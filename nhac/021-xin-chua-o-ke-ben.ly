% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Xin Chúa Ở Kề Bên" }
  poet = "Tv. 90"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhuc= \relative c'' {
  \partial 4 g8 fs |
  e4. a8 |
  c c a b |
  b4. a8 |
  b b d, e |
  e2 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  e8 a a g c c b4 \breathe
  b8 ef ef e a, b a g4 \breathe
  g8 a b b fs4 \breathe
  a8 b e, g g a b \breathe
  a c a b4 \breathe
  a8 a d, fs e4 ~ e \bar "||"
}

nhacPhienKhucHai = \relative c' {
  e8 b' b a a c \acciaccatura a8 b4 \breathe
  b8 ef \fermata ef ef! e! b a g4 \breathe
  g8 a g g a a b4 \breathe
  b8 fs g a b g fs e4 ~ e \bar "||"
}

nhacPhienKhucBa = \relative c' {
  e8 a a c b \breathe
  b g b e,4 \breathe
  g8 fs e b' a c a b4 \breathe
  b8 a c b ef b a g4 \breathe
  a8 b a b \acciaccatura e, g \acciaccatura g fs d4 \breathe
  b8 d fs a d, e e4 ~ e \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Lúc ngặt nghèo, xin Chúa ở kề bên con,
  xin hãy ở cùng con luôn.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Hỡi ai nương tựa Đấng Chí Tôn
  và núp bóng Đấng toàn năng cao cả
  Hãy thưa với Chúa rằng: Lạy Chúa Trời nơi con ẩn náu
  đồn lũy chở che, con tin cậy nơi Ngài.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Bạn sẽ chẳng gặp điều ác hại
  và tai ương không bén mảng tới nhà.
  Bởi chưng Người truyền cho Thiên Sứ giữ gìn bạn
  trên khắp mọi nẻo đường.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Và khi kêu đến Ta, Ta liền đáp lại.
  Lúc ngặt nghèo, có Ta ở kề bên.
  Ta giải cứu và ban nhiều danh vọng,
  cho sống lâu tuổi thọ an nhàn
  và hưởng ơn cứu độ Ta ban.
}


% Dàn trang
\paper {
  #(set-paper-size "a4")
  top-margin = 20\mm
  bottom-margin = 15\mm
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
  system-system-spacing = #'((basic-distance . 12)
                             (minimum-distance . 12)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 12)
                             (minimum-distance . 12)
                             (padding . 1))
}

% Thiết lập tông và nhịp
TongNhip = { \key g \major \time 2/4 }

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
            nonstaff-relatedstaff-spacing.padding = #1.5
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #6
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
        \TongNhip \nhacPhienKhucMot
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3
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
        \TongNhip \nhacPhienKhucHai
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
    \override Lyrics.LyricSpace.minimum-distance = #4
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
        \TongNhip \nhacPhienKhucBa
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucBa
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
