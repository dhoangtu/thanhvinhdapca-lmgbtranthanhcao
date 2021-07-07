% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Luật Pháp Chúa" }
  poet = "Tv. 118"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c' {
  \partial 2 e4 f |
  d2 d4 (f) |
  a2 c4. c8 |
  a _(c) d4 c2 |
  bf4. bf8 g4 e |
  f1 \bar "|."
}

nhacDiepKhucBas = \relative c' {
  \partial 2 e4 f |
  d2 d4 (f) |
  f2 a4. a8 |
  f ^(g) bf4 a2 |
  g4. g8 e4 c
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  f4 e8 d g4 a8 g |
  c2 c4. bf8 |
  d4 c bf g |
  g2 \breathe a4. g16 (a) |
  c4 a \acciaccatura g8 bf4 g8 (e) |
  f1 \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \partial 2 f4. e8 |
  c4 f f g |
  a2 \breathe g4. g8 |
  e4 c g' g |
  f2 \breathe f4. e8 |
  d4 g g a |
  c2 \breathe bf4. d8 |
  a4 g c g |
  f1 \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \partial 2 f4. e8 |
  d4 c f g |
  a2 \breathe g4. e8 |
  c4 g' bf e, |
  f2 \breathe f4. e8 |
  d4 g g a |
  c2 \breathe bf4. c8 |
  g4 bf \acciaccatura c8 d4 g,8 (e) |
  f1 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Luật pháp Ngài, lạy Chúa,
  Con yêu chuộng biết bao,
  con yêu chuộng dường bao.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Gia nghiệp đời con chính là Chúa,
  con đã hứa tuân giữ lời Ngài.
  Con đã hứa tuân giữ lời Ngài.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Huấn lệnh Ngài con yêu con quý,
  hơn cả bạc vàng muôn muôn triệu.
  Huấn lệnh Ngài con luôn thẳng bước.
  Lòng ghét mọi đường lối gian tà.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Xin Chúa dủ tình thương an ủi.
  Theo lời Ngài hứa với bề tôi.
  Xin chạnh lòng thương cho được sống.
  Vì con hằng yêu thích luật Ngài.
}


% Dàn trang
\paper {
  #(set-paper-size "a4")
  top-margin = 20\mm
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
  system-system-spacing = #'((basic-distance . 12.5))
  score-system-spacing = #'((basic-distance . 12.5))
}

% Thiết lập tông và nhịp
TongNhip = { \key f \major \time 2/2 }

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
        \key f \major \time 2/2 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
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
        \key f \major \time 2/2 \nhacPhienKhucHai
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
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
        \key f \major \time 2/2 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3.0
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  } 
}
