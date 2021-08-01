% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Chúa Hiển Linh" }
  poet = "Tv. 71"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhuc = \relative c' {
  \partial 4 c4 |
  a' f8 g |
  c,4 d8 c |
  a4 f'16 f g8 |
  a4 bf8 bf |
  g4 g8 e |
  c4 c16 g' a8 |
  bf4 c8 c |
  a2 ~ |
  a4 r \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucSop = \relative c' {
  \partial 4. f4 e8 |
  a4. a16 a |
  f8 bf a g |
  g4. g16 g |
  a8 g g e |
  \slashedGrace { \stemDown d8 _( } e2) ~ |
  e8
  \stemUp e4 f8 |
  g4. g16 g |
  a8 a f e |
  d4. d16 c |
  c8 e g e |
  f2 ~ |
  f4 r \bar "||"
}

nhacPhienKhucBas = \relative c'' {
  c4 a8 |
  d4. d16 d |
  bf8 e d d |
  c4. c16 c |
  d8 c bf g |
  \slashedGrace { g8 ^( } a2) ~ |
  a8
  \skip 4.
  \skip 2
  \skip 2
  \skip 2
  \skip 2
  \skip 2
  \skip 2
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Lạy Chúa mọi dân tộc trên địa
  \override LyricText.extra-offset = #'(0 . 0.5)
  cầu đều thờ lạy Chúa,
  mọi dân tộc trên địa cầu đều thờ lạy Chúa,
  Chúa chúng ta.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Tâu Thượng Đế, Xin ban quyền bính cho Tân Vương,
  trao công lý trong tay Hoàng Tử
  Để Tân Vương theo công lý xét xử dân Người
  bênh quyền lợi kẻ khó nghèo luôn.
}

loiPhienKhucHai = \lyricmode {
  \override Lyrics.LyricText.font-shape = #'italic
  \set stanza = #"2."
  Vương triều sẽ luôn đua nở thắm hoa công minh.
  Thiên thu mãi an ninh thịnh trị.
  Người quản cai qua sông cái đến tận địa cầu,
  từ biển này và tới biển kia.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Bao Hoàng Đế đến mãi từ thác Si -- sa -- ba.
  Hay nơi thẳm xa bao quần đảo.
  Cùng vương công chen nhau bước tới từ Ả -- rập,
  đem phẩm vật triều cống phục suy.
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
  system-system-spacing = #'((basic-distance . 12)
                             (minimum-distance . 12.5)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 12)
                             (minimum-distance . 12)
                             (padding . 1))
}

% Thiết lập tông và nhịp
TongNhip = { \key f \major \time 2/4 }

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
      }
      <<
      \new Voice = beSop {
        \TongNhip \stemNeutral \nhacDiepKhuc
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
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #4
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}

\score {
  \new ChoirStaff <<
    \new Staff = diepKhuc \with {
        \consists "Merge_rests_engraver"
        %\magnifyStaff #(magstep +1)
        printPartCombineTexts = ##f
      }
    <<
      \new Voice \TongNhip \partCombine 
        \notBePhu -3 { \nhacPhienKhucBas }
        \nhacPhienKhucSop
      \new NullVoice = nhacThamChieu \nhacPhienKhucSop
      \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.5
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #2
        }
        \lyricsto nhacThamChieu \loiPhienKhucMot
    \new Lyrics \lyricsto nhacThamChieu \loiPhienKhucHai
    \new Lyrics \lyricsto nhacThamChieu \loiPhienKhucBa
      >>
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #4.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}
