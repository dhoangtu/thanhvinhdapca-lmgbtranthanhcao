% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Giới Luật Chúa" }
  poet = "Tv. 18"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

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
}

% Nhạc điệp khúc
nhacDiepKhuc = \relative c'' {
  c4 a8 |
  \afterGrace c4 _({d8 c)} f, |
  f4 a8 |
  \acciaccatura f8 a4. |
  g4 d8 |
  g4 g8 |
  a16 (g) f8 d |
  c4. |
  d4 bf8 |
  f'4 bf,8 |
  bf4 d8 |
  \acciaccatura {c8 d} c4. |
  g'4 d8 |
  g4 c8 |
  bf g e |
  f4. ( |
  f4) r8 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \partial 4 f8 a |
  c4 \tuplet 3/2 { c8 e, d } |
  d4 e8 d |
  c4 \tuplet 3/2 { f8 g a } |
  g2 |
  r4 f16 bf d,8 |
  d4 \tuplet 3/2 { f8 f g } |
  a4 e8 f |
  g4 \tuplet 3/2 { a8 a f } |
  f2 \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \partial 4 c8 a |
  c4 \tuplet 3/2 { a8 a c } |
  c4 bf8 g |
  bf4 \tuplet 3/2 { c8 c bf } |
  a2 |
  r4 \tuplet 3/2 { bf8 bf d, } |
  d4 \tuplet 3/2 { e8 d e } |
  c4 e8 d |
  c4 \tuplet 3/2 { a'8 e f } |
  f2 \bar "||"
}

nhacPhienKhucBa = \relative c' {
  \partial 4 \tuplet 3/2 { f8 a c } |
  c2 |
  c8 bf g bf |
  c2 |
  bf8 c g a |
  f2 |
  f4 \tuplet 3/2 { d8 f g } |
  c,2 |
  d8 d d4 |
  f4 a |
  bf8 a bf4 |
  a8 bf c d |
  c2 |
  r4 g8 e |
  c2 |
  d8 f g a |
  f2 ( |
  f4) r \bar "||"
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  Giới luật Chúa hoàn toàn ngay thẳng.
  Gieo hỉ hoan chan chứa cả cõi lòng.
  Giới luật Chúa hoàn toàn ngay thẳng,
  Gieo hỉ hoan chứa chan cõi lòng con.
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Luật pháp Chúa, quả là hoàn thiện
  khiến tâm hồn vui sướng thảnh thơi.
  Lời răn của Người thật là chính đáng
  Làm cho kẻ chất phác nên khôn.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Huấn dụ Chúa mọi bề trong sáng.
  Vững bền luôn, mãi đến muôn đời.
  Phán quyết của Người luôn là chân thật.
  Hết thảy đều chính trực công minh.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Dầu tôi tớ Chúa, vẫn một lòng vâng giữ.
  Và hết dạ tuân phục.
  Nhưng nào ai biết được mọi điều mình sơ sót?
  Con nài xin, nài xin Chúa thứ tha
  lỗi con phạm mà không hay biết gì.
}


% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff = diepKhuc \with {
        \consists "Merge_rests_engraver"
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key f \major \time 3/8 \stemNeutral \nhacDiepKhuc
      }
    >>
    \new Lyrics \lyricsto beSop \loiDiepKhuc
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.2
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
    \new Lyrics \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    %\override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #1.1
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
        \key f \major \time 2/4 \nhacPhienKhucHai
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    %\override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.2
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
        \key f \major \time 2/4 \nhacPhienKhucBa
      }
    >>
    \new Lyrics \lyricsto beSop \loiPhienKhucBa
  >>
  \layout {
    %\override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #1.7
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  } 
}
