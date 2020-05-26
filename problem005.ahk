; Project Euler Problem #5

; Problem #5 text:
; 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
; What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

; code
#SingleInstance

; there's a smart way to do this, so that it can take any input range
; however, this is AHK, and I don't want to do more math than I have to
; therefore, get the prime factors of every number in (1,20] and multiply by all the unique ones
; 2^1, 3^1, 2^2, 5^1, 2^1*3^1, 7^1, 2^3, 2^1*5^1, 11^1, 2^2*3^1, 13^1, 2^1*7^1, 3^1*5^1, 2^4, 17^1, 2^1*3^2, 19^1, 2^2*5^1
; new factors needed: 2, 3, 2, 5, -, 7, 2, -, 11, -, 13, -, -, 2, 17, -, 19, -
; organized: 2^4, 3^2, 5^1, 7^1, 11^1, 13^1, 17^1, 19^1

answer := 16 * 9 * 5 * 7 * 11 * 13 * 17 * 19

msgbox, %answer%
Clipboard := answer

ExitApp