﻿; Project Euler Problem #12

; Problem #12 text:
; The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6
; + 7 = 28. The first ten terms would be:
; 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
; Let us list the factors of the first seven triangle numbers:
;  1: 1
;  3: 1, 3
;  6: 1, 2, 3, 6
; 10: 1, 2, 5, 10
; 15: 1, 3, 5, 15
; 21: 1, 3, 7, 21
; 28: 1, 2, 4, 7, 14, 28
; We can see that 28 is the first triangle number to have over five divisors.
; What is the value of the first triangle number to have over five hundred divisors?

; code
#SingleInstance

; warning: takes a while (~100s)

NUM := 500
triangleNumIndex := 1
triangleNum := 1
numFactors := 1

GetTriangleNum(Index){
	sum := 0
	currentNum := 1
	while (currentNum <= Index)
	{
		sum := sum + currentNum
		currentNum := currentNum + 1
	}
	return sum
}

while (numFactors < NUM)
{
	triangleNumIndex := triangleNumIndex + 1
	triangleNum := GetTriangleNum(triangleNumIndex)
	numFactors := 1
	counter := 2
	sqrtNum := Sqrt(triangleNum)
	while (counter <= sqrtNum)
	{
		if (Mod(triangleNum, counter) == 0) {
			numFactors := numFactors + 1
		}
		counter := counter + 1
	}
	numFactors := numFactors * 2
	if (sqrtNum == Floor(Sqrt(triangleNum))) {
		numFactors := numFactors - 1
	}
}

answer := triangleNum

msgbox, %answer%
Clipboard := answer

ExitApp