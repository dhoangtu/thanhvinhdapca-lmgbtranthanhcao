% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Dân Chúa Hỡi" }
  poet = "Tv. 77"
  composer = "Lm. GB Trần Thanh Cao"
  %arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhuc = \relative c' {
  <>^\markup { \halign #40 " " }
  \partial 2 d4 e |
  e4. d8 g4 a |
  b2 a4 d |
  b4. a8 g4 a |
  e2 e4 b' |
  a4. g8 fs4 g |
  d4. b8 d4 d |
  e4. d8 g4 a |
  c4. b8 fs4 a |
  g1 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {

  \tempo "Ad. lib."
  c8 c d4 c8 d d g, \acciaccatura g8 bf4 \breathe
  c8 bf a4 bf8 f d a' f g4 \breathe
  c8 d d c c d \acciaccatura g,8 bf4 \breathe
  a8 c f, d d4 a'8 \fermata g8 g4 ~ g \bar "||"
}

nhacPhienKhucHai = \relative c'' {
 
  d8 d c bf4
  g8 bf a g bf4 \breathe
  c8 bf a4 g8 a bf a g4 \breathe
  d'8 d bf4
  c8 d d c c \acciaccatura g8 bf4 \breathe
  c8 c bf a4 f8 a a g4 ~ g \bar "||"
}

nhacPhienKhucBa = \relative c'' {
 
  c8 d c d c d \acciaccatura g,8 bf4 \breathe
  a8 c c f, a a f g4 \breathe
  g8 g g g d' c d d4 \breathe
  a8 a c4 bf8 \tempo "Rall." c d d g,4 ~ g \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
 
  Dân Chúa hỡi, nào dân Chúa hỡi,
  đừng lãng quên những việc Chúa làm,
  đừng lãng quên những việc Chúa làm.
  Và luôn ghi nhớ, và luôn ghi nhớ,
  xin đừng lãng quên.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Dân tôi hỡi, này nghe tôi dạy bảo.
  Lắng tai nghe đón nhận lời lẽ miệng tôi.
  Tôi sẽ nói một bài huấn dụ.
  Công bố điều huyền diệu thuở xa xưa.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Thấy Chúa tiêu diệt, họ mới đi tìm Chúa.
  Mới trở lại, và đon đả kiếm Người.
  Mới nhớ rằng: Thiên Chúa, Đấng luôn che chở.
  Đấng cứu chuộc họ là Đấng Tối Cao.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Họ chỉ thơn thớt ngoài môi miệng.
  Đầu lưỡi phỉnh phờ dối trá mà thôi.
  Còn lòng dạ chẳng chút gì gắn bó.
  Chẳng thủy chung giữ giao ước với Người.
}


% Dàn trang
\paper {
  #(set-paper-size "a4")
  top-margin = 20\mm
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
  system-system-spacing = #'((basic-distance . 11)
                             (minimum-distance . 11)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 11)
                             (minimum-distance . 11)
                             (padding . 1))
}

\score {
  \new ChoirStaff <<
    \new Staff = diepKhuc \with {
        \consists "Merge_rests_engraver"
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key g \major \time 2/2 \stemNeutral \nhacDiepKhuc
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
    \override Lyrics.LyricSpace.minimum-distance = #2
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
        \key bf \major \time 2/2 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.2
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3.2
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
        \key bf \major \time 2/2 \nhacPhienKhucHai
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
        \key bf \major \time 2/2 \nhacPhienKhucBa
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
    \override Lyrics.LyricSpace.minimum-distance = #3.0
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}