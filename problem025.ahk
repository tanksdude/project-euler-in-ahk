; Project Euler Problem #25

; Problem #25 text:
; The Fibonacci sequence is defined by the recurrence relation:
; F_{n} = F_{n−1} + F_{n−2}, where F_{1} = 1 and F_{2} = 1.
; Hence the first 12 terms will be:
; F_{1} = 1
; F_{2} = 1
; F_{3} = 2
; F_{4} = 3
; F_{5} = 5
; F_{6} = 8
; F_{7} = 13
; F_{8} = 21
; F_{9} = 34
; F_{10} = 55
; F_{11} = 89
; F_{12} = 144
; The 12th term, F_{12}, is the first term to contain three digits.
; What is the index of the first term in the Fibonacci sequence to contain 1000 digits?

; code
#SingleInstance

; takes ~10s

; another problem that would be much easier with arbitrary-precision numbers
NUM := 1000
prevFib := [1] ; least significant digit first
currentFib := [1]
counter := 2
while (counter <= NUM + 1)
{
	prevFib.Push(0)
	currentFib.Push(0)
	counter := counter + 1
}

fibIndex := 2
while (currentFib[NUM] == 0)
{
	newFib := [0]
	counter := 1
	while (counter <= NUM)
	{
		newFib[counter] := newFib[counter] + Mod(prevFib[counter] + currentFib[counter], 10)
		newFib[counter+1] := (prevFib[counter] + currentFib[counter]) // 10
		counter := counter + 1
	}
	prevFib := currentFib
	currentFib := newFib
	fibIndex := fibIndex + 1
}
answer := fibIndex

msgbox, %answer%
Clipboard := answer

ExitApp