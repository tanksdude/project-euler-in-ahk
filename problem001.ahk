; Project Euler Problem #1

; Problem #1 text:
; If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
; Find the sum of all the multiples of 3 or 5 below 1000.

; code
#SingleInstance

NUM := 1000
answer := 0

counter := 1
while (counter < NUM)
{
	if (Mod(counter, 3) == 0 or Mod(counter, 5) == 0) {
		answer := answer + counter
	}
	counter := counter + 1
}

msgbox, %answer%
Clipboard := answer

ExitApp