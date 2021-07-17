% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Chén Hồng Ân" }
  poet = "Tv. 115"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhuc = \relative c'' {
  \partial 4 g8 g |
  a e g a |
  c,4 c8 d |
  c4 d |
  g2 |
  r4 a8 a |
  b a b d |
  g,4 b8 d |
  c4 d |
  c2 ~ |
  c4 r \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \partial 4 g8 f |
  d a' b a |
  g4 d8 f |
  e d e c |
  d4 r |
  r g8 g |
  a f a c |
  g4 a8 c |
  a4 c |
  d2 ~ |
  d4 r \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \partial 4 c8 c |
  g f d f |
  g2 |
  r8 b b d, |
  f g d16 ^(e) d8 |
  c2 |
  r4 g'8 e |
  c'2 |
  c8 a a c |
  d4 b8 a |
  g2 |
  f8 d d c |
  c2 \tweak extra-offset #'(0 . 3) ^~ |
  c4 r \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \partial 4 g8 a |
  g c c e, |
  g4 f8 a |
  g4 b |
  c2 |
  a8 c e, f |
  g2 |
  b4 b8 d |
  g,4 g8 d |
  e4 d |
  c2 ~ |
  c4 r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Tôi nâng Chén Hồng Ân cứu độ mà xưng tụng danh Chúa.
  Tôi nâng Chén Hồng Ân  cứu độ mà xưng tụng danh Người.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Lấy chi đền đáp Chúa bây giờ,
  vì những ơn chan chưa Người ban.
  Tôi nâng Chén Hồng Ân cứu độ, mà xưng tụng Danh Chúa.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Trước Thánh Nhan thật là quý giá,
  cái chết của ai hiếu nghĩa với Người.
  Vâng lạy Chúa, thân này là tôi tớ:
  tôi tớ Ngài, con của nữ tỳ Ngài.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Con sẽ dâng hiến lễ Tạ ơn, mà xưng tụng Danh Chúa.
  Lời khấn nguyện với Chúa,
  tôi xin giữ trọn trước toàn thể dân Người.
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
  system-system-spacing = #'((basic-distance . 12.5)
                             (minimum-distance . 12.5)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 12.5)
                             (minimum-distance . 12.5)
                             (padding . 1))
}

% Thiết lập tông và nhịp
TongNhip = { \key c \major \time 2/4 }

\score {
  \new ChoirStaff <<
    \new Staff = diepKhuc \with {
        \consists "Merge_rests_engraver"
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \TongNhip \stemNeutral \nhacDiepKhuc
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.2
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #1.5
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
        \key c \major \time 2/4 \nhacPhienKhucMot
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
    \override Lyrics.LyricSpace.minimum-distance = #1.5
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
        \key c \major \time 2/4 \nhacPhienKhucHai
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.5
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.7
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
        \key c \major \time 2/4 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #2
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.7
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  } 
}
