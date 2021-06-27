% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Tìm Chúa" }
  poet = "Tv. 68"
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
  d8 d c a |
  \acciaccatura c8 d2 |
  c8 a b a16 b |
  e,4. e16 fs |
  d8 a' a g |
  g2 ( |
  g4) r \bar "|."
}

nhacDiepKhucBass = \relative c'' {
  \skip 2
  \skip 2
  \skip 2
  \skip 4. a16 b |
  g8 c c b |
  b2 ( |
  b4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  g8 d' d c (a) d4 \breathe
  d8 d b g g4 \breathe
  e8 g d4 \breathe
  fs8 d b' a a4 \breathe
  d8 d c4 a8 c d b g4 \breathe
  e8 e e4 d8 b' a fs g4 \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  g8 d'4 d8 d g,4 \breathe
  e8 e e g d4 \breathe
  a'8 b e, g d4 \breathe
  d8 b' b a fs g4 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  #(define afterGraceFraction (cons 1 4))
  g8 g g c c a d d4 \breathe
  c8 a c a b a b e,4 \breathe
  e8 b' b a g g \afterGrace a (\tweak font-size #-4 b) d,4 \breathe
  d8 a' a a g fs fs a g4 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Hỡi những ai nghèo khổ,
  cứ tìm Chúa là tâm hồn,
  là tâm hồn phấn khởi vui tươi.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Phần con đây lạy Chúa,
  Xin dâng Ngài lời nguyện.
  Lạy Chúa Trời, đây giờ phút thi ân.
  Xin đáp lại vì ơn cả nghĩa dày.
  Quả thật Ngài là Đấng Cứu Độ con.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Lạy Chúa xin đáp lại bởi lòng Ngài nhân hậu,
  xin mở lượng hải hà mà ghé mắt lại nhìn xem.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Này bạn nghèo nghe đây mà vui lên,
  cứ tìm Chúa là tâm hồn phấn khởi.
  Vì Chúa đã nhậm lời người bé mọn.
  Vì Chúa chẳng lãng quên người bị giam cầm.
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
        \voiceTwo \key g \major \time 2/4 \nhacDiepKhucSop
      }
      \new Voice = beBas {
        \override NoteHead.font-size = #-2
        \voiceOne \key g \major \time 2/4 \nhacDiepKhucBass
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2.5
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
        \key g \major \time 2/4 \nhacPhienKhucMot
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
        \key g \major \time 2/4 \nhacPhienKhucHai
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2.5
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
        \key g \major \time 2/4 \nhacPhienKhucBa
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
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}
