% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Vẫn Trọn Tình Thương" }
  poet = "Tv. 106"
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
  a8 e' d f |
  e4. e8 |
  a4 a8 g |
  d4 e8 b |
  b4 f'8 f |
  d4 d |
  e4. a8 |
  g4 e |
  a2 ( |
  a4) r \bar "|."
}

nhacDiepKhucBass = \relative c' {
  a8 c b d |
  c4. c8 |
  f4 f8 e |
  b4 e8 b |
  b4 d8 d |
  b4 b 
  c4. f8 |
  e4 d |
  e2 ( |
  e4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  e8 e a,4 a8 f' d e4 e8 a gs4 \breathe
  a8 e a e c' b a4 (a8) \breathe
  d8 d g,4 g8 d' b c4 \breathe
  b8 b b4 \tempo "Rall" d8 g, b a4 (a) \bar "||"
}

nhacPhienKhucHai = \relative c' {
  d8 e a, a4 a8 e' e d g4 \breathe
  e8 a a4 a8 \acciaccatura e8 c'4 c8 a c d d4
  d8 b b g a f e d4 \breathe
  g8 e c4 a'8 g e a4 (a) \bar "||"
}

nhacPhienKhucBa = \relative c' {
  e8 a a4 e8 e g a c,4 \breathe
  b8 f' f e4 b8 b d b a4 (a8) \breathe
  a8 e' d e4 \breathe
  e8 g a4 e8 e c' c a b4 d8 b d c c4 f8 e d e4 \fermata
  \tempo "Rall" e8 c a a4 (a) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Nào cảm tạ Chúa đi, vì Chúa rất nhân từ.
  Muôn ngàn đời Chúa vẫn trọn tình thương,
  vẫn trọn tình thương.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Có những người vượt biển ngược xuôi nghề thương mại.
  Giữa trùng dương lèo lái con thuyền.
  Mắt đã tường việc Chúa làm nên.
  Thật kỳ diệu giữa lòng biển khơi.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Gặp bước ngặt nghèo, họ kêu lên cùng Chúa,
  Người ra tay cứu khổ thoát ngàn nỗi gian truân,
  đổi phong ba thành gió thoảng nhẹ nhàng.
  Sóng đang gầm bỗng thành bình yên.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Họ vui sướng vì trời yên bể lặng.
  Và Chúa dẫn đưa về bờ bến mong chờ.
  Họ sẽ tạ ơn, tạ ơn Chúa vì lòng Chúa rất từ nhân,
  đã làm cho người trần biết bao kỳ công,
  biết bao tuyệt diệu.
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
        \voiceTwo \key c \major \time 2/4 \nhacDiepKhucBass
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2.5
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
    \override Lyrics.LyricText.font-size = #+2.5
    \override Lyrics.LyricSpace.minimum-distance = #2.9
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
        \key c \major \time 2/4 \nhacPhienKhucHai
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2.5
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
    \override Lyrics.LyricText.font-size = #+2.5
    \override Lyrics.LyricSpace.minimum-distance = #3.0
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}
