\version "2.23.80"

\include "oll-core/package.ily"
\loadModule oll-misc.rests.auto-merge

\score
{
  \new Staff
  <<
    \new Voice \relative c'
    {
      \voiceOne
      e4 r e r |
      R1 |
      r2 e |
    }
    \new Voice \relative c'
    {
      \voiceTwo
      r4 c r r |
      R1 |
      r2 r4 c |
    }
  >>
}

\score
{
  \new Staff \relative c'
  <<
    {
      \compressEmptyMeasures
      c4 r r2 |
      R1 |
      r2 r4 r8 r16 r32 r |
      R1*3 |
    }
    \\
    {
      c4 r r r |
      R1 |
      r2 r4 r8 r16 r32 r |
      R1*3 |
    }
  >>
  \layout {
    \context { \Staff \consists #merge-rests-engraver }
    \context { \Staff \consists #merge-mmrests-engraver }
  }
}
