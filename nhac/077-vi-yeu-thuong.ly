% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Vì Yêu Thương" }
  poet = "Tv. 67"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c' {
  <>^\markup { \halign #35 " " }
  e4 g8 |
  c4 d8 |
  e,4 g8 |
  a4. |
  d,4 e8 |
  f4 g8 |
  g a e |
  d4 g8 |
  c,4. ~ |
  c4 r8 \bar "|."
}

nhacDiepKhucBas = \relative c' {
  c4 e8 |
  g4 b8 |
  c,4 e8 |
  f4. |
  b,4 c8 |
  d4 e8 |
  e f c |
  b4 b8 |
  c4. ~ |
  c4 r8
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  g8 f e g c4 \breathe
  c8 b b c4 b8 c d a b g4
  f8 g e c d4 ~ d \breathe
  g8 g e g c4 b8 c e c g4
  b8 g g b c4 (c) \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  g8 g e g c4
  c8 b c d g,4 \breathe
  f8 e g a d, g a e4 ~ e \breathe
  e8 g c c b d b g4 \breathe
  a8 g g4 g8 g a b c4 ~ c \bar "||"
}

nhacPhienKhucBa = \relative c' {
  e8 g c4
  b8 d c a g4 \breathe
  f8 d d e e c \acciaccatura c8 d4
  fs8 fs a g4 ~ g \breathe
  g8 e g4 \tuplet 3/2 { c,8 [c d] } e4 \breathe
  \tuplet 3/2 { f8 [e f] } d4 d8 d a'4 \breathe
  a8 a b c d e c4 ~ c \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Vì yêu thương, Chúa từng dọn sẵn,
  từng dọn sẵn nơi an trú cho kẻ khốn cùng.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Hết những người công chính múa nhảy mừng vui,
  mừng vui trước mặt Chúa Trời,
  niềm hoan lạc trào dâng.
  Hãy hát mừng Thiên Chúa đàn ca kính danh Người,
  Danh Người là Đức Chúa.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Cha nuôi dưỡng cô nhi, Đấng đỡ bênh quả phụ
  Chính là Thiên Chúa ngự nơi Thánh Điện.
  Người cô thân Chúa cho cửa cho nhà.
  Kẻ tù đày được tự do hạnh phúc.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Lạy Thiên Chúa, Ngài đổ mưa ân hậu.
  Gia nghiệp Ngài tiêu hao mòn mỏi Ngài bổ sức cho.
  Nơi đàn chiên Ngài được an trú
  Chính là nơi Ngài từng dọn sẵn,
  vì lòng yêu thương kẻ khốn cùng.
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
                             (minimum-distance . 11.5)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 11.5)
                             (minimum-distance . 11.5)
                             (padding . 1))
}

% Thiết lập tông và nhịp
TongNhip = { \key c \major \time 3/8 }

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
            nonstaff-relatedstaff-spacing.padding = #1
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto nhacThamChieu \loiDiepKhuc
      >>
  >>
  \layout {
    ragged-last = ##f
    \override Lyrics.LyricText.font-series = #'bold
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #4.0
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
        \key c \major \time 3/8 \nhacPhienKhucMot
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
    \override Lyrics.LyricSpace.minimum-distance = #2.5
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
        \key c \major \time 3/8 \nhacPhienKhucHai
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
        \key c \major \time 3/8 \nhacPhienKhucBa
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
    \override Lyrics.LyricSpace.minimum-distance = #3.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}
