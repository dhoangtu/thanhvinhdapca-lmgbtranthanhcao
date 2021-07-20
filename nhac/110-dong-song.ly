% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Dòng Sông" }
  poet = "Tv. 45"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c' {
  c4 e g |
  a2 e4 |
  d2. |
  g4 a g |
  b2 g4 |
  g2 c4 |
  c2. ~ |
  c4 r2 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  g8 a e g g c,16( d) |
  e2 d8 a' |
  fs2 fs4 |
  g2. |
  g8 e g e e f16( e) |
  d2. |
  a'8 a a b16 a d8 a |
  b2. |
  r8 c d c d c |
  e2 c4 |
  c2. \bar "||"
}

nhacPhienKhucHai = \relative c' {
  c4 e g |
  a2 e4 |
  d2. |
  g4 a g |
  b2 g4 |
  g2 c4 |
  c2 a4 |
  a2 f4 |
  c'2 a4 |
  g2 f8 f |
  e2 c4 |
  d2 d4 |
  \acciaccatura d8 g2 a8 a |
  c2 a8 a |
  c2 c4 |
  d2. \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  a4 g a |
  c2 e,4 |
  g2. |
  f4 d f |
  a2 f4 |
  d2 g4 |
  e2. |
  a2 g4 |
  a g a |
  g2 g8( a) |
  b2. |
  b4 a b |
  a2 g4 |
  d'2 e4 |
  c2. \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Dòng sông chia nhánh đổ về.
  Thành đô đền thánh tràn trề hân hoan.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Thiên Chúa là nơi ta ẩn náu, là sức mạnh của ta.
  Nên dầu cho địa cầu chuyển động,
  hay non cao có sập xuống đại dương,
  thì ta cũng không sợ hãi bồn chồn.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Dòng sông chia nhánh đổ về,
  thành đô đền thánh tràn trề hân hoan.
  Vui thay nhà Chúa chí tôn.
  Có Chúa ngự, thành không lay chuyển.
  Vừa rạng đông, Người đã thương giải cứu.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Chúng ta có Chúa càn khôn,
  Chúa nhà Gia -- cóp lũy đồn chở che.
  Đến mà xem việc Chúa làm hiển hách,
  bao kỳ công Người thực thi dưới trần.
}


% Dàn trang
\paper {
  #(set-paper-size "a4")
  top-margin = 20\mm
  bottom-margin = 20\mm
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
  system-system-spacing = #'((basic-distance . 11.5)
                             (minimum-distance . 11.5)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 11.5)
                             (minimum-distance . 11.5)
                             (padding . 1))
}

TongNhip = {
  \key c \major \time 3/4
  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment = #(ly:make-moment 1/4)
  \set Timing.beatStructure = #'(1 1 1)
}

\score {
  \new ChoirStaff <<
    \new Staff = diepKhuc \with {
        \consists "Merge_rests_engraver"
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key c \major \time 3/4 \nhacDiepKhucSop
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
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3.5
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
        \TongNhip \nhacPhienKhucMot
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
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #1.6
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
        \TongNhip \nhacPhienKhucHai
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.0
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
        \TongNhip \nhacPhienKhucBa
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.2
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}
