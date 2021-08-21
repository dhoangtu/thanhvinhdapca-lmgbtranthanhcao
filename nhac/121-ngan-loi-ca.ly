% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Ngàn Lời Ca" }
  composer = "Nhạc và Lời: Lm. GB Trần Thanh Cao"
  %arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c'' {
  R2 |
  a8. a16 fs8 e |
  d2 |
  b'8. b16 a8 g |
  fs4 d8 fs |
  a4 fs8 a |
  d2 ~ |
  d4 b |
  e8 d cs b |
  a g fs4 |
  fs8 fs b a |
  a g e cs |
  a4 e'8 cs |
  d2 \bar "|."
}

nhacDiepKhucAlto = \relative c' {
  R2 |
  fs8. fs16 d8 cs |
  b2 |
  g'8. g16 fs8 e |
  d4 d8 d |
  e4 d8 e |
  fs8 
  fs fs g |
  a4 d, |
  g8 fs e d |
  cs cs d4 |
  d8 d g fs |
  e2 \tweak extra-offset #'(0 . -0.3) ~ |
  e4 cs8 a |
  a2
}

nhacDiepKhucBas = \relative c {
  a8. a16 d8 d |
  d2 |
  b8. b16 e8 e |
  e4. a8 |
  d, e fs r |
  cs e a4 ~ |
  a8 d, d e |
  fs4 r |
  R2*2
  d4. d8 |
  a'2 ~ |
  a4 a8 a |
  <fs \tweak font-size #-2 d>2
}

% Nhạc phiên khúc
nhacPhienKhuc = \relative c' {
  \partial 4 d8 fs a a b d b
  a a e g a g fs2
  d8 fs a b d b a a a e g fs e d2 \bar "||"
}

% Lời điệp khúc
loiDiepKhucSop = \lyricmode {
  Hãy hát lên ca mừng
  Hãy hát lên ca mừng,
  mừng Thiên Chúa bài ca "mới (một   bài     ca"
  \once \override LyricText.self-alignment-X = #RIGHT
  "mới)      Ngài" đã tác sinh muôn vật muôn loài
  và quyền phép công minh
  (chiếu soi mọi người) khắp mọi nơi.
}

loiDiepKhucBas = \lyricmode {
  Ngàn lời ca dâng lên,
  Ngàn lời ca dâng lên
  hát mừng Thiên Chúa bài ca mới
  một bài ca mới.
  Và quyền phép khắp mọi nơi.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Lòng con hân hoan bước tới thành cung
  dâng lời với hết tâm hồn.
  Để tung hô danh thánh Chúa uy linh
  luôn bền vững đến muôn đời.
}

loiPhienKhucHai = \lyricmode {
  \override Lyrics.LyricText.font-shape = #'italic
  \set stanza = #"2."
  Tầng trời cao xanh tinh tú bao la
  vang lời kính Chúa uy linh.
  Rừng cây âm u mây nước sông sâu
  dâng lời kính tôn Cha hiền.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Họp nhau nơi đây liên kết một lòng
  dâng lời kính Chúa Ba Ngôi.
  Dù bao gian nguy xin Chúa thương
  ban mưa nhuần thấm ơn tâm hồn.
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
    \new Staff \with {
        \consists "Merge_rests_engraver"
        printPartCombineTexts = ##f
        \override VerticalAxisGroup.staff-staff-spacing = #'((basic-distance . 11))
      }
      <<
        \clef "treble"
        \new Voice \TongNhip \partCombine 
        \nhacDiepKhucSop
        \notBePhu -3 { \nhacDiepKhucAlto }
        \new NullVoice = nhacThamChieu \nhacDiepKhucSop
        \new Lyrics \with {
            \override VerticalAxisGroup.
              nonstaff-relatedstaff-spacing.padding = #0.5
            \override VerticalAxisGroup.
              nonstaff-unrelatedstaff-spacing.padding = #1
          }
        \lyricsto nhacThamChieu \loiDiepKhucSop
    >>
    \new Staff \with {
        \consists "Merge_rests_engraver"
        %\magnifyStaff #(magstep +1)
      }
      <<
        \clef "bass"
        \new Voice = beBas {
          \key d \major \time 2/4 \nhacDiepKhucBas
        }
        \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.2
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beBas \loiDiepKhucBas
    >>
  >>
  \layout {
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #0.5
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
        \key d \major \time 2/4 \nhacPhienKhuc
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.2
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucMot
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
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
    \override Lyrics.LyricSpace.minimum-distance = #2.0
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}
