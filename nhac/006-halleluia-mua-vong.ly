% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Halleluia Mùa Vọng" }
  poet = " "
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhuc = \relative c' {
  \partial 4 \tuplet 3/2 { f8 f f } |
  a4 \tuplet 3/2 { a8 a c } |
  d2 |
  d8 c a c | \break
  d2 |
  a8 g f d |
  a'2 |
  #(define afterGraceFraction (cons 1 3))
  e8 e g \afterGrace a ({
    \override Flag.stroke-style = #"grace"
    bf)} |
  \revert Flag.stroke-style
  a2 |
  g8 f e g |
  f4. f8 |
  g8 (a) g (f) |
  f2 \bar "|."
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Hal -- le -- lu -- ia.
  Hal -- le -- lu -- ia.
  Hãy dâng lời cảm mến.
  Hãy dọn đường người đến.
  Vì tình thương thiết tha.
  Đấng cứu độ chúng ta.
  Hal -- le -- lu -- ia.
}

% Dàn trang
\paper {
  #(set-paper-size "a4")
  top-margin = 15\mm
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
  system-system-spacing = #'((basic-distance . 12)
                             (minimum-distance . 12.5)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 12)
                             (minimum-distance . 12.5)
                             (padding . 1))
}

% Thiết lập tông và nhịp
TongNhip = { \key f \major \time 2/4 }

\score {
  \new ChoirStaff <<
    \new Staff = diepKhuc \with {
        \consists "Merge_rests_engraver"
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \TongNhip \stemNeutral \nhacDiepKhuc
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #2
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #2
        }
        \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}
