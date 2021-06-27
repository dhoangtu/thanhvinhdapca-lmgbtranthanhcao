% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Niềm Tin Vào Chúa" }
  poet = "Tv. 1"
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
nhacDiepKhucSop = \relative c'' {
  d8 b b a |
  g4 e8 g |
  a4. g8 |
  b4 a8 a |
  c4 b8 (a) |
  g2 ( |
  g4) r \bar "|."
}

nhacDiepKhucBas = \relative c' {
  fs8 g g fs |
  e4 c8 e |
  fs4. e8 |
  g4 fs8 fs |
  e4 d |
  b2 ( |
  b4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \partial 4 d8 c |
  c4 a8 c |
  a c a d16 (e) |
  d4 b8 d |
  e,4 \tuplet 3/2 { e8 g a } |
  b2 |
  r4 c8 a |
  a c a c |
  a c d4 |
  r b8 b |
  d b fs a |
  d,2 |
  r8 e g a |
  d, d'4 a8 |g2 ( |
  g4) r \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \partial 4 g8 b |
  d4 c8 a |
  g4 b8 a |
  c2 |
  c8 c a4 |
  a8 c e c |
  d2 |
  r4 \tuplet 3/2 { g,8 b d } |
  c4 a8 fs |
  e4. e8 |
  e2 |
  d8 fs a4 |
  d,8 a' b a |
  g2 ( |
  g4) r \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  g8 b a c |
  b4 g8 e |
  e2 |
  fs8 e d4 |
  a'8 c c a |
  b2 |
  a8 c a c |
  d2 |
  d8 a a c |
  d2 |
  c8 c e e |
  d2 |
  c8 a b a |
  g2 ( |
  g4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Phúc cho ai trọn bề đặt niềm tin vào Chúa,
  đặt niềm tin nơi Ngài.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Phúc thay ai chẳng theo lời những kẻ bất lương,
  chẳng bước vào đường quân tội lỗi.
  Không nhập bọn với phường ngạo ngược kiêu căng.
  Nhưng vui thú nghe lời Chúa dạy,
  nhẩm đi nhẩm lại suốt đêm ngày.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Người như thế, tựa cây trồng bên dòng suối.
  Cứ đúng mùa là hoa quả trổ sinh.
  Cành lá tốt tươi chẳng khi nào tàn tạ.
  Người như thế, việc chi cũng sẽ thành.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Còn số phận ác nhân đâu được vậy.
  Chẳng qua là vỏ trấu gió thổi bay.
  Vì Chúa hằng che chở,
  nẻo đường người công chính.
  Còn đường lối ác nhân, dẫn đưa tới suy tàn.
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
        \voiceOne \key g \major \time 2/4 \nhacDiepKhucSop
      }
      \new Voice = beBas {
        \override NoteHead.font-size = #-2
        \voiceTwo \key g \major \time 2/4 \nhacDiepKhucBas
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2.5
    \override Lyrics.LyricSpace.minimum-distance = #4.5
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
        \key g \major \time 2/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2.5
    \override Lyrics.LyricSpace.minimum-distance = #1.9
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
        \key g \major \time 2/4 \nhacPhienKhucHai
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2.5
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
        \key g \major \time 2/4 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2.5
    \override Lyrics.LyricSpace.minimum-distance = #1.2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}
