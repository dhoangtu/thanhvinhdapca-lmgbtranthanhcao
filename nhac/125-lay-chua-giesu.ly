% Cài đặt chung
\version "2.22.1"
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
  top-margin = 20\mm
  bottom-margin = 10\mm
  left-margin = 20\mm
  right-margin = 20\mm
  indent = #0
  #(define fonts
    (make-pango-font-tree
      "Deja Vu Serif Condensed"
      "Deja Vu Serif Condensed"
      "Deja Vu Serif Condensed"
      (/ 20 20)))
  page-count = #1
  system-system-spacing = #'((basic-distance . 12.5))
  score-system-spacing = #'((basic-distance . 12.5))
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  <>^\markup { \halign #35 " " }
  \partial 4 d8( f) |
  a4 g8( a16 g) |
  f2 |
  f4 g8 f |
  e f d4 ~ |
  d f |
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
  Xin dìu dắt mọi linh hồn lên Thiên Đàng,
  nhất là những linh hồn cần Chúa thương xót hơn.
}


% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key f \major \time 2/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.5
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  } 
}
