% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Hãy Dâng Lên Chúa" }
  poet = "Tv. 9"
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
  \partial 4. a8 g g |
  c2 e,8 g a e |
  g2 r8 f e d |
  g2 d8 f e d |
  c1 \bar "|."
}

nhacDiepKhucBas = \relative c' {
  \partial 4. f8 e e |
  g2 c,8 e f c |
  d2 r8 d c b |
  d2 b8 d c b
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  e8 d c g'4 \breathe
  f8 f a c4 \breathe
  d8 d b g g4
  f8 d e d c4 \breathe
  e8 g g g a g a b4 \breathe
  b8 g d' b a a4 g8 g4 \bar "||"
}

nhacPhienKhucHai = \relative c' {
  e8 d g4 a8 a g e4
  a8 g b4 a8 b d e, g4 \breathe
  f8 e d a' a b a g4 \breathe
  a8 g b b4 b8 g g g g \acciaccatura d'8 c4 \bar "||"
}

nhacPhienKhucBa = \relative c' {
  f8 d a'4 a8 d, d g e4 \breathe
  a8 g g a a g b d c4 \breathe
  c8 c c a g4 \breathe
  a8 d, g a e4
  a8 g b b b g b d e c4 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Hãy dâng lên Chúa, mọi vinh hiển quyền năng.
  Hãy dâng lên Chúa, lời chúc vinh Danh Ngài.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Hát lên mừng Chúa một bài ca mới.
  Hãy hát lên mừng Ngài hỡi toàn thể địa cầu.
  Kể cho muôn dân biết Người vinh hiển,
  cho mọi nước nghe việc là Người làm.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Hãy dâng Chúa, hỡi các dân tộc.
  Hãy dâng Chúa, mọi vinh hiển quyền năng.
  Hãy dâng lời ca khen xứng danh Người,
  lễ vật mang lên, bước vào tiền đình nhà Chúa.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Bái thờ Chúa, Đấng rạng ngời thánh thiện.
  Khắp hoàn cầu, hãy run sợ trước Thánh Nhan.
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
        \voiceOne \key c \major \time 4/4 \nhacDiepKhucSop
      }
      \new Voice = beBas {
        \override NoteHead.font-size = #-2
        \voiceTwo \key c \major \time 4/4 \nhacDiepKhucBas
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3.2
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
        \key c \major \time 4/4 \nhacPhienKhucMot
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
        \key c \major \time 4/4 \nhacPhienKhucHai
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
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
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key c \major \time 4/4 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #1.7
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}
