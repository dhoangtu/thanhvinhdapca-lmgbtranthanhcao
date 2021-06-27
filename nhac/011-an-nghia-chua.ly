% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Ân Nghĩa Chúa" }
  poet = "Tv. 88"
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
  g4 a |
  b2 |
  b8 a4 b8 |
  g2 |
  g4 fs |
  e2 |
  g8 g4 b,8 |
  d2 |
  e4 g |
  d4. d8 |
  d'4 a8 fs |
  g2 \bar "|."
}

nhacDiepKhucBass= \relative c' {
  e4 d |
  g2 |
  g8 fs4 e8 |
  d2 |
  e4 c |
  b2 |
  d8 d4 g,8 |
  b2 |
  c4 e |
  a,4. a8 |
  fs'4 d8 b |
  g'2
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  g8 a _(b) b4 b8 b a b g \breathe
  e e e e g g a (g) b, d4 \breathe
  c8 c e4 g8 a g e fs d4 \breathe
  d8 d d b'4 \fermata b8 fs a g g4 \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  g8 a _(b) b4 b8 a b a g4 \breathe
  e8 g e4 e8 g4 a8 g e b d4 \breathe
  d8 e d b' b a g a4 a8 e e g d'4 \fermata
  d,8 d d g g4 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  g8 g a b b a b b a (g) g4 \breathe
  e8 g a a g a g b, d4 \breathe
  e8 e d e4 d8 d g a b4 \breathe
  d,8 d d' d fs, a g g4 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Ân nghĩa Chúa, ca ngợi không ngừng.
  Ân nghĩa Ngài con ca tụng luôn.
  Ân nghĩa Ngài bền vững muôn ngàn đời.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Ân nghĩa Chúa con không ngừng ca tụng.
  Đời lại đời miệng rao giảng Chúa thành tín.
  Vì Ngài phán: Ân nghĩa Ta được xây dựng
  và lòng thành tính vững bền tới thiên thu.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Hạnh phúc thay dân nào biết ca ngợi.
  Họ tiến hành, Lạy Chúa bởi nghe danh Ngài luôn.
  Họ suốt ngày, hớn hở reo mừng vui.
  Ấy vì Ngài công chính mà họ được hiên ngang.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Hùng cường hiển hách sức của dân chính là Ngài.
  Làm uy vũ chúng con trổi cao rạng rỡ.
  Đấng bảo vệ dân là người của Thiên Chúa,
  thuộc quyền Đức Thánh của Is -- ra -- el.
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
        \voiceOne \key g \major \time 2/4 \nhacDiepKhucSop
      }
      \new Voice = beBas {
        \override NoteHead.font-size = #-2
        \voiceTwo \key g \major \time 2/4 \nhacDiepKhucBass
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #1.5
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
    \override Lyrics.LyricSpace.minimum-distance = #2.0
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
    \override Lyrics.LyricSpace.minimum-distance = #2.2
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
    \override Lyrics.LyricSpace.minimum-distance = #2.0
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  }
}
