% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Hồn Con Khao Khát Chúa" }
  poet = "Tv. 62"
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
nhacDiepKhucSop = \relative c' {
  d4 a' |
  fs8 a b b |
  a4 r8 b |
  a b cs d |
  \acciaccatura e8 d2 \bar "|."
}

nhacDiepKhucBas = \relative c' {
  d4 fs |
  d8 fs g g |
  fs4 r8 g |
  fs g g a |
  \acciaccatura a8 fs2
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  a4. b16 (a) |
  fs8 a b a |
  d,2 ( |
  d8) fs b, b |
  e4 cs8 b |
  a2 |
  r4 cs8 a |
  d e g fs |
  e2 |
  r4 e8 cs |
  a a e' cs |
  d2 ( |
  d4) r \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  a8 a b b |
  fs fs a b |
  d,4. cs8 |
  fs cs cs4 |
  cs8 fs a e |
  fs2 ( |
  fs8) fs a fs |
  fs b a b |
  cs2 |
  a8 b a4 |
  b8 b a e' |
  d2 ( |
  d4) r \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  b8 fs a4 |
  e8. fs16 e8 fs |
  d4. d8 |
  d b a4 |
  d8 e fs d |
  e2 |
  r4 g8 g 
  b8 b16 cs a8 a |
  a2 |
  cs8 a cs4 |
  a8 e' e d |
  d2 _( |
  d4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Lạy Chúa là Thiên Chúa của con,
  linh hồn con khao khát Chúa.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Chúa chính là Thiên Chúa con thờ.
  Ngay từ rạng đông con mong chờ.
  Linh hồn con đã khát khao Ngài,
  Tấm thân này mòn mỏi đợi trông.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Nên con đến ngắm nhìn Ngài nơi Thánh điện,
  Để thấy tận tường Ngài vinh hiển quyền năng,
  bởi ân tình Ngài quý hơn mạng sống,
  miệng lưỡi này xin ca ngợi tán dương.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Suốt đời con nguyện dâng lời chúc tụng.
  Đôi tay chắp lại, con tha thiết cầu xin.
  Được thỏa thuê như khách vừa dự tiệc.
  Môi miệng con rộn rã khúc hoan ca.
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
        \voiceOne \key d \major \time 2/4 \nhacDiepKhucSop
      }
      \new Voice = beBas {
        \override NoteHead.font-size = #-2
        \voiceTwo \key d \major \time 2/4 \nhacDiepKhucBas
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
        \key d \major \time 2/4 \nhacPhienKhucMot
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
  }
}

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key d \major \time 2/4 \nhacPhienKhucHai
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
  }
}

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key d \major \time 2/4 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.0
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}
