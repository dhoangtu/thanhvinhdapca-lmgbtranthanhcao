% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Suy Tôn Thánh Giá" }
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
  \partial 4 f8( e) |
  d d c4 |
  f8 g a4 |
  bf4. a8 |
  g4 c8 a |
  f8. g16 g8 a |
  d,4 f8 g |
  c,4 f8 d |
  f2( |
  f4) a8( g16 f) |
  a8 bf c c |
  d4 a8( g) |
  f4 d8 d |
  f4 g |
  f2 \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \partial 4 g8( fs) |
  e e d4 |
  g8 a b4 |
  c4. b8 |
  a4 d8 b |
  g8. a16 a8 b |
  e,4 g8 a |
  d,4 g8 e |
  g2( |
  g4) b8( a16 g) |
  b8 c d d |
  e4 b8( a) |
  g4 e8 e |
  g4 a |
  g2 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \partial 4 a8( gs) |
  fs fs e4 |
  a8 b cs4 |
  d4. cs8 |
  b4 e8 cs |
  a8. b16 b8 cs |
  fs,4 a8 b |
  e,4 a8 fs |
  a2( |
  a4) cs8( b16 a) |
  cs8 d e e |
  fs4 cs8( b) |
  a4 fs8 fs |
  a4 b |
  a2 \bar "|."
}

% Lời phiên khúc
loiPhienKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  \set stanza = \markup { \rounded-box { \large "Xướng" } }
  Đây là đây là cây Thánh Giá Chúa Ki -- tô,
  chính nơi này đem ơn cứu độ,
  ơn cứu độ cho trần gian.
  \override Lyrics.LyricText.font-series = #'normal
  \set stanza = \markup { \rounded-box { \large "Đáp" } }
  Chúng ta hãy mau mau đến tôn thờ mà thờ lạy mến yêu.
}

% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        \magnifyStaff #(magstep +0.5)
      }
      <<
      \new Voice = beSop {
        \key f \major \time 2/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  } 
}

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        \magnifyStaff #(magstep +0.5)
      }
      <<
      \new Voice = beSop {
        \key g \major \time 2/4 \nhacPhienKhucHai
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhuc
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
        \magnifyStaff #(magstep +0.5)
      }
      <<
      \new Voice = beSop {
        \key a \major \time 2/4 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhuc
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  } 
}