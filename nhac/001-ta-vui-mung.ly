% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Ta Vui Mừng" }
  poet = "Tv. 121"
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
nhacDiepKhuc = \relative c'' {
  \partial 4 g8 g |
  c,4
  <<
    {
      e8. g16 |
      e8 g a4 |
      a8 g d'4 |
      e8 d c d |
      c2 ^( |
      c4 r
    }
    {
      \tweak font-size -2 c,8. \tweak font-size -2 e16 |
      \tweak font-size -2 c8 \tweak font-size -2 e \tweak font-size -2 f4 |
      \tweak font-size -2 f8 \tweak font-size -2 e \tweak font-size -2 g4 |
      \tweak font-size -2 c8 \tweak font-size -2 b \tweak font-size -2 g \tweak font-size -2 f |
      \tweak font-size -2 e2 _( |
      \tweak font-size -2 e4) r
    }
  >>
  \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \partial 4 c8 g |
  g2 |
  g8 g e \afterGrace d (e8) |
  d2 |
  r8 e c e |
  f4 d8 f |
  g2 ( |
  g8) r g g |
  b2 |
  c8 c c c |
  d2 |
  r4 d8 b |
  g4. b8 |
  d4 g, |
  c2 ( |
  c4) r \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  r4 g8 a |
  g4. f8 |
  d4 e |
  f2 |
  r8 f e e |
  d4 b'8 a |
  g2 |
  r4 e8 g |
  a4. g8 |
  f4 g |
  d2 |
  r8 d b d |
  g,4. c8 |
  e4 \afterGrace d (c8) |
  c2 ( |
  c4) r4 \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \partial 4 e8 g |
  a4. g8 |
  a4 c |
  e,2 |
  r4 g8 e |
  g a g b |
  d4 d8 b |
  c2 ( |
  c4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Ta vui mừng trảy lên Đền Thánh Chúa,
  Ta mừng vui tiến lên Đền Thánh Người.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Vui chừng nào khi thiên hạ bảo tôi:
  Ta cùng trẩy lên Đền Thánh Chúa.
  Và giờ đây Giê -- ru -- sa -- lem hỡi
  Cửa nội thành, ta đã dừng chân.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Từng chi tộc, chi tộc của Chúa.
  Trảy hội lên đền, ở nơi đây.
  Để danh Chúa họ cùng xưng tụng.
  Như lệnh đã truyền cho Is -- ra -- el.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Cũng nơi đó, đặt ngai xét xử.
  Ngai vàng của vương triều Đa -- vít, Tổ phụ xưa.
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
        \key c \major \time 2/4 \nhacDiepKhuc
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2.5
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
        \key c \major \time 2/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2.5
    \override Lyrics.LyricSpace.minimum-distance = #1.5
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
        \key c \major \time 2/4 \nhacPhienKhucHai
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2.5
    \override Lyrics.LyricSpace.minimum-distance = #1.5
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
        \key c \major \time 2/4 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2.5
    \override Lyrics.LyricSpace.minimum-distance = #1.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}
