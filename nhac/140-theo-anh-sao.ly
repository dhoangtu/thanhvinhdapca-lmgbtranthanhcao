% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Theo Ánh Sao" }
  poet = " "
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  r8 d8 b d |
  g4 g8 fs g fs g a |
  b2 r8 g c b |
  a4 a8 b a g fs e |
  d2 r8 d b d |
  g4 g8 fs g fs g b |
  d2 r8 e d c |
  b4 g8 g a a g fs |
  g2 \bar "||"
}

nhacPhienKhucHai = \relative c' {
  r8 d8 b d |
  g4 g8 g g fs g a |
  b2 r8 g c b |
  a4 a8 b a g fs e |
  d2 r8 d b d |
  g4 g8 fs e g c b |
  a2 r8 a b c |
  d4 d8 e d c b a |
  g2 r4 \bar "||"
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c'' {
  \partial 2 r4 g |
  c2 r8 g g a |
  b2 r8 d, cs d |
  e ds e fs g g a b |
  a2 r4 g |
  c2 r8 g g a |
  b2 r8 d, cs d |
  e ds e fs g a16 (c) b8 a |
  g1 \bar "|."
}

nhacDiepKhucBas = \relative c' {
  \skip 2
  r4 e8 e e2 |
  r4 d8 d d d cs d |
  e4 r b' a8 g |
  fs4 \tuplet 3/2 { fs8 fs fs } fs4 r |
  r e8 e e2 |
  r4 d8 d d d cs d |
  e e e a c e d c |
  b1
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"(Nữ)"
  Ca đoàn Hiển Linh với nhiệt tâm phụng thờ Thiên Chúa.
  Cùng với ánh sao mang đức tin đến cho mọi người.
  Ca đoàn Hiển Linh với tuổi xuân hòa cùng tiếng hát.
  Hiến dâng lên Cha hòa cùng với lễ dâng chiều hôm.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"(Nam)"
  Ca đoàn Hiển Linh tay trong tay cùng nhau tiến bước.
  Nhìn ánh sáng sao ta vững tin bước đi trong đời.
  Chan hòa niềm vui qua bao ngày ta hát bên nhau.
  Phục vụ anh em, ta quyết tâm đi cho đến cùng.
}

% Lời điệp khúc
loiDiepKhucSop = \lyricmode {
  Hiển Linh đồng hành với Chúa
  qua mọi gian nguy lòng vẫn trung kiên đi theo ánh sao.
  Hiển Linh dâng lên tiếng hát
  ca ngợi tôn vinh phụng thờ Thiên Chúa đoái thương nhân trần.
}

loiDiepKhucBas = \lyricmode {
  Nguyện một lòng
  chẳng sờn lòng qua mọi gian nguy vẫn đi theo sao
  theo sao theo sao.
  Cùng cộng đoàn
  lời nguyện cầu ca ngợi tôn vinh
  phụng thờ Thiên Chúa đoái thương nhân trần.
}

% Dàn trang
\paper {
  #(set-paper-size "a4")
  top-margin = 15\mm
  bottom-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  indent = #0
  #(define fonts
    (make-pango-font-tree
      "Deja Vu Serif Condensed"
      "Deja Vu Serif Condensed"
      "Deja Vu Serif Condensed"
      (/ 20 20)))
  page-count = #2
  print-page-number = #f
}

TongNhip = {
  \key g \major \time 2/2 
  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment = #(ly:make-moment 1/4)
  \set Timing.beatStructure = #'(1 1 1 1)
}

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \TongNhip \nhacPhienKhucMot
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.2
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.0
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}

\score {
  \new ChoirStaff <<
    \new Staff = diepKhucSop \with {
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \TongNhip \nhacDiepKhucSop
      }
      \new Lyrics \lyricsto beSop \loiDiepKhucSop
    >>
     \new Staff = diepKhucBas \with {
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beBas {
        \TongNhip \nhacDiepKhucBas
      }
      \new Lyrics \lyricsto beBas \loiDiepKhucBas
    >>
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #1.0
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}

\markup { \vspace #2 }

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \TongNhip \nhacPhienKhucHai
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.2
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.0
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  } 
}
