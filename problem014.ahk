; Project Euler Problem #14

; Problem #14 text:
; The following iterative sequence is defined for the set of positive integers:
; n → n/2 (n is even)
; n → 3n + 1 (n is odd)
; Using the rule above and starting with 13, we generate the following sequence:
; 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
; It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz
; Problem), it is thought that all starting numbers finish at 1.
; Which starting number, under one million, produces the longest chain?
; NOTE: Once the chain starts the terms are allowed to go above one million.

; code
#SingleInstance

; warning: takes a while (~115s)

NUM := 1000000
longestSequence := 1
longestSequenceNumber := 1
currentNum := 2

while (currentNum <= NUM)
{
	modifiedNum := currentNum
	currentSequence := 1
	while (modifiedNum != 1)
	{
		if (Mod(modifiedNum, 2) == 0)
		{
			modifiedNum := modifiedNum / 2
			currentSequence := currentSequence + 1
		}
		else
		{
			; efficiency: if n odd, then 3n+1 is even, so do two steps at once! (saves ~40s)
			modifiedNum := (3*modifiedNum + 1) / 2
			currentSequence := currentSequence + 2
		}
	}
	if (currentSequence > longestSequence)
	{
		longestSequence := currentSequence
		longestSequenceNumber := currentNum
	}
	currentNum := currentNum + 1
}

answer := longestSequenceNumber

msgbox, %answer%
Clipboard := answer

ExitApp