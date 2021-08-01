% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Halleluia Mùa Thường Niên" }
  poet = " "
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  fs4. fs8 e4 fs |
  e4. e8 d4 e |
  d4. b8 d4 (e) |
  fs1 \break
  a4. g8 b4 cs |
  d4. cs8 b4 a |
  gs4. e8 fs4 (gs) |
  a1 \bar "||" \break
  fs4. fs8 fs g fs e |
  d2 fs |
  a4. a8 a b a g |
  fs2 d |
  e4. e8 fs g g fs |
  e2 a |
  b4. a8 b a b cs |
  d2 d |
  \tuplet 3/2 { d4 d b } d2 \bar "|."
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  Hal -- le -- lu -- ia Hal -- le -- lu -- ia Hal -- le -- lu -- ia.
  Hal -- le -- lu -- ia Hal -- le -- lu -- ia Hal -- le -- lu -- ia.
  Xin cho con biết lắng nghe lời Chúa.
  Cho con ghi nhớ giữ trong cuộc đời.
  Để hồn con vẫn sống trong niềm vui.
  Để trần gian tỏa ngời trong yêu thương.
  Hal -- le -- lu -- ia.
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

TongNhip = {
  \key d \major \time 2/2
  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment = #(ly:make-moment 1/4)
  \set Timing.beatStructure = #'(1 1 1 1)
}

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \TongNhip \nhacPhienKhucMot
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
    \override Lyrics.LyricText.font-series = #'bold
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #1.4
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  } 
}
