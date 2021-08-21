% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Tạ Ơn Chúa" }
  poet = "Tv. 91"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhuc = \relative c' {
  <>^\markup { \halign #35 " " }
  \partial 2 c4 (e) |
  g2 f4 a |
  g4. e8 e4 g |
  c2 \breathe a4 d |
  c4.
  <b \tweak font-size #-2 g>8
  <b \tweak font-size #-2 g>4
  <d \tweak font-size #-2 b> |
  <c \tweak font-size #-2 g>2 r4 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \partial 4 c8 e |
  d4 \tuplet 3/2 { f8 f a }
  \autoBeamOff
  c2 ~ |
  c8
  \autoBeamOn
  
  \once \override NoteColumn.X-offset = 4
  c e c g4 \tuplet 3/2 { d8 f f } |
  e2 r4 c8 e |
  g4. a8 a f4 g8 |
  d2 r4 g8 f |
  e2 b8 c d e |
  c2 r \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \partial 4 c8 e |
  g4 f8 f a8. a16 g8 b |
  c2 r4 e8 c |
  g2 d8 f g f |
  e2 r4 c8 e |
  g4. a8 g a4 g8 |
  b2 b8 d d a |
  a4. g8 d'4 e |
  c2 r \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \partial 4 d8 e |
  c2 a'8 g g f |
  \acciaccatura d8 e2 r4 \tuplet 3/2 { f8 f f } |
  a2 a8 d4 c8 |
  c2 r4 c8 a |
  g4. a8 d, d4 g8 |
  \acciaccatura d8 g2 \tupletUp \tuplet 3/2 { \stemDown b4 a a \stemNeutral } |
  g2 \tupletUp \tuplet 3/2 { b4 c d } |
  c2 r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override LyricText.extra-offset = #'(0 . 1)
  Lạy Chúa, hạnh phúc thay được tạ ơn Chúa.
  Hạnh phúc thay được tạ ơn Ngài.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Hạnh phúc thay được tạ ơn Chúa.
  \override LyricText.self-alignment-X = #LEFT
  Mừng "hát  "
  \override LyricText.self-alignment-X = #CENTER
  danh Ngài, lạy Đấng Chí Tôn.
  Từ buổi sớm, tuyên xưng Ngài nhân hậu.
  Suốt canh khuya, truyền giảng Chúa tín thành.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Người công chính thịnh đạt như cây dừa tươi tốt.
  Sức vươn mình tựa hương bá "Li -" băng,
  Chẳng khác chi cây trồng nơi nhà Chúa,
  mơn mởn giữa khuôn viên Đền Thánh của Người.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Già cỗi rồi vẫn sinh hoa kết quả.
  Tràn đầy nhựa sống, cành lá xanh tươi.
  Thế mới hay, Chúa thực là ngay thẳng
  Đấng tôi nương nhờ, chẳng chút bất công.
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
      "Deja Vu Serif Condensed"
      "Deja Vu Serif Condensed"
      "Deja Vu Serif Condensed"
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
TongNhip = {
  \key c \major \time 4/4
  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment = #(ly:make-moment 1/4)
  \set Timing.beatStructure = #'(1 1 1 1)}

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
            nonstaff-relatedstaff-spacing.padding = #2.5
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #5.5
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
            nonstaff-relatedstaff-spacing.padding = #1.2
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #1.5
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
        \TongNhip \nhacPhienKhucHai
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.2
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.5
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
        \TongNhip \nhacPhienKhucBa
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
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \override Score.SpacingSpanner packed-spacing = ##t
  }
}
