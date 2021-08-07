% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Sao Nỡ Bỏ Con" }
  poet = "Tv. 21"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucSop= \relative c'' {
  \partial 4 a4 |
  d2 c4 |
  a2 a4 |
  g bf g |
  a2 g4 |
  d c g' |
  f2. \bar "|."
}

nhacDiepKhucBas = \relative c' {
  \partial 4 f4 |
  bf2 a4 |
  f2 f4 |
  e g e |
  f2 e4 |
  bf a bf |
  c2.
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \partial 4 f8 e |
  d4 \tuplet 3/2 { bf'8 bf g } |
  a4 \breathe g8 f |
  e4 \tuplet 3/2 { d'8 d c } |
  c2 |
  r4 f,8 e |
  d4 \tuplet 3/2 { bf'8 bf g } |
  a4 r8 bf16 g |
  cs2 |
  a8 a e' e |
  d2 \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \partial 4 f8 e |
  d4 \tuplet 3/2 { bf'8 bf g } |
  a4 \breathe g8 f |
  e4 \tuplet 3/2 { c'8 d c } |
  c2 |
  r4 f,8 e |
  d4 \tuplet 3/2 { a'8 bf g } |
  a4 r8 g16 f |
  e2 |
  bf'8 g d' \afterGrace c _({
    \autoBeamOff
    \override Flag.stroke-style = #"grace"
    d16 c)} |
  \autoBeamOn
  \revert Flag.stroke-style
  f,2 ( |
  f4) r \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \partial 4 f8 e |
  d4 \tuplet 3/2 { a'8 bf g } |
  a4 \breathe g8 f |
  e4 \tuplet 3/2 { c'8 d c } |
  c2 |
  r4 f,8 e |
  d4 \tuplet 3/2 { bf'8 bf g } |
  a4 r8 g16 f |
  e2 |
  bf'8 g d' c |
  f,2 ( |
  f4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Lạy Chúa con thờ, sao Ngài nỡ bỏ con.
  Sao Ngài ruồng rẫy con.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Thân sâu bọ, chứ phải người đâu.
  Con bị đời mắng mỏ khinh khi.
  Thấy con là chúng đã cười chê:
  ''Nó cậy Chúa, mặc Người cứu nó đi!''
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Vây trong ngoài, lũ ác cuồng si,
  chân tay này đâm thủng thâu qua.
  Đưa mắt nhìn soi mói mỉa mai.
  Xương cốt này đếm từng đốt ngắn dài.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Thánh Danh Ngài, con sẽ truyền loan,
  cho mọi người nhận biết công khai.
  Ca tụng Ngài, hỡi các bạn ơi.
  Hãy một niềm tôn thờ chúc vinh Ngài.
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
      \new Voice \key f \major \time 3/4 \partCombine 
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
    \override Lyrics.LyricSpace.minimum-distance = #7
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
            nonstaff-relatedstaff-spacing.padding = #1.2
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    %\override Staff.TimeSignature.transparent = ##t
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
        \key f \major \time 2/4 \nhacPhienKhucHai
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.3
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    %\override Staff.TimeSignature.transparent = ##t
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
        \key f \major \time 2/4 \nhacPhienKhucBa
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
    %\override Staff.TimeSignature.transparent = ##t
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}
