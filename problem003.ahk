; Project Euler Problem #3

; Problem #3 text:
; The prime factors of 13195 are 5, 7, 13 and 29.
; What is the largest prime factor of the number 600851475143 ?

; code
#SingleInstance

NUM := 600851475143
divisor := 3

; the number isn't even, so don't need to check mod 2
; start at 3, increment by 2; once the divisor equals the remaining number, that should be the answer

while (divisor < NUM)
{
	while (Mod(NUM, divisor) == 0)
	{
		if (divisor == NUM) {
			break
		}
		NUM := NUM / divisor
	}
	divisor := divisor + 2
}

msgbox, %divisor%
Clipboard := divisor

ExitApp