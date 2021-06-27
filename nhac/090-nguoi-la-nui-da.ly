% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Người Là Núi Đá" }
  poet = "Tv. 17"
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
  g8  g af af |
  g4 g8 e |
  c2 |
  r4 \tuplet 3/2 { c8 c g' } |
  g4 \tuplet 3/2 { f8 f a } |
  a4 \tuplet 3/2 { g8 g d' } |
  \afterGrace d4 (e8) d d |
  c2 ( |
  c4) r \bar "|."
}

nhacDiepKhucBass = \relative c' {
  \skip 2
  \skip 2
  \skip 2
  r4 \tuplet 3/2 { a8 a e' } |
  e4 \tuplet 3/2 { d8 d f } |
  f4 \tuplet 3/2 { e8 e b' } |
  b4 g8 f |
  e2 ( |
  e4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  g8 g af af f4 c' g (g) \breathe
  c8 c d e d d (c) a!4 \breathe
  a8 a d c c c (a) g4 \breathe
  f8 af4 \fermata
  c8 d c4 (c) \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  g8 g af af c f, g4 \breathe
  c8 c d e \breathe
  a, c g4 f8 f af4 \fermata
  \acciaccatura c8 d c4 \breathe
  c8 a g c c c c d4 \breathe
  c8 e d b a g g4 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  g8 g af4 c8 f, g4 \breathe
  d'8 \afterGrace e (d) a4 d8 \breathe
  \afterGrace b (a!) g4
  d'8 d b4 g8 d' c b c4 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Con yêu Chúa, Chúa ơi, hết tâm hồn.
  Người là núi đá, Người là núi đá,
  Người là núi đá con nương nhờ.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Con yêu Chúa hết lòng Chúa ơi!
  Người là núi đá con nương nhờ,
  là thành lũy cho con ẩn mình,
  là Đấng giải thoát con.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Tôi ẩn náu nơi Chúa Trời tôi,
  Người là núi đá,
  là khiên mộc, là thành lũy chở che.
  Tôi chỉ cần hô lên: Tôn Vin Chúa,
  là thắng ngay hết mọi địch thù.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Vạn vạn tuế Chúa Trời tôi.
  Muôn chúc tụng Đấng hộ phù
  Tôn Vinh Người là Đấng Cứu Độ tôi.
}


% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = diepKhuc \with {
        \consists "Merge_rests_engraver"
        \magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \voiceOne \key c \major \time 2/4 \nhacDiepKhucSop
      }
      \new Voice = beBas {
        \override NoteHead.font-size = #-2
        \voiceTwo \key c \major \time 2/4 \nhacDiepKhucBass
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #2.2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        \magnifyStaff #(magstep +1)
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
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #1.7
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        \magnifyStaff #(magstep +1)
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
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #2.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        \magnifyStaff #(magstep +1)
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
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #2.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}
