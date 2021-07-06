% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Nhìn Lên Chúa" }
  poet = "Tv. 122"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c'' {
  \partial 4 c8 a |
  g8 e c d |
  e4 \breathe f8 e |
  d g e16 _(g) a8 |
  g4 \breathe c8 a |
  g c b16 ^(c) d8 |
  c2 \bar "|."
}

nhacDiepKhucBas = \relative c' {
  \skip 4
  \skip 2
  \skip 2
  \skip 2
  \skip 4 f8 e |
  d f d16 _(e) f8 |
  e2
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \partial 4 c8 d |
  d a a b |
  c4 \breathe c8 b |
  a g a e |
  g2 |
  r4 f8 g |
  g c, c e |
  a,2 |
  c8 e e d |
  d2 |
  e8 c d e |
  \acciaccatura e8 g2 ( |
  g4) r \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  g8 g a a |
  e4. e8 |
  c4 d8 c |
  e2 |
  a8 a g a |
  e a c4 ( |
  c) c8 c |
  d4. d8 |
  c4 c8 c |
  e2 ( |
  e4) r \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \partial 4 c8 e, |
  g4 c,8 (d) |
  e2 |
  e8 f d a' |
  g2 |
  r4 e8 a |
  g4 e8 a |
  g4 f8 (e) d2 |
  r4 c8 d |
  e4. d8 |
  c4 d |
  a \breathe c8 d |
  e4. a8 |
  g4 a |
  b8 r b a |
  g4. d'8 |
  a4 b |
  c2 ( |
  c4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Mắt chúng tôi luôn nhìn lên Chúa,
  tới khi Người mở lượng xót thương,
  tới khi Người mở lượng xót thương.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Tôi ngước mắt nhìn về phía Chúa,
  Đấng đang ngự trên chốn trời cao.
  Tôi ngước mắt nhìn về phía Người
  như mắt của gia nhân hướng nhìn tay ông chủ.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Như đôi mắt nữ tì hướng nhìn tay bà chủ,
  Ấy mắt ta cũng nhìn lên Chúa là Thượng Đế của ta,
  là Thượng Đế.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Dủ lòng thương, lạy Chúa, xin dủ lòng xót thương.
  Bởi chúng con bị khinh miệt ê chề.
  Hồn cảm thấy chán chường,
  hứng chịu lời nhạo báng của phường tự mãn,
  tiếng chê cười của bọn kiêu căng.
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
      "Liberation Serif"
      "Liberation Serif"
      "Liberation Serif"
      (/ 20 20)))
  page-count = #1
  system-system-spacing = #'((basic-distance . 12.5))
  score-system-spacing = #'((basic-distance . 12.5))
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
      \new Lyrics \lyricsto nhacThamChieu \loiDiepKhuc
      >>
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #1.4
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
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.5
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
        \key c \major \time 2/4 \nhacPhienKhucHai
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.1
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
        \key c \major \time 2/4 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}
