% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Gieo Vào Trái Đất" }
  poet = "Tv. 64"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c' {
  d8 e d a' |
  a2 |
  g8 bf g d' |
  d2 |
  e8 d d bf |
  a f c e |
  d2 \bar "|."
}

nhacDiepKhucBas = \relative c' {
  bf8 a bf f' |
  f2 |
  d8 g d bf' |
  bf2 |
  a8 g g g |
  e c a c |
  d2
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \tempo "Ad. lib." g8 a a g d a' \acciaccatura g8 a4 \breathe
  g8 c, c e g e d4 \breathe
  a'8 d, d' d c g4 \breathe
  a8 a e e4 bf'8 g g a4 \bar "||"
}

nhacPhienKhucHai = \relative c' {
  d8 a' a g d g \acciaccatura g8 a4 \breathe
  g8 d f e c e d4 \breathe
  a'8 g d' d g, a4 \breathe
  e8 g e a4 e8 c e d4 \bar "||"
}

nhacPhienKhucBa = \relative c' {
  d8 a' g g d g \acciaccatura g8 a4 \breathe
  bf8 bf g bf \acciaccatura g8 d' c c4 \breathe
  a8 e e bf' g a4 \breathe
  g8 d a' a4 d,16 (e) f (e) d8 d4 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Hạt gieo vào đất tốt.
  Hạt gieo vào đất tốt.
  Sẽ sinh hoa kết quả dồi dào gấp trăm.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Thăm trái đất mưa nhuần Chúa rải,
  cho tràn trề của cải sinh ra.
  Suối trời chứa nước chan hòa,
  sẵn để làm mùa chuẩn bị ruộng nương.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Ngài tưới luống san từng tảng đất,
  khiến dầm mưa cho hạt nẩy mầm.
  Bốn mùa Chúa đổ hồng ân.
  Ngài gieo mầu mỡ ngập tràn lối đi.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Vùng hoang địa xanh rì ngọn cỏ.
  Khắp núi đồi hoa nở tươi xinh.
  Chiên bò gặm cỏ đồng xanh.
  Nương vàng sóng lúa lượn quanh dạt dào.
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
        \key f \major \time 2/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
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
    \override Lyrics.LyricSpace.minimum-distance = #3.5
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
    \override Lyrics.LyricSpace.minimum-distance = #3.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}
