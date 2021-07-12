% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Ngợi Khen Chúa" }
  poet = "Lc 1, 46-54"
  composer = "Lm. GB Trần Thanh Cao"
  %arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucSop= \relative c' {
  g'8 e a g |
  e4 c8 d |
  g2 |
  a8. f16 f4 |
  a8 b c a |
  g2 |
  b8. g16 g4 |
  a8 a g d' |
  c4 b |
  c2 ( |
  c4) r4 \bar "|."
}

nhacDiepKhucBas = \relative c' {
  e8 c f e |
  c2 |
  r4 f8 a |
  c2 |
  c8. a16 a4 |
  c8 d e d |
  d2 |
  d8. g,16 g4 |
  a8 f d g |
  c,2 ( |
  c4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  a'8 g a g a b c4 \breathe
  a8 c c c c a g4 \breathe
  f8 f e f e c d4 \breathe
  c8 d a4 a8 e' d c g'4 \breathe
  gs8 f g g e4 \breathe
  e8 d d c a b c4 \tweak extra-offset #'(0 . 3) ^(c) \bar "||"
}

nhacPhienKhucHai = \relative c' {
  a'8 a c a c c e, f g4
  g8 c, d e4 \breathe
  a8 g fs4 a8 b a g4 \breathe
  f8 a a f g g g e4 \breathe
  d8 fs fs g g d c4 \tweak extra-offset #'(0 . 3) ^(c) \bar "||"
}

nhacPhienKhucBa = \relative c' {
  f4 a |
  f c'8 a |
  c4 e,8 (f) |
  g2 |
  c,4 c |
  e c8 e |
  a,4 c |
  d2 |
  a'4 f |
  f a8 g |
  g4 a |
  b2 |
  r4 b8 g |
  g4. d'8 |
  a4 g |
  c2 ( |
  c4) r4 \bar "||"
}

% Lời điệp khúc
loiDiepKhucSop = \lyricmode {
  Tôi mừng rỡ muôn phần nhờ Thiên Chúa.
  Vâng nhờ Người, tôi hớn hở hân hoan.
  Vâng nhờ Người, tôi vui mừng biết bao, dường bao.
}

loiDiepKhucBas = \lyricmode {
  Tôi mừng rỡ muôn phần nhờ Thiên Chúa.
  Vâng nhờ Người, tôi hớn hở hân hoan.
  Vâng nhờ Người, tôi vui mừng biết bao.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Linh hồn tôi ngợi khen Thiên Chúa,
  thần trí tôi hớn hở reo mừng
  trong Chúa là Đấng cứu độ tôi.
  Phận nữ tỳ, Người đoái thương nhìn tới.
  Khiến từ nay muôn đời sẽ khen tôi thật là diễm phúc.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Bởi vì Đấng Toàn Năng đã làm cho tôi những điều cao cả.
  Thật danh Ngài Chí Thánh Chí Tôn.
  Tình thương Chúa trải qua bao thế hệ
  dành cho ai biết kính sợ Ngài.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Kẻ đói nghèo, Chúa ban của đầy dư.
  Người giàu có lại đuổi về tay trắng.
  Chúa độ trì "Is -" "ra -" el tôi tớ.
  Bởi vì Người nhớ lại tình thương.
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
  system-system-spacing = #'((basic-distance . 11)
                             (minimum-distance . 11)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 11)
                             (minimum-distance . 12)
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
    \new Staff \with {
        \consists "Merge_rests_engraver"
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key c \major \time 2/4 \autoBeamOff \nhacDiepKhucSop
      }
      \new Lyrics \lyricsto beSop \loiDiepKhucSop
    >>
    \new Staff \with {
        \consists "Merge_rests_engraver"
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beBas {
        \key c \major \time 2/4 \autoBeamOff \nhacDiepKhucBas
      }
      \new Lyrics \lyricsto beBas \loiDiepKhucBas
    >>
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.0
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
            nonstaff-relatedstaff-spacing.padding = #0.5
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #0.5
        }
        \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.0
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
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #1.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  } 
}
