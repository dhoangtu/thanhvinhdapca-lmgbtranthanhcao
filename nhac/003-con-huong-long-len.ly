% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Con Hướng Lòng Lên" }
  poet = "Tv. 24"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucSop= \relative c' {
  \partial 4 d4 |
  a' a8 bf |
  g a a4 |
  a8 b g (a) |
  b b a ^(cs) |
  d2 \bar "|."
}

nhacDiepKhucBas = \relative c' {
  \skip 4
  fs4 fs8 g |
  e fs fs4 |
  fs8 g e ^(fs) |
  g g fs (e) |
  d2
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  e8 a4 a8 g a a g ([e]) g (a) a4 d,8 e fs4 e8
  cs e cs a4
  \tweak extra-offset #'(0 . 3) ^(a) \breathe
  e'8 cs e g g4 a8 g16 (e) g8 (a) a4
  g8 g b g a4 (a) d,8 e fs a gs a4
  g8 \fermata e \fermata d4
  \tweak extra-offset #'(0 . 3) ^(d) \bar "||"
}

nhacPhienKhucHai = \relative c' {
  e8 a4 e8 g fs e d4 (d8) b cs e a,4
  e'8 g e e e e fs4 (fs) \breathe
  g8 e g
  b a gs a4 \breathe
  g8 e g fs e \fermata e d4 \tweak extra-offset #'(0 . 3) ^(d) \bar "||"
}

nhacPhienKhucBa = \relative c' {
  g'8 a a g e a \acciaccatura g (a4) \breathe
  fs8 g fs b, b4
  a8 cs g' e fs4 (fs) \breathe
  a8 b b a a4 g8
  e cs e a,4
  \tweak extra-offset #'(0 . 3) ^(a) e'8 fs g4
  e8 b' \fermata \afterGrace a \fermata (b) d,4 (d) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Lạy Chúa, con hướng lòng con lên,
  con hướng lòng con lên cùng Chúa.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1. "
  Lạy Chúa, xin dạy con biết đường lối Chúa.
  Nẻo Ngài đi, xin chỉ bảo con cùng.
  Xin Ngài thương hướng dẫn, lấy lời chân lý mà dạy dỗ bảo ban
  vì Thiên Chúa cứu độ con, chính là Ngài.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2. "
  Lạy Chúa, giờ đây xin nhớ lại.
  Tình sâu nghĩa nặng, Ngài đã từng biểu lộ ngàn xưa
  Bởi Ngài vốn xót thương từ ái.
  Xin đừng nỡ quên con bao giờ.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3. "
  Thiên Chúa rất nhân từ chính trực.
  Đưa những ai lầm lạc về nẻo chính đường ngay.
  Hướng dẫn kẻ khiêm cung sống cuộc đời ngay thẳng.
  Dạy cho biết đường lối của Người.
}

% Dàn trang
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
  system-system-spacing = #'((basic-distance . 12)
                             (minimum-distance . 12.5)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 12)
                             (minimum-distance . 12.5)
                             (padding . 1))
}

% Thiết lập tông và nhịp
TongNhip = { \key d \major \time 2/4 }

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
            nonstaff-relatedstaff-spacing.padding = #1.5
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1.5
        }
        \lyricsto nhacThamChieu \loiDiepKhuc
      >>
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #5
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
        \key d \major \time 2/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.5
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1.5
        }
        \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #1.5
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \override Score.SpacingSpanner packed-spacing = ##t
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
        \key d \major \time 2/4 \nhacPhienKhucHai
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.5
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1.5
        }
        \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3.5
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
        \key d \major \time 2/4 \nhacPhienKhucBa
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
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}
