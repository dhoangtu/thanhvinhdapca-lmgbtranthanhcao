% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Ơn Phù Trợ" }
  poet = "Tv. 120"
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
  \partial 4 f8 c |
  d f g a |
  c2 |
  r8 bf d bf |
  c4. g8 |
  bf4 g8 a |
  f2 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \partial 4 c8 df |
  d bf c f, |
  \acciaccatura g8 a2 ( |
  a8) r g d |
  d f a g |
  g2 ( |
  g8) r8 f c |
  c f f g |
  a2 ( |
  a8) r g c |
  \autoBeamOff
  g bf \fermata
  \autoBeamOn
  g a |
  f2 \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \partial 4. c8 c a |
  bf4 g8 a |
  f2 |
  r8 f f d |
  f4 a8 f |
  g2 |
  r8 c, g' g |
  a f4 e8 |
  d2 |
  d8 bf' bf g |
  c c4 d8 |
  a2 |
  bf8 bf bf g |
  e4 d'8 b! |
  c2 \bar "||"
}

nhacPhienKhucBa = \relative c' {
  f4 df f |
  c2 df4 |
  d bf f' |
  c2. |
  e2 f4 |
  g2 bf4 |
  a2 g4 |
  f2. |
  f4 d f |
  bf2 a4 |
  g2. |
  a4 g a |
  c2 bf4 |
  g2 bf4 |
  c2. |
  bf4 c d |
  bf2 g4 |
  f2. ( |
  f4) r2 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Ơn phù trợ tôi do bởi Chúa
  là Đấng dựng nên, dựng nên cả đất trời.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Tôi ngước mắt nhìn lên rặng núi.
  Ơn phù hộ tôi bởi nơi nao.
  Ơn phù hộ tôi do bởi Chúa
  là Đấng dựng nên cả đất trời.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Chính Chúa là Đấng canh giữ bạn.
  Chính Chúa là Đấng vẫn chở che.
  Người luôn luôn ở gần kề bạn.
  Ngày sáu khắc vầng ô không tác hại.
  Đêm năm canh vành nguyệt chẳng hại chi.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Chúa gìn giữ bạn khỏi mọi điều bất hạnh.
  Bảo vệ cho sinh mệnh an toàn.
  Nẻo đường bạn Chúa lo toan.
  Lúc đi lúc tới Người hằng canh coi.
  Từ nay đến tận muôn đời.
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
        \key f \major \time 2/4 \stemNeutral \nhacDiepKhuc
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #4.0
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
        \key f \major \time 2/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #1.6
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
        \key f \major \time 2/4 \nhacPhienKhucHai
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #1.4
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
        \key f \major \time 3/4 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    %\override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #2.0
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  } 
}
