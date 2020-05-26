; Project Euler Problem #6

; Problem #6 text:
; The sum of the squares of the first ten natural numbers is,
; 1^2 + 2^2 + ... + 10^2 = 385
; The square of the sum of the first ten natural numbers is,
; (1 + 2 + ... + 10)^2 = 55^2 = 3025
; Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
; Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

; code
#SingleInstance

; I just want to use my calculator or WolframAlpha, but I have to do this in AHK
; why did I voluntarily force this upon myself?

answer := 0
sumOfSquares := 0
squareOfSum := 0 ; this just ends up being 5050^2

NUM := 100
counter := 1
while counter <= NUM
{
	squareOfSum := squareOfSum + counter
	sumOfSquares := sumOfSquares + counter * counter
	counter := counter + 1
}
squareOfSum := squareOfSum * squareOfSum

answer := squareOfSum - sumOfSquares

msgbox, %answer%
Clipboard := answer

ExitApp