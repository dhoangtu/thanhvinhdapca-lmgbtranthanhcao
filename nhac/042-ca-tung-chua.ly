% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Ca Tụng Chúa" }
  poet = "Tv. 66"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
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
}

% Nhạc điệp khúc
nhacDiepKhuc= \relative c'' {
  \partial 4 g4 |
  g r8 a |
  g4 e |
  c'2 |
  d4 a |
  c4 r8 c |
  e,4 g |
  g r8 g |
  f4 e |
  c2 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  g8 a c a g4 e8 g a e g a g4
  e8 g g e d16 ([e]) d4
  e8 e d c a4
  a8 b g g4 g8 a g d' d g c, c4
  c8 c c c a4 g8 b d ([f]) e ([d]) c d c4 \bar "||"
}


nhacPhienKhucHai = \relative c'' {
  #(define afterGraceFraction (cons 1 4))
  c8 a g g16 ([a]) g8 e g g4 \breathe
  e8 e g e d c d d4 \breathe
  a8 g b
  \afterGrace d8 (\tweak font-size #-4 g)
  f e d c4 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  g8 g a16 ([c]) a8 g e4
  g8 e d8. e16 c8 d d \breathe
  e8 d c a4 d8 e g e d16 ([e]) c8 d e d4
  a8 c e a, g b d f4 e8 d c4 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Chư dân, hãy ca tụng Chúa.
  Thân lạy Chúa,
  hết thảy chư dân, hãy ca tụng Ngài.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Xin Thiên Chúa xót thương
  và ban phúc lành cho chúng tôi.
  Xin chiếu giải trên chúng tôi ánh sáng tôn nhan Ngài,
  để trên địa cầu người ta nhìn biết đường lối của Ngài:
  Cho chư dân thiên hạ được biết rõ ơn Ngài cứu độ.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Các dân tộc hãy vui mừng hân hoan,
  vì Ngài công bình cai trị chư dân,
  và Ngài cai quản các nước địa cầu.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Chư dân hãy ca tụng Ngài,
  thân lạy Ngài, hết thảy chư dân hãy ca tụng Ngài.
  Xin Thiên Chúa ban phúc lành cho chúng tôi.
  Và cho khắp cùng bờ cõi trái đất kính sợ Ngài.
}

% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = diepKhuc \with {
        \consists "Merge_rests_engraver"
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key c \major \time 2/4 \stemNeutral \nhacDiepKhuc
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2.5
    \override Lyrics.LyricSpace.minimum-distance = #2.0
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
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
  >>
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
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
  >>
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
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
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
