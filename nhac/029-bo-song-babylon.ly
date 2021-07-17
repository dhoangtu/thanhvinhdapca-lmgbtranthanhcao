% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Bờ Sông Babylon" }
  poet = "Tv. 136"
  composer = "Lm. GB Trần Thanh Cao"
  %arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c' {
  fs8 g a a |
  a4. a16 a |
  fs8 a fs4 |
  b,8 d b' a |
  a2 |
  e8 fs g g |
  g4. g16 g |
  e8 g cs,4 |
  a8 e' fs e |
  d2 ~ |
  d4 r \bar "|."
}

nhacDiepKhucBas = \relative c' {
  d8 e fs fs |
  fs4. fs16 fs |
  d8 fs d4 |
  g,8 b g' fs |
  fs2 |
  cs8 d d d |
  d4. d16 d |
  b8 d a4 |
  fs8 b cs b |
  a2 ~ |
  a4 r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \partial 4 d8 b' |
  a fs a b |
  cs4 cs8 cs |
  e,4 \tuplet 3/2 { cs8 e a } |
  a4. a8 |
  fs8 a d,16 ^(e) fs8 |
  fs2 |
  e16 e e8 \acciaccatura e8 a4 |
  r8. a,16 e'8. d16 |
  d2 \bar "||"
}

nhacPhienKhucHai = \relative c' {
  \partial 4 d8 fs |
  a a e4 |
  e8 g a b |
  fs2 |
  b8 cs
  \autoBeamOff
  d \fermata b |
  \autoBeamOn
  a2 |
  g8 g g g |
  b2 |
  a8 a e' d |
  d4 \tuplet 3/2 { b8 cs d } |
  a4 g8 a |
  e4 fs8 fs |
  e4. e8 |
  a4 a |
  d,2 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  d8 cs b g |
  g4 \breathe g8 e |
  cs'4 b8 a16 a |
  a2 |
  a8 a cs a |
  e'4 \fermata \tuplet 3/2 { e8 d cs } |
  d2 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Bờ sông Ba -- by -- lon,
  ta ra ngồi nức nở mà tưởng nhớ Si -- on.
  Bờ sông "Ba -" "by -" lon,
  ta ra ngồi nức nở mà tưởng nhớ Si -- on.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Bọn lính canh đòi ta hát xướng.
  Lũ cướp này mời gượng vui lên.
  Hát đi hát thử đi xem Si -- on quê cũ
  điệu quen một bài.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Bài ca kính Chúa Trời làm sao ta hát nổi,
  nới đất khách quê người.
  Giê -- ru -- sa -- lem hỡi,
  lòng này nếu quên ngươi
  thì tay gảy đàn thành tê bại,
  lưỡi xướng ca sẽ dính với hàm.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Nếu ta không hoài niệm,
  không cần lấy Giê -- ru -- sa -- lem,
  làm niềm vui tuyệt đỉnh của tâm hồn ta.
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
      "Liberation Serif"
      "Liberation Serif"
      "Liberation Serif"
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
TongNhip = { \key d \major \time 2/4 }

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
            nonstaff-relatedstaff-spacing.padding = #0.2
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #0.5
        }
        \lyricsto nhacThamChieu \loiDiepKhuc
      >>
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2
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
        \key d \major \time 2/4 \nhacPhienKhucMot
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
    \override Lyrics.LyricText.font-size = #+2
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
        \key d \major \time 2/4 \nhacPhienKhucHai
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
    \override Lyrics.LyricText.font-size = #+2
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
        \key d \major \time 2/4 \nhacPhienKhucBa
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
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #4
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
   
  } 
}
