% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Trước Mặt Chư Dân" }
  poet = "Tv. 97"
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
  system-system-spacing = #'((basic-distance . 13))
  score-system-spacing = #'((basic-distance . 13))
}

% Nhạc điệp khúc
nhacDiepKhuc = \relative c'' {
  \partial 4 c4 |
  a8 d c b4 c8 |
  a4 c8 a4 b8 |
  b4 e,8 b' a b |
  g4 a8 fs4 g8 |
  e4. ( e) \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \partial 4. c8 b a |
  d4 c8 a4 b8 |
  b4 \breathe e,8 b' b g |
  a4 b8 a4 fs16 g |
  e4. d8 fs a |
  b4 g8 a4 d,8 |
  d4. r4 c8 |
  g' fs e a4 b8 |
  e,4. (e) \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \partial 4. c4. |
  a8 d c b4 c8 |
  a4 e8 b' b a |
  g4 fs8 d4 e8 |
  e4. r8 d a' |
  fs d a' b4 b8 |
  g4. r8 fs a |
  g4 fs8 a4 fs8 |
  e4. (e) \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \partial 4. b8 b b |
  e,4 b'8 fs4 a8 |
  b4. r8 a a |
  fs4 fs8 a4 a8 |
  g4. r8 b b |
  c4 c8 a d c |
  b4. b4 a8 |
  a4. a4 g8 |
  g4 fs8 b4 a8 |
  e4. (e) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Chúa mạc khải ơn Người cứu độ trước mặt chư dân,
  mạc khải ơn cứu độ trước mặt muôn loài.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Hát lên mừng Chúa một bài ca mới.
  Vì Chúa đã dựng nên biết bao việc lạ lùng.
  Người chiến thắng bởi bàn tay hùng mạnh,
  bởi cánh tay thần thánh của Người.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Chúa biểu dương ơn Người cứu độ,
  mạc khải đức công bình trước mặt chư dân.
  Người nhớ lại tình ân nghĩa tín thành.
  Dành để cho nhà Is -- ra -- el.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Khắp cõi đất này đã từng xem thấy.
  Ơn cứu độ của Chúa chúng ta.
  Tung hô Chúa, hỡi toàn thể địa cầu.
  Hãy vui lên, hãy vui lên đàn hát reo hò.
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
        \key g \major \time 6/8 \stemNeutral \nhacDiepKhuc
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #4
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
        \key g \major \time 6/8 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2
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
        \key g \major \time 6/8 \nhacPhienKhucHai
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3
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
        \key g \major \time 6/8 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  } 
}
