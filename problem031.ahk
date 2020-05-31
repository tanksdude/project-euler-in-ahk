; Project Euler Problem #31

; Problem #31 text:
; In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:
; 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
; It is possible to make £2 in the following way:
; 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
; How many different ways can £2 be made using any number of coins?

; code
#SingleInstance

moneyArr := [1, 2, 5, 10, 20, 50, 100, 200]
moneyArrLength := 8
targetNum := 200

; dynamic programming solution to the subset sum problem
waysToMakeSum := []
outer_counter := 1
while (outer_counter <= targetNum+1)
{
	waysToMakeSum.Push([])
	inner_counter := 1
	while (inner_counter <= moneyArrLength)
	{
		waysToMakeSum[outer_counter].Push(0)
		inner_counter := inner_counter + 1
	}
	waysToMakeSum[outer_counter][1] := 1 ; all zero sum sets can be made
	outer_counter := outer_counter + 1
}

outer_counter := 1
while (outer_counter <= targetNum+1)
{
	inner_counter := 2
	while (inner_counter <= moneyArrLength)
	{
		waysToMakeSum[outer_counter][inner_counter] := waysToMakeSum[outer_counter][inner_counter-1]
		if (moneyArr[inner_counter] <= outer_counter-1) {
			waysToMakeSum[outer_counter][inner_counter] := waysToMakeSum[outer_counter][inner_counter] + waysToMakeSum[outer_counter - moneyArr[inner_counter]][inner_counter]
		}
		inner_counter := inner_counter + 1
	}
	outer_counter := outer_counter + 1
}
; this can be done with a 1D array if you so desire

answer := waysToMakeSum[targetNum+1][moneyArrLength]

msgbox, %answer%
Clipboard := answer

ExitApp