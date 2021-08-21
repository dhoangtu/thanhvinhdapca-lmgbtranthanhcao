% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Xin Chúa Giữ Gìn" }
  poet = "Tv. 130"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c' {
  <>^\markup { \halign #45 " " }
  d4 fs a |
  d2 cs8 ^(b) |
  a2 r4 |
  fs4 d e |
  g2 fs8 ^(e) |
  a,2 e'8 ^(fs) |
  d2. \bar "|."
}

nhacDiepKhucBas = \relative c'' {
  \skip 2.
  \skip 2.
  \skip 2 r4
  a4 fs g |
  cs2 a4 |
  e2 g4 |
  fs2.
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  d4 fs a |
  bf2 g4 |
  a2. |
  bf4 a g |
  d'2 cs4 |
  a2 e'4 |
  d2. \bar "||"
}

nhacPhienKhucHai = \relative c' {
  d2 fs4 |
  cs2 e4 |
  b a4. fs'8 |
  fs2. |
  g2 fs4 |
  e2 cs4 |
  b' b4. gs8 |
  a2. |
  d,4 fs a |
  d2 cs8 (b) |
  a2. |
  fs4 d e |
  b2 a4 |
  e'2 e4 |
  d2. \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  bf2 a4 |
  bf4 bf g |
  g2 d4 |
  a'2. |
  c2 f,4 |
  bf2 d,4 |
  g2 ef4 |
  d2. |
  d4 g bf |
  c2 r8 ef |
  d2. |
  b!4 g a |
  c2 b!8 (a) |
  d,2 a'8 (b!) |
  g2. \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Hồn con xin Chúa giữ gìn.
  Sống kề bên
  \override LyricText.extra-offset = #'(0 . 1)
  Chúa an bình thảnh thơi.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Lòng con chẳng dám tự cao,
  mắt con chẳng dám tự hào Chúa ơi.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Đường cao vọng chẳng đời nào bước đến.
  Việc diệu kỳ vượt sức chẳng cầu mong.
  Hồn con, con giữ trước sau,
  an hòa thinh lặng là câu thanh bình.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Bé no sữa nép mình bên lòng mẹ,
  ấy hồn con lặng lẽ an vui.
  Cậy trông vào Chúa, Chúa ơi,
  bây giờ đến mãi muôn đời muôn đời.
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
TongNhip = { \key d \major \time 3/4 }

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
        \notBePhu -3 { \nhacDiepKhucBas }
        \nhacDiepKhucSop
      \new NullVoice = nhacThamChieu \nhacDiepKhucSop
      \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.7
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1.5
        }
        \lyricsto nhacThamChieu \loiDiepKhuc
      >>
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3.5
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
        \key d \major \time 3/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.5
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1.5
        }
        \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    %\override Lyrics.LyricText.font-size = #+2
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
        \key d \major \time 3/4 \nhacPhienKhucHai
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
    \override Lyrics.LyricSpace.minimum-distance = #3.2
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
        \key bf \major \time 3/4 \nhacPhienKhucBa
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
