; Project Euler Problem #18

; Problem #18 text:
; By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is
; 23.
;    3
;   7 4
;  2 4 6
; 8 5 9 3
; That is, 3 + 7 + 4 + 9 = 23.
; Find the maximum total from top to bottom of the triangle below:
; 75
; 95 64
; 17 47 82
; 18 35 87 10
; 20 04 82 47 65
; 19 01 23 75 03 34
; 88 02 77 73 07 63 67
; 99 65 04 28 06 16 70 92
; 41 41 26 56 83 40 80 70 33
; 41 48 72 33 47 32 37 16 94 29
; 53 71 44 65 25 43 91 52 97 51 14
; 70 11 33 28 77 73 17 78 39 68 17 57
; 91 71 52 38 17 14 91 43 58 50 27 29 48
; 63 66 04 68 89 53 67 30 73 16 69 87 40 31
; 04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
; [spacing not preserved]
; NOTE: As there are only 16384 routes, it is possible to solve this problem by trying every route. However, Problem 67, is the same
; challenge with a triangle containing one-hundred rows; it cannot be solved by brute force, and requires a clever method! ;o)

; code
#SingleInstance

; it's still possible to brute force this problem (and even Problem 67), but it would take too long (at least, that's what I assume, especially in AHK)
; solution: find the best path from the bottom-up; instead of deciding which way to go (L/R) from the top, just choose the one that's already been computed to be the best

TRIANGLE := []
TRIANGLE.Push([75])
TRIANGLE.Push([95, 64])
TRIANGLE.Push([17, 47, 82])
TRIANGLE.Push([18, 35, 87, 10])
TRIANGLE.Push([20, 04, 82, 47, 65])
TRIANGLE.Push([19, 01, 23, 75, 03, 34])
TRIANGLE.Push([88, 02, 77, 73, 07, 63, 67])
TRIANGLE.Push([99, 65, 04, 28, 06, 16, 70, 92])
TRIANGLE.Push([41, 41, 26, 56, 83, 40, 80, 70, 33])
TRIANGLE.Push([41, 48, 72, 33, 47, 32, 37, 16, 94, 29])
TRIANGLE.Push([53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14])
TRIANGLE.Push([70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57])
TRIANGLE.Push([91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48])
TRIANGLE.Push([63, 66, 04, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31])
TRIANGLE.Push([04, 62, 98, 27, 23, 09, 70, 98, 73, 93, 38, 53, 60, 04, 23])
TRIANGLE_depth := 15

pathTotals := []
counter := 1
while (counter <= TRIANGLE_depth)
{
	pathTotals.Push(TRIANGLE[TRIANGLE_depth][counter])
	counter := counter + 1
}

counter := TRIANGLE_depth - 1
while (counter > 0)
{
	index := 1
	while (index <= counter)
	{
		greater := Max(pathTotals[index], pathTotals[index+1])
		pathTotals[index] := TRIANGLE[counter][index] + greater
		index := index + 1
	}
	counter := counter - 1
}

answer := pathTotals[1]

msgbox, %answer%
Clipboard := answer

ExitApp