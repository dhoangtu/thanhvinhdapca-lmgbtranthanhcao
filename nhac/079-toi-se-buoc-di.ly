% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Tôi Sẽ Bước Đi" }
  poet = "Tv. 114"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c'' {
  \partial 2 a4. fs8 |
  b a4 g8 e4 fs |
  d2 cs4. d8 |
  e4 b d fs |
  a2 b4. g8 |
  d' cs4 b8 a4 b |
  cs2 cs4. b8 |
  e4 b8 cs e4 b8 _(a) |
  d1 \bar "|."
}

nhacDiepKhucBas = \relative c' {
  \partial 2 fs4. d8 |
  g8 fs4 e8 cs4 d |
  a2 a4. b8 |
  cs4 g b d |
  e2 g4. e8 |
  b' a4 g8 fs4 g |
  a2 a4. g8 |
  cs4 g8 a cs4 g8 ^(e) |
  fs1
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \partial 4 \tuplet 3/2 { d8 f g } |
  a4 bf8 g |
  a2 |
  r4 \tuplet 3/2 { a8 d e } |
  cs4 \tuplet 3/2 { d8 bf a } |
  g2 |
  r4 \tuplet 3/2 { g8 g bf } |
  a4 \tuplet 3/2 { f8 g e } |
  d2 ( 
  d4) r \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  bf4 g8 d' |
  d bf g d' |
  a2 |
  r4 a8 a |
  g e e g |
  f2 
  r4 g8 g |
  d' d c d |
  bf4 a8 a |
  e4 \tuplet 3/2 { g8 c, e } |
  d2 ( |
  d4) r \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \partial 4 bf8 bf |
  bf g bf g |
  d'2 |
  r4 bf8 bf |
  g bf g a |
  f2 |
  r4 f8 d |
  g bf bf g |
  a2 |
  r4 a8 g16 (a) |
  bf8 a a f |
  f2 |
  r4 f8 e |
  f d f g |
  a2 ( |
  a4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Tôi sẽ bước đi trước nhan Chúa Trời,
  trong cõi đất dành cho kẻ sống.
  Tôi sẽ bước đi trước nhan Thánh Chúa,
  trong miền đất dành cho kẻ lòng ngay.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Lòng tôi yêu mến Chúa Trời tôi.
  Vì Chúa đã nghe tiếng tôi khẩn nài.
  Người lại lắng tai, ngày tôi kêu cầu.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Chúa là Đấng rất nhân từ, chính trực.
  Chúa chúng ta một dạ xót thương.
  Hằng gìn giữ những ai bé mọn.
  Tôi yếu hèn, Chúa đã cứu tôi.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Chúa cứu gỡ mạng tôi khỏi chết.
  Giữ mắt này chẳng con đẫm lệ.
  Ngăn ngừa tôi khỏi phải bụi chân.
  Tôi sẽ bước đi trước mặt Người,
  trong cõi đất dành cho kẻ sống.
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
TongNhip = { \key d \major \time 2/2 }

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
    \override Lyrics.LyricSpace.minimum-distance = #2.0
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
    %\override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #1.4
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \override Score.SpacingSpanner packed-spacing = ##t
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
    %\override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3.6
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
        \key f \major \time 2/4 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    %\override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #1.7
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}
