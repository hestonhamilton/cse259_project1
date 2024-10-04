# cse259_project1 - ASU Prolog Program
First group project for CSE 259.

## Team Members
- **Member 1:** Heston Hamilton
- **Member 2:** Jaafar Abdeen
- **Member 3:** Vaughn Hoffler

## Project Overview

This project involves implementing a Prolog program that prints the letters "ASU" within a bounding box. The program takes several parameters, including left and right margins, bottom and top margins, the space between characters, and font size. The purpose of this assignment is to familiarize students with Prolog through a simple text-generation exercise.

## Requirements

This program requires the GNU Prolog compiler.

The program should implement the following predicate:

```prolog
?- asu(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, FontSize).
```

### Parameters:
- **LeftRightMargin**: Specifies the number of spaces between the left or right edge and the text.
- **BottomTopMargin**: Specifies the number of spaces between the top or bottom edge and the text.
- **SpaceBetweenCharacters**: Specifies the number of spaces between the characters in "ASU."
- **FontSize**: Specifies the size of the characters. Each letter can be divided into 3 horizontal segments and 5 vertical segments, where each segment contains a number of characters equal to the FontSize.

### Expected Output:
The program should print the letters "ASU" inside a bounding box with margins and space between characters defined by the input parameters. The size of the font is determined by the FontSize parameter. If it is not possible to draw the bounding box or letters with the given parameters, the program should print "no."

### Example:
An example of a valid query:

```prolog
| ?- asu(4,1,3,3).
-------------------------------------------
|                                         |
|    *********   *********   ***   ***    |
|    *********   *********   ***   ***    |
|    *********   *********   ***   ***    |
|    ***   ***   ***         ***   ***    |
|    ***   ***   ***         ***   ***    |
|    ***   ***   ***         ***   ***    |
|    *********   *********   ***   ***    |
|    *********   *********   ***   ***    |
|    *********   *********   ***   ***    |
|    ***   ***         ***   ***   ***    |
|    ***   ***         ***   ***   ***    |
|    ***   ***         ***   ***   ***    |
|    ***   ***   *********   *********    |
|    ***   ***   *********   *********    |
|    ***   ***   *********   *********    |
|                                         |
-------------------------------------------

true ? 

(2 ms) yes
```

## Boundary Conditions:
There are four boundary cases that should be handled:
1. If LeftRightMargin is too small (< 0).
2. If SpaceBetweenCharacters is too small (< 0).
3. If BottomTopMargin is too small (< 0).
4. If FontSize is too small (<= 0). 
5. If an incorrect parameter type is passed (non-integer/non-positive).

For boundary cases where the conditions are not met, the program should return "no."

## Usage Instructions

1. Load the `printing_asu.pl` file in your Prolog environment.
2. Execute the `asu` predicate with the required parameters.

Example usage:
```prolog
?- asu(4, 2, 2, 3).
```

## Testing Boundary Conditions:

1.
```prolog
| ?- asu(-1,1,1,1).

no
```

2.
```prolog
| ?- asu(1,-1,1,1).

no
```

3.
```prolog
| ?- asu(1,1,-1,1).

no
```

4.
```prolog
| ?- asu(1,1,1,0).

no
| ?- asu(1,1,1,-1).

no
```

5.
```prolog
| ?- asu(a,1,1,1). 

no
```