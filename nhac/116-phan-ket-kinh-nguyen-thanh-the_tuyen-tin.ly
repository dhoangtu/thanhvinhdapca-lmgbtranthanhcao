% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  tagline = ##f
}

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
  print-all-headers = ##t
  
  system-system-spacing = #'((basic-distance . 14))
}

% Nhạc phiên khúc
nhacPhienKhucMotKinhNguyen = \relative c'' {
  \afterGrace c4 _({c8 bf)} f g4 c8 (d) bf4 g8 c bf4 \breathe
  g8 g bf f f g g f g f16 (g) bf4 \breathe
  g8 c a c \breathe
  g bf bf bf g bf f4 (g) \bar "||"
  g8 (f g) g4 \bar "|."
}

% Lời phiên khúc
loiPhienKhucMotKinhNguyen = \lyricmode {
  \override LyricText.font-series = #'bold
  Chính nhờ Người, với Người và trong Người
  mà mọi chúc tụng và vinh quang đều quy về Chúa,
  là Cha toàn năng cùng với Chúa Thánh Thần muôn đời.
  \override LyricText.font-series = #'normal
  A -- men.
}

% Tuyen tin
% Nhạc phiên khúc
nhacPhienKhucMotTuyenTin = \relative c'' {
  g4 e8 c |
  c4 a' |
  g2 ( |
  g8) r r4 \bar "||"
}

% Nhạc điệp khúc
nhacDiepKhucSopTuyenTin = \relative c'' {
  \partial 4. g8 e d |
  c4 f |
  f8 d g4 |
  r8 a g g |
  g4 b |
  d8 c a4 |
  r a8 b |
  a2 |
  b4 c |
  d2 |
  <<
    {
      c4 c |
      c2 ^( |
      c4) r
    }
    {
      \tweak font-size #-2 e4
      \tweak font-size #-2 e |
      \tweak font-size #-2 e2 _( |
      \tweak font-size #-2 e4) r
    }
  >>
  \bar "||"
}

nhacDiepKhucBassTuyenTin = \relative c' {
  \skip 4.
  \skip 4 c4 |
  c8 b c4 |
  r8 f e e |
  e4 g |
  b8 g f4 |
  r f8 g |
  f2 |
  d4 e |
  f2 g4 g |
  c,2 ( |
  c4) r
}

% Lời điệp khúc
loiPhienKhucMotTuyenTin = \lyricmode {
  \set stanza = #"XƯỚNG:"
  Đây là mầu nhiệm đức tin.
}

% Lời phiên khúc
loiDiepKhucTuyenTin = \lyricmode {
  \set stanza = #"ĐÁP:"
  Chúng con loan truyền Chúa đã chịu chết.
  Chúng con tuyên xưng Chúa đã sống lại,
  cho tới khi Ngài lại đến trong vinh quang.
}

\book {
  % Phan Ket Kinh Nguyen Thanh The
  \score {
    \new ChoirStaff <<
      \new Staff = phienKhuc \with {
          %\magnifyStaff #(magstep +1)
        }
        <<
        \new Voice = beSop {
          \key bf \major \time 2/4 \nhacPhienKhucMotKinhNguyen
        }
      >>
      \new Lyrics \lyricsto beSop \loiPhienKhucMotKinhNguyen
    >>
    \header {
      title = \markup { \fontsize #3 "Phần Kết Kinh Nguyện Thánh Thể" }
      poet = " "
      composer = "Lm. GB Trần Thanh Cao"
      arranger = " "
    }
    \layout {
      \override Staff.TimeSignature.transparent = ##t
      \override Lyrics.LyricText.font-size = #+2.5
      \override Lyrics.LyricSpace.minimum-distance = #2.0
      \override Score.BarNumber.break-visibility = ##(#f #f #f)
      \override Score.SpacingSpanner.uniform-stretching = ##t
      \set Score.barAlways = ##t
      \set Score.defaultBarType = ""
    } 
  }

  \markup { \vspace #5 }
  
  % Tuyen Tin
  \score {
    \new ChoirStaff <<
      \new Staff = phienKhuc \with {
          %\magnifyStaff #(magstep +1)
        }
        <<
        \new Voice = beSop {
          \key c \major \time 2/4 \nhacPhienKhucMotTuyenTin
        }
      >>
      \new Lyrics \lyricsto beSop \loiPhienKhucMotTuyenTin
    >>
    \header {
      title = \markup { \fontsize #3 "Tuyên Tín" }
      poet = " "
      composer = "Lm. GB Trần Thanh Cao"
      arranger = " "
    }
    \layout {
      \override Lyrics.LyricText.font-series = #'bold
      \override Lyrics.LyricText.font-size = #+2.5
      \override Lyrics.LyricSpace.minimum-distance = #8.5
      \override Score.BarNumber.break-visibility = ##(#f #f #f)
      \override Score.SpacingSpanner.uniform-stretching = ##t
    } 
  }
  \score {
    \new ChoirStaff <<
      \new Staff = diepKhuc \with {
          \consists "Merge_rests_engraver"
          %\magnifyStaff #(magstep +1)
        }
        <<
        \new Voice = beSop {
          \voiceOne \key c \major \time 2/4 \nhacDiepKhucSopTuyenTin
        }
        \new Voice = beBas {
          \override NoteHead.font-size = #-2
          \voiceTwo \key c \major \time 2/4 \nhacDiepKhucBassTuyenTin
        }
      >>
      \new Lyrics \lyricsto beSop \loiDiepKhucTuyenTin
    >>
    \layout {
      \override Staff.TimeSignature.transparent = ##t
      \override Lyrics.LyricText.font-size = #+2.5
      \override Lyrics.LyricSpace.minimum-distance = #2.2
      \override Score.BarNumber.break-visibility = ##(#f #f #f)
      \override Score.SpacingSpanner.uniform-stretching = ##t
    }
  }
}
