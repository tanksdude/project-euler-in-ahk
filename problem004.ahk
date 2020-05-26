; Project Euler Problem #4

; Problem #4 text:
; A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 ×
; 99.
; Find the largest palindrome made from the product of two 3-digit numbers.

; code
#SingleInstance

answer := 0
prod1 := 100 ; realistically, these can start much later, but it's fine
prod2 := 100

; flipping a string code from: https://autohotkey.com/board/topic/42396-fastest-way-to-reverse-a-string/
Flip(Str) {
	Loop, Parse, Str
		nStr = %A_LoopField%%nStr%
	Return nStr
}

while (prod1 <= 999)
{
	prod2 := 100
	while (prod2 <= 999)
	{
		mult := prod1 * prod2
		if (mult > answer)
		{
			temp := Flip(mult)
			if (mult == temp) {
				answer := mult
			}
		}
		prod2 := prod2 + 1
	}
	prod1 := prod1 + 1
}

msgbox, %answer%
Clipboard := answer

ExitApp