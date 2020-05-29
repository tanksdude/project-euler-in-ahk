; Project Euler Problem #23

; Problem #23 text:
; A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the
; proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
; A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.
; As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant
; numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two
; abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest
; number that cannot be expressed as the sum of two abundant numbers is less than this limit.
; Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

; code
#SingleInstance

; warning: takes a while (~70s)

GetIsAbundant(in_num) { ; most of the code is from Problem 021
	divisors := [1]
	divisorsLength := 1
	counter := 2
	sqrtNum := Sqrt(in_num)
	while (counter <= sqrtNum) ; get first half of list of divisors
	{
		if (Mod(in_num, counter) == 0)
		{
			divisors.Push(counter)
			divisorsLength := divisorsLength + 1
		}
		counter := counter + 1
	}
	startCount := 2
	endCount := divisorsLength
	if (sqrtNum == Floor(sqrtNum)) {
		endCount := endCount - 1
	}
	while (startCount <= endCount) ; generate second half
	{
		divisors.Push(in_num / divisors[startCount]) ; it's not sorted, but it doesn't matter
		divisorsLength := divisorsLength + 1
		startCount := startCount + 1
	}
	sum := 0
	counter := 1
	while (counter <= divisorsLength) ; get sum
	{
		sum := sum + divisors[counter]
		counter := counter + 1
	}
	return (sum > in_num)
}

loopCount := 2
abundantNumbers := []
abundantNumbersLength := 0
while (loopCount <= 28123-12)
{
	if (GetIsAbundant(loopCount))
	{
		abundantNumbers.Push(loopCount)
		abundantNumbersLength := abundantNumbersLength + 1
	}
	loopCount := loopCount + 1
}

nonAbundantSums := []
nonAbundantSumsLength := 28123
loopCount := 1
while (loopCount <= nonAbundantSumsLength)
{
	nonAbundantSums.Push(loopCount)
	loopCount := loopCount + 1
}

outerLoopCount := 1
while (outerLoopCount <= abundantNumbersLength)
{
	innerLoopCount := outerLoopCount
	while (innerLoopCount <= abundantNumbersLength)
	{
		if (abundantNumbers[innerLoopCount] + abundantNumbers[outerLoopCount] <= nonAbundantSumsLength) {
			nonAbundantSums[abundantNumbers[innerLoopCount] + abundantNumbers[outerLoopCount]] := 0
		}
		innerLoopCount := innerLoopCount + 1
	}
	outerLoopCount := outerLoopCount + 1
}

answer := 0
loopCount := 1
while (loopCount <= nonAbundantSumsLength)
{
	answer := answer + nonAbundantSums[loopCount]
	loopCount := loopCount + 1
}

msgbox, %answer%
Clipboard := answer

ExitApp