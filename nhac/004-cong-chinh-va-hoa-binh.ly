% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Công Chính Và Hòa Bình" }
  poet = "Tv. 71"
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
nhacDiepKhucSop = \relative c' {
  \partial 2 c4 d |
  e8. c16 c8 c c4 e |
  g2 a8 _(g) f4 |
  f2 b8 _(a) g4 |
  g4. g8 d4 d |
  d2 \breathe c4 d |
  e8. c16 c8 c c4 e |
  g2 g8 a g e |
  f2 f8 g d c |
  d4 d g,8 b4 d8 |
  d c c2 r4 \bar "|."
}

nhacDiepKhucBas = \relative c' {
  \override NoteHead.font-size = #-2
  \partial 2 g4 b |
  c8. g16 g8 g g4 b |
  c2 f8 ^(e) d4 |
  d2 g8 ^(f) e4 |
  e4. e8 b4 b |
  b2 g4 b |
  c8. g16 g8 g g4 b |
  c2 e8 f e c |
  d2 d8 e b g |
  b4 b g8 g4 b8 |
  b g c2 r4
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \partial 2. g8 e c'4 \breathe a8 c |
  g2 f8 d b' a |
  g2 r4 f8 a |
  d,2 d8 b c d |
  a2 r4 b8 c |
  d4. d8 d g a g |
  e2 g8 a b c |
  g2 d'8 b g d' |
  c2 r4 \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \partial 4 e8 g |
  c4. a8 c4 c |
  \acciaccatura e,8 g2 r4 f8 e |
  d4. a'8 b4 d, |
  g2 r8 e g a |
  c4. c8 e,4 d |
  d2 r8 d8 a' g |
  g2 g8 a b d |
  c2 r \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \partial 4 g'8 g |
  e2 f8 d e c |
  c2 r8 a' a f |
  d4. b'8 b4 a |
  g2 e8 a g e |
  g4. f8 f4d8 g |
  e2 b'8 a a a |
  g2 g8 a g b |
  c2 r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Sự công chính và nền hòa bình viên mãn, sẽ triển nở,
  sẽ triển nở trong triều đại Người.
  Sự công chính và nền hòa bình viên mãn
  cho đến khi mặt trăng,
  cho đến khi mặt trăng không còn chiếu ánh sáng lung linh.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Tâu Thượng Đế, quyền bính Ngài, xin hạ tứ Tân Vương.
  Công lý Ngài, xin tặng ban Thế Tử.
  Cho dân Chúa được Người xét xử công bình.
  Quyền lợi kẻ khó nghèo, sẽ được Người đỡ nâng.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Người giải thoát bần dân kêu khổ.
  Kẻ khốn cùng không chỗ tựa nương.
  Chạnh lòng thương xót những hạng nghèo hèn.
  Mạng sống dân đen, Người ra tay tế độ.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Danh thơm Người sẽ ngàn năm truyền tụng.
  Nức tiếng xa gần, dưới ánh mặt trời.
  Mọi sắc tộc trần gian, nhờ Người được chúc lành.
  Khắp muôn dân thiên hạ, ngợi khen Người diễm phúc.
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
        \voiceOne \key c \major \time 2/2 \nhacDiepKhucSop
      }
      \new Voice = beBas {
        \voiceTwo \key c \major \time 2/2 \nhacDiepKhucBas
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    %\override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #0.6
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
        \key c \major \time 2/2 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
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
        \key c \major \time 2/2 \nhacPhienKhucHai
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
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
        \key c \major \time 2/2 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #1.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}
