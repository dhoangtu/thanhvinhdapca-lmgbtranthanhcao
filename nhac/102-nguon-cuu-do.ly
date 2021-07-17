% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Nguồn Cứu Độ" }
  poet = "Is. 12"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhuc = \relative c' {
  \partial 4 f8 d |
  f d c f |
  \acciaccatura f8 a4 \breathe bf8 a |
  g4. d'8 |
  bf4 g |
  c2 |
  r4 g8 e |
  c g' e c |
  f2 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  f8 f d f |
  bf4 \tuplet 3/2 { bf8 bf f } |
  a2 |
  g8 g e4 |
  d8 e d e |
  c2 \tweak extra-offset #'(0 . 3) ^~ |
  c4 \tuplet 3/2 { d8 e c } |
  g'4 g8 bf |
  g a a g |
  bf4 \tuplet 3/2 { \stemUp d8 d b! \stemNeutral } |
  c4 bf8 g |
  f2 ~ |
  f4 r \bar "||"
}

nhacPhienKhucHai = \relative c' {
  f8 d bf'4 |
  bf8 d, f g |
  a2 |
  bf8 g a4 |
  f8 g d e |
  c2 |
  g'8 g e g |
  c4 d8 c |
  bf2 |
  g8 c a g |
  c,4 g' |
  f2 ( |
  f4) r \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \partial 4 bf8 g |
  bf \breathe g c a |
  a2 |
  g8 e g e |
  c4 \tuplet 3/2 { c8 f a } |
  g4 r8 bf |
  bf bf g bf |
  g _(c4) \breathe f,8 |
  a (g) g (f) |
  f2 ~ |
  f4 r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Các bạn sẽ vui mừng hoan hỷ.
  Uống tận nguồn cứu độ trào dâng,
  uống tận nguồn cứu độ trào dâng.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Đây chính là Thiên Chúa, Đấng Cứu Độ tôi.
  Tôi tin tưởng và không sợ hãi gì.
  Vì sức mạnh tôi và khúc nhạc tôi ca là Chúa.
  Đấng Cứu Độ tôi chính là Ngài.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Trong ngày đó, các bạn lên tiếng nói:
  Hãy tạ ơn và xưng tụng danh Người.
  Huân công Người loan báo giữa muôn dân
  và nhắc nhở Danh Người siêu việt.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Hát mừng Chúa, và hãy loan đi cho toàn cõi địa cầu,
  vì ở giữa ngươi có Đấng Thánh thật cao cả,
  của Is -- ra -- el.
}


% Dàn trang
\paper {
  #(set-paper-size "a4")
  top-margin = 20\mm
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
  system-system-spacing = #'((basic-distance . 11.5)
                             (minimum-distance . 11.5)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 11.5)
                             (minimum-distance . 11.5)
                             (padding . 1))
}

% Thiết lập tông và nhịp
TongNhip = { \key f \major \time 2/4 }

\score {
  \new ChoirStaff <<
    \new Staff = diepKhuc \with {
        \consists "Merge_rests_engraver"
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \TongNhip \nhacDiepKhuc
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiDiepKhuc
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
        \key f \major \time 2/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.5
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.1
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
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucHai
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
        \key f \major \time 2/4 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.5
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #4
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  } 
}
