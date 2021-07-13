% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Ca Tiếp Liên" }
  poet = "Lễ Chúa Thánh Thần Hiện Xuống"
  composer = "Lm. GB Trần Thanh Cao"
  %arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c'' {
  a4 fs |
  \acciaccatura a8 b4 a |
  fs2 |
  fs4 e |
  g e |
  fs2 |
  d4 d |
  fs g |
  a2 |
  gs4 a |
  b gs |
  a2 \bar "||"
  fs4 a |
  b a |
  fs2 |
  g4 e |
  fs fs |
  \acciaccatura d8 e2 |
  d4 e |
  fs e |
  e2 |
  e4 cs |
  b a |
  fs'2 \bar "||"
  b4 b |
  a fs |
  fs2 |
  e4 g |
  fs4 e |
  d2 |
  e4 cs |
  b cs |
  a2 |
  a4 e' |
  fs cs |
  d2 \bar "||"
  a'4 b |
  b a |
  a2 |
  fs4 fs |
  a a |
  \acciaccatura fs8 a2 |
  cs4 cs |
  a fs |
  e2 |
  e4 a, |
  e' d |
  d2 \bar "||"
  a'4 fs |
  a a |
  \acciaccatura fs8 a2 |
  b4 cs |
  cs cs |
  e,2 |
  cs4 e |
  cs e |
  a2 |
  a4 gs |
  b a |
  a2 \bar "||"
  a4 fs |
  fs fs |
  fs2 |
  fs4 d |
  e fs |
  b,2 |
  b4 d |
  fs d |
  e2 |
  d4 e |
  d e |
  a2 \bar "||"
  b4 b |
  fs a |
  \acciaccatura fs8 a2 |
  a4 fs |
  a fs |
  a2 |
  g4 e |
  fs fs |
  d2 |
  d4 b |
  a e' |
  d2 \bar "||"
  b'4 b |
  b a |
  fs2 |
  d4 d |
  fs g |
  a2 |
  a4 fs |
  b a |
  fs2 |
  g4 fs |
  fs fs |
  \acciaccatura d8 e2 \bar "||"
  b'4 a |
  fs a |
  \acciaccatura fs8 a2 |
  a4 fs |
  b a |
  fs2 |
  cs'4 b |
  a fs |
  fs2 |
  e4 gs |
  b gs |
  a2 \bar "||"
  d,4 fs |
  a b |
  a2 |
  g4 e |
  e fs |
  d2 |
  fs4 d |
  fs a |
  b2 |
  b4 a |
  e' d |
  d2 |
  b4 a |
  b8 b b4 |
  d2 ( |
  d4) r \bar "|."
}

% Lời điệp khúc
loiDiepKhucSop = \lyricmode {
  "1. Muôn" lạy Chúa Thánh Thần. Xin ngự đến trần gian.
  Từ trời cao gửi xuống, nguồn ánh sáng tỏa lan.
  "2. Lạy" Cha kẻ cơ hàn.
  Đấng tặng ban ân điển.
  và soi dẫn nhân tâm.
  cúi xin Ngài Ngự đến.
  "3. Đấng" ủi an tuyệt diệu,
  Thượng khách của tâm hồn.
  Ôi ngọt ngào êm dịu.
  Dòng suối mát chảy tuôn.
  "4. Khi" vất vả lao công.
  Ngài là nơi an nghỉ.
  Gió mát đuổi cơn nồng.
  Tay hiền lau giọt lệ.
  "5. Hỡi" hào quang linh diệu.
  Xin chiếu giải ánh hồng.
  Vào tâm hồn tín hữu.
  Cho rực rỡ trinh trong.
  "6. Không" thần lực phù trì.
  Kẻ phàm nhân cát bụi.
  Thật chẳng có điều chi.
  Mà không là tội lỗi.
  "7. Hết" những gì nhơ bẩn.
  Xin rửa cho sạch trong.
  Tưới gội nơi khô cạn.
  Chữa lành mọi vết thương.
  "8. Cứng" cỏi uốn cho mềm.
  Lạnh lùng xin sưởi ấm.
  Những đường nẻo sai lầm.
  Sửa sang cho ngay thẳng.
  "9. Những" ai hằng tin tưởng.
  Trông cậy Chúa vững vàng.
  Dám xin Ngài rộng lượng.
  Bảy ơn Thánh tặng ban.
  "10. Nguyện" xin Chúa thưởng công.
  Cuộc đời dày đức độ.
  Ban niềm vui muôn thuở.
  Sau giờ phút lâm chung.
  "A -" men. "Hal -" "lê -" "lu -" ia.
}

% Bố trí
\paper {
  #(set-paper-size "a4")
  top-margin = 10\mm
  bottom-margin = 10\mm
  left-margin = 20\mm
  right-margin = 20\mm
  indent = #0
  #(define fonts
    (make-pango-font-tree
      "Liberation Serif"
      "Liberation Serif"
      "Liberation Serif"
      (/ 20 20)))
  page-count = #1
  %system-system-spacing = #'((basic-distance . 13))
  %score-system-spacing = #'((basic-distance . 13))
}

\score {
  \new ChoirStaff <<
    \new Staff <<
      \new Voice = beSop {
        \key d \major \time 2/4 \stemNeutral \nhacDiepKhucSop
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiDiepKhucSop
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #0.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \override Score.SpacingSpanner packed-spacing = ##t
  } 
}
