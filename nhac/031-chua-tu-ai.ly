% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Chúa Từ Ái" }
  poet = "Tv. 129"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhuc = \relative c'' {
  <>^\markup { \halign #40 " " }
  c4. c8 b a |
  d2 g,4 |
  g2 f8 e |
  d4 c8 c e d |
  g2 \breathe b8 d |
  d,4 d8 d g d |
  c2. ~ |
  c2 r4 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  #(define afterGraceFraction (cons 1 4))
  \partial 4 c8 d |
  ef4. g8 g g |
  c,2 af'4 |
  g8 r \afterGrace c2 ({
    \autoBeamOff \stemDown
    \override Flag.stroke-style = #"grace"
    \tweak font-size #-3 d16
    \tweak font-size #-3 c)} |
  \revert Flag.stroke-style
  \stemNeutral
  \autoBeamOn
  b!8 b a! b c4 |
  af8 g f af g4 |
  r8 f16 ef f8 f g ef |
  d2 r8 ef |
  f af g4. e!8 |
  c2. \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \partial 4 ef8 c |
  g'4. af16 g f8 bf |
  g2 g4 |
  c16 b! c8 d4 f, |
  g2 c8 d |
  c af f4 bf |
  g2 f8 af |
  g d g (f) e! (d) |
  c2. \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \set Staff.keyAlterations = #`(((0 . 6) . ,NATURAL)
                                 ((1 . 2) . ,NATURAL)
                                 ((0 . 5) . ,NATURAL))
  \partial 4 g8 e |
  c'4 d8 e a, c |
  g2 r8 e' |
  d8. c16 a8 a r a |
  c d c8. a16 g8 g ~ |
  g2 a8 c |
  a f d4. g8 |
  b4 d16 c e8 d c |
  a2 g8 (b) |
  c2. \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Chúa vẫn luôn từ ái một niềm,
  ơn cứu độ Người hằng ban rộng rãi.
  Ơn cứu độ Người hằng ban lâu dài.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Từ vực thẳm, con kêu lên Ngài.
  Chúa ơi, Chúa ơi xin hãy nghe con.
  Dám xin Ngài lắng tai nghe lời con tha thiết nguyện cầu,
  lời con thiết tha nguyện cầu.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Ôi lạy Chúa, nếu như Ngài chấp tội
  nào có ai đứng vững được chăng?
  Nhưng Chúa thường rộng lòng thứ tha.
  Để chúng con hằng kính sợ Người.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Mong đợi Chúa, tôi hết lòng mong đợi.
  Vững tin ở Lời Người.
  Hồn tôi vẫn trông mong chờ Người,
  hơn lính canh mong đợi hừng đông.
  Hơn cả lính canh mong đợi hừng đông.
}


% Dàn trang
\paper {
  #(set-paper-size "a4")
  top-margin = 15\mm
  bottom-margin = 20\mm
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
                             (minimum-distance . 12)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 12)
                             (minimum-distance . 12)
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
        \key c \major \time 3/4 \stemNeutral
          \set Timing.beamExceptions = #'()
          \set Timing.baseMoment = #(ly:make-moment 1/4)
          \set Timing.beatStructure = #'(1 1 1)
          \nhacDiepKhuc
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #1.9
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
        \key ef \major \time 3/4
          \set Timing.beamExceptions = #'()
          \set Timing.baseMoment = #(ly:make-moment 1/4)
          \set Timing.beatStructure = #'(1 1 1)
          \nhacPhienKhucMot
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2
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
        \key ef \major \time 3/4
          \set Timing.beamExceptions = #'()
          \set Timing.baseMoment = #(ly:make-moment 1/4)
          \set Timing.beatStructure = #'(1 1 1)
          \nhacPhienKhucHai
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.5
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2
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
        \key ef \major \time 3/4
          \set Timing.beamExceptions = #'()
          \set Timing.baseMoment = #(ly:make-moment 1/4)
          \set Timing.beatStructure = #'(1 1 1)
          \nhacPhienKhucBa
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.5
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #1.9
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}
