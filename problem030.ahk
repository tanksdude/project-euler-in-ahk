; Project Euler Problem #30

; Problem #30 text:
; Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:
; 1634 = 1^4 + 6^4 + 3^4 + 4^4
; 8208 = 8^4 + 2^4 + 0^4 + 8^4
; 9474 = 9^4 + 4^4 + 7^4 + 4^4
; As 1 = 1^4 is not a sum it is not included.
; The sum of these numbers is 1634 + 8208 + 9474 = 19316.
; Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.

; code
#SingleInstance

; takes ~20s

; the largest the sum of the digits to the fifth power of an n-digit number can be is n*9^5
; the largest an n-digit number can be is 10^n-1
; therefore, at some n, the sum of the digits to the fifth power would never be able to reach the largest n-digit number
; this happens at n=7, so check 2 <= n <= 6

currentNum := 10
NUMLength := 6
satisfiedNumbers := []
satisfiedNumbersLength := 0

GetDigitNum(n, digitPos) {
	return Mod(n // 10**(digitPos-1), 10)
}

while (currentNum < 10**NUMLength)
{
	digitSum := 0
	counter := 1
	while (counter <= NUMLength)
	{
		digitSum := digitSum + GetDigitNum(currentNum, counter)**5
		counter := counter + 1
	}
	if (digitSum == currentNum)
	{
		satisfiedNumbers.Push(currentNum)
		satisfiedNumbersLength := satisfiedNumbersLength + 1
	}
	currentNum := currentNum + 1
}

answer := 0
counter := 1
while (counter <= satisfiedNumbersLength)
{
	answer := answer + satisfiedNumbers[counter]
	counter := counter + 1
}

msgbox, %answer%
Clipboard := answer

ExitApp