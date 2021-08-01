% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Hãy Reo Mừng" }
  poet = "Is. 12"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c' {
  \partial 8 a'8 |
  f d d f |
  c4 \tuplet 3/2 { c8 f a } |
  g4 r8 bf |
  bf bf g bf |
  g ( \once \stemUp  c4) \breathe f,8 |
  a _(g) g _(f) |
  f2 \bar "|."
}

nhacDiepKhucBas = \relative c' {
  \skip 8
  \skip 2
  \skip 4 \tuplet 3/2 { c8 d f } |
  e4 r8 g |
  g g c, g' |
  c, _(a'4) a,8 |
  c4 bf4 |
  a2
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  f8 f d f |
  bf4 \tuplet 3/2 { bf8 bf f } |
  a2 g8 g e4 |
  d8 e d e |
  c2 ~ |
  c4 \tuplet 3/2 { d8 e c } |
  g'4 g8 bf |
  g a a g |
  bf4 \tuplet 3/2 { d8 d b! } |
  c4 bf8 g |
  f2 ~ |
  f4 r \bar "||"
}

nhacPhienKhucHai = \relative c' {
  f8 d bf'4 |
  bf8 d, f g |
  a2 |
  bf8 g a4 |
  f8 g d e |
  c2 |
  g'8 g e g |
  c4 d8 c |
  bf2 |
  g8 c a g |
  c,4 g' |
  f2 ~ |
  f4 r \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \partial 4 bf'8 g |
  bf \breathe g c a |
  a2 |
  g8 e g e |
  c4 \tuplet 3/2 { c8 f a } |
  g4 r8 bf |
  bf bf g bf |
  g _(c4) \breathe f,8 |
  a (g) g (e) |
  f2 ~ |
  f4 r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Hãy reo mừng và ca ngợi,
  vì ở giữa ngươi có Đấng Thánh thật cao cả,
  của Is -- ra -- el.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1. "
  Đây chính là Thiên Chúa, Đấng Cứu Độ tôi.
  Tôi tin tưởng và không sợ hãi gì.
  Vì sức mạnh tôi và khúc nhạc tôi ca là Chúa:
  Đấng Cứu Độ tôi, chính là Ngài.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2. "
  Trong ngày đó, các bạn lên tiếng nói.
  Hãy tạ ơn và xưng tụng danh Người.
  Huân công Người loan báo giữa muôn dân
  và nhắc nhở Danh Người siêu việt.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3. "
  Hát mừng Chúa, và hãy loan đi cho toàn cõi địa cầu,
  vì ở giữa ngươi có Đấng Thánh thật cao cả,
  của Is -- ra -- el.
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
      "Deja Vu Serif Condensed"
      "Deja Vu Serif Condensed"
      "Deja Vu Serif Condensed"
      (/ 20 20)))
  %page-count = #1
  system-system-spacing = #'((basic-distance . 12)
                             (minimum-distance . 12)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 12)
                             (minimum-distance . 12.5)
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
        \key f \major \time 2/4 \nhacPhienKhucHai
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.5
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
            nonstaff-relatedstaff-spacing.padding = #1.5
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
    \override Score.SpacingSpanner packed-spacing = ##t
  }
}
