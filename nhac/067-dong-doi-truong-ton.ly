% Cài đặt chung
\version "2.20.0"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Dòng Dõi Trường Tồn" }
  poet = "Tv. 88"
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

  g8 _(fs) e _(fs) |
  d2 |
  a'4 c, |
  c2 |
  g'4 b, |
  b d |
  d (g8) r |
  b _(a) g4 |
  g2 |
  c8 _(b) a4 |
  a2 |
  d8 d g,4 |
  g2 ( |
  g4) r \bar "|."
}

nhacDiepKhucBass = \relative c' {


  \skip 2
  b2 |
  d4 a |
  a2 |
  e'4 g, |
  g b |
  b (d8) r |
  g ^(fs) e4 |
  e2 |
  a8 ^(g) d4 |
  d2 |
  b'8 b d,4 |
  g2 ( |
  g4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
 
  g8 a (b) b4 b8 b a b g \breathe
  e e e e g g a (g) b, d4 \breathe
  c8 c e4 g8 a g e fs d4 \breathe
  d8 d d d'4 \fermata b8 fs a g g4 \bar "||"
}

nhacPhienKhucHai = \relative c'' {
 
  g8 a (b) b b4 b8 a a b g4 \breathe
  a8 g e e g a a (g) b, d4 \breathe
  c \breathe e8 g d g a b a g a4 \breathe
  e \breathe a8 e a \breathe a d4 \fermata
  d,8 b' a fs g4 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
 
  g8 a (b) b b a a b a b g4 \breathe
  e8 g a g e4 \breathe
  e8 g g b, d4 \breathe
  \tempo "Rall" d8 d'4 \fermata b8 (a) fs g4 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
 
  Dòng dõi người sẽ trường tồn, sẽ trường tồn vạn kỷ,
  sẽ trường tồn, sẽ trường tồn, mãi mãi trường tồn.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Ân nghĩa Chúa con không ngừng ca tụng.
  Đời lại đời miệng rao giảng Chúa thành tín.
  Vì Ngài phán: Ân nghĩa Ta được xây dựng
  và lòng thành tín vững bền tới thiên thu.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Ta đã giao ước với người Ta tuyển chọn,
  đã đoan thề cùng Đa -- vít nghĩa bộc Ta.
  Rằng: Dòng dõi người Ta giữ vững muôn ngàn năm.
  Rằng: Ngai vàng ngươi Ta thiết lập tới muôn ngàn đời.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Ngươi sẽ thưa Ta rằng: Ngài chính là Thân phụ,
  là Thiên Chúa con thờ,
  là nơi con tựa nương,
  là Đấng cứu độ con.
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
        \voiceOne \key g \major \time 2/4 \nhacDiepKhucSop
      }
      \new Voice = beBas {
        \override NoteHead.font-size = #-2
        \voiceTwo \key g \major \time 2/4 \nhacDiepKhucBass
        
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #2.0
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
        \key g \major \time 2/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #2.2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        \magnifyStaff #(magstep +1)
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
    \override Lyrics.LyricText.font-size = #+3
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
        \magnifyStaff #(magstep +1)
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
    \override Lyrics.LyricText.font-size = #+3
    \override Lyrics.LyricSpace.minimum-distance = #2.3
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}
