% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Ta Là Dân Tộc" }
  poet = "Tv. 99"
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
  system-system-spacing = #'((basic-distance . 13))
  score-system-spacing = #'((basic-distance . 13))
}

% Nhạc điệp khúc
nhacDiepKhuc = \relative c'' {
  \partial 4. a8 g a |
  d,4. d16 d |
  a'8 g16 _(a) bf _(a) a _(g) |
  a2 |
  r8 g f g |
  c,4. c16 c |
  e8 d f16 (e) d8 |
  d2 ( |
  d4) r \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \partial 4 d,8 d |
  d'4. a16 c |
  c4 f,8 bf |
  bf c4 bf8 |
  a2 |
  r4 a8 e |
  e4 g8 d |
  d4. c16 e |
  g4. f8 |
  f2 |
  r4 c8 c |
  e4 e8 e |
  g4. bf8 |
  a e4 f8 |
  d2 ( |
  d4) r \bar "|."
}

nhacPhienKhucHai = \relative c'' {
  f,4 d8 d |
  d'4 c8 d |
  e4. c16 e |
  d4 \breathe \tuplet 3/2 { a8 a c } |
  c4. c8 |
  a8 g4 a8 |
  f4 \tuplet 3/2 { f8 e a } |
  \tempo "Rall" d,4 c8 e |
  d g
  \autoBeamOff
  bf \fermata a |
  \autoBeamOn
  a2 ( |
  a4) r \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \partial 8 d,8 |
  a'4 f8 e |
  d4 d8 f |
  f4. g8 |
  a4. g8 |
  c4 bf8 a |
  g4 a8 g |
  f4. a8 |
  a4 \afterGrace c (d8) |
  d2 ( |
  d4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Ta là dân tộc, là đoàn chiên của Chúa dẫn dắt.
  Ta là dân tộc, là đoàn chiên của Chúa chăn nuôi.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Toàn cầu hỡi, nào tung hô, nào tung hô Chúa chúng ta.
  Đến phụng thờ, đến phụng thờ, thật hớn hở vui tươi.
  Vào triều bái, vào triều bái, cất cao giọng reo hò.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Hãy nhìn nhận Chúa là Thượng Đế của chúng ta.
  Người dựng nên ta, ta là của riêng Người.
  Dân Người tuyển chọn, đoàn chiên Người dẫn lối ta đi.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Vì Chúa thật nhân lành, hằng yêu thương mãi mãi.
  Vì Chúa rất nhân hậu, vốn trung thành vạn đại thiên thu.
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
        \key f \major \time 2/4 \stemNeutral \nhacDiepKhuc
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
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
        \key f \major \time 2/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
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
        \key f \major \time 2/4 \nhacPhienKhucHai
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.3
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
        \key f \major \time 2/4 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  } 
}
