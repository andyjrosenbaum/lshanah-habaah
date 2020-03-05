\version "2.18.2"  % necessary for upgrading to future LilyPond versions.

\header {
	title = "L'Shanah Haba'ah B'Yerushalayim Melody1 v1"
	composer = "Jewish Traditional"
	arranger = "arr. Andy Rosenbaum March 2020"
}


\paper {
  top-system-spacing #'basic-distance = #10
  score-system-spacing #'basic-distance = #20
  system-system-spacing #'basic-distance = #20
  last-bottom-spacing #'basic-distance = #10
}

global = {
  \key f \minor
  \time 4/4
}

% ======== %
% Part One %
% ======== %

sopPartOne = \relative c' {
	| c8 c   c  r  c c   c  r  |  % l'shanah haba-ah
	| c8 c   c  r  c c   c  r  |  % l'shanah haba-ah
	| c8 des e( f) g aes g( f) |  % l'shanah haba-ah
	| e8 f   e des c4    c4    |  % b'yerushalayim
}

altoPartOne = \relative c' {
	| g8 g   g  r    g g g  r    |  % l'shanah haba-ah
	| g8 g   g  r    g g g  r    |  % l'shanah haba-ah
	| g8 aes c( des) e des e( des) |  % l'shanah haba-ah
	| c8 des c  aes  g4  g4      |  % b'yerushalayim
}

tenorPartOne = \relative c {
	| e8 e   e  r    e e e  r    |  % l'shanah haba-ah
	| e8 e   e  r    e e e  r    |  % l'shanah haba-ah
	| e8 f   g( aes) c aes c( aes) |  % l'shanah haba-ah
	| g8 aes g  f    e4  e4      |  % b'yerushalayim
}

bassPartOne = \relative c {
	| c8 c   c  r    c c c  r  |  % l'shanah haba-ah
	| c8 c   c  r    c c c  r  |  % l'shanah haba-ah
	| c8 bes g( des') c f e( f) |  % l'shanah haba-ah
	| g8 des g,  bes  c4    c4  |  % b'yerushalayim
}

words = \lyricmode {
	| l' -- sha -- nah ha -- ba' -- ah |
	| l' -- sha -- nah ha -- ba' -- ah |
	| l' -- sha -- nah ha -- ba' -- ah |
	| b' -- ye -- ru -- sha -- la -- yim |
}


allStuff = {
  \new ChoirStaff <<
    \new Lyrics = "sopranos" \with {
      % this is needed for lyrics above a staff
      \override VerticalAxisGroup.staff-affinity = #DOWN
    }
    \new Staff = "upper" <<
	\set Staff.midiInstrument = "voice oohs"
      \new Voice = "sopranos" {
        \voiceOne
        << \global \sopPartOne >>
      }
      \new Voice = "altos" {
        \voiceTwo
        << \global \altoPartOne >>
      }
    >>
    \new Lyrics = "altos"
    \new Lyrics = "tenors" \with {
      % this is needed for lyrics above a staff
      \override VerticalAxisGroup.staff-affinity = #DOWN
    }
    \new Staff = "lower" <<
      \set Staff.midiInstrument = "voice oohs"
      \clef bass
      \new Voice = "tenors" {
        \voiceOne
        << \global \tenorPartOne >>
      }
      \new Voice = "basses" {
        \voiceTwo << \global \bassPartOne >>
      }
    >>
    \new Lyrics = "basses"
    \context Lyrics = "sopranos" \lyricsto "sopranos" \words
    \context Lyrics = "altos" \lyricsto "altos" \words
    \context Lyrics = "tenors" \lyricsto "tenors" \words
    \context Lyrics = "basses" \lyricsto "basses" \words
  >>
}

% For printed pdf music.
\score {
	\allStuff
	\layout{}
}

% For midi
\score {
	\unfoldRepeats {
		\allStuff
	}
	\midi{ \tempo 4 = 100 }
}
