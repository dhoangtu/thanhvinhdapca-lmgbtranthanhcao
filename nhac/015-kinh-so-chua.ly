% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Kính Sợ Chúa" }
  poet = "Tv. 127"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucSop= \relative c'' {
  \partial 8 c8 |
  g4. f8 |
  d4 e8 e |
  c4 _(d) |
  g2 |
  r8 a8 b a |
  g4 a8 g |
  d'4 d8 ^(e) |
  c2 \bar "|."
}

nhacDiepKhucBas = \relative c' {
  \skip 8
  \skip 2
  \skip 2
  \skip 2
  \skip 2
  r8 f g f |
  e4 f8 e |
  g4 g8 (f) |
  e2
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  a8 c c a a c a c4 \breathe
  c8 d d c e c g4 \breathe
  af8 af af f f4 f8 c f \acciaccatura c8 g'4
  e8 e e d b' b d, \fermata g4 ~ g \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  a8 c a c a c g4 \breathe
  c8 e, f g c, d e4
  d8 d fs \fermata a b a g4
  g8 e e c' c d \acciaccatura c8 e4 ~ e \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  c8 c a c a4 c8 e, f g a a e d4 \breathe
  d8 g b, c d4
  b'8 a a d, fs g4 \breathe
  e8 g a e e4
  e8 e c' b16 b b b8 \breathe
  e d16 d d d4 g, c ~ c \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Phúc thay những người biết kính sợ Chúa.
  Ăn ở theo đường, theo đường lối của Người.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Hạnh phúc thay bạn nào kính sợ Chúa,
  ăn ở theo đường lối của Người.
  Công khó tay bạn làm bạn được an hưởng.
  Đời bạn quả là lắm phúc nhiều may.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Hiền thê bạn trong cửa trong nhà,
  khác nào cây nho đầy hoa trái.
  Và bầy con xúm xít lại bàn
  như những chồi ô -- liu mơn mởn.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Đó chính là phúc lộc Chúa dành cho kẻ biết kính sợ Người.
  Xin Chúa từ Si -- on xuống cho muôn vàn ơn phước.
  Để trong suốt cuộc đời bạn được thấy "Giê -" "ru -" "sa -" lem
  thấy "Giê -" "ru -" "sa -" lem phồn vinh.
}


% Dàn trang
\paper {
  #(set-paper-size "a4")
  top-margin = 15\mm
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
                             (minimum-distance . 11)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 11.5)
                             (minimum-distance . 11)
                             (padding . 1))
}

% Thiết lập tông và nhịp
TongNhip = { \key c \major \time 2/4 }

% Đổi kích thước nốt cho bè phụ
notBePhu =
#(define-music-function (font-size music) (number? ly:music?)
   (for-some-music
     (lambda (m)
       (if (music-is-of-type? m 'rhythmic-event)
           (begin
             (set! (ly:music-property m 'tweaks)
                   (cons `(font-size . ,font-size)
                         (ly:music-property m 'tweaks)))
             #t)
           #f))
     music)
   music)

\score {
  \new ChoirStaff <<
    \new Staff = diepKhuc \with {
        \consists "Merge_rests_engraver"
        %\magnifyStaff #(magstep +1)
        printPartCombineTexts = ##f
      }
      <<
      \new Voice \TongNhip \partCombine 
        \nhacDiepKhucSop
        \notBePhu -3 { \nhacDiepKhucBas }
      \new NullVoice = nhacThamChieu \nhacDiepKhucSop
      \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #0.5
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto nhacThamChieu \loiDiepKhuc
      >>
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #5
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
            nonstaff-relatedstaff-spacing.padding = #1
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    %\override Lyrics.LyricText.font-size = #+2
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
        \key c \major \time 2/4 \nhacPhienKhucHai
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
    %\override Lyrics.LyricText.font-size = #+2
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
        \key c \major \time 2/4 \nhacPhienKhucBa
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
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #4
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}
