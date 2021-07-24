% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Trọn Tình Thương" }
  poet = "Tv. 135"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Thiết lập tông và nhịp
TongNhip = { \key c \major \time 2/4 }

% Nhạc phiên khúc
nhacPhienKhuc = \relative c'' {
  % Đáp 1
  \partial 4 g8 e |
  e b'4 d8 |
  g,4 e |
  c'2 \bar "|." \break
  
  % 1
  \partial 4. c8 a b |
  c a c a |
  g4 r \bar "||" \break
  
  % Đáp 2
  \partial 4 f8 d |
  d g4 a8 |
  f4 d |
  g2 \bar "|." \break
  
  % 2
  \partial 4 c8 c |
  a4 a8 b |
  c g d e |
  c4 r
  \tweak extra-offset #'(0 . -2) _\markup { \large \halign #-0.5 "(ĐÁP 1)" }
  \bar "||" \break
  
  % 3
  \partial 4 g'8 g |
  c4 c8 a |
  a4. g8 |
  g4 r
  \tweak extra-offset #'(0 . -1.5) _\markup { \large \halign #-1 "(ĐÁP 2)" }
  \bar "||" \break
  
  % 4
  g8 g g4 |
  a8 g d' c |
  c4 r
  \tweak extra-offset #'(0 . -2) _\markup { \large \halign #-1.2 "(ĐÁP 1)" }
  \bar "||" \break
  
  % 5
  a8 c c4 |
  c8 f, d f |
  g4 r
  \tweak extra-offset #'(0 . -1.5) _\markup { \large \halign #-1 "(ĐÁP 2)" }
  \bar "||" \break
  
  % 6
  g8
  d' d4 |
  d8 g, e' d |
  c4 r
  \tweak extra-offset #'(0 . -1.5) _\markup { \large \halign #-1 "(ĐÁP 1)" }
  \bar "||" \break
  
  % 7
  c8
  a f4 |
  f8 g g a |
  g4 r
  \tweak extra-offset #'(0 . -1.5) _\markup { \large \halign #-1 "(ĐÁP 2)" }
  \bar "||" \break
  
  % CODA
  \partial 4
  g8 e |
  e b4 d8 |
  g4 e |
  c'2 \bar "|."
}

% Lời phiên khúc
loiPhienKhuc = \lyricmode {
  \set stanza = "ĐÁP 2.   "
  \override Lyrics.LyricText.font-series = #'bold
  Muôn ngàn đời Chúa vẫn trọn tình thương.
  \revert Lyrics.LyricText.font-series

  \set stanza = "     1.     "
  Hãy tạ ơn Chúa vì Chúa nhân từ.
  
  \set stanza = "ĐÁP 1.   "
  \override Lyrics.LyricText.font-series = #'bold
  Muôn ngàn đời Chúa vẫn trọn tình thương.
  \revert Lyrics.LyricText.font-series

  \set stanza = "     2.     "
  Chỉ có Người làm nên những kỹ công vĩ đại.
  
  \set stanza = "     3.     "
  Tầng trời cao, Chúa tạo dựng tài tình.
  
  \set stanza = "     4.     "
  Đặt địa cầu trên làn nước bao la.
  
  \set stanza = "     5.     "
  Người thắp sáng những đèn trời to lớn.
  
  \set stanza = "     6.     "
  Dùng kim ô để điều khiển ban ngày.
  
  \set stanza = "     7.     "
  Lúc đêm về ngàn trăng sao hướng dẫn.
  
  \set stanza = "CODA:   "
  Muôn ngàn đời Chúa vẫn trọn tình thương.
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
  %page-count = #1
  system-system-spacing = #'((basic-distance . 13)
                             (minimum-distance . 13)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 13)
                             (minimum-distance . 13)
                             (padding . 1))
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
    \new Lyrics \with {
      \override VerticalAxisGroup.
        nonstaff-relatedstaff-spacing.padding = #1.6
      \override VerticalAxisGroup.
        nonstaff-unrelatedstaff-spacing.padding = #1.6
    }
    \lyricsto beSop \loiPhienKhuc
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #4
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}
