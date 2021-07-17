% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Công Chính Và Hòa Bình" }
  poet = "Tv. 71"
  composer = "Lm. GB Trần Thanh Cao"
  %arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c' {
  \partial 2 c4 d |
  e8. c16 c8 c c4 e |
  g2 a8 _(g) f4 |
  f2 b8 _(a) g4 |
  g4. g8 d4 d |
  d2 \breathe c4 d |
  e8. c16 c8 c c4 e |
  g2 g8 a g e |
  f2 f8 g d c |
  d4 d g,8 b4 d8 |
  d c c2 r4 \bar "|."
}

nhacDiepKhucBas = \relative c' {
  \partial 2 g4 b |
  c8. g16 g8 g g4 b |
  c2 f8 (e) d4 |
  d2 g8 (f) e4 |
  e4. e8 b4 b |
  b2 g4 b |
  c8. g16 g8 g g4 b |
  c2 e8 f e c |
  d2 d8 e b g |
  b4 b g8 g4 b8 |
  b g c2 r4
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \partial 2. g8 e c'4 \breathe a8 c |
  g2 f8 d b' a |
  g2 r4 f8 a |
  d,2 d8 b c d |
  a2 r4 b8 c |
  d4. d8 d g a g |
  e2 g8 a b c |
  g2 d'8 b g d' |
  c2 r4 \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \override Score.SpacingSpanner.strict-grace-spacing = ##t
  \partial 4 e8 g |
  c4. a8 c4 c |
  \slashedGrace { e,8 (} g2) r4 f8 e |
  d4. a'8 b4 d, |
  g2 r8 e g a |
  c4. c8 e,4 d |
  d2 r8 d8 a' g |
  g2 g8 a b d |
  c2 r \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \partial 4 g'8 g |
  e2 f8 d e c |
  c2 r8 a' a f |
  d4. b'8 b4 a |
  g2 e8 a g e |
  g4. f8 f4d8 g |
  e2 b'8 a a a |
  g2 g8 a g b |
  c2 r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Sự công chính và nền hòa bình viên mãn, sẽ triển nở,
  sẽ triển nở trong triều đại Người.
  Sự công chính và nền hòa bình viên mãn
  cho đến khi mặt trăng,
  cho đến khi mặt trăng không còn chiếu ánh sáng lung linh.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1. "
  Tâu Thượng Đế, quyền bính Ngài, xin hạ tứ Tân Vương.
  Công lý Ngài, xin tặng ban Thế Tử.
  Cho dân Chúa được Người xét xử công bình.
  Quyền lợi kẻ khó nghèo, sẽ được Người đỡ nâng.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2. "
  Người giải thoát bần dân kêu khổ.
  Kẻ khốn cùng không chỗ tựa nương.
  Chạnh lòng thương xót những hạng nghèo hèn.
  Mạng sống dân đen, Người ra tay tế độ.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3. "
  Danh thơm Người sẽ ngàn năm truyền tụng.
  Nức tiếng xa gần, dưới ánh mặt trời.
  Mọi sắc tộc trần gian, nhờ Người được chúc lành.
  Khắp muôn dân thiên hạ, ngợi khen Người diễm phúc.
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
  system-system-spacing = #'((basic-distance . 12.5)
                             (minimum-distance . 12)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 12.5)
                             (minimum-distance . 12)
                             (padding . 1))
}

% Thiết lập tông và nhịp
TongNhip = { \key c \major \time 2/2 }

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
            nonstaff-unrelatedstaff-spacing.padding = #0.2
        }
        \lyricsto nhacThamChieu \loiDiepKhuc
      >>
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #0.5
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
        \key c \major \time 2/2 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #0.5
        }
        \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2
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
        \key c \major \time 2/2 \nhacPhienKhucHai
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
        \key c \major \time 2/2 \nhacPhienKhucBa
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
    \override Lyrics.LyricSpace.minimum-distance = #2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \override Score.SpacingSpanner packed-spacing = ##t
  }
}
