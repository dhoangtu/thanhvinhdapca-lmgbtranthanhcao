% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Vườn Nho Của Chúa" }
  poet = "Tv. 79"
  composer = "Lm. GB Trần Thanh Cao"
  %arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c' {
  c8 g' e (g) |
  a4. e8 |
  d ^(e) a g |
  g2 |
  g8 c
  b (c) |
  d4. f,8 |
  e ^(g) d' c |
  c2 \bar "|."
}

nhacDiepKhucBas = \relative c' {
  c8 d c4 |
  f4. e8 |
  d _(c) f d |
  d2 |
  e8 a g _(a) 
  b4. f8 |
  e _(d) f e |
  e2
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  d8 bf ^([c]) d4 \breathe
  g8 a bf a g d ef f ef d d c4
  \tweak extra-offset #'(0 . 2.5) ^~ c8
  ef c d ef bf bf d c4
  c8 g' a g fs g a b!4 bf8 d c c4 c8 e! d bf4
  g8 g g ([a]) d4 \breathe
  d,8 d g f g a g g4 \bar "||"
}

nhacPhienKhucHai = \relative c' {
  d8 bf ^([c]) d c c4
  g'8. a16 bf8 ([a]) g4
  d8 d ef ef f ef d4 c8 d ef c d4
  \once \override Slur #'extra-offset = #'(0 . 2)
  bf ^(bf)
  g'8 g fs ([g]) g a g a b! b!4 c8 a ([bf])
  \acciaccatura c8 e!4 \breathe \break
  g,8 g g a a d d d,4 f8 ([g]) a4 g \bar "||"
}

nhacPhienKhucBa = \relative c' {
  d8 d d d bf bf bf c c d d4 \breathe
  g8 fs fs g a g g a b!4 (b8)
  d c d c a a bf c \acciaccatura c e!4
  d8 c b! a g ([a]) d4
  d,8 g f f f g a4 g \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Vườn nho của Chúa là nhà Is -- ra -- el.
  Vườn nho của Chúa là nhà Is -- ra -- el.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Ôi lạy Chúa là Thiên Chúa chúng tôi,
  xin cho chúng tôi được phục hồi.
  Xin tỏ Thiên nhan hiền từ Chúa ra,
  hầu cho chúng tôi được ơn cứu sống.
  Lạy Chúa Thiên binh cho tới bao giờ
  Ngài còn giận dữ, bỏ mặc những lời dân Chúa van xin.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Ôi lạy Chúa thiên binh, xin thương trở lại,
  từ trời cao xin đoái thương xem và thăm viếng vườn nho này.
  Xin che chở vườn nho mà tay hữu Chúa đã từng cấy,
  bảo vệ ngành nho mà Chúa đã chọn làm sức mạnh.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Xin ra tay ban trợ người ở bên tay hữu Chúa,
  con người mà Chúa đã chọn làm dũng khí.
  Chúng tôi sẽ không còn rời xa Chúa nữa.
  Chúa cho chúng tôi được sống
  và chúng tôi ca khen Danh Thánh Ngài.
}


% Dàn trang
\paper {
  #(set-paper-size "a4")
  top-margin = 7\mm
  bottom-margin = 7\mm
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
  system-system-spacing = #'((basic-distance . 11)
                             (minimum-distance . 11)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 11)
                             (minimum-distance . 11)
                             (padding . 1))
}

% Thiết lập tông và nhịp
TongNhip = { \key c \major \time 2/4 }

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
    \new Staff <<
      \new Voice = beSop {
        \key bf \major \time 2/4 \nhacPhienKhucMot
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
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}

\score {
  \new ChoirStaff <<
    \new Staff <<
      \new Voice = beSop {
        \key bf \major \time 2/4 \nhacPhienKhucHai
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
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
    \new Staff <<
      \new Voice = beSop {
        \key bf \major \time 2/4 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}

