% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Tình Chúa" }
  poet = "Tv. 89"
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
  a8 a g |
  a4 d,8 |
  e f d |
  a'4. |
  g8 bf a |
  g4 a8 |
  a4 f8 |
  f4. |
  e8 g f |
  e4 g8 |
  g4 e8 |
  d4. ( |
  d4) r8 \bar "|."
}

nhacDiepKhucBas = \relative c' {
  f8 f d |
  f4 bf,8 |
  c c a |
  f'4. |
  e8 f f |
  e4 f8 |
  f4 d8 |
  c4. |
  c8 d d |
  c4 d8 |
  d4 c8 |
  d4. ( |
  d4) r8
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  a8 g bf |
  a4 a8 |
  f e d |
  a'4 \breathe g8 |
  e f g |
  c,4 d8 |
  d4. ^( |
  d8) r d |
  a'4. |
  r8 bf g |
  g4 g8 |
  bf \acciaccatura d8 e d |
  a4 \breathe g8 |
  e e g |
  a4 \fermata \breathe e'8 |
  d e \acciaccatura bf8 a |
  d4. ( |
  d4) r8 \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \partial 4 d8 f |
  a4. |
  a8 a g |
  a4 d,8 |
  e f d |
  a'4. |
  bf8 a g ^( |
  g) bf (bf) |
  e e d |
  d4. _( |
  d4) c8 |
  c bf d |
  c g a |
  \acciaccatura g8 a4. |
  e8 g a |
  f4 \breathe e8 |
  g a a |
  e4 f8 |
  d4. ^( |
  d4) r8 \bar "||"
}

nhacPhienKhucBa = \relative c' {
  f8 d a' |
  a4 d,8 |
  f e d |
  a'4 \breathe e8 |
  g f e |
  g e f |
  d4. ^( |
  d4) g8 |
  bf g bf |
  d e d |
  a a4 |
  r4 g8 |
  bf c a |
  f4. |
  f8 e f |
  g4 e8 |
  f g e |
  f g e |
  d4. ^( |
  d4) r8 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Xin cho đoàn con được no say tình Chúa,
  Để chúng con được hớn hở vui ca,
  Để chúng con được hớn hở ca mừng.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Xin dạy chúng con biết tuổi đời là mấy.
  Ngõ hầu tâm trí được khôn ngoan.
  Lạy Chúa, xin trở lại!
  Ngài đợi đến bao giờ?
  Xin chạnh lòng thương xót những tôi tớ Ngài đây.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Từ buổi mai, xin cho đoàn con được no say tình Chúa.
  Để mọi ngày được hớn hở vui ca.
  Xin ban tặng chúng con niềm hoan hỷ.
  Bù những tháng năm, Ngài đã bắt nếm nhục nuốt sầu.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Cho bày tôi đây được thấy công trình Chúa,
  và cháu con chiêm ngưỡng vinh hiển Ngài.
  Xin Chúa hằng chiếu tỏa ánh huy hoàng Ngài.
  Việc tay chúng con làm, xin Ngài củng cố.
  Xin củng cố việc tay chúng con làm.
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
        \voiceOne \key f \major \time 3/8 \nhacDiepKhucSop
      }
      \new Voice = beBas {
        \override NoteHead.font-size = #-2
        \voiceTwo \key f \major \time 3/8 \nhacDiepKhucBas
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #1.9
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
        \key f \major \time 3/8 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
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
        \key f \major \time 3/8 \nhacPhienKhucHai
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
  }
}

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key f \major \time 3/8 \nhacPhienKhucBa
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
