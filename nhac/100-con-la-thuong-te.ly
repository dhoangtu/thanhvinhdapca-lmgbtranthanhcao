% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Con Là Thượng Tế" }
  poet = "Tv. 109"
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

  a4 e8 g |
  a4 c,8 d |
  f g4 f8 |
  e2 |
  a4. f8 |
  e a c b |
  a2 ( |
  a4) r \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {

  a8 g e g a4 \breathe
  c8 a e' c d4 \breathe
  b8 d b b4 b8 b g g4 \breathe
  a8 e d c c4 \breathe
  d8 e b d e c'4 b a (a) \bar "||"
}

nhacPhienKhucHai = \relative c'' {

  a8 a a f e4 ^(e8) \breathe
  d g g4 g8 a c, a e'4 \breathe
  f8 e d e gs4 gs8 e a4
  b8 d d a c e c4 \breathe
  e,8 gs b4 b8 d c b a4 (a) \bar "||"
}

nhacPhienKhucBa = \relative c'' {
 
  a8 a g e c a e'4 \breathe
  d8 g f e d e4
  a8 g4 a8 a e a c4
  b8 d g, b c4 d e _(e) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
   Con là Thượng Tế, là Thượng Tế đến muôn đời,
  Theo phẩm hàm "Men -" "ki -" "sê -" đê.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Sấm ngôn của Đức Chúa, ngỏ cùng Chúa Thượng tôi:
  Bên hữu Cha đây, Con lên ngự trị,
  để rồi bao địch thù, Cha sẽ đặt làm bệ dưới chân con.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Đức Chúa phán bảo rằng:
  Ngày đăng quang, con nắm quyền thủ lãnh,
  vẻ huy hoàng rực rỡ tựa thần linh.
  Ngay trước lúc hừng đông xuất hiện,
  tự lòng Cha, Cha đã sinh ra con.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Đức Chúa đã một lần thề ước,
  Người sẽ chẳng rút lời rằng:
  Muôn thuở con sẽ là Thượng Tế
  chẳng khác nào Men -- ki -- sê -- đê.
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
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #4.0
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
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3.0
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
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3.5
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
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}
