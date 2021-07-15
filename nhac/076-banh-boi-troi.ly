% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Bánh Bởi Trời" }
  poet = "Tv. 77"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c'' {
  b2 gs4 |
  gs cs, e |
  fs2 cs4 |
  b2 \breathe fs'4 |
  fs ds e |
  fs2 b,4 |
  e2. ~ |
  e4 r2 \bar "|."
}

nhacDiepKhucBas = \relative c'' {
  gs2 e4 |
  e a, cs |
  ds2 a4 |
  gs2 ds'4 |
  ds b cs |
  ds2 gs,4 |
  b2. ~ |
  b4 r2
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  fs8 b a b fs a b4 \breathe
  e,8 gs gs a fs ds b4 \breathe
  cs8 b b e gs e fs fs4 \breathe
  fs8 fs b fs4 fs8 a a b e,4 ~ e \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  b8 fs fs a a fs a \acciaccatura a8 b4 \breathe
  e,8 e fs e gs fs fs4 \breathe
  fs8 ds ds cs b e fs gs4 \breathe
  a8 fs b a fs4 fs8 gs e4 ~ e \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  a8 fs a fs a b b gs e4 \breathe
  cs8 e b b fs' e gs fs4 \breathe
  b8 a a fs fs a b4 \breathe
  a8 b fs cs' ds cs b4 ~ b \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Chúa cho dân được ăn bánh bởi trời,
  cho dân được ăn bánh trường sinh.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Điều chúng ta đã từng nghe biết,
  Bậc cha ông kể lại cho mình,
  Sẽ tường thuật cho thế hệ mai sau:
  Sự nghiệp lẫy lừng, quyền uy của Chúa Trời.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Chúa hạ lệnh cho mây tầng cao thẳm,
  lại truyền mở rộng cảnh thiên môn.
  Khiến "Man -" na, tựa hồ mưa rơi xuống.
  Ấy là bánh bởi trời nuôi dưỡng họ.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Kẻ phàm nhân được ăn bánh các Thiên Thần,
  Được no lòng nhờ lương thực Chúa ban.
  Chúa đưa dân vào miền đất hứa.
  Vùng núi đồi Chúa đã ra tay.
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
TongNhip = { \key e \major \time 3/4 }

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
    \override Lyrics.LyricText.font-size = #+2
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
        \key e \major \time 3/4 \nhacPhienKhucMot
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
    \override Lyrics.LyricSpace.minimum-distance = #3.0
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
        \key e \major \time 3/4 \nhacPhienKhucHai
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
    \override Lyrics.LyricSpace.minimum-distance = #2.7
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
        \key e \major \time 3/4 \nhacPhienKhucBa
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
    \override Lyrics.LyricSpace.minimum-distance = #2.7
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}
