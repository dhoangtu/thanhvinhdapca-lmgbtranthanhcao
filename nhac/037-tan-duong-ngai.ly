% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Tán Dương Ngài" }
  poet = "Tv. 29"
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
nhacDiepKhucSop= \relative c' {
  \partial 4 d4 |
  a'2 |
  a4 a |
  c a8 _(g) |
  f2 |
  g4 g |
  a g8 _(f) |
  d2 |
  d4 f |
  c d |
  g8 _(f) d4 |
  a'2 ( |
  a4) r \bar "|."
}

nhacDiepKhucBass= \relative c' {
  \partial 4 d4 |
  f2 |
  f4 f |
  a f8 ^(e) |
  d2 |
  e4 e |
  f e8 ^(d) |
  bf2 |
  bf4 d |
  a bf |
  c bf |
  a2 ( |
  a4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  f8 c'4 \breathe
  bf8 bf c a f4 d8 f d4 d8 f g c,4 \breathe
  c'8 bf c f, bf bf a4 (a) \breathe
  f8 c' bf c f,4 d8 f g f f4 d8 f g c,4
  d8 f4 e8 f g a a f4 (f) \bar "||"
}

nhacPhienKhucHai = \relative c' {
  f8 c' bf4 f8 bf bf c4 \breathe
  a8 a a4 a8 g16 _(c) a (g) f4 \breathe
  d8 g f4 f8 d f f g c,4 \breathe
  e8 f g4 d8 e c4 a'8 g a c, f4 (f) \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  c8 bf a a c a16 _(bf) c4 f,8 (g) a4 a8 g g c bf g f4
  a8 g g4 g8 g d e c4 \breathe
  e8 f g4 g8 c bf g4 g8 e d c4
  g'8
  \tempo "Rall." g c, f4 (f) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Lạy Chúa, con xin tán dương Ngài,
  con xin tán dương Ngài,
  vì chính Ngài đã cứu mạng con.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Lạy Chúa, con xin tán dương Ngài
  vì chính Ngài đã thương cứu mạng
  không để quân thù chế giễu con.
  Lạy Chúa, từ âm phủ, Ngài đã kéo con lên.
  Tưởng đã xuống mồ,
  Ngài thương mà Ngài thương cứu sống con.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Người có giận, giận trong giây lát.
  Nhưng yêu thương, thương suốt cả đời.
  Lệ có rơi khi màn đêm buông xuống rồi,
  thì hừng đông, hừng đông về, đã vọng tiếng hò reo.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Xin nhận lời và dủ lòng thương.
  Lạy Chúa, xin Ngài trợ giúp con đêm ngày,
  khúc ai ca, Chúa đổi thành vũ điệu.
  Lạy Thiên Chúa, lạy Chúa con thờ,
  xin tạ ơn Ngài mãi mãi ngàn thu.
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
        \voiceOne \key f \major \time 2/4 \nhacDiepKhucSop
      }
      \new Voice = beBas {
        \override NoteHead.font-size = #-2
        \voiceTwo \key f \major \time 2/4 \nhacDiepKhucBass
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
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
        \key f \major \time 2/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
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
        \key f \major \time 2/4 \nhacPhienKhucHai
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
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #4.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}
