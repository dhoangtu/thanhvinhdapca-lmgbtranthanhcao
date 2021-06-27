% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Hãy Reo Mừng Thiên Chúa" }
  poet = "Tv. 65"
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
nhacDiepKhuc= \relative c' {
  \partial 4. d8 e d |
  b4 g'8 a |
  g4 a |
  b \breathe \tuplet 3/2 {
    <\tweak font-size -2 e c \tweak font-size -2 g>8
    <\tweak font-size -2 e c \tweak font-size -2 g>8
    <\tweak font-size -2 e c \tweak font-size -2 g>8
  } |
  <\tweak font-size -2 fs d \tweak font-size -2 c,>2 |
  d8 d d b |
  a4 a8 g |
  e4 a |
  g4 \breathe \tuplet 3/2 {
    <\tweak font-size -2 e' c \tweak font-size -2 d,>8
    <\tweak font-size -2 e c \tweak font-size -2 e,>8
    <\tweak font-size -2 e c \tweak font-size -2 fs,>8
  } |
  <\tweak font-size -2 d g,>2 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  g8 a b4 \breathe
  a8 b b4 \breathe
  a8 b a g e4 \breathe
  g8 a g e d4 a'8 b a g e g g4 \fermata \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  g8 a b4 b8 a a b fs4
  e8 a fs d b fs' e4 \breathe
  b'8 a b4 a8 b g e e4
  a8 d, d4 fs8 a b, e4 \fermata \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  g8 a b b b a b e,4 \breathe
  e8 fs d e b g' g4 \breathe
  g8 g a b4 b8 a a \acciaccatura e8 g4
  a8 a fs4 d8 b' a a g4 \fermata \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Toàn thể địa cầu hãy reo mừng Thiên Chúa
  Hal -- lê -- lu -- ia.
  Trái đất hãy vui lên, hãy reo mừng Chúa ta
  Hal -- lê -- lu -- ia.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Cả trái đất nào tung hô cất tiếng ca reo mừng,
  cất tiếng ca chúc tụng.
  Chúa chúng ta sự nghiệp oai linh.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Toàn trái đất hãy quỳ lạy tôn thờ.
  Đàn hát lên ca ngợi Thánh Danh.
  Đến mà xem việc Chúa Trời thực hiện.
  Công trình Người cho kẻ phàm nhân.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Làm cho biển khơi hóa ra đất liền,
  và dân Người đi bộ qua sông.
  Việc Ngài làm đó khiến ta hoan hỉ.
  Chúa dũng lực hằng hiển trị muôn đời.
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
        \key g \major \time 2/4 \stemNeutral \nhacDiepKhuc
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2.5
    \override Lyrics.LyricSpace.minimum-distance = #1.2
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
        \key g \major \time 2/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2.5
    \override Lyrics.LyricSpace.minimum-distance = #2.0
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
        \key g \major \time 2/4 \nhacPhienKhucHai
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2.5
    \override Lyrics.LyricSpace.minimum-distance = #2.0
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
        \key g \major \time 2/4 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2.5
    \override Lyrics.LyricSpace.minimum-distance = #2.0
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  }
}
