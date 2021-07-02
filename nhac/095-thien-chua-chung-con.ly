% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Thiên Chúa Chúng Con" }
  poet = "Tv. 8"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhuc = \relative c' {
  e8 a c \acciaccatura b8 c |
  d e d4 |
  e8 a, c b |
  a4 b8 g |
  \acciaccatura g8 a2 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  a8 g a c |
  a8. e'16 c4 |
  d8 d d e |
  d16 (e) d (c) a4 |
  g8 b g b |
  c2 |
  b8 d b d |
  e4 \fermata \tuplet 3/2 { a,8 c b } |
  a2 |
  g8 b d g, |
  a2 ( |
  a4) r \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \partial 4 \tuplet 3/2 { a8 b g } |
  a4 \tuplet 3/2 { a8 c b } |
  d4 b |
  e2 |
  d8 d c b |
  a2 |
  g8 b d8. b16 |
  c2 |
  r4 \tuplet 3/2 { a8 c b } |
  a2 |
  g8 a f g |
  e2 |
  r4 \tuplet 3/2 { a8 g a } |
  e4 e8 a |
  c4 b |
  a2 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  a8 c a c |
  d2 |
  b8 d b d |
  e2 \fermata |
  e8 d a d |
  c4. a8 |
  g4. a8 |
  e4 c'8 b |
  d4 g, |
  a2 ( |
  a4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Lạy Thiên Chúa là Chúa chúng con,
  lẫy lừng thay danh Ngài khắp địa cầu.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Ngắm trời xanh tay Ngài sáng tạo.
  Muôn trăng sao Chúa đã an bài.
  Thì con người là chi,
  mà Chúa cần nhớ đến.
  Phàm nhân là gì, mà Chúa phải bận tâm.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  So với Thần Linh, Ngài không để thua là mấy.
  Ban vinh dự huy hoàng để làm mũ triều thiên.
  Kiệt tác của Ngài, Ngài cho làm bá chủ.
  Muôn loài muôn sự Ngài đặt cả dưới chân.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Bò chiên và dã thú,
  bò chiên và dã thú.
  Chim trời và cá biển mọi loài,
  muôn loại ngang dọc khắp trùng dương.
}


% Dàn trang
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

% Thiết lập tông và nhịp
TongNhip = { \key c \major \time 2/4 }

\score {
  \new ChoirStaff <<
    \new Staff = diepKhuc \with {
        \consists "Merge_rests_engraver"
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \TongNhip \stemNeutral \nhacDiepKhuc
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #4.0
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
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
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
        \TongNhip \nhacPhienKhucHai
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
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
        \TongNhip \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3.0
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  } 
}
