

@ECHO ON
rem setlocal enabledelayedexpansion

set LILYPOND="C:\Program Files (x86)\LilyPond-2.22.1\usr\bin\lilypond.exe"

set GEN=".\pdf-generated"
mkdir %GEN%

for %%f in (D:\01.lilypond\01.github\thanhvinhdapca-lmgbtranthanhcao\nhac\*.ly) do (
  rem set /p val=<%%f
  rem echo "fullname: %%f"
  rem echo "name: %%~nf"
  %LILYPOND% --output="%GEN%\%%~nf" -dno-point-and-click --pdf "%%f"
)

pdftk %GEN%\*.pdf cat output bai-hat.pdf

pdflatex so-trang-chan-le.tex

pdftk bia-truoc-xanh.pdf blank-a4.pdf bia-truoc.pdf blank-a4.pdf ^
  bia-truoc-trong.pdf blank-a4.pdf loi-phi-lo.pdf blank-a4.pdf so-trang-chan-le.pdf blank-a4.pdf ^
  muc-luc.pdf blank-a4.pdf bia-sau-trong.pdf ^
  bia-sau.pdf blank-a4.pdf bia-sau-xanh.pdf cat output thanhvinhdapca-lmgbtranthanhcao.pdf

del /s /f /q %GEN% bai-hat.pdf *.aux *.log so-trang-chan-le.pdf
rmdir /s/q %GEN%
