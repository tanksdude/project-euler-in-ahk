; Project Euler Problem #20

; Problem #20 text:
; n! means n × (n − 1) × ... × 3 × 2 × 1
; For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
; and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
; Find the sum of the digits in the number 100!

; code
#SingleInstance

; digits required by 100! = ceil(sum_(n=1)^(100) log_10(n)) = 158

numberDigits := [1] ; least significant digit first
numDigits := 158
counter := 2
while (counter <= numDigits)
{
	numberDigits.Push(0)
	counter := counter + 1
}

currentNum := 2
NUM := 99 ; can skip 100 because the sum of the digits of 99!*100 are the same as 99!

while (currentNum <= NUM)
{
	counter := 1
	while (counter <= numDigits)
	{
		numberDigits[counter] := numberDigits[counter] * currentNum
		counter := counter + 1
	}
	counter := 1
	while (counter <= numDigits - 2)
	{
		numGet := numberDigits[counter]
		; the largest numGet can be is 9*99, which is 3 digits long
		numberDigits[counter]   := Mod(numGet, 10)
		numberDigits[counter+1] := numberDigits[counter+1] + Mod(numGet // 10, 10)
		numberDigits[counter+2] := numberDigits[counter+2] + numGet // 100
		counter := counter + 1
	}
	currentNum := currentNum + 1
}

answer := 0
counter := 1
while (counter <= numDigits)
{
	answer := answer + numberDigits[counter]
	counter := counter + 1
}

msgbox, %answer%
Clipboard := answer

ExitApp