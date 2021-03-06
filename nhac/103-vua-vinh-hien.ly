% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Vua Vinh Hiển" }
  poet = "Tv. 23"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhuc = \relative c'' {
  <>^\markup { \halign #40 " " }
  d8 d d g, |
  a4 d,8 a' |
  g4. g8 |
  a2 |
  a8 a a d, |
  f4. d8 |
  e g f e |
  d2 ~ |
  d4 r \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \partial 4 f8 e |
  d4 \tuplet 3/2 { a'8 bf a } |
  a4 g8 g |
  a2 |
  a8 a d, e |
  f2 |
  r4 e8 g |
  f e f e |
  d2 \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \partial 8 a8 |
  g g bf g |
  a2 |
  r8 a a cs |
  e4. e8 |
  cs4 d |
  d2 |
  g,8 a bf g |
  e4 g8 a |
  d,2 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \partial 8 a8 |
  g g bf g |
  a2 |
  r4 a8 cs |
  e e e cs |
  d2 |
  r4 bf8 g |
  e a f e |
  d2 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Chính Chúa Tể càn khôn là Đức Vua vinh hiển.
  Chính Chúa Tể can khôn là Vua hiển trị muôn đời.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Hỡi của đền, hãy nhấc cao lên, cao lên nữa,
  hỡi cửa đền cổ kính.
  Để Đức Vua vinh hiển ngự vào.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Đức Vua vinh hiền là ai?
  Người là Thiên Chúa lẫm liệt oai phong.
  Là Đức Chúa oai hùng khi xuất trận.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Đức Vua vinh hiển là ai?
  Là Thượng Tế Chúa Tể càn khôn.
  Chính Người là Đức Vua vinh hiển.
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
      "Deja Vu Serif Condensed"
      "Deja Vu Serif Condensed"
      "Deja Vu Serif Condensed"
      (/ 20 20)))
  page-count = #1
  system-system-spacing = #'((basic-distance . 13.5)
                             (minimum-distance . 13.5)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 13.5)
                             (minimum-distance . 13.5)
                             (padding . 1))
}

\score {
  \new ChoirStaff <<
    \new Staff = diepKhuc \with {
        \consists "Merge_rests_engraver"
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key f \major \time 2/4 \stemNeutral \nhacDiepKhuc
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.5
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}

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
            nonstaff-relatedstaff-spacing.padding = #2
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.4
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  } 
}

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key f \major \time 2/4 \nhacPhienKhucHai
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #2
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.4
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  } 
}

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key f \major \time 2/4 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #2
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.4
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  } 
}
