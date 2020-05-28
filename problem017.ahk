; Project Euler Problem #17

; Problem #17 text:
; If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
; If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
; NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and
; fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.

; code
#SingleInstance

answer := StrLen("onethousand")
ONES := [StrLen("one"), StrLen("two"), StrLen("three"), StrLen("four"), StrLen("five"), StrLen("six"), StrLen("seven"), StrLen("eight"), StrLen("nine")]
TENS := [StrLen("ten"), StrLen("twenty"), StrLen("thirty"), StrLen("forty"), StrLen("fifty"), StrLen("sixty"), StrLen("seventy"), StrLen("eighty"), StrLen("ninety")]
TEENS := [StrLen("ten"), StrLen("eleven"), StrLen("twelve"), StrLen("thirteen"), StrLen("fourteen"), StrLen("fifteen"), StrLen("sixteen"), StrLen("seventeen"), StrLen("eighteen"), StrLen("nineteen")]
HUNDREDlength := StrLen("hundred")
ANDlength := StrLen("and")

NUM := 999
counter := 1
while (counter <= NUM)
{
	newNum := counter
	sum := 0
	if (newNum >= 100)
	{
		sum := sum + ONES[newNum // 100] + HUNDREDlength
		if (Mod(newNum, 100) != 0)
		{
			sum := sum + ANDlength
		}
		newNum := Mod(newNum, 100)

	}
	if (newNum >= 10)
	{
		if (newNum < 20)
		{
			sum := sum + TEENS[Mod(newNum, 10) + 1]
			newNum := 0
		}
		else
		{
			sum := sum + TENS[newNum // 10]
			newNum := Mod(newNum, 10)
		}
	}
	if (newNum >= 1)
	{
		sum := sum + ONES[newNum]
	}
	answer := answer + sum
	counter := counter + 1
}

msgbox, %answer%
Clipboard := answer

ExitApp