% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Một Niềm Vui" }
  poet = "Tv. 125"
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
  %system-system-spacing = #'((basic-distance . 13))
  score-system-spacing = #'((basic-distance . 14))
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c' {
  e8 g d g |
  a c4 d8 |
  b2 |
  a8 b e, a |
  b4 fs8 d |
  g2 ( |
  g4) r \bar "|."
}

nhacDiepKhucBass = \relative c' {
  \skip 2
  fs8 a4 b8 |
  g2 |
  e8 g c, e |
  g4 d8 c |
  b2 ( |
  b4) r
}

% Nhạc phiên khúc
nhacPhienKhuc = \relative c' {
  \partial 4. b'8 d d |
  e, fs fs e |
  d4. d8 |
  g, b d e |
  d4. c8 |
  c4 e8 e |
  e4 d8 fs ( |
  fs) a a e |
  c' d4 fs,8 |
  g2 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Việc Chúa làm cho ta, ôi vĩ đại.
  Ta thấy mình chan chứa một niềm vui.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1. "
  Khi Chúa dẫn tù Si -- on trở về,
  Ta tưởng mình trong giấc mơ.
  Ngoài miệng vang vang câu cười nói,
  trên môi rộn rã khúc nhạc mừng.
}

loiPhienKhucHai = \lyricmode {
  \override Lyrics.LyricText.font-shape = #'italic
  \set stanza = #"2. "
  Hôm ấy khắp bàn dân nghe luận đàm,
  Ôi việc tay Chúa lớn lao.
  Việc Ngài thi công cao trọng quá,
  con nghe hồn chất ngất niềm vui.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3. "
  Xin Chúa dẫn đường con dân trở về,
  như chuyển dòng suối phía Nam.
  Nghẹn ngào ra đi gieo hạt giống,
  mai sau gặt hái sẽ mừng vui.
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
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #4
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
        \key g \major \time 2/4 \nhacPhienKhuc
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
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
