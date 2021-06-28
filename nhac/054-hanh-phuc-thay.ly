% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Hạnh Phúc Thay" }
  poet = "Tv. 118"
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
  \partial 4 g8 d' |
  c4 a8 d |
  d c e4 |
  c a |
  a8 c c a |
  c4 a |
  g b16 b d8 |
  c2 ( |
  c4) r \bar "|."
}

nhacDiepKhucBas = \relative c' {
  \partial 4 e8 g |
  f4 f8 a |
  a g c4 |
  g f |
  f8 a a f |
  g4 f |
  e g16 g f8 |
  e2 ( |
  e4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \partial 4 e8 a |
  g4 g8 g |
  e4. d8 |
  d2 |
  r4 f8 e |
  e d g e16 (d) |
  c2 |
  r4 f8 c' |
  a4 a8 a |
  g4 c8 d |
  e4. e8 |
  a, b g4 |
  a8 g d' (e) |
  c2 ( |
  c4) r \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \partial 4 g8 e |
  c'4 a8 c |
  e,4.  d8 |
  d2 | r4 e8 a |
  g2 |
  e8 d e d |
  c2 |
  a'8 g g4 |
  g8 e c' d |
  e2 |
  r4 d8 e |
  a,4 g |
  c2 ( |
  c4) r \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \partial 4 g8 e |
  g4. g8 |
  d4 e |
  e2 |
  r8 a g e |
  g2 |
  d8 e e d |
  c2 |
  g'8 g g4 |
  e8 g c d |
  e2 |
  r8 d e a, |
  b4. d8 |
  e4 c |
  c2 ( |
  c4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Hạnh phúc thay, người noi theo luật pháp Chúa Trời.
  Người noi theo luật pháp Chúa Trời, thì thật phúc thay.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Hạnh phúc thay, ai sống đời hoàn thiện,
  biết noi theo luật pháp Chúa Trời.
  Hạnh phúc thay kẻ tuân hành theo ý Chúa.
  Hết lòng hết dạ đi tìm kiếm Người.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Vâng lệnh Chúa, Ngài đã ban lề luật.
  Truyền chúng con phải vâng giữ vẹn toàn.
  Ước mong sao con hằng luôn vững bước
  theo huấn lệnh Ngài ban.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Xin dạy con biết đường lối Chúa.
  Chỉ thị Ngài ban, con sẽ giữ đến cùng.
  Ban cho con được thông minh duệ trí.
  Con sẽ tận tâm tuân giữ luật Ngài.
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
        \voiceOne \key c \major \time 2/4 \nhacDiepKhucSop
      }
      \new Voice = beBas {
        \override NoteHead.font-size = #-2
        \voiceTwo \key c \major \time 2/4 \nhacDiepKhucBas
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
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
        \key c \major \time 2/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.8
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
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.6
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
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}
