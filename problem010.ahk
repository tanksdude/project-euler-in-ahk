; Project Euler Problem #10

; Problem #10 text:
; The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
; Find the sum of all the primes below two million.

; code
#SingleInstance

; warning: this takes a long time (~700s)

NUM := 2000000
answer := 0

; problem: AHK is a scripting language for macros, so math isn't super fast
; solution: use the Sieve of Eratosthenes algorithm

numberList := []
primeList := [] ; contains T/F of whether the item in numberList is prime

counter := 1
while (counter <= NUM)
{
	numberList.Push(counter)
	evenCheck := (Mod(counter, 2) == 1)
	primeList.Push(evenCheck)
	counter := counter + 1
}
; fixes
primeList[1] := false
primeList[2] := true

counter := 3
sqrtNum := Floor(Sqrt(NUM))
while (counter <= sqrtNum)
{
	if (primeList[counter]) ; this check alone saves ~100s
	{
		index := counter * 2
		while (index <= NUM)
		{
			primeList[index] := false
			index := index + counter
		}
	}
	counter := counter + 2
}

counter := 1
answer := 0
while (counter <= NUM)
{
	if (primeList[counter]) {
		answer := answer + numberList[counter]
	}
	counter := counter + 1
}

msgbox, %answer%
Clipboard := answer

ExitApp