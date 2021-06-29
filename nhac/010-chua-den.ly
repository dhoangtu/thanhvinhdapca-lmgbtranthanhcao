% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Chúa Đến" }
  poet = "Tv. 23"
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
  system-system-spacing = #'((basic-distance . 12))
  score-system-spacing = #'((basic-distance . 12))
}

% Nhạc điệp khúc
nhacDiepKhucSop= \relative c'' {
  \partial 4 a4 |
  a4 f8 f |
  g4 d8 d |
  e d e d |
  c4 \breathe bf' |
  bf g8 g |
  a4 f8 f |
  g d c g' |
  f2 ( |
  f4) r \bar "|."
}

nhacDiepKhucBass= \relative c' {
  \partial 4 f4 |
  f d8 d |
  e4 bf8 bf |
  c bf c bf |
  a4 g' |
  g c,8 c |
  f4 bf,8 bf |
  c bf a c |
  f2 ( |
  f4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  c8 a bf c c (c16) bf8 c a bf f4 \breathe
  d8 f d c (c16) d8 c a' g g4 (g8) \breathe
  g8 bf c bf bf c bf \acciaccatura bf16 c4 \breathe
  f,8 d f g c,4 a'8 g g f4 (f) \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  bf8 g bf c c4 \breathe
  bf8 c a bf c d c4 \breathe
  bf8 g a a d, f c4 \breathe
  bf8 d f g c,4 \breathe
  d8 c g' a f4 (f) \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  bf8 c g \breathe
  bf c d c4 \breathe
  a8 a g g e g c,4 \breathe
  d8 c g' g e g e bf'4 \breathe
  c8 bf c bf d c g f4 (f) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Chúa đến, Người là Vua,
  Người là Vua vinh hiển muôn đời.
  Chúa đến, Người là Vua,
  Người là Vua muôn đời hiển vinh.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Chúa làm chủ trái đất, cùng muôn loài muôn vật,
  làm chủ địa cầu, với toàn thể dân cư.
  Nền trái đất, Người đặt trên biển cả.
  Thiết lập cho vững bền mãi trên sông dài.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Ai được lên núi Chúa,
  Ai đáng vào đứng giữa Thánh cung?
  Ấy là kẻ có lòng thanh sạch chẳng mê theo ngẫu tượng,
  không thề gian nói ngoa.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Người như vậy Chúa chúc phúc cho,
  Chúa chí công dủ tình cứu độ.
  Đây dòng dõi những người đi tìm Chúa.
  Những người mong bệ kiến Thánh nhan Ngài.
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
        \key f \major \time 2/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.5
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
    \override Lyrics.LyricSpace.minimum-distance = #4
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
    \override Lyrics.LyricSpace.minimum-distance = #4
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}
