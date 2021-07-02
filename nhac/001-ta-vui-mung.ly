% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Ta Vui Mừng" }
  poet = "Tv. 121"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Thiết lập tông và nhịp
TongNhip = { \key c \major \time 2/4 }

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c'' {
  \partial 4 g8 g |
  c,4 e8. g16 |
  e8 g a4 |
  a8 g d'4 |
  e8 d c d |
  c2 ^( |
  c4) r
  \bar "|."
}

nhacDiepKhucBas = \relative c'' {
  \partial 4 g8 g |
  c,4 c8. e16 |
  c8 e f4 |
  f8 e g4 |
  c8 b g f |
  e2 _( |
  e4) r
}

% Nhạc phiên khúc
nhacPhienKhuc = \relative c'' {
  #(define afterGraceFraction (cons 1 3))
  % Phiên khúc 1
  \partial 4 c8 g |
  g2 |
  g8 g e
  \afterGrace d (e8) |
  d2 |
  r8 e c e |
  f4 d8 f |
  g2 ( |
  g8) r g g |
  b2 |
  c8 c c c |
  d2 |
  r4 d8 b |
  g4. b8 |
  d4 g, |
  c2 ( |
  c4) r \bar "|."
  
  % Phiên khúc 2
  \partial 4 g8 a |
  g4. f8 |
  d4 e |
  f2 |
  r8 f e e |
  d4 b'8 a |
  g2 |
  r4 e8 g |
  a4. g8 |
  f4 g |
  d2 |
  r8 d b d |
  g,4. c8 |
  e4
  \afterGrace d (c8) |
  c2 ( |
  c4) r4 \bar "|."
  
  % Phiên khúc 3
  \partial 4 e8 g |
  a4. g8 |
  a4 c |
  e,2 |
  r4 g8 e |
  g a g b |
  d4 d8 b |
  c2 ( |
  c4) r \bar "|."
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Ta vui mừng trảy lên Đền Thánh Chúa,
  Ta mừng vui tiến lên Đền Thánh Người.
}

% Lời phiên khúc
loiPhienKhuc = \lyricmode {
  \set stanza = \markup { \circle { \huge "1" } }
  Vui chừng nào khi thiên hạ bảo tôi:
  Ta cùng trẩy lên Đền Thánh Chúa.
  Và giờ đây "Giê -" "ru -" "sa -" lem hỡi
  Cửa nội thành, ta đã dừng chân.

  \set stanza = \markup { \circle { \huge "2" } }
  Từng chi tộc, chi tộc của Chúa.
  Trảy hội lên đền, ở nơi đây.
  Để danh Chúa họ cùng xưng tụng.
  Như lệnh đã truyền cho "Is -" "ra -" el.

\set stanza = \markup { \circle { \huge "3" } }
  Cũng nơi đó, đặt ngai xét xử.
  Ngai vàng của vương triều "Đa -" vít, Tổ phụ xưa.
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
  %page-count = #1
  system-system-spacing = #'((basic-distance . 13))
  score-system-spacing = #'((basic-distance . 13))
}

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
    \override Lyrics.LyricSpace.minimum-distance = #4
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \override Score.SpacingSpanner packed-spacing = ##t
  }
}

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
      }
      <<
      \new Voice = beSop {
        \TongNhip \nhacPhienKhuc
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhuc
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #4.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}
