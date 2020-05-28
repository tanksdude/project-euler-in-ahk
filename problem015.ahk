; Project Euler Problem #15

; Problem #15 text:
; Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom
; right corner.
; →→↓↓ →↓→↓ →↓↓→
; ↓→→↓ ↓→↓→ ↓↓→→
; How many such routes are there through a 20×20 grid?

; code
#SingleInstance

; this is way too much to manually compute, so time for some clever math:
; first example given: →→↓↓, or (RRDD)
; (RRDD) has 2N elements (the path is 2N length), and they need to be arranged N ways, so use (2N choose N) (N=20)
; (n choose k) = n! / (k! * (n-k)!)
; (2n choose n) = (2n)! / (n! * n!)

; problem: these numbers are too big for plain ol' AHK, so some math needs to be precomputed
; (40 choose 20) = 40! / (20! * 20!)
; = 40 * 39 * 38 * ... * 21 / 20!
; still way too big

; 20! = 2 * 3 * 4 * 5 * 6 * 7 * 8 * 9 * 10 * 11 * 12 * 13 * 14 * 15 * 16 * 17 * 18 * 19 * 20
; = 2 * 4 * 8 * 16 * 3 * 6 * 9 * 12 * 15 * 18 * 5 * 10 * 20 * 7 * 14 * 11 * 13 * 17 * 19
; = 2^10 * 3^8*2^4*5^1 * 5^3*2^3 * 7^2*2^1 * 11 * 13 * 17 * 19
; = 2^18 * 3^8 * 5^4 * 7^2 * 11 * 13 * 17 * 19

; now to save space and just write the prime factorization of 40!/20!:
; 40!/20! = 2^20 * 3^10 * 5^5 * 7^3 * 11^2 * 13^2 * 17^1 * 19^1 * 23 * 29 * 31 * 37

; therefore, (40 choose 20) =
; 2^2 * 3^2 * 5^1 * 7^1 * 11^1 * 13^1 * 23 * 29 * 31 * 37

answer := 2*2 * 3*3 * 5 * 7 * 11 * 13 * 23 * 29 * 31 * 37

msgbox, %answer%
Clipboard := answer

ExitApp