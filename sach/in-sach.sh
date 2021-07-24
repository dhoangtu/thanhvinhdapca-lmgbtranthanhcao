#!/bin/bash

set -x

FOLDERS="//home/dhtu/Desktop/CATH/thanhvinhdapca-lmgbtranthanhcao/nhac"
lilypondcmd="/home/dhtu/bin/lilypond"

GEN=./pdf-generated
rm -rf ${GEN}
mkdir ${GEN}

CONTENT=./content-table.csv
rm ${CONTENT}

# xuất PDF từ file nhạc lilypond
IFS=' '
pagecounter=1
filelist=()
for fullname in ${FOLDERS}/*.ly
do
    echo "=== Generating $fullname "
    name=`basename -- "$fullname"`
    shortname="${name%.*}"
    
    # lấy tiêu đề
    title=`cat ${fullname} | grep " title" | grep "=" | sed 's/^[^"]*"//g' | sed -e 's/[[:space:]]*$//' | sed 's/\"[[:space:]]//g'`
    # bỏ ký tự cuối
    title=${title%?}
    #echo "title: ${title}"

    # xuất PDF
    #${lilypondcmd} --output="${GEN}/${shortname}" -dno-point-and-click --pdf "$fullname"
    
    # đếm số trang
    echo "${title};${pagecounter}" >> ${CONTENT}
    # bắt đầu trang kế tiếp
    pageno=`pdfinfo "${GEN}/${shortname}.pdf" | grep "Pages" | grep -Eo '[0-9]+'`
    echo "${title} : ${pageno} pages"
    pagecounter=$(( $pageno + $pagecounter ))
	
	filelist+=( "${GEN}/${shortname}.pdf" )
    
    echo "" 
done

# gộp những file PDF thành 1 file
pdftk "${filelist[@]}" cat output bai-hat.pdf

# đánh số trang chẵn lẻ
pdflatex so-trang-chan-le.tex

# thêm lời mở đầu
pdftk bia-truoc-trong.pdf blank-a4.pdf loi-phi-lo.pdf blank-a4.pdf so-trang-chan-le.pdf blank-a4.pdf cat output song-book.pdf

# chỉnh lệch trang chẵn lẻ
pdfjam --twoside --paper a4paper --offset '0.3cm 0cm' song-book.pdf --outfile song-book-adjusted.pdf

pdftk  bia-truoc-xanh.pdf blank-a4.pdf bia-truoc.pdf blank-a4.pdf song-book-adjusted.pdf muc-luc.pdf blank-a4.pdf bia-sau-trong.pdf bia-sau.pdf blank-a4.pdf bia-sau-xanh.pdf cat output thanhvinhdapca-lmgbtranthanhcao.pdf

# xóa những file tạm
#rm -rf ${GEN} so-trang-chan-le.pdf songs.pdf song-book.pdf song-book-adjusted.pdf *.aux *.log
