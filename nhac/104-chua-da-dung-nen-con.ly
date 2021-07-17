% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Chúa Đã Dựng Nên Con" }
  poet = "Tv. 138"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c' {
  \partial 2 f4 g |
  c4. c8 bf4 c |
  c4. c8 f,4 g |
  a c2 bf8 _(g) |
  f4. f8 d4 f |
  f g2 e8 _(d) |
  c4. g'8 g e4 g8 |
  f1 \bar "|."
}

nhacDiepKhucBas = \relative c' {
  \partial 2 f4 g |
  a4. a8 g4 a |
  a4. a8 d,4 c |
  f a2 g8 (e) |
  f4. f8 d4 f |
  d d2 c8 (bf) |
  f4. c'8 c4 bf |
  a1
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  f8 (g) c4 bf8 bf c (d) c4
  bf8 bf c d4 d8 c g a c g f4 \breathe
  f8 d d d4 c8 f a f g4 \breathe
  g8 c, g' a g \breathe
  g8 e bf' c4
  bf8 d c c4
  g8 bf c g f4 ~ f \bar "||"
}

nhacPhienKhucHai = \relative c' {
  f8 g c4 c8 c bf c g4 \breathe
  d8 f d c g' f a g4 \breathe
  f8 f f c' bf c c d c bf4 \breathe
  bf8 g g c a g f4 \breathe
  ef8 g g bf c e, f4 ~ f \bar "||"
}


nhacPhienKhucBa = \relative c'' {
  c8 bf c bf c bf c g4 \breathe
  bf8 bf f f f4 gf \fermata g \fermata
  bf f4 \breathe
  f8 g! f f f4
  a8 f c' d bf4 ~ bf \bar "||"
}

% Lời điệp khúc
loiDiepKhucSop = \lyricmode {
  Cảm tạ Chúa đã dựng nên con,
  đã dựng nên con cách lạ lùng,
  đã dựng nên con cách lạ lùng.
  Con dâng lời cảm tạ.
}

loiDiepKhucBas = \lyricmode {
  Cảm tạ Chúa đã dựng nên con,
  đã dựng nên con cách lạ lùng,
  đã dựng nên con cách lạ lùng.
  Con xin cảm tạ.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Lạy Chúa, Ngài dò xét con và Ngài biết rõ,
  biết con cả khi đứng khi ngồi.
  Con nghĩ tưởng gì, Ngài thấu suốt từ xa.
  Đi lại hay nghỉ ngơi, Chúa đều xem xét.
  Đường lối con theo, Ngài biết rõ ngọn nguồn.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Tạng phủ con, ấy chính Ngài cấu tạo dệt tấm hình hài,
  trong dạ mẫu thân.
  Cảm tạ Ngài, đã dựng nên con cách lạ lùng.
  Công trình Ngài xiết bao kỳ diệu.
  Hồn con đây, biết rõ mười mươi.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Chi thể con, Ngài không lạ lẫm gì,
  Khi con được hình thành trong nơi bí ẩn.
  Được thêu dệt tài tình trong lòng đất thẳm sâu.
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

\score {
  \new ChoirStaff <<
    \new Staff \with {
        \consists "Merge_rests_engraver"
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key f \major \time 2/2 \nhacDiepKhucSop
      }
      \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiDiepKhucSop
    >>
    \new Staff \with {
        \consists "Merge_rests_engraver"
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beBas {
        \key f \major \time 2/2 \nhacDiepKhucBas
      }
      \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beBas \loiDiepKhucBas
    >>
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #1.6
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
        \key f \major \time 2/2 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.2
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #0.9
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
        \key f \major \time 2/2 \nhacPhienKhucHai
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
    \override Lyrics.LyricSpace.minimum-distance = #1.5
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
        \key f \major \time 2/2 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.2
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #1.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}
