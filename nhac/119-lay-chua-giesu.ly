% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Lạy Chúa Giêsu" }
  poet = " "
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

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
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \partial 4 d8( f) |
  a4 g8( a16 g) |
  f2 |
  f4 g8 f |
  e f d4( |
  d) f |
  d8( f) a4 |
  a8( bf) a4 |
  g8( a) f e |
  d2 |
  e4 d8 f |
  e d a4 |
  d d |
  c2 |
  f4 d |
  a'8 f d a |
  f'4 e8 f |
  d2 \bar "|."
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  Lạy Chúa "Giê -" su, xin Chúa tha tội chúng con.
  Xin gìn giữ chúng con khỏi lửa hỏa ngục.
  Xin dìu dắt mọi linh hồn lên Thiêng Đàng,
  nhất là những linh hồn cần Chúa thương xót hơn.
}


% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        \magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key f \major \time 2/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #3.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  } 
}
