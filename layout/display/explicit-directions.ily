\version "2.23.80"

\header {
  snippet-title = "Color grobs with explicit direction"
  snippet-author = "David Nalesnik, Urs Liska"
  snippet-source = "http://lists.gnu.org/archive/html/lilypond-user/2013-09/msg00977.html"
  snippet-description = \markup {
    This snippets catches the directional operators and
    colors the objects whose direction have been set explicitly.
  }
  % add comma-separated tags to make searching more effective:
  tags = "debug, direction, color"
  % is this snippet ready?  See meta/status-values.md
  status = "unfinished"
  %{
    TODO:
    - Currently this only works for Slur/PhrasingSlur
      but it should work for any Grob that the operators
      can be applied to
  %}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%
% here goes the snippet: %
%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define appearance:
#(define debug-direction-up-color
  (if (defined? 'debug-direction-up-color)
   debug-direction-up-color red))
#(define debug-direction-down-color
  (if (defined? 'debug-direction-down-color)
   debug-direction-down-color blue))


#(define (Color_explicit_direction_engraver ctx)
    (make-engraver
     (acknowledgers
      ((slur-interface trans grob source)
       (let* ((event (event-cause grob))
              (dir (ly:event-property event 'direction)))
         (if (not (null? dir))
             (cond ((equal? dir 1)
                    (set! (ly:grob-property grob 'color)
                          debug-direction-up-color))
               ((equal? dir -1)
                    (set! (ly:grob-property grob 'color)
                          debug-direction-down-color)))))))))

\layout {
  \context {
    \Voice
    \consists #Color_explicit_direction_engraver
  }
}
