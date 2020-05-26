; Project Euler Problem #7

; Problem #7 text:
; By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
; What is the 10,001st prime number?

; code
#SingleInstance

; warning: I'm not sure how fast this code is compared to more optimal AHK, but I know for sure that this takes a while (~70s on my computer)

answer := 0
primeList := [2]
primeCount := 1
currentNum := 3

NUM := 10001
while (primeCount < NUM)
{
	counter := 2 ; slight optimization: all numbers being checked aren't even, so skip 2 in the prime list
	prime := true
	while (counter <= primeCount)
	{
		if (Mod(currentNum, primeList[counter]) == 0)
		{
			prime := false
			break
		}
		counter := counter + 1
	}
	if (prime)
	{
		primeList.Push(currentNum)
		primeCount := primeCount + 1
	}
	currentNum := currentNum + 2
}

answer := primeList[NUM]

msgbox, %answer%
Clipboard := answer

ExitApp