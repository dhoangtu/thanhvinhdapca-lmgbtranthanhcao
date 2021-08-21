% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Ca Tụng Chúa" }
  poet = "Tv. 145"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c'' {
  <>^\markup { \halign #35 " " }
  \partial 4. c8 b d |
  c4 \breathe c,8 d |
  e4. g8 |
  a4 g |
  c2 ~ |
  c4 r \bar "|."
}

nhacDiepKhucBas = \relative c' {
  \partial 4. f8 d f |
  g4 a,8 g |
  c4. e8 |
  f4 d |
  e2 ~ |
  e4 r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  c8 c e, f |
  g4 f8 d |
  c2 |
  c8 f f f |
  d4 b8 g' |
  g2 |
  r4 a8 a |
  f r b b |
  g b c d |
  c2 \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  c8 b c a |
  g4 f8 d |
  c2 |
  r8 g' g a |
  f4 e8 d |
  d4. d8 |
  b g f'4 |
  d8 fs a d, |
  g2 |
  a8 a b4 |
  g8 b d e |
  c2 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \partial 4 g8 c, |
  c2 |
  a'8 g e f |
  g2 |
  r4 c,8 d |
  e2 |
  f8 f d e |
  c2 |
  r4 g'8 af |
  af af f c' |
  g2 |
  c8 d d d |
  a4 d8 d |
  b2 |
  c8 e d8. c16 |
  c2 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Ca tụng Chúa đi, hồn tôi hỡi.
  Hãy ca tụng Chúa.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Chúa giữ lòng trung tín mãi muôn đời.
  Xử công minh cho người bị áp bức.
  Ban lương thực, ban lương thực cho kẻ đói nghèo.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Chúa giải phóng những ai bị tù tội.
  Chúa mở mắt cho kẻ mù lòa.
  Kẻ bị dìm xuống, Người cho đứng thẳng lên.
  Ai công chính được Người yêu mến chuộng.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Chúa phù trì, kẻ lưu lạc tha phương.
  Người nâng đỡ cô nhi và quả phụ.
  Nhưng phá vỡ mưu đồ ác nhân.
  Chúa vẫn giữ vương quyền muôn muôn thuở.
  Người hiển trị ngàn đời.
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
      "Deja Vu Serif Condensed"
      "Deja Vu Serif Condensed"
      "Deja Vu Serif Condensed"
      (/ 20 20)))
  page-count = #1
  system-system-spacing = #'((basic-distance . 12.5)
                             (minimum-distance . 12.5)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 12.5)
                             (minimum-distance . 12.5)
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
    ragged-last = ##f
    \override Lyrics.LyricText.font-series = #'bold
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}

%\markup { \vspace #0.1 }

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key c \major \time 2/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.2
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
        \key c \major \time 2/4 \nhacPhienKhucHai
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.2
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
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
        \key c \major \time 2/4 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.2
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #1.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}
