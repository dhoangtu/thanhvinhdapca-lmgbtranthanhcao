% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \raise #1 \fontsize #3 "Nguồn Ánh Sáng" }
  poet = "Tv. 26"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c'' {
  <>^\markup { \halign #40 " " }
  a8 d, d a' |
  a4 f8 bf |
  bf4 g8 c |
  c4 a8 c |
  bf8 g a4 |
  a8 g g g |
  a4a8 d, |
  d4 c |
  f2 ^~ |
  f4 r \bar "|."
}

nhacDiepKhucBas = \relative c' {
  f8 bf, bf f' |
  f4 d8 g |
  g4 e8 a |
  a4 f8 a |
  g e f4 |
  f8 e e e |
  f4 f8 bf, |
  bf4 g |
  a2 ~ |
  a4 r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \partial 4 a8 d, |
  d a' a4 |
  f8 bf bf g |
  c2 |
  c8 bf g bf |
  c2 |
  r8 bf d bf |
  c4 bf8 f |
  f g a4 |
  a8 d, e e |
  d (g) f (d) |
  c2 \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \partial 4. bf8 c g |
  bf4. bf16 g |
  g8 g4 g8 |
  \acciaccatura g8 c2 |
  r4 c8 bf |
  g g d' b! |
  c2 |
  r4 f,8 g |
  a c f, a |
  d,2 |
  r8 e g e |
  c4. g'8 |
  a4 c, |
  f2 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \partial 4 bf8 bf |
  c bf g bf |
  \acciaccatura g8 bf4 bf16 g d'8 |
  c4. c8 |
  a4 g |
  c,2 |
  d8 c a' g |
  g2 |
  r4 bf8 a |
  bf4. a8 |
  bf4 a |
  c2 |
  r8 bf8 bf c8 |
  d2 |
  bf4 g |
  f2 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Chúa là nguồn ánh sáng, nguồn ánh sáng, nguồn ánh sáng.
  Là Đấng cứu độ tôi.
  Tôi còn sợ gì
  \override LyricText.extra-offset = #'(0 . 0.5)
  ai, tôi còn sợ gì ai.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Chúa là nguồn ánh sáng, là Đấng cứu độ tôi.
  Tôi sợ gì ai nữa.
  Người bảo vệ tôi như thành trì kiên cố.
  Ai làm tôi run rẩy hãi hùng.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Tôi tớ Ngài đây, xin đừng giận mà ruồng bỏ.
  Chính Ngài từng phù giúp chở che.
  Lạy Thiên Chúa Đấng hằng cứu độ,
  xin chớ xa lìa,
  xin chớ bỏ rơi.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Nhưng tôi cứ một niềm tin tưởng,
  sẽ được Chúa ban phúc lộc dồi dào ngay tại cõi dương gian.
  Can đảm lên! Cậy trông vào Chúa.
  Một lòng cương quyết đợi chờ Người.
}


% Dàn trang
\paper {
  #(set-paper-size "a4")
  top-margin = 10\mm
  bottom-margin = 15\mm
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
  system-system-spacing = #'((basic-distance . 12)
                             (minimum-distance . 12)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 12)
                             (minimum-distance . 12)
                             (padding . 1))
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
      \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #0.5
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto nhacThamChieu \loiDiepKhuc
      >>
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    %\override Lyrics.LyricText.font-size = #+2
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
        \key f \major \time 2/4 \nhacPhienKhucMot
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
        \key f \major \time 2/4 \nhacPhienKhucHai
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
        \key f \major \time 2/4 \nhacPhienKhucBa
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
    \override Lyrics.LyricSpace.minimum-distance = #3
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}
