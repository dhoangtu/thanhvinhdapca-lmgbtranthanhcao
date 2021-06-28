% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Xin Ngài Ngự Đến" }
  poet = "Tv. 145"
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
  \partial 4 c4 |
  a' \tuplet 3/2 { a8 g a } |
  bf4 e,8 f |
  g4. c8 |
  a4 \breathe \tuplet 3/2 { bf8 a bf } |
  c4 c,8 d |
  g4. g8 |
  f2 \bar "|."
}

nhacDiepKhucBas = \relative c' {
  \skip 4
  f4 \tuplet 3/2 { f8 e f } |
  g4 c,8 d |
  e4. f8 |
  e4 \tuplet 3/2 { g8 f g } |
  a4 c,8 d |
  c4. bf8 |
  a2
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  c8 c a bf |
  c4 c8 a |
  f2 |
  d8 f f f | \break
  c4 f8 g |
  a2 |
  r4 bf8 bf |
  g bf c d |
  bf2 \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \partial 4 c'8 bf |
  c c a f |
  f4 \breathe f8 d |
  f f g d |
  c4 r8 g' |
  g g bf4 |
  g8 bf d bf |
  c2 |
  r8 g g a |
  d, c g' a |
  f2 \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \partial 4 c'8 g |
  g2 |
  c8 bf g bf |
  c2 |
  r4 bf8 c |
  d2 |
  bf8 bf g a |
  f2 |
  e8 g g4 |
  e8 c g' bf |
  a2 |
  bf8 bf bf4 |
  bf8 g bf bf |
  c2 |
  r4 a8 a |
  c2 |
  r8 bf g a |
  d c bf g |
  f2 ( |
  f4) r4 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Lạy Chúa, xin Ngài ngự đến mà giải thoát chung con.
  Xin Ngài ngự đến mà giải thoát chúng con.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Chúa giữ lòng trung tín mãi muôn đời.
  Xử công minh cho người bị áp bức.
  Ban lương thực cho kẻ đói ăn.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Chúa giải phóng những ai tù tội.
  Chúa mở mắt cho kẻ mù lòa.
  Kẻ bị dìm xuống, Người cho đứng thẳng lên.
  Ai công chính được Người yêu mến luôn.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Chúa phù trì kẻ lưu lạc tha phương.
  Người nâng đỡ cô nhi và quả phụ.
  Nhưng phá vỡ mưu đồ bọn ác nhân.
  Chúa nắm giữ vương quyền muôn muôn thuở.
  Si -- on hỡi Chúa Trời ngươi hiển trị muôn ngàn đời.
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
        \voiceOne \key f \major \time 2/4 \nhacDiepKhucSop
      }
      \new Voice = beBas {
        \override NoteHead.font-size = #-2
        \voiceTwo \key f \major \time 2/4 \nhacDiepKhucBas
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.0
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
        \key f \major \time 2/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.0
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
        \key f \major \time 2/4 \nhacPhienKhucHai
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.0
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
        \key f \major \time 2/4 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.0
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}
