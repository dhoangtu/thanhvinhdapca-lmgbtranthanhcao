% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Xin Hồi Phục" }
  poet = "Tv. 79"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c' {
  \partial 4 d4 |
  a'2 |
  g8 e e fs |
  d4 d8 fs 
  e d b4 |
  b8 d a e' |
  d2 ~ |
  d4 r \bar "|."
}

nhacDiepKhucBas = \relative c' {
  a'4 |
  d2 |
  b8 g g a |
  fs4 fs8 a |
  g fs e4 |
  e8 g e g |
  fs2 ~ |
  fs4 r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  e8 g a g b a a \breathe
  a g b a4 ~ a8 \breathe
  a g a a d, e fs4 ~ fs \breathe
  a8 g e g b g a4 a16 fs d8 e4 \breathe
  e8 cs b cs a4 \breathe
  b8 a fs' e4 e8 g a d,4 ~ d \bar "||"
}

nhacPhienKhucHai = \relative c' {
  e8 g a g a4 \breathe
  g8 a d,4 ~ d8 \breathe
  b d a4 a8 d fs d e4 ~ e8 \breathe
  a g g a a d, e fs4 \breathe
  a8 g a ~ [a16] a8 b b16 b e,4 \breathe
  e8 e a4 \breathe
  cs,8 a e' fs d4 ~ d \bar "||"
}

nhacPhienKhucBa = \relative c' {
  g'8 a g a a b e, g a4 \breathe
  g8 a g4 a8 a d, e e fs4 a8 g e g a cs b a4 ~ a8 \breathe
  cs b a ~ [a16] cs8 cs a e'4 \breathe
  d16 fs e4 e8 d8 \fermata e \fermata d4 ~ d \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Lạy Chúa, xin hồi phục dân Ngài,
  nguyện Thánh
  \override LyricText.extra-offset = #'(0 . 1)
  Nhan chiếu rọi, để cứu độ chúng con.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1. "
  Hỡi mục tử nhà "Is -" "ra -" el, xin hãy lắng nghe
  Đấng ngự trên các thần hộ giá.
  Dám xin Ngài giải sáng hiển linh.
  Dũng lực quyền uy, xin khơi dậy đi nào.
  Đến cùng chúng con và thương cứu độ.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2. "
  Lạy Chúa tể càn khôn, xin đoái lại.
  Từ cõi trời, Ngài ngó xuống mà xem.
  Xin trở về thăm nom vườn nho cũ.
  Bảo vệ cây tay hữu Chúa đã trồng.
  Cây non ấy, Ngài từng cho sức mạnh.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3. "
  Xin Chúa đặt tay trên Đấng ngồi bên hữu,
  là con người Chúa đã từng cho mạnh sức.
  Chúng con nguyện chẳng xa Chúa nữa đâu.
  Cúi xin Ngài ban cho được sống,
  để chúng con xưng tụng danh Ngài.
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
  %page-count = #1
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
        \notBePhu -3 { \nhacDiepKhucBas }
        \nhacDiepKhucSop
      \new NullVoice = nhacThamChieu \nhacDiepKhucSop
      \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.5
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto nhacThamChieu \loiDiepKhuc
      >>
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #4
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
    %\override Lyrics.LyricText.font-size = #+2
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
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2
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
        nonstaff-relatedstaff-spacing.padding = #1.7
      \override VerticalAxisGroup.
        nonstaff-unrelatedstaff-spacing.padding = #1
    }
    \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #1.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}
