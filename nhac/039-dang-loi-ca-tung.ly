% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Dâng Lời Ca Tụng" }
  poet = "Tv. 21"
  composer = "Lm. GB Trần Thanh Cao"
  %arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhuc = \relative c' {

  \partial 4 e4 |
  a g8 f |
  e2 |
  g8 f e f |
  d2 |
  f8 e d e |
  c4. f8 |
  e d e g |
  a2 ( |
  a4) r \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {

  \partial 4 d8 e |
  a,4 \tuplet 3/2 { d8 d e } |
  e4 e8 b |
  e4 \tuplet 3/2 { g8 g e } |
  a4 a8 e |
  a4 \tuplet 3/2 { e8 a a } |
  \acciaccatura e8 c'4 \fermata b8 b |
  d2 |
  b8 d e d |
  e4 \fermata a,8 c |
  b4. d8 |
  c8 (b) a4 |
  a2 ( |
  a4) r \bar "||"
}

nhacPhienKhucHai = \relative c' {

  \partial 4 a8 a |
  e'4 \tuplet 3/2 { e8 d e } |
  b4 \tuplet 3/2 { g'8 d d } |
  e4 \tuplet 3/2 { g8 g g } |
  a2 |
  r4 a8 c |
  c4 \tuplet 3/2 { d8 d e } |
  c4 b8 g |
  g4
  \autoBeamOff \tuplet 3/2 { b8 \fermata g \fermata b \fermata } |
  a2 ( |
  a4) r \bar "||"
}

nhacPhienKhucBa = \relative c' {

  \partial 4 a8 a |
  e'2 |
  e8 e b d |
  e4 \tuplet 3/2 { f8 a g } |
  g4 f8 d |
  d4 \breathe a'8 e |
  g a e a |
  c2 |
  c8 c a c |
  d4 \tuplet 3/2 { d8 b b } |
  e4 \fermata \tuplet 3/2 { e8 d e } |
  \acciaccatura d8 e4 b8 b |
  d4. c8 |
  c4 b |
  a2 ( |
  a4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
 
  Lạy Chúa, chịu ơn Ngài, con dâng lời ca tụng.
  Con dâng lời ca tụng trong ngày đại hội toàn dân.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Điều khấn nguyện, con xin giữ mãi.
  Trước mặt ai biết kính sợ Chúa.
  Kẻ nghèo khó, được ăn no thỏa.
  Người tìm Chúa, đồng vang tiếng ngợi khen.
  Cầu chúc họ sống vui ngàn đời.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Hạng quyền thế trên đời hết thảy,
  sẽ đều thờ lạy một mình Người thôi.
  Phàm những kẻ mang thân cát bụi,
  trước bệ rồng phủ phục kính tôn.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Còn phần con lấy Chúa làm lẽ sống.
  Con cháu mai sau phụng thờ Người.
  Thiên hạ sẽ kể về Đức Chúa,
  cho thế hệ tương lai.
  Lưu truyền hậu thế ơn Người cứu độ.
  Sự nghiệp đây chính Chúa tạo thành.
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
  system-system-spacing = #'((basic-distance . 12)
                             (minimum-distance . 12)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 12)
                             (minimum-distance . 12)
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
        \TongNhip \nhacDiepKhuc
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.5
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3.5
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
            nonstaff-relatedstaff-spacing.padding = #1.2
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.2
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
            nonstaff-relatedstaff-spacing.padding = #1
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3
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
            nonstaff-relatedstaff-spacing.padding = #1
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  } 
}
