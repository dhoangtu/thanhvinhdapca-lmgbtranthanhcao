% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Dân Chúa Hỡi" }
  poet = " "
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
nhacDiepKhuc = \relative c' {
  \partial 2 d4 e |
  e4. d8 g4 a |
  b2 a4 d |
  b4. a8 g4 a |
  e2 e4 b' |
  a4. g8 fs4 g |
  d4. b8 d4 d |
  e4. d8 g4 a |
  c4. b8 fs4 a |
  g2 r4 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhuc = \relative c' {
  \partial 8 d8 |
  d'8 e4 d8 |
  d4. c8 |
  b a4 b8 |
  e,4. e8 |
  c' d4 <c \tweak font-size #-2 d>8 |
  c4. a8 |
  fs e4 fs8 |
  d4. d8 |
  d'8 e4 d8 |
  d4. c8 |
  b a4 b8 |
  e,4. e8 |
  a b4 a8 |
  a4. fs8 |
  fs d4 a'8 |
  g2 ( |
  g4) r \bar "|."
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Dân Chúa hỡi, nào dân Chúa hỡi,
  đừng lãng quên những việc Chúa làm,
  đừng lãng quên những việc Chúa làm.
  Và luôn ghi nhớ, và luôn ghi nhớ,
  xin đừng lãng quên.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Người vẫn xót thương tôi,
  thứ tha mọi lỗi lầm.
  Người vẫn xót thương tôi,
  nén giận đã bao lần,
  Người vẫn xót thương tôi
  mỗi ngày và suốt đời.
  Người vẫn xót thương tôi,
  đem tôi về với Ngài.
}

loiPhienKhucHai = \lyricmode {
  \override Lyrics.LyricText.font-shape = #'italic
  \set stanza = #"2."
  Lòng Chúa rất bao la,
  như sao giăng khắp trời.
  Chở che hết (những) ai vững tâm đi theo Ngài.
  Tình thương rất mênh mông,
  như mây bay trên ngàn.
  Phủ che những thương đau,
  cho tôi được trung thành.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Dìu dắt bước tôi đi
  những bao lần vấp ngã.
  Bàn tay Chúa nâng tôi,
  cho tôi niềm hy vọng.
  Nhận biết Chúa đưa tôi,
  qua tháng ngày vất vả.
  Đời tôi có chi đâu
  sao tôi được Chúa thương?
}


% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = diepKhuc \with {
        \consists "Merge_rests_engraver"
        \magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key g \major \time 4/4 \stemNeutral \nhacDiepKhuc
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #1.6
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        \magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key g \major \time 2/4 \nhacPhienKhuc
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    %\override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #2.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  } 
}
