% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Lời Ban Hạnh Phúc" }
  poet = "Tv. 18"
  composer = "Lm. GB Trần Thanh Cao"
  %arranger = " "
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
nhacDiepKhucSop = \relative c' {
  \partial 4 \tuplet 3/2 { d8 g a } |
  b4 \tuplet 3/2 { b8 b b } |
  e,4 \tuplet 3/2 { e8 g a } |
  b2 |
  r4 \tuplet 3/2 { d,8 g a } |
  b4 \tuplet 3/2 { b8 b b } |
  e,4 fs8 g |
  a4. fs8 |
  g2 ( |
  g4) r \bar "|."
}

nhacDiepKhucBas = \relative c' {
  \partial 4 \tuplet 3/2 { d8 e fs } |
  g4 \tuplet 3/2 { g8 g g } |
  c,4 \tuplet 3/2 { c8 d c } |
  d2 |
  r4 \tuplet 3/2 { d8 e fs } |
  g4 \tuplet 3/2 { g8 g g } |
  c,4 d8 c |
  d4. a8 |
  b2 ( |
  b4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \partial 4 \tuplet 3/2 { d8 g a } |
  b4 \tuplet 3/2 { b8 e, e } |
  e4 fs8 e |
  d4 \tuplet 3/2 { fs8 g b } |
  a2 |
  r4 \tuplet 3/2 { g8 c d } |
  e4 \tuplet 3/2 { c8 a c } |
  a4 fs8 g |
  \autoBeamOff
  a8 ^^ d ^^ d ^^ g, ^^ |
  \autoBeamOn
  g2 ( |
  g4) r \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \partial 4 \tuplet 3/2 { d8 g a } |
  b4 \tuplet 3/2 { e,8 e g} |
  e4 fs8 e |
  d4 \tuplet 3/2 { a'8 b a } |
  g2 |
  r4 \tuplet 3/2 { g8 c d } |
  e4 \tuplet 3/2 { c8 a c } |
  a4 g8 e' |
  d4 \tuplet 3/2 { d8 d fs, } |
  g2 ( |
  g4) r \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \partial 4 d8 b |
  d4 \tuplet 3/2 { b8 b d } |
  e4 c8 a |
  c4 \tuplet 3/2 { d8 d c } |
  b4 \tuplet 3/2 { c8 c a } |
  a4 \tuplet 3/2 { a8 fs a } |
  d,4 fs8 e |
  d4 \tuplet 3/2 { a'8 fs g } |
  g2 ( |
  g4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Nào ca ngợi Chúa,
  Chúa có những lời, lời ban hạnh phúc.
  Nào ca ngợi Chúa,
  Chúa có những lời ban hạnh phúc trường sinh.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Luật pháp của Chúa quả là hoàn thiện,
  khiến tâm hồn vui sướng thảnh thơi.
  Lời dạy của Chúa thật là chính đại,
  làm cho kẻ chất phác nên khôn.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Lề luật của Chúa hoàn toàn ngay thẳng.
  Gieo hoan hỉ chan chứa cõi lòng.
  Mệnh lệnh của Chúa, bao la minh bạch.
  Tỏa ánh thiêng mở mắt phàm nhân.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Huấn dụ Chúa, mọi bề trong sáng,
  vững bền luôn mãi tới muôn đời.
  Phán quyết của Người luôn là chân thật.
  Hết thảy đều chính trực công minh.
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
    \override Lyrics.LyricText.font-size = #+2
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
        \key g \major \time 2/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
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
        \key g \major \time 2/4 \nhacPhienKhucHai
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
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
        \key g \major \time 2/4 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}
