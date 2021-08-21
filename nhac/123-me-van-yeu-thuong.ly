% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Mẹ Vẫn Yêu Thương" }
  poet = " "
  composer = "Nhạc và lời: Lm. GB Trần Thanh Cao"
  arranger = " "
  tagline = ##f
}

% Nhạc phiên khúc
nhacPhienKhuc = \relative c' {
  \tempo "Boston"
  <>^\markup { \halign #45 " " }
  \repeat volta 2
  {
    \partial 4 cs8 d |
    e2 e8 r |
    gs e gs fs4 fs8 |
    fs r gs a b4 |
    b b4. cs,8 |
    e2. ~ |
    e4 r a8 b |
    cs4. cs4 cs8 |
    b a b b4 a8 |
    fs2 gs8 fs |
    e2 gs8 a |
  }
  \alternative {
    {
      b4 b gs8 e |
      a2.
    }
    {
      b4. b8 gs e |
      a2. \bar "||"
    }
  }
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c'' {
  r2 a8 b |
  cs2 cs8 cs |
  cs2 d8 b |
  cs4. cs4 cs8 |
  cs2 a8 cs |
  b2 fs4 |
  fs2 b8 a |
  a2 a4 |
  e2. ~ |
  e4 r a8 b |
  cs4. d4 cs8 |
  cs4. cs8 a b |
  cs4. d4 cs8 |
  b2 b8 b |
  b2 b4 |
  fs2 a8 a |
  a4. gs8 fs gs |
  \acciaccatura cs,8 e2 a4 
  a2. ~ |
  a2 r4 \bar "|."
}

nhacDiepKhucBas = \relative c'' {
  r2 cs8 d |
  e2 e8 e |
  e2 fs8 d |
  e4. e4 e8 |
  e2 cs8 e |
  d2 b4 |
  b2 d8 cs |
  cs2 cs4 |
  a2. ~ |
  a4 r cs8 d |
  e4. fs4 e8 |
  e4. e8 cs d |
  e4. fs4 e8 |
  d2 d8 d |
  d2 d4 |
  b2 cs8 cs |
  cs4. b8 a b |
  a2 cs4 |
  cs2. ~ |
  cs2 r4
}

hopAmPhienKhucMot = \chords {
  \skip 4
  a2. e d b:m e a cs:m b:m fs:m e
  e2. a
  e2. a2
}

hopAmDiepKhucMot = \chords {
  \skip 2.
  a2. cs:m fs:m cs:m b:m \skip 2. d \skip 2. a
  \skip 2. \skip 2.
  cs:m b:m e ds fs:m e a
}

% Lời phiên khúc
loiPhienKhucMot = \lyricmode {
  \set stanza = #"1."
  Lạy Mẹ yêu thương, đoái nhìn chúng con van xin
  mà đưa tay dẫn dắt phù trì.
  Tình Mẹ tha thiết vẫn như vầng trăng thơ dịu dàng.
  Mọi nẻo đường, Mẹ âu yếm chở che ủi an.
}

loiPhienKhucHai = \lyricmode {
  \override Lyrics.LyricText.font-shape = #'italic
  \set stanza = #"2."
  Chiều hôm nay đây giã từ phút giây bên nhau,
  lòng con thấy thổn thức bồi hồi.
  Tình Mẹ vẫn thương, chở che đời con luôn đêm ngày.
  Phút giây này, con ghi
  \repeat unfold 1 { "" "" "" "" "" }
  nhớ suốt cả đời con.
}

% Lời điệp khúc
loiDiepKhuc = \lyricmode {
  \set stanza = #"ĐK:"
  Mẹ hãy nhớ ban ơn thiêng giúp đời con nơi tha hương.
  Dù cách xa nghìn trùng vẫn yêu thương đong đầy.
  Dù thời gian có phôi pha nhưng tình Mẹ thương vẫn bao la.
  Như mây bay trên ngàn.
  Như thông reo bên dòng suối nhỏ yêu thương.
}

% Dàn trang
\paper {
  #(set-paper-size "a4")
  top-margin = 20\mm
  bottom-margin = 10\mm
  left-margin = 20\mm
  right-margin = 20\mm
  #(define fonts
    (make-pango-font-tree
      "Deja Vu Serif Condensed"
      "Deja Vu Serif Condensed"
      "Deja Vu Serif Condensed"
      (/ 20 20)))
  page-count = #1
  indent = #0
  system-system-spacing = #'((basic-distance . 14)
                             (minimum-distance . 14)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 14)
                             (minimum-distance . 14)
                             (padding . 1))
}

\score {
  \new ChoirStaff <<
    \hopAmPhienKhucMot
    \new Staff = diepKhuc \with {
        \consists "Merge_rests_engraver"
        %\magnifyStaff #(magstep +1)
      }
      <<
      \new Voice = beSop {
        \key a \major \time 3/4 \stemNeutral \nhacPhienKhuc
      }
    >>
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.2
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucMot
    \new Lyrics \with {
          \override VerticalAxisGroup.
            nonstaff-relatedstaff-spacing.padding = #1.2
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto beSop \loiPhienKhucHai
  >>
  \layout {
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}

% Thiết lập tông và nhịp
TongNhip = { \key a \major \time 3/4 }

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
    \hopAmDiepKhucMot
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
            nonstaff-relatedstaff-spacing.padding = #2
          \override VerticalAxisGroup.
            nonstaff-unrelatedstaff-spacing.padding = #1
        }
        \lyricsto nhacThamChieu \loiDiepKhuc
      >>
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-series = #'bold
    %\override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #2.2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}
