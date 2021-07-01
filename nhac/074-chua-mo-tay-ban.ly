% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Chúa Mở Tay Ban" }
  poet = "Tv. 144"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c'' {
  \partial 4 c8 _(d) |
  c2 f,8 _(a) |
  c2 bf4 |
  bf2. |
  f4 g a |
  d,2 c4 |
  g2 bf4 |
  c2. ^( |
  c4) r a'8 _(c) |
  a2 f8 _(g) |
  a2 f4 |
  d2. |
  c4 e g |
  bf2 a8 _(g) |
  c,2 g'8 _(a) |
  f2. ^( |
  f4) r2 \bar "|."
}

nhacDiepKhucBas = \relative c'' {
  \partial 4 a8 ^(bf) |
  a2 d,8 ^(f) |
  a2 f4 |
  f2. |
  d4 e f |
  bf,2 a4 |
  g2 g4 |
  a2. _( |
  a4) r f'8 ^(a) |
  f2 d4 |
  f2 d4 |
  bf2. |
  a4 c e |
  g2 e4 |
  a,2 c4 |
  a2. _( |
  a4) r2
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  c2 a4 |
  d,2 bf'4 |
  a2 g4 |
  c2. |
  d2 bf4 |
  f2 g4 |
  c4 c4. g8 |
  a2. |
  bf2 d,4 |
  e2 g4 |
  c,4. g'8 a f |
  e2. |
  c2 f4 |
  a2 g8 e |
  c4 g' e |
  f2. ( |
  f2) r4 \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \partial 4 c4 |
  c'2 a4 |
  d,2 bf'8 bf |
  a2 g4 |
  c2 \breathe bf8 c |
  g2 e'4 |
  e2 d4 |
  c2. ( |
  c4) r bf |
  d,2 d4 |
  bf'2 a4 |
  a2. |
  d,4 e e |
  d2 e4 |
  c2 g'8 (a) |
  f2. ( |
  f4) r2 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  c2 a4 |
  a a e8 (d) |
  d2 f8 (g) |
  a2. |
  d,2 f8 (g) |
  g2 g8 (a) |
  g (f) f4. c8 |
  c2. |
  bf'2 g4 |
  bf2 a4 |
  g g4. f8 |
  a2. |
  f4 g a |
  e2 g8 (a) |
  d,2 c4 |
  f2. ( |
  f4) r2 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Chúa thương rộng mở tay ban,
  đoàn con hết thảy muôn vàn thỏa thuê.
  Chúa thương rộng mở tay Ngài,
  đoàn con hết thảy muôn vàn thỏa thuê.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Chúa một niềm xót thương từ ái,
  đã khoan hồng lại lắm nghĩa giàu ân.
  Chúa từ bi quảng đại với hết mọi người,
  và âu yếm mọi vật Ngài đã dựng nên.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Lạy Chúa, muôn loài ngước mắt trông lên Chúa,
  và chính Ngài đúng bữa cho ăn.
  Khi Ngài rộng mở tay ban,
  là bao sinh vật muôn vàn thỏa thuê.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Chúa yêu thương trong mọi đường lối Chúa.
  Đầy yêu thương trong mọi việc Người làm.
  Chúa gìn giữ những ai kêu cầu Chúa.
  Cầu xin với cả tấm lòng thành tín.
}


% Dàn trang
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

% Thiết lập tông và nhịp
TongNhip = { \key f \major \time 3/4 }

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
        \key f \major \time 3/4 \nhacPhienKhucMot
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
        \key f \major \time 3/4 \nhacPhienKhucHai
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
  }
}

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key f \major \time 3/4 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}