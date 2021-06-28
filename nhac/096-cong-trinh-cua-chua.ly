% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Công Trình Của Chúa" }
  poet = "Tv. 103"
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
nhacDiepKhuc = \relative c' {
  \partial 4 d8 d |
  d'2 b4 |
  g2 \breathe g8 fs |
  e2 e4 |
  \acciaccatura c8 d2 \breathe a'8 d, |
  d2 b4 |
  d2 fs4 |
  g2. \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \partial 4 d4 |
  b' fs g |
  a2 a4 |
  b g a |
  b2 g4 |
  d' c b |
  e,2 \breathe fs4 |
  d a' b |
  g2. \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \partial 4 d8 g |
  b2 d,8 b' |
  a2 a4 |
  b2 b8 g |
  a2 a8 b |
  e,2 d4 |
  d2. |
  r2 fs8 d |
  e2 a8 a |
  g2 b4 |
  a2 d,8 g |
  b2 g8 a |
  fs2 a4 |
  g2. \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \partial 4 g8 fs |
  e2 e8 (g) |
  b2 g8 e |
  c2 d4 |
  d2 g8 e |
  d2 c'4 |
  c2 a8 b |
  b2. |
  r2 g8 g |
  a2 fs4 |
  fs2 d4 |
  g2. \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Lạy Thượng Đế con thờ,
  Chúa muôn trùng cao cả.
  Công trình Ngài vạn đại thiên thu.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Ngài khiến mọc cỏ xanh, nuôi sống đàn gia súc,
  làm tốt tươi thảo mộc, cho người thế hưởng dùng.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Từ ruộng đất, họ kiếm ra cơm bánh.
  Chế rượu ngon cho phấn khởi lòng người.
  Xức dầu thơm cho gương mặt sáng tươi.
  Nhờ cơm bánh mà no lòng chắc dạ.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Công trình Ngài, lạy Chúa,
  quả thiên hình vạn trạng.
  Chúa hoàn thành tất cả thật khôn ngoan.
  Sự nghiệp Chúa tràn đầy mặt đất.
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
        \key g \major \time 3/4 \stemNeutral \nhacDiepKhuc
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
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
        \key g \major \time 3/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3.0
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
        \key g \major \time 3/4 \nhacPhienKhucHai
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
        \key g \major \time 3/4 \nhacPhienKhucBa
      }
    >>
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
