% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Cảm Tạ Chúa" }
  poet = "Tv. 117"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

global = {
  \key c \major
  \time 2/4
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
nhacDiepKhucSop = \relative c' {
  c4 e8 d |
  g4. f8 |
  f4 g8 f |
  d4 e8 c |
  c g'4 a8 |
  f4 d |
  g2 |
  a8 c b d16 (e) |
  d4. a8 |
  a4 \acciaccatura a8 c4 |
  g a8 g |
  g b4 d8 |
  g,4 e |
  c'2 \bar "|."
}

nhacDiepKhucBas = \relative c'' {
  r2 |
  r4 b |
  a4. a8 |
  g2 |
  r4 c |
  d4. c8 |
  b a4 d8 |
  g,2 |
  a8 f d'4 |
  c2 |
  e |
  d4 d |
  b g |
  c2 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  g4 d'8 (e) |
  d d a c |
  c4 b8 a |
  g4 a |
  a e8 c |
  g'2 ( |
  g8) \breathe c, e e |
  e4 d8 g |
  g4 a8 g |
  g4 b |
  d8 g,4 e8 |
  c'2 \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  g8 c e, f |
  g4. e8 |
  c4. (e8) |
  r4 d8 d |
  g4 a |
  b a |
  g2 |
  c |
  f,4. a8 |
  c4 e, |
  g e |
  d2 ( |
  d8) f f f |
  e2 |
  c4 d |
  c2 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  g4 c |
  b8 b a b |
  e,4 \breathe e |
  a2 |
  g8 g a d, |
  e2 ( |
  e4) c8 d |
  f4. e8 |
  d r e g |
  c b a g |
  f e d c |
  d2 |
  d4 d |
  c2 ( |
  c4) r \bar "||"
}

nhacPhienKhucBon = \relative c' {
  d8 e c4 |
  a' g8 e |
  c'4 b8 a |
  g2 |
  f4 f |
  d8 d g4 ( |
  g) b,8 b |
  d4. c8 |
  c2 \bar "||"
}

% Lời điệp khúc
loiDiepKhucSop = \lyricmode {
  Nào cảm tạ Chúa, vì Ngài rất nhân từ.
  Muôn ngàn đời Chúa vẫn trọn tình thương.
  Nào cảm tạ Chúa đi vì Ngài nhân hậu.
  Muôn ngàn đời Chúa vẫn trọn tình thương.
}

loiDiepKhucBas = \lyricmode {
  Chúa ta nhân từ
  Ta hãy mau cảm tạ Chúa nào!
  Cảm tạ biết bao
  Chúa luôn cho trọn tình thương.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Nhà Is -- ra -- el, nào hãy nói:
  Muôn ngàn đời Chúa vẫn trọn tình thương.
  Nhà A -- ha -- ron nào hãy nói:
  Muôn ngàn đời Chúa vẫn trọn tình thương.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Viên đá người thợ xây loại bỏ
  lại trở nên đá tảng góc tường.
  Ấy là Chúa đã làm nên như vậy
  trước mắt chúng ta thật lạ lùng.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Lạy Chúa, xin ban ơn cứu độ.
  Lạy Chúa, xin thương giúp thành công.
  Nguyện xin Chúa chúc lành,
  Nguyện xin Chúa chúc lành cho những ai tiến vào đây,
  nhân danh Ngài.
}

loiPhienKhucBon = \lyricmode {
  \set stanza = #"4."
  Từ thánh điện chúng tôi cầu phúc cho anh em.
  Đức Chúa là Thượng Đế,
  Ngài giải sáng trên ta.
}

% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff \with {
        \consists "Merge_rests_engraver"
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key c \major \time 2/4 \nhacDiepKhucSop
      }
      \new Lyrics \lyricsto beSop \loiDiepKhucSop
    >>
    \new Staff \with {
        \consists "Merge_rests_engraver"
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beBas {
        \key c \major \time 2/4 \nhacDiepKhucBas
      }
      \new Lyrics \lyricsto beBas \loiDiepKhucBas
    >>
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2.5
    \override Lyrics.LyricSpace.minimum-distance = #0.5
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
    \override Lyrics.LyricSpace.minimum-distance = #0.5
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
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2.5
    \override Lyrics.LyricSpace.minimum-distance = #0.5
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
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2.5
    \override Lyrics.LyricSpace.minimum-distance = #0.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  } 
}
%{
\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key c \major \time 2/4 \nhacPhienKhucBon
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBon
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2.5
    \override Lyrics.LyricSpace.minimum-distance = #0.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  } 
}
%}