% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Kinh Lạy Cha" }
  poet = " "
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \key bf \major \time 2/4
  g8 f bf bf bf4 \breathe
  g8 bf c d bf bf4 \breathe
  d8 c d a g4 \bar "||"
  d8 g bf a f g d4 ~ d8 \breathe
  ef d c f f d16 (f) g4 \breathe
  bf8 a g c4 \breathe
  d8 c bf a c d c bf a g4 ~ g \breathe
  f8 f f g f f f f ef d d4 \breathe
  d8 g f a g4 \breathe
  bf8 c bf c bf4 d8 d c ef d4 ~ d8 \breathe
  g,8 a f a g ef f ef d4 \breathe
  g8 bf bf a f d f f g4 ~ g \bar "|."
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \override LyricText.font-series = #'bold
  Vâng lệnh Chúa Cứu Thế và theo thể thức Người dạy
  chúng ta dám nguyện rằng:
  \override LyricText.font-series = #'normal
  Lạy Cha chúng con ở trên trời,
  chúng con nguyện danh Cha cả sáng,
  nước Cha trị đến,
  ý Cha thể hiện dưới đất cũng như trên trời.
  Xin Cha cho chúng con hôm nay lương thực hàng ngày,
  và tha nợ chúng con
  như chúng con cũng tha kẻ có nợ chúng con.
  Xin chớ để chúng con sa chước cám dỗ
  nhưng cứu chúng con cho khỏi mọi sự dữ.
}


% Dàn trang
\paper {
  #(set-paper-size "a4")
  top-margin = 20\mm
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
  system-system-spacing = #'((basic-distance . 12.5)
                             (minimum-distance . 12.5)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 12.5)
                             (minimum-distance . 12.5)
                             (padding . 1))
}

\score {
  \new ChoirStaff <<
    \new Staff <<
      \new Voice = beSop \nhacPhienKhucMot
      >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.7
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.5
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}
