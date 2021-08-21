% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Dâng Lời Ca Ngợi" }
  poet = "Dn 3, 52-57"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhuc = \relative c'' {
  <>^\markup { \halign #35 " " }
  d8 d b c |
  a4. f8 |
  e (f) b c |
  a2 |
  b8 b g a |
  e4. e8 |
  d c' b a |
  g2 ~ |
  g4 r \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
 
  \partial 4 d8 b |
  g4 f8 g |
  a b a b |
  a4 \breathe a8 f |
  d a' a c |
  e,4 f |
  g2 \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  
  \partial 4 d8 b |
  g4 a8 a |
  c4 b |
  a \breathe a8 f |
  d4 c'8 c |
  e,4 f |
  g2 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  
  \partial 4 d8 b |
  g4 a8 a |
  c4 b |
  a \breathe a8 f |
  d4 c'8 b |
  a4 e8 (f) |
  g2 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
 
  Xin dâng lời ca ngợi, ca ngợi Thiên Chúa ta.
  Xin dâng lời ca ngợi, ca ngợi chúc vinh muôn đời.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Chúc tụng Ngài là Thiên Chúa tổ tiên chúng con.
  Chúc tụng Ngài trong nơi Thánh Điện vinh quang.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Chúc tụng Ngài trên ngai báu cửu trùng.
  Chúc tụng Ngài Đấng thấu nhìn vực thẳm.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Chúc tụng Ngài ngự trên các Thiên Thần,
  Chúc tụng Ngài chốn cao xanh vời vợi.
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
  system-system-spacing = #'((basic-distance . 13.5)
                             (minimum-distance . 13.5)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 13.5)
                             (minimum-distance . 13.5)
                             (padding . 1))
}

% Thiết lập tông và nhịp
TongNhip = { \key c \major \time 2/4 }

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
            nonstaff-relatedstaff-spacing.padding = #1.7
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    %\override Lyrics.LyricText.font-size = #+2
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
        \key c \major \time 2/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #2.5
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3.0
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
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #2
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3.0
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
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #2.5
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3.0
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  } 
}
