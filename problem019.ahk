; Project Euler Problem #19

; Problem #19 text:
; You are given the following information, but you may prefer to do some research for yourself.
; * 1 Jan 1900 was a Monday.
; * Thirty days has September,
;   April, June and November.
;   All the rest have thirty-one,
;   Saving February alone,
;   Which has twenty-eight, rain or shine.
;   And on leap years, twenty-nine.
; * A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
; How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

; code
#SingleInstance

; set up variables for counting the date
; starting on 1 January 1901, which was a Tuesday
dayOfMonth := 3 ; Sunday=1, Saturday=7
currentDay := 1
currentMonth := 1
daysInMonth := [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
currentYear := 1901 ; easy leap year calculation: all years in 1901-2000 that are divisible by 4 are leap years
sundayCount := 0

while (currentYear < 2001)
{
	; logic check
	if (currentDay == 1 and dayOfMonth == 1)
	{
		sundayCount := sundayCount + 1
	}
	; increment
	currentDay := currentDay + 1
	dayOfMonth := Mod(dayOfMonth, 7) + 1
	if (currentDay > daysInMonth[currentMonth])
	{
		if (currentMonth == 12)
		{
			currentYear := currentYear + 1
			if (Mod(currentYear, 4) == 0) {
				daysInMonth[2] := 29
			} else {
				daysInMonth[2] := 28
			}
		}
		currentDay := 1
		currentMonth := Mod(currentMonth, 12) + 1
	}
}

answer := sundayCount

msgbox, %answer%
Clipboard := answer

ExitApp