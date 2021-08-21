% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Trong Thiên Chúa" }
  poet = "Tv. 61"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c' {
  <>^\markup { \halign #45 " " }
  b4 d e |
  g2 b,4 |
  d2. |
  d4 e g |
  b2 c4 |
  a2 fs4 |
  g2. \bar "|."
}

nhacDiepKhucBas = \relative c' {
  \skip 2.
  \skip 2.
  \skip 2.
  b4 c d |
  g2 e4 |
  fs2 d4 |
  b2.
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  b4 d e |
  g2 b,4 |
  d2. |
  d4 e g |
  e2 g4 |
  a2 a4 |
  g2. |
  fs2 a4 |
  d,2 e4 |
  b2 e4 |
  g2 \breathe g4 |
  e4 e g |
  a4. a8 g (a) |
  b2. |
  a4 d c |
  b2 a8 g |
  e2 fs4 |
  g2. \bar "||"
}

nhacPhienKhucHai = \relative c' {
  b4 d e |
  g2 b,4 |
  d2. |
  d4 e g |
  e2 g4 |
  a2 a4 |
  g2. |
  fs4 d d |
  e2 e4 |
  b2 e4 |
  g2 \breathe g4 |
  e4 e g |
  a4. a8 g (a) |
  b2. |
  a4 d c |
  b2 a8 g |
  e2 fs4 |
  g2. \bar "||"
}

nhacPhienKhucBa = \relative c' {
  b2 e4 |
  g2. |
  a4 g b |
  g2 g8 a |
  a2. |
  a4 a d |
  d2 c4 |
  a2 b4 |
  b2. |
  g4 a a |
  b2 b4 |
  a2 b4 |
  b2. |
  a2 b4 |
  d2 c4 |
  a b4. g8 |
  a2. |
  b2 a4 |
  fs2 a4 |
  fs d4. g8 |
  g2. \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Chỉ trong Thiên Chúa mà thôi.
  Này hồn tôi hãy nghỉ ngơi bằng yên.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Chỉ trong Thiên Chúa mà thôi.
  Hồn tôi mới được nghỉ ngơi yên hàn.
  Ơn cứu độ do Người mà đến.
  Duy Người là núi đá độ trì tôi.
  Thành lũy chở che, tôi chẳng hề nao núng.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Chỉ trong Thiên Chúa mà thôi,
  hồn tôi mới được nghỉ ngơi yên hàn.
  Hy vọng của tôi do Người mà có.
  Duy Người là núi đá độ trì tôi.
  Thành lũy chở che, tôi chẳng hề nao núng.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Nhờ Thiên Chúa, tôi được cứu độ và vinh quang.
  Người là núi đá vững vàng cho tôi.
  Ở nơi Thiên Chúa tôi hằng nương thân.
  Toàn dân hỡi luôn cậy trông vào Chúa.
  Trước mặt Người, hãy thổ lộ tâm can.
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
      "Deja Vu Serif Condensed"
      "Deja Vu Serif Condensed"
      "Deja Vu Serif Condensed"
      (/ 20 20)))
  page-count = #1
  system-system-spacing = #'((basic-distance . 11.5)
                             (minimum-distance . 11.5)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 11.5)
                             (minimum-distance . 11.5)
                             (padding . 1))
}

% Thiết lập tông và nhịp
TongNhip = { \key g \major \time 3/4 }

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
      \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto nhacThamChieu \loiDiepKhuc
      >>
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    %\override Lyrics.LyricText.font-size = #+2
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
        \key g \major \time 3/4 \nhacPhienKhucMot
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
        \key g \major \time 3/4 \nhacPhienKhucHai
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
        \key g \major \time 3/4 \nhacPhienKhucBa
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
    \override Lyrics.LyricSpace.minimum-distance = #2.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}
