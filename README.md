# cse259_project1 - ASU Prolog Program
First group project for CSE 259.

## Team Members
- **Member 1:** Heston Hamilton
- **Member 2:** Jaafar Abdeen
- **Member 3:** Vaughn Hoffler

## Project Overview

This project involves implementing a Prolog program that prints the letters "ASU" within a bounding box. The program takes several parameters, including left and right margins, bottom and top margins, the space between characters, and font size. The purpose of this assignment is to familiarize students with Prolog through a simple text-generation exercise.

## Requirements

The program should implement the following predicate:

```prolog
?- asu(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, FontSize).
```

### Parameters:
- **LeftRightMargin**: Specifies the number of spaces between the left or right edge and the text.
- **BottomTopMargin**: Specifies the number of spaces between the top or bottom edge and the text.
- **SpaceBetweenCharacters**: Specifies the number of spaces between the characters in "ASU."
- **FontSize**: Specifies the size of the characters. Each letter can be divided into 3 horizontal segments and 5 vertical segments, where each segment contains a number of characters equal to the FontSize.

### Example:
An example of a valid query:

```prolog
?- asu(4, 1, 3, 3).
```

### Expected Output:
The program should print the letters "ASU" inside a bounding box with margins and space between characters defined by the input parameters. The size of the font is determined by the FontSize parameter. If it is not possible to draw the bounding box or letters with the given parameters, the program should print "no."

## Boundary Conditions:
There are four boundary cases that should be handled:
1. If any margin is too small to fit the letters.
2. If the space between characters or font size is too small.
3. If the bounding box size does not permit printing.
4. If an incorrect parameter type is passed.

For boundary cases where the conditions are not met, the program should return "no."

## Usage Instructions

1. Load the `printing_asu.pl` file in your Prolog environment.
2. Execute the `asu` predicate with the required parameters.

Example usage:
```prolog
?- asu(4, 2, 2, 3).
```
