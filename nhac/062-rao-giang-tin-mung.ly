% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Rao Giảng Tin Mừng" }
  poet = "Tv. 116"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c'' {
  \partial 8 d8 |
  b b a b |
  g4. b8 |
  a g e g |
  d4 a'8 b |
  g2 ^( |
  g4) r \bar "|."
}

nhacDiepKhucBas = \relative c' {
  \partial 8 d8 
  g g e g |
  d4. d8 |
  e d c d |
  b4 c8 d |
  b2 _( |
  b4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \partial 4 c8 c |
  d4 \breathe a8 b |
  g4 \tuplet 3/2 { e8 g a } |
  b2 |
  r4 d,8 a' |
  a4 \tuplet 3/2 { a8 fs e } |
  d4. e8 |
  d c' b a |
  g2 ( |
  g4) r \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \partial 8 e16 e |
  c'8 b b e, |
  g2 |
  r8 d16 d d8 a' |
  a a g a |
  b4. e,16 c' |
  b8 e, a fs |
  d4. a'8 |
  a4 g8 e |
  g2 ( |
  g4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Hãy đi rao giảng tin mừng.
  Hãy đi rao giảng tin mừng khắp thế gian.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Muôn nước hỡi, nào ca ngợi, nào ca ngợi Chúa.
  Ngàn dân ơi, hãy chúc tụng Người,
  chúc tụng Thánh Danh muôn đời.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Vì tình Chúa thương ta bền vững.
  Vì tình Người yêu ta không bờ không bến.
  Lòng tín trung Người mãi muôn đời, mãi mãi muôn đời sau.
}


% Dàn trang
\paper {
  #(set-paper-size "a4")
  top-margin = 15\mm
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
  system-system-spacing = #'((basic-distance . 14))
  score-system-spacing = #'((basic-distance . 14))
}

% Thiết lập tông và nhịp
TongNhip = { \key g \major \time 2/4 }

% Đổi kích thước nốt cho bè phụ
notBePhu =
#(define-music-function (font-size music) (number? ly:music?)
   (for-some-music
     (lambda (m)
       (if (music-is-of-type? m 'rhythmic-event)
           (begin
             (set! (ly:music-property m 'tweaks)
                   (cons `(font-size . ,font-size)
                         (ly:music-property m 'tweaks)))
             #t)
           #f))
     music)
   music)

\score {
  \new ChoirStaff <<
    \new Staff = diepKhuc \with {
        \consists "Merge_rests_engraver"
        %\magnifyStaff #(magstep +1)
        printPartCombineTexts = ##f
      }
      <<
      \new Voice \TongNhip \partCombine 
        \nhacDiepKhucSop
        \notBePhu -3 { \nhacDiepKhucBas }
      \new NullVoice = nhacThamChieu \nhacDiepKhucSop
      \new Lyrics \lyricsto nhacThamChieu \loiDiepKhuc
      >>
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #5
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
        \key g \major \time 2/4 \nhacPhienKhucHai
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
