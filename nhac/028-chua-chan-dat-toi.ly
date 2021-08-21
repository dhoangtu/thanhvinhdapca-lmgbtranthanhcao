% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Chúa Chăn Dắt Tôi" }
  poet = "Tv. 22"
  composer = "Lm. GB Trần Thanh Cao"
  %arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucBas = \relative c'' {
  R2 |
  d4 a8 b |
  a4 a8 a 
  b4 fs |
  g8 g a d, |
  e4 fs8 a |
  g4 fs8 e |
  fs2 ~ |
  fs4 r \bar "|."
}

nhacDiepKhucSop = \relative c'' {
  <>^\markup { \halign #40 " " }
  d4 a8 b |
  a4. a8 |
  fs (g) fs e |
  d4. d8 |
  b (d) e b |
  a4 d8 fs |
  e (d) b a |
  d2 ~ |
  d4 r \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  fs8 d fs a |
  a4 b8 a |
  g4 b |
  d2 |
  d8 b e d |
  d4 b8 cs |
  d4 fs,8 (g) |
  a2 |
  g8 d a' fs |
  fs4 e8 e |
  a4 cs, |
  d2 ~ |
  d4 r \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \partial 4 b4 |
  d2 |
  b8 d e d |
  d2 ~ |
  d4 r8 e |
  d d4 d8 |
  d4 e fs r |
  b,8 cs d b |
  a2 |
  g8 e e a |
  a e4 a8 |
  cs,4 d8 (e) |
  d2 ~ |
  d4 r \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  a8 fs b a |
  a4. cs8 |
  cs4 e,8 g |
  g4 b |
  fs4. a8 |
  e2 |
  r4 cs8 ^(d) |
  e2 |
  a8 a cs, d |
  e4 cs'8 a |
  cs8 cs4 a8 |
  a4 e' |
  d2 ~ |
  d4 r \bar "||"
}

nhacPhienKhucBon = \relative c'' {
  \partial 4 g8 b |
  d2 |
  b4 d8 e |
  d2 |
  r4 d8 d |
  e4. d8 |
  e8 \acciaccatura e fs4 d8 |
  a2 |
  g4 b |
  d e |
  a,4. (b8) |
  a2 ( |
  a4) cs8 a |
  cs4 cs8 a |
  fs4 cs' |
  d2 ( |
  d4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhucSop = \lyricmode {
  Chúa chăn dắt tôi,
  tôi chẳng thiếu thốn gì
  trong đồng cỏ xanh rì
  Người để tôi được nghỉ ngơi.
}

loiDiepKhucBas = \lyricmode {
  Chúa chăn dắt tôi
  chắng thiếu chi
  Đồng xanh trên đồng cỏ xanh,
  Người để tôi được nghỉ ngơi.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Bên dòng nước trong mát dẫn tôi về bổ sức.
  Chúa dìu dắt tôi đi trên nẻo chính đường ngay.
  Chúa dìu dắt tôi đi trên nẻo chính đường ngay.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Lạy Chúa, dầu qua lũng âm u,
  con sợ gì sợ gì nguy khó,
  vì có Chúa ở cùng,
  côn trượng Ngài sẵn đó con vững dạ an tâm.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Chúa dọn sẵn cho con mâm cỗ bày ra ngay trước mặt quân thù.
  Đầu con Chúa xức đượm dầu thơm,
  ly rượu con đã đầy tràn chứa chan.
}

loiPhienKhucBon = \lyricmode {
  \set stanza = #"4."
  Tình thương Chúa và muôn phúc lộc,
  hằng dõi theo dõi theo suốt cuộc đời
  và tôi sống ở nhà Người những ngày tháng,
  những năm dài triền miên.
}


% Dàn trang
\paper {
  #(set-paper-size "a4")
  top-margin = 10\mm
  bottom-margin = 10\mm
  left-margin = 20\mm
  right-margin = 20\mm
  indent = #0
  #(define fonts
    (make-pango-font-tree
      "Deja Vu Serif Condensed"
      "Deja Vu Serif Condensed"
      "Deja Vu Serif Condensed"
      (/ 20 20)))
  page-count = #1
  system-system-spacing = #'((basic-distance . 11)
                             (minimum-distance . 11)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 11)
                             (minimum-distance . 11)
                             (padding . 1))
}

% Thiết lập tông và nhịp
TongNhip = { \key d \major \time 2/4 }

\score {
  \new ChoirStaff <<
     \new Staff = diepKhuc \with {
        \consists "Merge_rests_engraver"
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \TongNhip \stemNeutral \nhacDiepKhucSop
      }
      \new Lyrics \lyricsto beSop \loiDiepKhucSop
    >>
    \new Staff <<
      \new Voice = beBas {
        \TongNhip \stemNeutral \nhacDiepKhucBas
      }
      \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #0.5
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beBas \loiDiepKhucBas
    >>
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #1.5
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
        \TongNhip \nhacPhienKhucMot
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3.0
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
        \TongNhip \nhacPhienKhucHai
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3.0
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
        \TongNhip \nhacPhienKhucBa
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3.0
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  } 
}
