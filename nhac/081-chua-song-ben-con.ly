% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Chúa Sống Bên Con" }
  poet = "Tv. 144"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhuc= \relative c'' {
  c2 g4 |
  bf a g |
  g2 f4 |
  a2. |
  bf4 bf a |
  a4. g8 g4 |
  f e g |
  f2. \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  c2 a4 |
  d,2 bf'4 |
  a2 g4 |
  c2. |
  d2 bf4 |
  f2 g4 |
  c4 c4. g8 |
  a2. |
  bf2 d,4 |
  e2 g4 |
  c,4. g'8 a f |
  g2. |
  c,2 f4 |
  a2 g8 e |
  c4 g' e |
  f2. ( |
  f4) \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \partial 4 c4 |
  c'2 a4 |
  d,2 bf'8 bf |
  a2 g4 |
  c2 \breathe bf8 c |
  g2 e'4 |
  e2 d4 |
  c2. ( |
  c4) r bf |
  d,2 d4 |
  bf'2 a4 |
  a2. |
  d,4 e e |
  d2 e4 |
  c2 g'8 (a) |
  f2. ( |
  f2) r4 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  c2 a4 |
  a a e8 (d) |
  d2 f8 (g) |
  a2. |
  d,2 f8 (g) |
  g2 g8 (a) |
  g (f) f4. c8 |
  c2. |
  bf'2 g4 |
  bf2 a4 |
  g g4. f8 |
  a2. |
  f4 g a |
  e2 g8 (a) |
  d,2 c4 |
  f2. ( |
  f2) r4 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Chúa gần gũi những ai kêu cầu Chúa.
  Chúa sống bên con khi con kêu cầu khấn xin.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Chúa một niềm xót thương từ ái,
  đã khoan hồng lại lắm nghĩa giàu ân.
  Chúa từ bi quảng đại với hết mọi người,
  và âu yếm mọi vật Ngài đã dựng nên.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Lạy Chúa, muôn loài ngước mắt trông lên Chúa,
  và chính Ngài đúng bữa cho ăn.
  Khi Ngài rộng mở tay ban,
  là bao sinh vật muôn vàn thỏa thuê.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Chúa yêu thương trong mọi đường lối Chúa.
  Đầy yêu thương trong mọi việc Người làm.
  Chúa gìn giữ những ai kêu cầu Chúa.
  Cầu xin với cả tấm lòng thành tín.
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
TongNhip = { \key f \major \time 3/4 }

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
    \override Lyrics.LyricSpace.minimum-distance = #2.2
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
    \override Lyrics.LyricSpace.minimum-distance = #2.2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  } 
}
