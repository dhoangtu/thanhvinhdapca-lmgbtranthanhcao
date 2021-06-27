% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Đức Thánh Quân" }
  poet = "Tv. 92"
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

  b4 g8 |
  c c b |
  a g r |
  e a g |
  g e fs |
  d4. |
  g8 d' c |
  c a b |
  g4. ( |
  g4) r8 \bar "|."
}

nhacDiepKhucBas = \relative c'' {


  g4 e8 |
  a a g |
  fs d r |
  c fs e |
  e c d |
  b4. |
  e8 b' a |
  a d, d |
  g4. ( |
  g4) r8
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {

  b4 g8 |
  c c b |
  a g r |
  e a g |
  g e fs |
  d4. |
  e8 c a' |
  a4. |
  e4 b'8 |
  g4. ( |
  g4) r8 \bar "||"
}

nhacPhienKhucHai = \relative c'' {

  \partial 8 b8 |
  g b g |
  e4 fs8 |
  d g a |
  b4. |
  c4 a8 |
  c4 d8 |
  e d cs |
  d4. |
  fs,4 g8 |
  a4. |
  e4 fs8 |
  d g a |
  b4. |
  fs8 g a |
  b4 g8 |
  g4. ( |
  g4) r8 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
 
  g4 g8 |
  g4 b8 |
  e, e' cs |
  d4. |
  c4 a8 |
  a4 a8 |
  b a b |
  e,4. |
  e8 g g |
  a e d |
  a'4 fs8 |
  g4. ( |
  g4) r8 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
 
  Chúa là Đức Thánh Quân hiển trị,
  mặc lấy oai phong tựa cẩm bào,
  mặc lấy oai phong tựa cẩm bào.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Chúa là Đức Thánh Quân hiển trị,
  mặc lấy oai phong tựa cẩm bào,
  long cổn cân đai tựa dũng lực.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Chúa củng cố địa cầu vững vàng không lay chuyển.
  Ngai vàng Chúa kiên vững tựa ngàn xưa.
  Ngài hiện hữu tự muôn đời,
  muôn muôn thuở, và mãi mãi đến thiên thu.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Lời Ngài dạy vững bền đáng cậy tin.
  Nơi đền vàng, rực lên toàn thánh thiện,
  triền miên qua hết mọi thời, hết mọi nơi.
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
        \voiceOne \key g \major \time 3/8 \nhacDiepKhucSop
      }
      \new Voice = beBas {
        \override NoteHead.font-size = #-2
        \voiceTwo \key g \major \time 3/8 \nhacDiepKhucBas
               
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
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
        \key g \major \time 3/8 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2.5
    \override Lyrics.LyricSpace.minimum-distance = #2.5
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
        \key g \major \time 3/8 \nhacPhienKhucHai
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
  }
}

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key g \major \time 3/8 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2.5
    \override Lyrics.LyricSpace.minimum-distance = #2.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}