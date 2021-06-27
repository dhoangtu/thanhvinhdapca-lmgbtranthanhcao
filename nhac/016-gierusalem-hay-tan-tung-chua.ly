% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Giêrusalem Hãy Tán Tụng Chúa" }
  poet = "Tv. 147"
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
nhacDiepKhucSop= \relative c'' {
  \partial 4. g8 g g |
  g4 r8 e |
  c4 a' |
  g2 | \break
  r8 a a a |
  a a4 f8 |
  a4 d |
  c2 ^( |
  c4) r \bar "|."
}

nhacDiepKhucBas = \relative c' {
  \skip 4.
  \skip 4 r8 \skip 8
  \skip 2
  \skip 2
  r8 f f f |
  f f4 d8 |
  f4 g |
  e2 ( |
  e4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  a8 g b a a16 a a a c4 \breathe
  a8 g a e d a' f e4 \breathe
  a8 a c \breathe
  c c c d4 \breathe
  c8 e d a4 b8 g d' e c4 \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  a8 a a e c' b a e4 \breathe
  f8 f f d a' e c \acciaccatura c8 e4 \breathe
  a8 a a e e' c a a4 \breathe
  d8 d d g, d' b g c4 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  a8 e a e d e a, d e4 \breathe
  a8 f d d a' c b b4 \breathe
  b8 b a c b b a g4 f8 g a c a d e c4 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Giê -- ru -- sa -- lem tán tụng Chúa đi.
  Giê -- ru -- sa -- lem hãy ngợi khen Chúa đi.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Tán tụng Chúa đi Giê -- ru -- sa -- lem hỡi.
  Ca ngợi Chúa Trời nào hỡi Si -- on.
  Cho ngươi vững, cho ngươi kiên vững.
  Con cái trong thành Chúa đều chúc phúc lành.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Nơi biên cương Người thiết lập hòa bình,
  cho ngươi no đầy lúa mì tuyệt hảo.
  Nơi biên cương Người thiết lập hòa bình,
  cho ngươi no đầy phúc lộc triền miên.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Chúa bày tỏ luật Ngài cho nhà Gia -- cóp.
  Chiếu chỉ luật điều cho Is -- ra -- el.
  Chưa dân nào Chúa thi ân như vậy,
  để cho ta thấy tình thương của Ngài.
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
        \voiceOne \key c \major \time 2/4 \nhacDiepKhucSop
      }
      \new Voice = beBas {
        \override NoteHead.font-size = #-2
        \voiceTwo \key c \major \time 2/4 \nhacDiepKhucBas
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2.5
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
        \key c \major \time 2/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2.5
    \override Lyrics.LyricSpace.minimum-distance = #3.0
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key c \major \time 2/4 \nhacPhienKhucHai
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2.5
    \override Lyrics.LyricSpace.minimum-distance = #3.0
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key c \major \time 2/4 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2.5
    \override Lyrics.LyricSpace.minimum-distance = #3.0
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}
