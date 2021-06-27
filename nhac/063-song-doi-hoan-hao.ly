% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Sống Đời Hoàn Hảo" }
  poet = "Tv. 49"
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
nhacDiepKhuc= \relative c' {
  d8 e b d |
  \acciaccatura d8 g4. g8 |
  g fs a b |
  d,4. d8 |
  \tuplet 3/2 { b'8 a b } g a |
  g2 ( |
  g4) \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  g8 g \breathe
  e g g a4 \breathe
  a8 g a b4 \breathe
  c8 c b b4 \breathe
  g8 a a e e4 \breathe
  g8 g a4 a8 b b a g a b4 \breathe
  c8 a b a b e, fs g b g a4 a g (g) \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  a8 g b4 \breathe
  a8 a g b a a4 \breathe
  g8 a b b a g b a fs \acciaccatura e8 g4 \breathe
  g8 a g b g b a a4 \breathe
  b8 a a4 b8 fs d e4 g (g) \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  g8 b a b g a b e,4 \breathe
  e8 g a g a g e fs d4 \breathe
  e8 e d g g fs fs a4 \breathe
  a8 b c b4 a8 d d g, e fs4 g (g) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Ai sống đời hoàn hảo,
  Chúa cho được ơn cứu độ,
  được hưởng ơn cứu độ muôn đời.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Đức Chúa, Thượng Đế Chí Tôn,
  nay Người lên tiếng,
  Khắp cõi đông tây,
  Người triệu tập hoàn cầu:
  Dân ta hỡi, Ta chẳng trách ngươi về lễ tế.
  Lễ toàn thiêu của ngươi,
  hằng nghi ngút trước mặt Ta đêm ngày.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Ta mà đói, Ta đâu cần nói ngươi hay.
  Vì trái đất với mọi loài,
  chính Ta làm chủ.
  Thịt trâu bò, há là thức Ta ăn?
  Máu chiên dê, há là đồ Ta uống?
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Hãy tiến dâng Chúa Trời lễ tán tạ,
  cùng Đấng Tối Cao, phải lo trọn khấn nguyện.
  Hãy kêu cầu Ta trong ngày cùng khốn.
  Ta giải thoát cho, và ngươi sẽ làm hiển danh Ta.
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
        \key g \major \time 2/4 \stemNeutral \nhacDiepKhuc
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #3.5
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
        \key g \major \time 2/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
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
        \key g \major \time 2/4 \nhacPhienKhucHai
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
        \key g \major \time 2/4 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #2.2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  }
}
