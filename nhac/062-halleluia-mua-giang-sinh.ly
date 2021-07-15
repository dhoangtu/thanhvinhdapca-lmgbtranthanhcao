% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Halleluia Mùa Giáng Sinh" }
  poet = " "
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucSop= \relative c' {
  \partial 4 e8. e16 |
  e4 \breathe e8. a16 |
  gs4 (fs) |
  e fs8. fs16 |
  fs4 \breathe fs8. b16 |
  b4 (gs) |
  a2 ~ |
  a4 a8. (b16) |
  cs2 |
  cs8 d cs b |
  b2 |
  b8 cs b a |
  e2 ~ |
  e4 gs8. a16 |
  b2 |
  b8 cs b a |
  e2 |
  b'8 b gs b |
  a2 ~ |
  a4 e8. e16 |
  e4 \breathe e8. a16 |
  gs4 (fs) |
  e fs8. fs16 |
  fs4 \breathe fs8. b16 |
  b4 (gs) |
  a2 ~ |
  a4 r \bar "|."
}

nhacDiepKhucBas = \relative c' {
  cs8. cs16 |
  cs4 cs8. e16 |
  e2 |
  cs4 d8. d16 |
  d4 d8. d16 |
  d2 |
  cs2 ~ |
  cs4 r |
  r e8. (fs16) |
  a8 b a gs |
  gs4 fs |
  gs8 a gs fs |
  e4 d |
  cs r |
  r e8. (fs16) |
  gs8 a gs fs |
  e4 (d) |
  e8 e d d |
  cs2 ~ |
  cs4 cs8. cs16 |
  cs4 cs8. e16 |
  e2 |
  cs4 d8. d16 |
  d4 d8. d16 |
  d2 |
  cs2 ~ |
  cs4 r
}

% Lời điệp khúc
loiDiepKhucSop = \lyricmode {
  "Hal -" "le -" lu "Ha -" "le -" "lu -" ia.
  "Hal -" "le -" lu "Ha -" "le -" "lu -" ia.
  Này đây, ta báo cho anh em tin xiết bao vui mừng.
  Ngày hôm nay, Trinh Nữ đã sinh hạ Đấng Cứu Độ chúng ta.
  "Hal -" "le -" lu "Ha -" "le -" "lu -" ia.
  "Hal -" "le -" lu "Ha -" "le -" "lu -" ia.
}

loiDiepKhucBas = \lyricmode {
  Hal -- le -- lu Ha -- le -- lu -- ia.
  Hal -- le -- lu Ha -- le -- lu -- ia.
  Này ta báo cho anh em một tin xiết bao vui mừng, vui mừng.
  Ngày Trinh Nữ đã sinh hạ Đấng Cứu Độ chúng ta.
  Hal -- le -- lu Ha -- le -- lu -- ia.
  Hal -- le -- lu Ha -- le -- lu -- ia.
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
  system-system-spacing = #'((basic-distance . 13)
                             (minimum-distance . 14)
                             (padding . 2))
  score-system-spacing = #'((basic-distance . 12)
                             (minimum-distance . 12.5)
                             (padding . 1))
}

\score {
  \new ChoirStaff <<
    \new Staff \with {
        \consists "Merge_rests_engraver"
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key a \major \time 2/4 \nhacDiepKhucSop
      }
      \new Lyrics \lyricsto beSop \loiDiepKhucSop
    >>
    \new Staff \with {
        \consists "Merge_rests_engraver"
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beBas {
        \key a \major \time 2/4 \nhacDiepKhucBas
      }
      \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beBas \loiDiepKhucBas
    >>
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}
