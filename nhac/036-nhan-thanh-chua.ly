% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Nhan Thánh Chúa" }
  poet = "Tv. 4"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c' {
  \partial 4 c4 |
  a'2 |
  c8 a a f |
  g2 |
  bf8 e, e c |
  d4 d |
  a'8 a g8. f16 |
  f2 ( |
  f4) r4 \bar "|."
}

nhacDiepKhucBas = \relative c' {
  \skip 4
  f2 |
  a8 f f d |
  e2 |
  c8 c c f, |
  bf4 bf |
  d8 d c8. c16 |
  f2 ( |
  f4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  bf16 (g) c4 bf16 (g) g8 g bf c4 \breathe
  bf8 bf bf16 (g) g8 g a g f4 \breathe
  f8 d c4 \breathe
  f8 g a a g g4 \breathe
  c8 c bf4 (bf8) 
  g a g f4 (f) \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  c16 (bf) bf (g) g8 bf c a a4 g8 f f g g g c, a'4 \breathe
  bf16 (g) c4 g8 c bf bf f g4 a8 g a f f4 (f) \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  bf16 (c) c (bf) g8 a4 \breathe
  g8 g bf bf16 (c)
  \acciaccatura { f,8 [g] } f4 \breathe
  d8 d16 (f) g (f) d (c) c4 f8 (g) a4 bf8 bf bf
  g g16 (a) g8 f4 (f) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Lạy Chúa, chúng con chỉ cầu mong,
  chúng con chỉ cầu mong nhìn thấy Thánh Nhan rạng ngời.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Lạy Chúa, là đèn trời soi xét.
  Khi con kêu cầu nguyện Chúa đáp lời.
  Lúc ngặt nghèo, Chúa mở lối thoát cho con.
  Xin thương nghe lời con khẩn cầu.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Biết bao người than thở kêu ca.
  Trên đời này, ai cho ta hạnh phúc?
  Lạy Chúa, phần chúng con chỉ cầu mong
  thấy Nhan Thánh rạng ngời.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Thư thái bình an, vừa nằm con đã ngủ vì chỉ có mình Ngài.
  Lạy Chúa, ban cho con cuộc sống yên hàn.
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
  system-system-spacing = #'((basic-distance . 12.5))
  score-system-spacing = #'((basic-distance . 12.5))
}

% Thiết lập tông và nhịp
TongNhip = { \key f \major \time 2/4 }

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
        \key f \major \time 2/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
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
    \override Lyrics.LyricSpace.minimum-distance = #5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}
