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
#set +x
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
    ${lilypondcmd} --output="${GEN}/${shortname}" -dno-point-and-click --pdf "$fullname"
    
    # đếm số trang
    echo "${title};${pagecounter}" >> ${CONTENT}
    # bắt đầu trang kế tiếp
    pageno=`find . -xdev -type f -name "${GEN}/${shortname}.pdf" -exec pdfinfo "{}" ";" | awk '/^Pages:/ {n += $2} END {print n}'`
    #pageno=`pdfinfo "${GEN}/${shortname}.pdf" | grep "Pages" | grep -Eo '[0-9]+'`
    #echo "${title} : ${pageno} pages"
    pagecounter=$(( $pageno + $pagecounter ))
	  
	  filelist+=( "${GEN}/${shortname}.pdf" )
    
    echo "" 
done

# gộp những file PDF thành 1 file
pdftk "${filelist[@]}" cat output bai-hat.pdf
#set -x
# đánh số trang chẵn lẻ, chỉnh lệch trang chẵn lẻ
pdflatex so-trang-chan-le.tex

# thêm trang bìa
pdftk bia-truoc-xanh.pdf blank-a4.pdf bia-truoc.pdf blank-a4.pdf \
  bia-truoc-trong.pdf blank-a4.pdf loi-phi-lo.pdf blank-a4.pdf so-trang-chan-le.pdf blank-a4.pdf \
  muc-luc-thanh-vinh.pdf muc-luc-phung-vu.pdf blank-a4.pdf bia-sau-trong.pdf \
  bia-sau.pdf blank-a4.pdf bia-sau-xanh.pdf cat output thanhvinhdapca-lmgbtranthanhcao.pdf

# xóa những file tạm
rm -rf ${GEN} bai-hat.pdf so-trang-chan-le.pdf *.aux *.log ${CONTENT}

