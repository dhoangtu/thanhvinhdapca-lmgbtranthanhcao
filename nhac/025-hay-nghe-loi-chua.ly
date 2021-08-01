% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Hãy Nghe Lời Chúa" }
  poet = "Tv. 94"
  composer = "Lm. GB Trần Thanh Cao"
  %arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c'' {
  \partial 8 a8 |
  fs fs fs e |
  cs4. e8 |
  cs b4 e8 |
  a,4. b8 |
  b e4 fs16 ^(e) |
  cs4 e8 fs |
  a b4 _(cs8) |
  a2 \bar "|."
}

nhacDiepKhucBas = \relative c'' {
  \partial 8 cs8 |
  a a a gs |
  e4. a8 |
  e d4 a'8 |
  e4. d8 |
  d a'4 a8 |
  e4 gs8 a |
  cs8 d4 ^(e8) |
  cs2
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \partial 4 e8 a |
  a b
  \stemUp
  cs b16 a |
  \stemNeutral
  b4 \breathe b8 b16 (a) |
  fs2 |
  r8 a b16 (a) cs,8 |
  e2 |
  b8 cs16 (e) fs8 e |
  fs4 \tuplet 3/2 { e8 fs (a) } |
  cs,4 e8 b' |
  b4 cs8 b |
  e4 cs8 (b) |
  a2 \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \partial 4 a8 b16 (a) |
  fs4. a8 |
  cs,8 (e) fs fs |
  e2 |
  r4 b8 b |
  e4. fs16 (e) |
  cs8 (e) e fs |
  \acciaccatura b,8 cs2 |
  r4 a'8 b16 (a) |
  fs8 e b' cs |
  b4 \breathe a8 cs |
  b a16 b a8 b |
  fs r fs b |
  gs e16 e b'8 b |
  fs e4 b'8 |
  a2 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  a4 cs8 cs |
  cs4 d8 cs |
  b4 e |
  e \breathe e8 \acciaccatura fs e |
  cs cs b16 (e) cs8 |
  cs r d d |
  b b fs gs |
  gs gs fs gs |
  e2 |
  r4 \tuplet 3/2 { cs'8 b cs } |
  b r \tuplet 3/2 { e cs a } |
  b4 e,8 e |
  cs'4 b |
  a2 \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Ước chi hôm nay các bạn, các bạn nghe tiếng Người
  thì đừng có cứng lòng,
  thì đừng có cứng lòng.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Nào anh em ta hãy reo mừng lên,
  tung hô Người Đấng Cứu Độ ta.
  Vào trước Thánh Nhan, dâng lời cảm tạ.
  Cùng tung hô theo điệu hát cung đàn.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Hãy tiến vào phủ phục trước Thánh Nhan.
  Quỳ lạy Chúa tác thành ta hết thảy
  bới chính Người là Chúa chúng ta,
  còn chúng ta là dân Người lãnh đạo,
  còn chúng ta là đoàn chiên tay Người hằng dẫn đưa.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Vậy hôm nay đây hãy nghe lời Chúa phán:
  Chớ cứng lòng như tổ tiên xưa,
  chớ cứng lòng như tổ tiên xưa trong vùng sa mạc
  đã khiêu khích ta, dẫu công trình ta
  từng nghiệm thấy bao lần.
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
  system-system-spacing = #'((basic-distance . 12)
                             (minimum-distance . 12)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 12)
                             (minimum-distance . 12)
                             (padding . 1))
}

% Thiết lập tông và nhịp
TongNhip = { \key a \major \time 2/4 }

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
        \notBePhu -3 { \nhacDiepKhucBas }
        \nhacDiepKhucSop
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
        \key a \major \time 2/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
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

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key a \major \time 2/4 \nhacPhienKhucHai
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
        \key a \major \time 2/4 \nhacPhienKhucBa
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
    \override Lyrics.LyricSpace.minimum-distance = #1.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  } 
}
