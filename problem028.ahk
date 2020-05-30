; Project Euler Problem #28

; Problem #28 text:
; Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:
; 21 22 23 24 25
; 20  7  8  9 10
; 19  6  1  2 11
; 18  5  4  3 12
; 17 16 15 14 13
; It can be verified that the sum of the numbers on the diagonals is 101.
; What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?

; code
#SingleInstance

; continuing the spiral, a pattern emerges:
; top right of n×n: n^2
; bottom right of n×n: (n-2)^2 + n-1 = n^2 - 3n + 3
; bottom left of n×n: (n-2)^2 + 2n-2 = n^2 - 2n + 2
; top left of n×n: (n-2)^2 + 3n-3 = n^2 - n + 1

; therefore, sum every corner of every n×n up to the 1001×1001 spiral
; sum of corners = 4n^2 - 6n + 6

NUM := 1001
answer := 1
counter := 3
while (counter <= NUM)
{
	answer := answer + 4*counter**2 - 6*counter + 6
	counter := counter + 2
}

msgbox, %answer%
Clipboard := answer

ExitApp