% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Cùng Dâng" }
  composer = "Nhạc và Lời: Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc phiên khúc
nhacPhienKhuc = \relative c' {
  \partial 4 
  d8 a' |
  a g bf a |
  g4. f8 |
  a g f e |
  d4 d8 a' |
  a g bf a |
  g4. f8 |
  a g f e |
  d4 r8
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c'' {
  \partial 8 a8 |
  d4 d8 e |
  f4 e8 d |
  f e d bf |
  a4. a8 |
  d4 d8 e |
  f4 e8 d |
  cs cs b! cs |
  d2 ( |
  d4) \bar "|."
}

nhacDiepKhucAlto = \relative c'' {
  \partial 8 a8 |
  f4 f8 bf |
  a4 g8 f |
  a g f d |
  cs4. a'8 |
  f4 f8 bf |
  a4 g8 f |
  e e g g |
  fs2 ( |
  fs4)
}

nhacDiepKhucBas = \relative c' {
  \partial 8 a8 |
  bf4 d8 cs |
  d4 a8 a |
  d, g g g |
  a4. a8 |
  bf4 a8 a |
  d,4 g8 g |
  a4 a8 a |
  <<
    {
      a2 ^( |
      a4)
    }
    {
      d,2 _( |
      d4)
    }
  >>
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"(Nữ) 1."
  Cùng dâng lên tòa Chúa uy linh của lễ hy sinh nhiệm màu.
  \set stanza = #"(Nam) "
  Rươu thơm ngon và bánh tinh tuyền cùng khó nhọc của muôn người.
}

loiPhienKhucHai = \lyricmode {
  \override Lyrics.LyricText.font-shape = #'italic
  \set stanza = #"2."
  Đời con đây dâng Chúa uy linh trọn tất cả tuổi xuân này.
  Tựa hương thơm trầm ngát lan bay lên Thánh nhan Cha dịu hiền.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Đoàn con dâng hồn xác yếu hèn xin Chúa nhân từ nhận lời.
  Lòng con sẽ hạnh phúc thảnh thơi vì có Chúa luôn hộ phù.
}

% Lời điệp khúc
loiDiepKhucSop = \lyricmode {
  Hợp dâng lên của lễ linh mục kính tiến trên bàn thờ.
  Nguyện xin Cha giáng phúc cho mọi người tràn đầy hồng ân.
}

loiDiepKhucBas = \lyricmode {
  Hợp dâng lên của lễ tay linh mục dâng trên bàn thờ.
  Nguyện xin Cha ban tặng cho nhân thế đầy hồng ân.
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

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key f \major \time 2/4 \nhacPhienKhuc
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.0
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  } 
}

\score {
  \new ChoirStaff <<
    \new Staff \with {
        \consists "Merge_rests_engraver"
        %\magnifyStaff #(magstep +1)
      }
      <<
        \clef "treble"
        \new Voice = beSop {
          \voiceOne \key f \major \time 2/4 \nhacDiepKhucSop
        }
        \new Voice = beAlto {
          \voiceTwo \key f \major \time 2/4 \nhacDiepKhucAlto
        }
        \new Lyrics \lyricsto beSop \loiDiepKhucSop
    >>
    \new Staff \with {
        \consists "Merge_rests_engraver"
        %\magnifyStaff #(magstep +1)
      }
      <<
        \clef "bass"
        \new Voice = beBas {
          \voiceTwo \key f \major \time 2/4 \nhacDiepKhucBas
        }
        \new Lyrics \lyricsto beBas \loiDiepKhucBas
    >>
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}
