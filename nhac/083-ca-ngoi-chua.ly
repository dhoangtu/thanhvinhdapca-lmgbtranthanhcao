% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Ca Ngợi Chúa" }
  poet = "Tv. 112"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhuc = \relative c' {
  \override Score.SpacingSpanner.strict-grace-spacing = ##t
  \partial 2 e4 \tuplet 3/2 { g8 a g } |
  c2 r4 a8 e' |
  d4. d8 d b4 g8 |
  f2 r4 d8 e |
  f4. g8 g \acciaccatura d8 e4 d8 |
  c1 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \partial 4. g8 a c |
  c4 c8 b a b g4 |
  r d8 e d f g f |
  e2 f8 e g a |
  c2 r4 a8 a |
  c4 d8 e e4 \fermata d |
  c1 \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \partial 2. c8 a f a c e, |
  g2 r4 f8 f |
  d4 d8 e c4 e |
  g2 r4 g8 g |
  fs g a b a2 |
  b8 g d' b g2 |
  a8 g a g g4 b |
  c1 \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \partial 4 d8 e |
  c4 g'8 f g4 d8 e |
  c2. e8 c |
  g'4 fs8 g a4 d,8 g |
  g4 \breathe f8 f a a g g |
  b4 g8 g e'4 d |
  c1 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Nào ta ca ngợi Chúa,
  Người đỡ nâng, cất nhắc kẻ cơ hàn.
  Người nâng đỡ, cất nhắc kẻ nghèo hèn.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Hỡi tôi tớ Chúa hãy dâng lời ca ngợi.
  Nào ca ngợi danh Thánh Chúa đi.
  Chúc tụng danh Thánh Chúa,
  tự giờ đây cho mãi đến muôn đời.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Chúa siêu việt trên hết mọi dân.
  Vinh quang Người vượt xa trời cao thẳm.
  Ai sánh tày Thượng Đế Chúa ta.
  Đấng ngự chốn cao vời cúi mình xem bầu trời trái đất.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Kẻ yếu hèn, Chúa nâng đỡ từ cát bụi.
  Ai nghèo túng, Người cất nhắc khỏi phân tro.
  Đặt ngồi chung với hàng quyền quý.
  Hàng quyền quý dân Người.
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
TongNhip = { \key c \major \time 2/2 }

\score {
  \new ChoirStaff <<
    \new Staff = diepKhuc \with {
        \consists "Merge_rests_engraver"
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \TongNhip \nhacDiepKhuc
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.3
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \override Score.SpacingSpanner packed-spacing = ##t
  }
}

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key c \major \time 2/2 \nhacPhienKhucMot
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
        \key c \major \time 2/2 \nhacPhienKhucHai
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.1
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \override Score.SpacingSpanner packed-spacing = ##t
  } 
}

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key c \major \time 2/2 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #1.4
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    %\override Score.SpacingSpanner packed-spacing = ##t
  } 
}
