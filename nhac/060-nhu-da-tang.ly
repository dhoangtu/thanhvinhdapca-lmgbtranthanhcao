% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Như Đá Tảng" }
  poet = "Tv. 30"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhuc = \relative c' {
  \partial 4 c4 |
  a'4. a8 |
  g a a c |
  f,4. e8 |
  g d4 d8 |
  c4. e8 |
  g f4 g8 |
  f2 ~ |
  f4 r \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \partial 4 c4 |
  a' \breathe a8 g |
  a (bf) a (g) |
  f2 |
  r8 f d f |
  c d4 f8 |
  g2 |
  r8 c bf d |
  c4 \tuplet 3/2 { f,8 f g } |
  a4 bf8 a |
  g2 |
  c,8 g' g a |
  f2 ~ |
  f4 r \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \partial 4. c8 bf c |
  c4 \tuplet 3/2 { bf8 d c } |
  c2 |
  bf8 f f g |
  a4. bf8 |
  a d,4 d8 |
  c2 |
  r8 d c d |
  c4 c8 f |
  f g a4 |
  d,8 f d4 ~ |
  d8 e g a |
  f2 ~ |
  f4 r \bar "||"
}

nhacPhienKhucBa = \relative c' {
  f8 a g f |
  d2 |
  c8 c f a |
  g2 |
  bf8 c bf d |
  \acciaccatura bf8 c2 |
  r4 c8 c |
  bf4 g16 bf g8 |
  c2 |
  r4 bf8 bf |
  c4. g8 |
  bf4 g |
  f2 ~ |
  f4 r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Lạy Chúa, xin Ngài nên như đá tảng,
  để con được độ trì,
  để con được cứu độ.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Lạy Chúa, con ẩn náu bên Ngài,
  mong chẳng bao giờ phải hổ ngươi.
  Xin giải thoát con, vì Ngài công chính,
  lắng tai nghe và mau mau chữa lành.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Xin Ngài nên như tảng đá dung thân,
  như tòa nhà kiên cố để con được độ trì.
  Chúa là sức mạnh, là nơi con ẩn náu.
  Vì danh Ngài, xin dẫn dắt con.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Nguyện Thánh Nhan đã rạng, nhìn đầy tớ Chúa đây
  và thương tình cứu độ.
  Hết những ai cậy trông vào Chúa,
  mạnh bạo lên và hãy can trường.
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
            nonstaff-relatedstaff-spacing.padding = #1
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2
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
        \TongNhip \nhacPhienKhucHai
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
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
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}
