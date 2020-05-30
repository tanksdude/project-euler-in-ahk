; Project Euler Problem #26

; Problem #26 text:
; A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:
; 1/2 = 0.5
; 1/3 = 0.(3)
; 1/4 = 0.25
; 1/5 = 0.2
; 1/6 = 0.1(6)
; 1/7 = 0.(142857)
; 1/8 = 0.125
; 1/9 = 0.(1)
; 1/10 = 0.1
; Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.
; Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.

; code
#SingleInstance

NUM := 1000
periodNum := 1
periodLength := 0
d := 2
while (d < NUM)
{
	; if the denominator is divisible by 2 or 5 (because of base 10), then there is a smaller number with the same period as this number
	; example: 220 = 2^2 * 5^1 * 11; therefore, 220 has the same period as 11 because 1/220 = 1/11 * .05
	if ((Mod(d, 2) != 0) and (Mod(d, 5) != 0))
	{
		; every number here will have its period start at the tenths place, making period checking much easier
		digits := [] ; most significant digit first (basically, 0.arr[1]arr[2]arr[3]...)
		digitCheck := Ceil(Log(d)) ; 2-digit numbers can't push more than 99 to the decimal part at a time, and every time XX is pushed, YY will follow
		leftover := 1
		counter := 1
		while (counter <= NUM) ; minimum amount of digits required to represent number
		{
			leftover := leftover * 10
			digits.Push(leftover // d)
			leftover := Mod(leftover, d)
			if (counter > digitCheck)
			{
				repetitionFound := true
				digitIndex := 1
				while (digitIndex <= digitCheck)
				{
					if (digits[counter-digitCheck + digitIndex] != digits[digitIndex])
					{
						repetitionFound := false
						break
					}
					digitIndex := digitIndex + 1
				}
				if (repetitionFound)
				{
					if (counter - digitCheck > periodLength)
					{
						periodNum := d
						periodLength := counter - digitCheck
					}
					break
				}
			}
			counter := counter + 1
		}
	}
	d := d + 1
}
answer := periodNum

msgbox, %answer%
Clipboard := answer

ExitApp