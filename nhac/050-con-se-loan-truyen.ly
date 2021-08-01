% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Con Sẽ Loan Truyền" }
  poet = "Tv. 70"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhuc= \relative c' {
  \partial 4 d4 |
  a'2 |
  g8 a bf a |
  g4 a8 g |
  f4 e8 f |
  c4 a |
  d2 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {

  d8 a'4 a8 bf c bf a4 \breathe
  a8 g g c c g a \acciaccatura g8 a4 \breathe
  a8 f f a d, f g4
  e8 f g c, e f d4 \tweak extra-offset #'(0 . 3) ^~ d \bar "||"
}

nhacPhienKhucHai = \relative c' {

  d8 a'4 a8 g a g c bf a4 \breathe
  a8 g g a bf a g a g f4 \breathe
  f8  bf g c a \fermata g g g c c bf a4 \breathe
  g8 g a g e f e d4 \tweak extra-offset #'(0 . 3) ^~ d \bar "||"
}

nhacPhienKhucBa = \relative c' {

  d8 d a'4 a8 g g bf a g f4 \breathe
  e8 e f g g f e d4 \breathe
  a'8 a g g c g c bf a4 \breathe
  a8 cs cs \fermata d d a g f4 \breathe
  g8 a f e g f a4 \breathe
  a8 e e4 \breathe
  g8 a e g a f e d4 ~ d \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {

  Lạy Chúa, miệng con sẽ loan truyền,
  sẽ loan truyền ơn cứu độ Ngài ban.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Lạy Chúa, con nương ẩn nơi Ngài.
  Xin đừng để con muôn đời tủi hổ.
  Bởi vì Ngài chính trực công minh.
  Xin cứu thoát và giải phóng con.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Lạy Chúa, xin Ngài như tảng đã dung thân.
  Như tòa nhà kiên cố, cho con sống an toàn.
  Vì Chúa là sức mạnh và là đồn lũy chở che con.
  Xin giải thoát con khỏi tay kẻ thù.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Vì lạy Chúa, chính Ngài là Đấng con mong đợi.
  Từ độ thanh xuân con trông cậy Ngài.
  Con nương tựa vào Chúa từ thuở sơ sinh.
  Ngài đã kéo con ra khỏi lòng mẹ.
  Con đã được Ngài thương dạy dỗ.
  Tới giờ này con vẫn truyền rao vĩ nghiệp của Ngài.
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
      "Deja Vu Serif Condensed"
      "Deja Vu Serif Condensed"
      "Deja Vu Serif Condensed"
      (/ 20 20)))
  page-count = #1
  system-system-spacing = #'((basic-distance . 11.5)
                             (minimum-distance . 11.5)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 11.5)
                             (minimum-distance . 11.5)
                             (padding . 1))
}

% Thiết lập tông và nhịp
TongNhip = { \key f \major \time 2/4 }

\score {
  \new ChoirStaff <<
    \new Staff = diepKhuc \with {
        \consists "Merge_rests_engraver"
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \TongNhip \nhacDiepKhuc
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #0.5
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
        \key f \major \time 2/4 \nhacPhienKhucMot
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
        \key f \major \time 2/4 \nhacPhienKhucHai
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
    \override Lyrics.LyricSpace.minimum-distance = #2.5
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
        \key f \major \time 2/4 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.2
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}

