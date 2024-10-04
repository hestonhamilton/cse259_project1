drawSymbol(Symbol, 0).
drawSymbol(Symbol, N) :- N > 0, write(Symbol), N1 is N - 1, drawSymbol(Symbol, N1).


drawHorizontalLine(Symbol, 0) :- nl.
drawHorizontalLine(Symbol, N) :- drawSymbol(Symbol, N).


drawVerticalLinesWithSpace(Symbol, 0, Width).
drawVerticalLinesWithSpace(Symbol, Height, Width) :- 
  Height > 0,
  write(Symbol),
  drawSymbol(' ', Width - 2),
  write(Symbol),
  nl,
  Height1 is Height - 1,
  drawVerticalLinesWithSpace(Symbol, Height1, Width).


/*-------------------------------------------------------------------------------------------------*/
/* draw A */
drawA(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  ColumnNumber >= TextWidth.

/* 
 * Covers the left-most and the right-most columns that only have stars 
 */
drawA(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  (
    (ColumnNumber >= 0, ColumnNumber < FontSize);
    (ColumnNumber >= FontSize * 2, ColumnNumber < TextWidth )
  ),
  drawSymbol('*', FontSize),
  NextColumn is ColumnNumber + FontSize,
  drawA(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).


/* 
 * Covers the middle segment
 * Will have either stars or spaces 
 */
drawA(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  (ColumnNumber >= FontSize, ColumnNumber < FontSize * 2),
  (
    (CurrentLine >= 0, CurrentLine < FontSize);
    (CurrentLine >= FontSize * 2 , CurrentLine < FontSize * 3)
  ),
  drawSymbol('*', FontSize),
  NextColumn is ColumnNumber + FontSize,
  drawA(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).


drawA(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  (ColumnNumber >= FontSize, ColumnNumber < FontSize * 2),
  (
    (CurrentLine >= FontSize, CurrentLine < 2 * FontSize);
    (CurrentLine >= FontSize * 3, CurrentLine < TextHeight)
  ),
  drawSymbol(' ', FontSize),
  NextColumn is ColumnNumber + FontSize,
  drawA(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).
/* draw A */
/*-------------------------------------------------------------------------------------------------*/


/*-------------------------------------------------------------------------------------------------*/
/* WRITE RULES FOR drawS HERE*/
drawS(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  ColumnNumber >= TextWidth.

/* Draw top and bottom horizontal lines of S */
drawS(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  (
    (CurrentLine >= 0, CurrentLine < FontSize);
    (CurrentLine >= TextHeight - FontSize, CurrentLine < TextHeight)
  ),
  drawSymbol('*', FontSize),
  NextColumn is ColumnNumber + FontSize,
  drawS(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).

/* Draw the middle horizontal line of S */
drawS(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  CurrentLine >= FontSize * 2, CurrentLine < FontSize * 3,
  drawSymbol('*', FontSize),
  NextColumn is ColumnNumber + FontSize,
  drawS(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).

/* Draw the vertical left side of S (top part) */
drawS(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  CurrentLine >= FontSize, CurrentLine < FontSize * 2,
  ColumnNumber >= 0, ColumnNumber < TextWidth,
  (
    ColumnNumber < FontSize         
    -> drawSymbol('*', FontSize)
    ;  drawSymbol(' ', FontSize)    
  ),
  NextColumn is ColumnNumber + FontSize,
  drawS(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).

/* Draw the vertical right side of S (bottom part) */
drawS(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  CurrentLine >= FontSize * 3, CurrentLine < FontSize * 4,
  ColumnNumber >= 0, ColumnNumber < TextWidth, 
  (
    ColumnNumber < TextWidth - FontSize   
    -> drawSymbol(' ', FontSize)
    ;  drawSymbol('*', FontSize)          
  ),
  NextColumn is ColumnNumber + FontSize,
  drawS(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).
/*-------------------------------------------------------------------------------------------------*/

/*-------------------------------------------------------------------------------------------------*/
/* WRITE RULES FOR drawU HERE*/
/*-------------------------------------------------------------------------------------------------*/

/* draw U */
drawU(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  ColumnNumber >= TextWidth.

/* 
 * Covers the left-most and the right-most columns that only have stars 
 */
drawU(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  (
    (ColumnNumber >= 0, ColumnNumber < FontSize);
    (ColumnNumber >= FontSize * 2, ColumnNumber < TextWidth )
  ),
  drawSymbol('*', FontSize),
  NextColumn is ColumnNumber + FontSize,
  drawU(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).


/* 
 * Covers the middle segment with spaces
 * Fills bottom with stars 
 */
drawU(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  CurrentLine > TextHeight - FontSize - 1,
  drawSymbol('*', FontSize),
  NextColumn is ColumnNumber + FontSize,
  drawU(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).

drawU(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  (ColumnNumber >= FontSize, ColumnNumber < FontSize * 2),
  drawSymbol(' ', FontSize),
  NextColumn is ColumnNumber + FontSize,
  drawU(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).
/* draw U */

/* draw the text with appropriate spacing*/
draw(LeftRightMargin, SpaceBetweenCharacters, FontSize, CurrentLine, TextWidth, TextHeight) :-
  CurrentLine >= TextHeight.
draw(LeftRightMargin, SpaceBetweenCharacters, FontSize, CurrentLine, TextWidth, TextHeight) :-
  CurrentLine < TextHeight,
  ColumnNumber is 0,
  write('|'), drawSymbol(' ', LeftRightMargin),
  drawA(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber),
  /*---------------------------------------------*/
  /** CALL YOUR RULES HERE **/
  % add spaces here between A and S
  drawSymbol(' ', SpaceBetweenCharacters),
  % call drawS
  drawS(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber),
  % add spaces here between S and U
  drawSymbol(' ', SpaceBetweenCharacters),
  % call drawU
  drawU(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber),
  /*---------------------------------------------*/
  drawSymbol(' ', LeftRightMargin),
  write('|'),
  nl,
  NextLine is CurrentLine + 1,
  draw(LeftRightMargin, SpaceBetweenCharacters, FontSize, NextLine, TextWidth, TextHeight).



/* this will be initiating the variables and will be called from asu() */
drawVerticalLinesWithCharacters(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, FontSize) :-
  CurrentLine is 0,
  TextWidth is FontSize * 3,
  TextHeight is FontSize * 5,
  draw(LeftRightMargin, SpaceBetweenCharacters, FontSize, CurrentLine, TextWidth, TextHeight).



/* this will be used from the console */
asu(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, FontSize) :-
  /* verify that the variables are integers */
  integer(LeftRightMargin), integer(BottomTopMargin), integer(SpaceBetweenCharacters), integer(FontSize),

  /* check that variables are non-negative */
  LeftRightMargin >= 0, BottomTopMargin >= 0, SpaceBetweenCharacters >= 0,

  /* check that FontSize is greater than 0 */
  FontSize > 0,

  /* proceed only after all checks are passed */

  /* calculate the height and width */
  Width is (LeftRightMargin * 2 + SpaceBetweenCharacters * 2 + FontSize * 3 * 3 + 2),
  Height is (BottomTopMargin * 2 + FontSize * 5),

  /* top horizontal line of the box */
  drawHorizontalLine('-', Width),
  nl,

  /* the empty space in the top */
  drawVerticalLinesWithSpace('|', BottomTopMargin, Width),

  /* the actual text */
  drawVerticalLinesWithCharacters(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, FontSize),

  /* the empty space in the bottom */
  drawVerticalLinesWithSpace('|', BottomTopMargin, Width),

  /* bottom horizontal line of the box */
  drawHorizontalLine('-', Width).
