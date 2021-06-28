% Cài đặt chung
\version "2.22.1"
\include "english.ly"

\header {
  title = \markup { \fontsize #3 "Chúa Gọi Con" }
  composer = "Nhạc và Lời: Lm. GB Trần Thanh Cao"
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
  page-count = #2
  print-page-number = #f
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c'' {
  r2 |
  r8 a a f16 _(c) |
  d4 f8 f |
  f4 g8 (a) |
  a4 r8 a |
  a (c) d (c) |
  a f d4 ^( |
  d8) g g g |
  a2 ( |
  a8) d d bf |
  c4 a8 a |
  a4 c |
  a f8 g |
  f e c d |
  a c f e |
  d4 \tuplet 3/2 { c8 f e } |
  d2 ^( |
  d8) \bar "|."
}

nhacDiepKhucAlto = \relative c'' {
  r2 |
  r8 a a f16 _(c) |
  d4 d8 d |
  d4 e8 (d) 
  c4 r8 f |
  f (a) g (e) |
  f d a4 ^( |
  a8) e' e d |
  c4. d8 |
  e2 ( |
  e4) f8 d |
  c4 c |
  a d8 e |
  d c bf d |
  a a c bf |
  a4 \tuplet 3/2 { g8 c bf } |
  a2 ^( |
  a8)
}

nhacDiepKhucBas = \relative c' {
  d8 d c (a) |
  c4. a16 (g) |
  f4 a8 a |
  bf4 g8 e |
  f (a c) d |
  c4 bf8 (a) |
  d,4. f16 f |
  e4. e8 |
  a, a' a g16 (f) |
  g4. g8 |
  a (g f) e |
  f4 e |
  d g8 bf |
  a4 g |
  f8 bf a g |
  f4 \tuplet 3/2 { e8 a g } |
  f2 _( |
  f8)
}

% Nhạc phiên khúc
nhacPhienKhucSop = \relative c' {
  \partial 4. d8 f g |
  a a a a |
  bf4. a8 |
  g d f4 |
  d8 \breathe d f g |
  a a bf a |
  a g d f |
  e2 ^( |
  e8) d f g |
  a a a4 ( |
  a8) bf a bf |
  c a4. ( |
  a8) <a \tweak font-size #-2 d>8 d e |
  f4. e8 |
  cs4 \tuplet 3/2 { d8 (e) d } |
  d2 ( |
  d8) r r4 \bar "||"
}

nhacPhienKhucBas = \relative c {
  \partial 4. r8 r4 |
  r8 f8 f e |
  d4. f8 |
  g bf a (g) |
  f4. r8 |
  r a d e |
  f4. d8 |
  a bf a d |
  cs r r4 |
  r2 |
  r2 |
  r2 |
  r8 a bf bf |
  a4. g8 |
  a (g) \tuplet 3/2 { f (g) f } |
  f2 ( |
  f8) r r4
}

% Lời điệp khúc
loiDiepKhucSop = \lyricmode {
  Chúa đã gọi con vâng nghe theo tiếng Chúa
  Từ bỏ lưới thuyền cha mẹ
  Con theo chân Chúa.
  Chúa đã gọi con
  Con nghe theo tiếng Người
  Con vững tâm theo đường lối Người
  chẳng chút lo gì
  chẳng chút lo gì.
}

loiDiepKhucAlto = \lyricmode {
  Chúa đã gọi con vâng nghe theo tiếng Chúa
  Từ bỏ lưới thuyền cha mẹ
  Con theo chân Người theo chân
  Con nghe theo tiếng Người
  Con vững tâm theo đường lối Người
  chẳng chút lo gì
  chẳng chút lo gì.
}

loiDiepKhucBas = \lyricmode {
  Chúa đã gọi con ơi con
  vâng nghe theo tiếng của Chúa
  Đã bỏ lưới thuyền cha với mẹ
  theo Người con đi theo chân theo Chúa
  và theo tiếng Người
  con vững tâm trong đường lối Người lo gì
  chẳng chút lo gì.
}

% Lời phiên khúc
loiPhienKhucMotSop = \lyricmode {
  \set stanza = #"1."
  Đời bao giống tố con luôn kiên vững dưới đôi bàn tay Người.
  Lòng con dâng lên Thiên Chúa khoan nhân
  bao tình mến yêu.
  Gà con nấp bóng dưới cánh
  không còn lo lắng gì.
  Vì luôn có Chúa trên từng bước con đi.
}

