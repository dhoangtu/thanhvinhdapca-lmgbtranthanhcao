% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Ánh Sáng Bừng Lên" }
  poet = "Tv. 96"
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
  a8 a b a |
  fs g a d, |
  e4. g8 |
  fs2 \breathe |
  d8 e fs e |
  b4. cs8 |
  b e cs e |
  d2 ( |
  d4) r \bar "|."
}

nhacDiepKhucBas = \relative c' {
  \override NoteHead.font-size = #-2
  fs8 fs g fs |
  d d cs b |
  cs4. b8 |
  d2 |
  b8 cs d cs |
  g4. a8 |
  g cs a4 |
  d2 ( |
  d4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  b8 fs a b |
  fs4 fs8 d |
  b4 g'16 g e8 |
  fs2 |
  r4 e8 e |
  cs4. a8 |
  e'4 \acciaccatura e8 fs4 |
  \acciaccatura cs8 d2 \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \partial 4. d8 g a |
  b fs d fs |
  b,2 |
  r4 e8 cs |
  cs4. a8 |
  fs'4 e8 fs |
  d2 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \partial 4 a8 a |
  d,8 e d e |
  fs2 |
  e8 a a a |
  gs4b8 gs |
  a2 |
  r4 fs8 g |
  a4 \tuplet 3/2 { d,8 g fs } |
  e4 g8 g |
  fs2 |
  r8 e a a |
  g4 e8 g |
  fs4 e |
  d2 ( |
  e4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Hôm nay chúng ta được ánh sáng bừng lên chiếu soi.
  Vì Chúa đã giáng trần, giáng trần cứu độ chúng ta.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Chúa là Vua hiển trị, hỡi địa cầu, hãy nhảy mừng lên!
  Vui đi nào, ngàn muôn hải đảo.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Trời xanh tuyên bố rằng Người chính trực.
  Khắp mọi dân được thấy vinh hiển Người.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Ánh sáng bừng soi người công chính.
  Niềm hân hoan chiếu rọi kẻ lòng ngay.
  Người hiền đức, nào hãy vui mừng trước Thánh Nhan.
  Tưởng nhớ Thánh Danh mà dâng lời cảm tạ.
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
        \voiceOne \key d \major \time 2/4 \nhacDiepKhucSop
      }
      \new Voice = beBas {
        \voiceTwo \key d \major \time 2/4 \nhacDiepKhucBas
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2.5
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
        \key d \major \time 2/4 \nhacPhienKhucMot
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
  }
}

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key d \major \time 2/4 \nhacPhienKhucHai
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
  }
}

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key d \major \time 2/4 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2.5
    \override Lyrics.LyricSpace.minimum-distance = #3.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}