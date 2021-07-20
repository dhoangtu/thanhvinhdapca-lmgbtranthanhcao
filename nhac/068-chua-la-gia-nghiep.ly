% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Chúa Là Gia Nghiệp" }
  poet = "Tv. 15"
  composer = "Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c' {
  \partial 4 d4 |
  a'2 g8 a e fs |
  e4
  e8 e a a cs, d
  d1 \bar "|."
}

nhacDiepKhucBas = \relative c' {
  \skip 4
  \skip 1
  \skip 4
  cs8 a e'4. cs8 |
  d1 \bar "|."
}

% Nhạc phiên khúc
nhacPhienKhucMot = \relative c' {
  \partial 4 e8 fs |
  d2 r8 a' d fs, |
  a2. d,8 e |
  a,2 r8 e' e d16 (e) |
  fs2. r8 g |
  g e b'4 a8 a e' d |
  a2 g8 b e, fs |
  e4 e8 e a a cs, d |
  d1 \bar "||"
}

nhacPhienKhucHai = \relative c'' {
  \partial 4. a8 a fs |
  d'4. b8 d4 e |
  a,2 r4 g8 fs |
  e4. e8 e b'4 gs8 |
  a2 r8 a a fs |
  d'4. d8 b4 d |
  a2 r8 a gs a |
  b4. e,8 b' cs4 b8 |
  a1 \bar "||"
}

nhacPhienKhucBa = \relative c'' {
  \partial 4 a4 |
  d a8 fs g4. a8 |
  \acciaccatura {d,8(} fs2) r4 e8 e |
  \autoBeamOff
  a4. b8 b ([cs])
  \tuplet 3/2 { b \([a b]\) } |
  \autoBeamOn
  a2 r4 a8 b |
  a4. g8 fs4 fs |
  e2 r8 e gs b |
  e,4. d8 cs b'4 gs8 |
  a1 \bar "||"
}

% Lời điệp khúc
loiDiepKhucSop = \lyricmode {
  Lạy Chúa, Ngài chính là gia nghiệp, là phần phúc đã dành cho con.
}

loiDiepKhucBas = \lyricmode {
  (là phần phúc đời con.)
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Lạy Chúa Trời, xin giữ gìn con vì bên Ngài con đang ẩn náu.
  Con thưa cùng Chúa: Ngài là Chúa con thờ.
  Ngài chính là gia nghiệp và phần phúc đã dành cho con.
}

loiPhienKhucHai = \lyricmode {
  \set stanza = #"2."
  Con thưa cùng Chúa hằng thương chỉ dạy
  Cả đêm trường lòng dạ nhắn nhủ con.
  Con luôn tưởng nhớ có Ngài trước mặt,
  được Ngài ở bên chẳng nao núng bao giờ.
}

loiPhienKhucBa = \lyricmode {
  \set stanza = #"3."
  Vì thế tâm hồn con hớn hở và lòng con hoan hỉ 
  \set lyricMelismaAlignment = #LEFT
  nhảy mừng.
  Thân xác con nghỉ ngơi an toàn
  vì Chúa chẳng đành, chẳng đành bỏ mặc con.
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
  system-system-spacing = #'((basic-distance . 11.5)
                             (minimum-distance . 11.5)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 11.5)
                             (minimum-distance . 11.5)
                             (padding . 1))
}

% Thiết lập tông và nhịp
TongNhip = {
  \key d \major \time 2/2
  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment = #(ly:make-moment 1/4)
  \set Timing.beatStructure = #'(1 1 1 1)
}

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
            nonstaff-relatedstaff-spacing.padding = #1.5
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto nhacThamChieu \loiDiepKhucSop
      \new NullVoice = nhacThamChieuBas \nhacDiepKhucBas
      \new Lyrics \lyricsto nhacThamChieuBas \loiDiepKhucBas
      >>
  >>
  \layout {
    \override Lyrics.LyricText.font-series = #'bold
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #4.0
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}

%\markup { \vspace #+0.5 }

\score {
  \new ChoirStaff <<
    \new Staff = phienKhuc \with {
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \TongNhip \nhacPhienKhucMot
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #0.5
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucMot
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #1.5
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
        \TongNhip \nhacPhienKhucHai
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
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #1.5
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
        \TongNhip \nhacPhienKhucBa
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
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #3
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    %\override Score.SpacingSpanner packed-spacing = ##t
    %\override Score.SpacingSpanner.strict-grace-spacing = ##t
  }
}
