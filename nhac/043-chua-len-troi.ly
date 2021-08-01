% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Chúa Lên Trời" }
  poet = "Tv. 46"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c'' {
  \partial 4 g8 e |
  c4. g'8 |
  a e g4 ~ |
  g8 e c d |
  e2 |
  r4 f8 e |
  d4. d8 |
  a' a g4 ~ |
  g8 e a g |
  c4 \tuplet 3/2 { c8 c a } |
  c2 ~ |
  c4 r \bar "|."
}

nhacDiepKhucBas = \relative c' {
  \override NoteHead.font-size = #-2
  \skip 4
  \skip 4. e8 |
  f c e4 ~ |
  e8 c a g |
  c2 |
  r4 d8 c |
  b4. b8 |
  f' f d4 ~ |
  d8 c f e |
  a4 \tuplet 3/2 { g8 g f } |
  e2 ~ |
  e4 r
}

nhacDiepKhucKhac = \relative c'' {
  \partial 4 g4 |
  c4. e,8 |
  g8. g16 f8 e |
  d2 |
  r8 e c e |
  g4. a8 |
  b4 g |
  c2 ~ |
  c4 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  \partial 4. c8 b a |
  g4 \breathe d8 d |
  e2 |
  c8. d16 e4 
  d8 fs a d, |
  g2 |
  r4 e8 g |
  a a g a |
  b4. d,8 |
  g a g f |
  d4 d |
  c2 \tweak extra-offset #'(0 . 3) ^~ |
  c4 r \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \partial 4 e8 c |
  d4 \breathe c8. e16 |
  e8 d g4 |
  a8 r \tuplet 3/2 { f8 a a } |
  f4 \breathe f8 a |
  c d c a |
  g2 ~ |
  g4 r \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \partial 4 c8 g |
  e a g e |
  \acciaccatura e8 (c'2) |
  c8 e, f g |
  e4. d8 |
  c2 |
  c4 d8 c |
  a4 d |
  d4. c8 |
  \acciaccatura a8 c2 ~ |
  c4 r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \set stanza = #"ĐK 1."
  Chúa lên trời giữa tiếng hò reo, vang trời dậy đất.
  Chúa lên trời kèn sáo trổi cao, mừng Chúa hiển vinh
  "Hal -" "lê -" "lu -" ia.
}

loiDiepKhucKhac = \lyricmode {
  \set stanza = #"ĐK 2."
  Thiên Chúa ngự lên giữa tiếng tưng bừng.
  Chúa ngự lên giữa bao tiếng kèn vang.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Vỗ tay đi nào, muôn dân hỡi.
  Mừng Thiên Chúa nào cất tiếng hò reo.
  Vì Thiên Chúa tối cao khả úy,
  là Vua Chí Tôn thống trị địa cầu.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Hãy đàn ca, đàn ca lên mừng Thiên Chúa.
  Đàn ca lên nào, đàn ca nữa kính Vua chúng ta.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Hãy dâng Người khúc ca tuyệt mỹ.
  Chúa là Vua thống trị muôn dân.
  Ngự trên ngai tòa uy linh cao cả.
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
  system-system-spacing = #'((basic-distance . 12)
                             (minimum-distance . 12)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 12)
                             (minimum-distance . 12)
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
    \override Lyrics.LyricText.font-series = #'bold
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2
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
      \new Voice = beSopKhac {
        \key c \major \time 2/4 \nhacDiepKhucKhac
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.2
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSopKhac \loiDiepKhucKhac
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
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
        \key c \major \time 2/4 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.5
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}