loiPhienKhucMotBas = \lyricmode {
  \set stanza = #"1."
  Con luôn kiên vững nhờ đôi cánh tay Người.
  Lòng con dâng lên bao tình mến yêu chân thành.
  Vì luôn có Chúa trên mỗi bước con đi.
}

loiPhienKhucHaiSop = \lyricmode {
  \override Lyrics.LyricText.font-shape = #'italic
  \set stanza = #"2."
  Đồng cỏ non xanh tươi ngon với suối mát trong tràn nước nguồn.
  Đoàn chiên no nê vui sống ấm êm cuộc đời thảnh thơi.
  Người là Mục tử thương yêu sẵn sàng đổ máu mình
  Dìu ta tới bến Thiên đàng phúc vinh quang.
}

loiPhienKhucHaiBas = \lyricmode {
  \override Lyrics.LyricText.font-shape = #'italic
  \set stanza = #"2."
  Tươi ngon suối ngọt tràn tuôn dưới nước nguồn.
  Đoàn chiên no nê ấm êm cuộc đời thảnh thơi.
  Dìu ta tới bến vui hưởng phúc vinh quang.
}

loiPhienKhucBaSop = \lyricmode {
  \set stanza = #"3."
  Cảm tạ Thiên Chúa đã đoái thương đến tôi tớ hèn mọn này.
  Và đã cất nhắc lên Núi Thánh chứa chan Hồng ân Người.
  Nguyện cho danh Cha vinh sáng Chúa Con và Thánh Thần
  (Ba) Ngôi Thiên Chúa hiển trị khắp muôn dân.
}

loiPhienKhucBaBas = \lyricmode {
  \set stanza = #"3."
  Đã đoái thương con là tôi tớ mọn này.
  Và đã cất nhắc lên Đền Thánh Hồng ân Người.
  Ba Ngôi Thiên Chúa vinh hiển khắp muôn dân.
}

% Dàn trang
\score {
  \new ChoirStaff <<
    \new Staff \with {
        %\magnifyStaff #(magstep +1)
      }
      <<
        \clef "treble"
        \new Voice = beSop {
          \key f \major \time 2/4 \nhacDiepKhucSop
        }
        \new Lyrics \lyricsto beSop \loiDiepKhucSop
    >>
    \new Staff \with {
        %\magnifyStaff #(magstep +1)
      }
      <<
        \new Voice = beAlto {
          \key f \major \time 2/4 \nhacDiepKhucAlto
        }
        \new Lyrics \lyricsto beAlto \loiDiepKhucAlto
    >>
    \new Staff \with {
        %\magnifyStaff #(magstep +1)
      }
      <<
        \clef "bass"
        \new Voice = beBas {
          \key f \major \time 2/4 \nhacDiepKhucBas
        }
        \new Lyrics \lyricsto beBas \loiDiepKhucBas
    >>
  >>
  \layout {
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #0.6
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \override Score.NonMusicalPaperColumn.page-break-permission = ##f
  }
}

\score {
  \new ChoirStaff <<
    \new Staff \with {
        \consists "Merge_rests_engraver"
        %\magnifyStaff #(magstep +1)
      }
      <<
        \clef "treble"
        \new Voice = beSop {
          \key f \major \time 2/4 \nhacPhienKhucSop
        }
        \new Lyrics \lyricsto beSop \loiPhienKhucMotSop
        \new Lyrics \lyricsto beSop \loiPhienKhucHaiSop
        \new Lyrics \lyricsto beSop \loiPhienKhucBaSop
    >>
    \new Staff \with {
        \consists "Merge_rests_engraver"
        %\magnifyStaff #(magstep +1)
      }
      <<
        \clef "bass"
        \new Voice = beBas {
          \key f \major \time 2/4 \nhacPhienKhucBas
        }
        \new Lyrics \lyricsto beBas \loiPhienKhucMotBas
        \new Lyrics \lyricsto beBas \loiPhienKhucHaiBas
        \new Lyrics \lyricsto beBas \loiPhienKhucBaBas
    >>
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricText.font-size = #+2
    \override Lyrics.LyricSpace.minimum-distance = #0.6
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \override Score.NonMusicalPaperColumn.page-break-permission = ##f
  }
}
