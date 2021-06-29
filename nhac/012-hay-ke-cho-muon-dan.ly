% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Hãy Kể Cho Muôn Dân" }
  poet = "Tv. 95"
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
  system-system-spacing = #'((basic-distance . 13))
  score-system-spacing = #'((basic-distance . 13))
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c'' {
  \partial 8 d8 |
  g,4 a8 b |
  c4. c8 |
  e,4 fs8 g |
  a4 d |
  d8 a a b |
  g2 ( |
  g4) r \bar "|."
}

nhacDiepKhucBas = \relative c'' {
  \partial 8 d8 |
  b4 c8 d |
  e4. e8 |
  a,4 b8 c |
  d4 d |
  d8 c c d |
  b2 ( |
  b4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  e8 d c g'4 f8 f a c4 \breathe
  d8 d b g g4 f8 d e d c4 \breathe
  e8 g g g a g a b4 \breathe
  b8 g d' b a a4 g8 g4 \bar "||"
}

nhacPhienKhucHai = \relative c' {
  e8 d g4 a8 a g e4 a8 g b4 a8 b d e, g4 \breathe
  f8 e d a' a b a g4
  a8 g b b4 b8 g g g g \acciaccatura d' c4 \bar "||"
}

nhacPhienKhucBa = \relative c' {
  e8 d a'4 a8 d, d g e4 \breathe
  a8 g g a a g b d c4 \breathe
  c8 c c a g4 \breathe
  a8 f g a e4 a8 g b b b g b d e c4 (c) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Hãy kể cho muôn dân,
  hãy kể cho muôn dân biết những việc lạ Chúa làm.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Hát lên mừng Chúa, một bài ca mới.
  Hãy hát lên mừng Người hỡi toàn thể địa cầu.
  Kể cho muôn dân biết, Người vinh hiển,
  cho mọi nước nghe việc lạ Người làm.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Hãy dâng Chúa, hỡi các dân tộc,
  hãy dâng Chúa mọi vinh hiển quyền năng.
  Hãy dâng lời ca khen xứng danh Người.
  Lễ vật mang lên, bước vào tiền đình Nhà Chúa.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Bàn thờ Chúa, Đấng rạng ngời Thánh thiện.
  Khắp hoàn cầu hãy run sợ trước Thánh nhan.
  Hãy nói giữa chư dân:
  Chúa là Vua hiển trị,
  cai trị muôn dân theo đường công minh chính trực.
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
        \voiceTwo \key g \major \time 2/4 \nhacDiepKhucSop
      }
      \new Voice = beBas {
        \override NoteHead.font-size = #-2
        \voiceOne \key g \major \time 2/4 \nhacDiepKhucBas
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #5
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
        \key c \major \time 2/4
        \set Staff.keyAlterations = #`(((1 . 3) . ,NATURAL))
        \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key c \major \time 2/4
        \set Staff.keyAlterations = #`(((1 . 3) . ,NATURAL))
        \nhacPhienKhucHai
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
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key c \major \time 2/4
        \set Staff.keyAlterations = #`(((1 . 3) . ,NATURAL))
        \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #4
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}

