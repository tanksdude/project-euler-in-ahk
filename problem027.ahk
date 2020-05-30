; Project Euler Problem #27

; Problem #27 text:
; Euler discovered the remarkable quadratic formula:
; n^2 + n + 41
; It turns out that the formula will produce 40 primes for the consecutive integer values 0 ≤ n ≤ 39. However, when
; n = 40, 40^2 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41, and certainly when n = 41, 41^2 + 41 + 41 is clearly divisible by 41.
; The incredible formula n^2 − 79n + 1601 was discovered, which produces 80 primes for the consecutive values 0 ≤ n ≤ 79. The
; product of the coefficients, −79 and 1601, is −126479.
; Considering quadratics of the form:
; n^2 + an + b, where |a|<1000 and |b|≤1000
; where |n| is the modulus/absolute value of n
; e.g. |11|=11 and |−4|=4
; Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for
; consecutive values of n, starting with n = 0.

; code
#SingleInstance

; if n=0 has to be a prime, then 2 <= b <= 997

NUM := 40000 ; this is plenty
; Sieve of Eratosthenes algorithm from problem 10
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
	if (primeList[counter])
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

longestPrimeSequence := 0
primeSequenceA := 0
primeSequenceB := 0
a := -999
b := 3 ; should start at 2, but realistically it won't be necessary
while (b <= 997)
{
	if (primeList[b])
	{
		a := -999
		while (a <= 999)
		{
			counter := 1 ; n
			isPrimeNum := true
			while (isPrimeNum)
			{
				testNum := counter**2 + a*counter + b
				if (testNum >= 2)
				{
					if (testNum > NUM)
					{
						msgbox, % "increase NUM"
					}
					if (not primeList[testNum])
					{
						isPrimeNum := false
					}
				}
				else
				{
					isPrimeNum := false
				}
				counter := counter + 1
			}
			if (counter-1 > longestPrimeSequence)
			{
				longestPrimeSequence := counter - 1
				primeSequenceA := a
				primeSequenceB := b
			}
			a := a + 1
		}
	}
	b := b + 2
}

answer := primeSequenceA * primeSequenceB

msgbox, %answer%
Clipboard := answer

ExitApp