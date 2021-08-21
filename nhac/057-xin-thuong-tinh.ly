% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Xin Thương Tình" }
  poet = "Tv. 40"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c' {
  <>^\markup { \halign #40 " " }
  \partial 4 f8 d |
  c4 f8 _(g) |
  a2 |
  c8 c bf d |
  c2 \breathe |
  c8 f, g bf |
  a4 g |
  f2 ~ |
  f4 r \bar "|."
}

nhacDiepKhucBas = \relative c' {
  \partial 4 d8 bf |
  a4 c |
  f2 |
  a8 a g bf |
  a2 |
  f8 d e g |
  f4 c |
  f2 ~ |
  f4 r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  c8 bf4 g8 |
  bf f d c |
  a'2 ~ |
  a8 d, f d |
  c4. d8 |
  c4 f8 bf |
  a4 \breathe bf8 g |
  g g4 bf8 |
  g4 bf |
  c2 |
  r4 d,8 f |
  f d f d |
  c2 |
  r8 g' g e |
  f d c e |
  f2 ~ 
  f4 r \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \partial 4 g8 bf |
  c c16 bf g8 bf |
  c2 |
  r4 bf8 g |
  g \breathe d f d |
  c4 c8 c |
  c f g bf |
  g2 |
  c8 c bf d |
  c4 f,8 (g) 
  a2 |
  bf8 g bf c |
  a4 g |
  f2 ~ |
  f4 r \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \partial 8 f8 |
  bf2 |
  r8 bf8 bf d, |
  f4 ef8 c |
  bf4. bf8 |
  ef4. c8 |
  c c g' f |
  f4. g8 |
  a2 |
  r8 a g a |
  f8 \breathe bf d c |
  c4 bf8 c |
  g4. a8 |
  bf4 g8 g |
  f2 ~ |
  f4 r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Xin thương tình, lạy Chúa,
  Xin thương tình chữa con.
  Quả thật con đắc tội với Ngài.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Phúc thay kẻ biết thương người nghèo khổ.
  Gặp cảnh khốn cùng sẽ được Chúa cứu nguy.
  Chúa bảo vệ và giữ gìn mạng sống.
  Lại ban cho hạnh phúc trên đời.
  Không trao họ cho địch thù hung hãn.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Người chăm nom khi liệt giường liệt chiếu.
  Lúc bệnh hoạn Người chữa cho lành.
  Vì vậy mà con mới dám thưa:
  ''Xin thương tình chữa con, lạy Chúa.
  Quả thật con đắc tội với Ngài.''
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Giờ đây, Chúa giữ gìn con được vẹn toàn,
  nhận con vào hầu cận trước Tôn Nhan mãi mãi.
  Chúc tụng Chúa Trời,
  Chúa "Is -" "ra -" el.
  Từ muôn thuở cho đến muôn muôn đời.
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
  page-count = #1
  system-system-spacing = #'((basic-distance . 11)
                             (minimum-distance . 11)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 11)
                             (minimum-distance . 11)
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
            nonstaff-relatedstaff-spacing.padding = #1
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucHai
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
    \override Lyrics.LyricSpace.minimum-distance = #2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}	
