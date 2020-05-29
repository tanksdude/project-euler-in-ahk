; Project Euler Problem #21

; Problem #21 text:
; Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
; If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.
; For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284
; are 1, 2, 4, 71 and 142; so d(284) = 220.
; Evaluate the sum of all the amicable numbers under 10000.

; code
#SingleInstance

GetDivisorSum(am_num) {
	divisors := [1]
	divisorsLength := 1
	counter := 2
	sqrtNum := Sqrt(am_num)
	while (counter <= sqrtNum) ; get first half of list of divisors
	{
		if (Mod(am_num, counter) == 0)
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
		divisors.Push(am_num / divisors[startCount]) ; it's not sorted, but it doesn't matter
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
	return sum
}

NUM := 10000
loop_count := 2 ; AHK scope problem
am_sum := 0
while (loop_count < NUM)
{
	testNum := GetDivisorSum(loop_count)
	pairNum := GetDivisorSum(testNum)
	if ((loop_count == pairNum) and (loop_count != testNum))
	{
		am_sum := am_sum + loop_count
	}
	loop_count := loop_count + 1
}

answer := Floor(am_sum) ; not sure when it becomes a double, but whatever (I think it's line 34)

msgbox, %answer%
Clipboard := answer

ExitApp