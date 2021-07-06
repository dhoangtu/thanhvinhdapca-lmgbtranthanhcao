% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Hãy Nghiệm Xem" }
  poet = "Tv. 33"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c'' {
  r4 d8 a |
  b4 a8 b |
  d,4 e |
  a2 _( |
  a8) r d, fs |
  e r g b |
  a g e d |
  d2 _( |
  d4) r \bar "|."
}

nhacDiepKhucBas = \relative c'' {
  \skip 4. cs8 |
  d4 cs8 d |
  g,4 a |
  cs2 ^( |
  cs8) r g b 
  a r b d |
  cs b a g |
  fs2 ^( |
  fs4) r
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c'' {
  a8 a fs d' b d e4 \breathe
  d8 cs b a4 e8 g fs fs4 \breathe
  a8 a gs a b cs e,4 \breathe
  a8 a gs gs!4 a8 b cs e, a a4 (a) \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  a8 fs d' d cs d e4 \breathe
  d8 b d e cs d a4 \breathe
  g8 a fs d4 d8 d fs b,4 \breathe
  d8 fs e4 gs8 e cs' b a4 (a) \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  a8 fs a d4 d8 cs d d e a,4 \breathe
  g8 a g e fs d fs e4 \breathe
  a8 fs fs g a4 b8 cs d b a4 \breathe
  b8 a b g g4 \breathe
  a8 e' d d4 (d) \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Hãy nghiệm xem Chúa tốt lành biết mấy.
  Hạnh phúc thay, hạnh phúc thay kẻ nương tựa Người.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Tôi chúc tụng Chúa Trời luôn mãi,
  Câu hát mừng Người chẳng ngớt trên môi.
  Chúa đã làm cho tôi hãnh diện.
  Xin các bạn nghèo nghe tôi nói mà vui lên.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Hãy cùng tôi tán dương Thiên Chúa.
  Ta đồng thanh chúc tụng danh Người.
  Tôi đã kêu cầu và Người đáp lại.
  Giải thoát tôi khỏi sợ hãi âu lo.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Ai nhìn lên Chúa sẽ được vui tươi hớn hở,
  và không bao giờ bẽ mặt hổ ngươi.
  Kẻ nghèo này kêu lên, và Chúa đã nhận lời,
  cứu khỏi bước ngặt nghèo, khỏi bước gian nguy.
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
      "Liberation Serif"
      "Liberation Serif"
      "Liberation Serif"
      (/ 20 20)))
  page-count = #1
  system-system-spacing = #'((basic-distance . 12))
  score-system-spacing = #'((basic-distance . 12))
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
        \notBePhu -3 { \nhacDiepKhucBas }
        \nhacDiepKhucSop
      \new NullVoice = nhacThamChieu \nhacDiepKhucSop
      \new Lyrics \lyricsto nhacThamChieu \loiDiepKhuc
      >>
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2
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
        \key d \major \time 2/4 \nhacPhienKhucMot
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
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
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
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
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #4
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \set Score.barAlways = ##t
    \set Score.defaultBarType = ""
  } 
}
