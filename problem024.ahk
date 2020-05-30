; Project Euler Problem #24

; Problem #24 text:
; A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all of
; the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2
; are:
; 012   021   102   120   201   210
; What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

; code
#SingleInstance

; takes just under 10s

NUM := 1000000
arr := [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
arrlength := 10
permutationNumber := 1
while (permutationNumber < NUM)
{
	; algorithm from https://www.nayuki.io/page/next-lexicographical-permutation-algorithm
	; more about lexicographic permutation: https://en.wikipedia.org/wiki/Permutation#Generation_in_lexicographic_order
	pivotIndex := arrlength
	while (pivotIndex > 1 and arr[pivotIndex-1] >= arr[pivotIndex])
	{
		pivotIndex := pivotIndex - 1
	}
	
	if (pivotIndex == 0) {
		break ; last permutation
	}
	
	pivotExceedIndex := arrlength
	while (arr[pivotExceedIndex] < arr[pivotIndex - 1])
	{
		pivotExceedIndex := pivotExceedIndex - 1
	}
	
	tempVar := arr[pivotIndex - 1]
	arr[pivotIndex - 1] := arr[pivotExceedIndex]
	arr[pivotExceedIndex] := tempVar
	
	switchIndex := arrlength
	while (pivotIndex < switchIndex)
	{
		tempVar := arr[pivotIndex]
		arr[pivotIndex] := arr[switchIndex]
		arr[switchIndex] := tempVar
		pivotIndex := pivotIndex + 1
		switchIndex := switchIndex - 1
	}
	permutationNumber := permutationNumber + 1
}

foundPermutation := 0
counter := 1
while (counter <= arrlength)
{
	foundPermutation := foundPermutation + arr[counter] * 10**(arrlength - counter)
	counter := counter + 1
}
answer := foundPermutation

msgbox, %answer%
Clipboard := answer

ExitApp