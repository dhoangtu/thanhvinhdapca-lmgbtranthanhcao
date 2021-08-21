% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Chúa Ban Phúc Lành" }
  poet = "Tv. 28"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhuc= \relative c' {
  <>^\markup { \halign #50 " " }
  cs2 e4 |
  a2 a4 |
  gs4 b8 (cs) b (a) |
  e2. |
  b4 cs b |
  e2 gs,4 |
  a2. \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  cs8 e fs a4 \breathe
  b8 a fs a b4 \breathe
  fs8 a b cs4 \breathe
  d8 cs b b a4 \breathe
  fs8 a a a fs e cs'4 \breathe
  d8 cs d b \fermata
  e e gs, a4 ~ a \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  a8 a fs a4 \breathe
  fs8 a fs a b4 \breathe
  a8 gs fs fs4 cs8 gs' fs e4 \breathe
  a8 a fs a b4 \breathe
  d8 d b cs cs4 ~ cs \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  a8 a fs fs4 \breathe
  e8 cs'^^ cs^^ a^^ a4^^
  fs8 a b gs4 a8 a cs, d e4 \breathe
  fs8 b, e gs4 a8 fs e gs4 ~ gs8 \breathe
  a b fs a4 cs8 b b a4 ~ a \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \override Lyrics.LyricText.font-series = #'bold
  Thần dân Chúa, Chúa tuôn đổ phúc lành
  và cho hưởng phúc bình an.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Nào tung hô Chúa, hỡi chư Thần chư Thánh
  Nào tung hô Chúa, Đấng vinh diệu uy quyền.
  Nào tung hô danh Ngài rạng rỡ,
  phủ phục bái thờ Đức Thánh Hiển Linh.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Tiếng Chúa rền vang làm biển gào sóng vỗ.
  Chúa hiển trị trên làn nước bao la.
  Tiếng Chúa hùng mạnh quá.
  Tiếng Chúa thật oai phong.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Tiếng Chúa uy linh nổi sấm sét ầm ầm.
  Còn trong Thánh điện hết thảy cùng tung hô
  Chúa ngự trị giữa những cơn hồng thủy.
  Chúa sẽ làm Vua thống trị muôn đời.
}

% Dàn trang
\paper {
  #(set-paper-size "a4")
  top-margin = 15\mm
  bottom-margin = 15\mm
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
                             (minimum-distance . 12)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 12)
                             (minimum-distance . 12.5)
                             (padding . 1))
}

% Thiết lập tông và nhịp
TongNhip = {
  \key a \major \time 3/4
  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment = #(ly:make-moment 1/4)
  \set Timing.beatStructure = #'(1 1 1 1)
}

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
            nonstaff-relatedstaff-spacing.padding = #1
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #5
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
    \override Lyrics.LyricSpace.minimum-distance = #3
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
    \override Lyrics.LyricSpace.minimum-distance = #4
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
            nonstaff-relatedstaff-spacing.padding = #1
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}
