; Project Euler Problem #16

; Problem #16 text:
; 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
; What is the sum of the digits of the number 2^1000?

; code
#SingleInstance

; AHK doesn't have arbitrary-precision numbers, so time to do the math the human way
; number of digits needed: ceil(log_10(2^N)) = ceil(N * log_10(2))
; N=1000 so digits needed = 302

NUM := 1000
digitsNeeded := Ceil(NUM * Log(2)) ; 302
numberDigits := []
counter := 1
while (counter <= digitsNeeded)
{
	numberDigits.Push(0)
	counter := counter + 1
}
numberDigits[1] := 1

exponent := 1 ; already initialized to 2^0
while (exponent <= NUM)
{
	index := 1
	carry := 0
	while (index <= digitsNeeded)
	{
		newNum := numberDigits[index] * 2
		numberDigits[index] := Mod(newNum, 10) + carry
		carry := newNum // 10
		index := index + 1
	}
	exponent := exponent + 1
}

counter := 1
answer := 0
while (counter <= digitsNeeded)
{
	answer := answer + numberDigits[counter]
	counter := counter + 1
}

msgbox, %answer%
Clipboard := answer

ExitApp