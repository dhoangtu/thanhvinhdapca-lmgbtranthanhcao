% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  tagline = ##f
}

% Nhạc phiên khúc
nhacKinhNguyenThanhThe = \relative c'' {
  \afterGrace c4 _({c8 [bf])} f g4 c8 ([d]) bf4 g8 c bf4 \breathe
  g8 g bf f f g g f g f16 ([g]) bf4 \breathe
  g8 c a c \breathe
  g bf bf bf g bf f4 (g) \bar "||" \break
  
  <g d>4 <g d>
  <bf g> <bf g>
  <c a f> \fermata <d bf f> \fermata
}

% Lời phiên khúc
loiKinhNguyenThanhThe = \lyricmode {
  \override LyricText.font-series = #'bold
  \set stanza = \markup { "XƯỚNG:" }
  Chính nhờ Người, với Người và trong Người
  mà mọi chúc tụng và vinh quang đều quy về Chúa,
  là Cha toàn năng cùng với Chúa Thánh Thần muôn đời.

  \override LyricText.font-series = #'normal
  \set stanza = \markup { "ĐÁP:" }

  \set stanza = \markup { "ĐÁP:" }
  A -- men, A -- men, A -- men.
}

% Nhạc Tuyen tin
notPhu = \tweak font-size #-3 \etc
nhacTuyenTin = \relative c'' {
  % Xướng
  g4 e8 c |
  c4 a' |
  g2 ~ |
  g8 r r4 \bar "||" \break
  
  % Đáp
  \partial 4. g8 e d |
  c4 <f \notPhu c> |
  <f \notPhu c>8 <d \notPhu b> <g \notPhu c,>4 |
  r8 <a \notPhu f> <g \notPhu e> <g \notPhu e> |
  <g \notPhu e>4 <b \notPhu g> |
  <d \notPhu b>8 <c \notPhu g> <a \notPhu f>4 |
  r <a \notPhu f>8 <b \notPhu g> |
  <a \notPhu f>2 |
  <b \notPhu d,>4 <c \notPhu e,> |
  <d \notPhu f,>2 |
  
  <c \notPhu e \notPhu g,>4
  <c \notPhu e \notPhu g,>
  <c \=1( \notPhu e \=2^( \notPhu c,\=3_(>2 |
  <c \=1) \notPhu e \=2) \notPhu c,\=3)>4
  \bar "||"
}

% Lời Tuyên tín
loiTuyenTin = \lyricmode {
  \override LyricText.font-series = #'bold
  \set stanza = \markup { "XƯỚNG:" }
  Đây là mầu nhiệm đức tin.

  \override LyricText.font-series = #'normal
  \set stanza = \markup { "ĐÁP:" }
  Chúng con loan truyền Chúa đã chịu chết.
  Chúng con tuyên xưng Chúa đã sống lại,
  cho tới khi Ngài lại đến trong vinh quang.
}

% Câu đáp tung hô
nhacCauDapTungHo = \relative c'' {
  \partial 4. g8 bf f |
  g \breathe c f c |
  d4 \tuplet 3/2 { c8 (d c) } |
  bf4 g8 c |
  bf (d) c (bf) |
  bf2 \bar "|."
}

% Lời phiên khúc
loiCauDapTungHo = \lyricmode {
  Vì Chúa là Vua, vì Chúa là Vua uy quyền và vinh hiển muôn đời.
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
  print-all-headers = ##t
  system-system-spacing = #'((basic-distance . 11.5)
                             (minimum-distance . 11.5)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 11.5)
                             (minimum-distance . 11.5)
                             (padding . 1))
}

\book {
  % Phần kêt Kinh Nguyện Thánh Thể
  \score {
    \new ChoirStaff <<
      \new Staff = phienKhuc
        <<
        \new Voice = beSop {
          \key bf \major \time 2/4 \nhacKinhNguyenThanhThe
        }
      >>
      \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.2
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiKinhNguyenThanhThe
    >>
    \header {
      title = \markup { \fontsize #3 "Phần Kết Kinh Nguyện Thánh Thể" }
      poet = " "
      composer = "Lm. GB Trần Thanh Cao"
      %arranger = " "
    }
    \layout {
      \override Staff.TimeSignature.transparent = ##t
      \override Lyrics.LyricText.font-size = #+2
      \override Lyrics.LyricSpace.minimum-distance = #3
      \override Score.BarNumber.break-visibility = ##(#f #f #f)
      \override Score.SpacingSpanner.uniform-stretching = ##t
      \set Score.barAlways = ##t
      \set Score.defaultBarType = ""
    } 
  }

  \markup { \vspace #1 }
  
  % Tuyen Tin
  \score {
    \new ChoirStaff <<
      \new Staff
        <<
        \new Voice = beSop {
          \key c \major \time 2/4 \nhacTuyenTin
        }
      >>
      \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.2
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiTuyenTin
    >>
    \header {
      title = \markup { \fontsize #3 "Tuyên Tín" }
      poet = " "
      composer = "Lm. GB Trần Thanh Cao"
      %arranger = " "
    }
    \layout {
      \override Lyrics.LyricText.font-size = #+2
      \override Lyrics.LyricSpace.minimum-distance = #4.5
      \override Score.BarNumber.break-visibility = ##(#f #f #f)
      \override Score.SpacingSpanner.uniform-stretching = ##t
    } 
  }

  \markup { \vspace #1 }
  
  % Tuyen Tin
  \score {
    \new ChoirStaff <<
      \new Staff
        <<
        \new Voice = beSop {
          \key bf \major \time 2/4 \nhacCauDapTungHo
        }
      >>
      \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.7
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiCauDapTungHo
    >>
    \header {
      title = \markup { \fontsize #3 "Câu Đáp Tung Hô" }
      poet = " "
      composer = "Lm. GB Trần Thanh Cao"
      %arranger = " "
    }
    \layout {
      \override Lyrics.LyricText.font-size = #+2
      \override Lyrics.LyricSpace.minimum-distance = #4.5
      \override Score.BarNumber.break-visibility = ##(#f #f #f)
      \override Score.SpacingSpanner.uniform-stretching = ##t
    } 
  }
}
