% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
 title = \markup { \fontsize #3 "Ca Tụng Chúa Đi" }
  poet = "Tv. 146"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhuc = \relative c'' {
  \partial 4. g8 e a |
  g4 d |
  c4. e8 |
  d d16 d  c8 e |
  g2 |
  r8 c b d |
  c4 a |
  a4. e'8 |
  d d16 d b8 d |
  c2 ( |
  c4) r \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  g8 e a g |
  d2 |
  e8 a e a |
  g2 |
  c8 b d b |
  a2 |
  a8 g c d |
  e2 |
  d4. a8 |
  d8 c b a |
  g8 g4 g8 |
  g2 |
  e8 d a' g |
  g4 d16 (e) d8 |
  c2 ( |
  c4) r \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \partial 4 g8 c |
  a a16 a e8 a |
  c4. a16 e' |
  d8 b d b |
  g2 |
  r4 e8 e |
  a a16 a e8 g |
  b2 |
  g8 g d' d |
  a4 d8 d |
  c2 ( |
  c4) r \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \partial 4 c8 b |
  a f d f |
  \acciaccatura d8 g2 |
  r4 \tuplet 3/2 { e8 c e } |
  e4 \tuplet 3/2 { g8 f e } |
  d2 |
  r4 a'8 g |
  a a g a |
  b2 |
  r4 b8 b |
  g2 |
  g8 g d' d |
  c2 ( |
  c4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Ca tụng Chúa đi nào, Người chữa trị bao tâm hồn tan vỡ.
  Ca tụng Chúa đi nào, Người chữa trị bao cõi lòng nát tan.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Ca tụng Chúa đi nào, đàn hát mừng Chúa ta.
  Ca tụng Chúa đi nào, thỏa tình ta biết mấy.
  Chúa là Đấng xây dựng lại "Giê -" "ru -" "sa -" lem
  quy tụ Is -- ra -- el tản lạc về.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Người chữa trị bao cõi lòng tan vỡ.
  Những vết thương băng bó cho lành.
  Người định số cho muôn triệu vì sao.
  Và đặt tên cho từng ngôi sao một.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Chúa chúng ta thật là cao cả.
  Uy lực vô biên, trí tuệ khôn lường.
  Chúa nâng đỡ những ai khiêm tốn.
  Bọn gian tà Người hạ xuống đất đen.
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
  system-system-spacing = #'((basic-distance . 13))
  score-system-spacing = #'((basic-distance . 13))
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
        \TongNhip \nhacDiepKhuc
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2
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
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2
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
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3
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
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  } 
}
