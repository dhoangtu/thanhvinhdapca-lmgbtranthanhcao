% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Reo Vui Lên" }
  poet = "Tv. 80"
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

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c'' {
  g8 g g e |
  c'2 \breathe |
  bf8 d, f a |
  g2 \breathe |
  bf8 bf bf g |
  d'2 \breathe |
  bf8 e, g d' |
  c2 ( |
  c4) r \bar "|."
}

nhacDiepKhucBas = \relative c' {
  e8 e e c |
  g'2 |
  g8 bf, d f |
  e2 |
  g8 g g e |
  bf'2 |
  f8 c d g |
  e2 ( |
  e4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \partial 4 c8 g |
  g4 \tuplet 3/2 { d8 f a } |
  g4. f8 |
  d e4 e8 |
  c r d r |
  e2 |
  r4 bf'8 a |
  a4 \tuplet 3/2 { c8 d g, } |
  g2 |
  r8 d d d |
  d4. a'8 |
  a4 g |
  c2 \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \partial 8 c8 |
  e, e a g |
  g4 a |
  c2 |
  r8 c a c |
  d4 bf8 a |
  g2 |
  r4 f8 f |
  f2 |
  d8 f g a |
  e2 |
  r4 a8 bf |
  g4. a8 |
  g4 bf |
  c2 \bar "||"
}

nhacPhienKhucBa = \relative c' {
  e8 g c4 |
  bf8 a4 bf8 |
  d,2 |
  c8 a' e f |
  g4 \tuplet 3/2 { g8 a a } |
  g2 |
  r4 g8 fs |
  g4 e8 c' |
  bf4 f8 g |
  e2 |
  r4 f8 e |
  d4 \tuplet 3/2 { d8 a' g } |
  g4. a8 |
  g4 bf |
  c2 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Reo vui lên mừng Chúa, Đấng phù trợ chúng ta.
  Reo vui lên mừng Chúa, Đấng phù trợ chúng ta.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Xướng ca đi, hòa nhịp trống cơm.
  Bổng trầm gieo tiếng cầm, tiếng sắt.
  Rúc lên đi, hãy rúc tù và.
  Mồng một ngày rằm cho ta mừng lễ.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Đó là luật Is -- ra -- el phải cứ.
  Chúa nhà Gia -- cóp đã phán truyền.
  Chỉ thị này, nhà Giu -- se đã nhận
  khi bỏ miền Ai Cập ra đi.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Một giọng nói tôi nghe khác lạ
  Rằng gánh nặng vai dân, Ta đã cất cho.
  Tay họ thôi cầm chiếc ki người nô lệ.
  Lúc ngặt nghèo, người đã kêu lên, Ta liền giải thoát.
}


% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = diepKhuc \with {
        \consists "Merge_rests_engraver"
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \voiceOne \key f \major \time 2/4 \nhacDiepKhucSop
      }
      \new Voice = beBas {
        \override NoteHead.font-size = #-2
        \voiceTwo \key f \major \time 2/4 \nhacDiepKhucBas
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2
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
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3.0
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
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
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
        \key f \major \time 2/4 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}
