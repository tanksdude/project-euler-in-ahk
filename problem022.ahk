; Project Euler Problem #22

; Problem #22 text:
; Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it
; into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the
; list to obtain a name score.
; For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the
; list. So, COLIN would obtain a score of 938 × 53 = 49714.
; What is the total of all the name scores in the file?

; code
#SingleInstance

; takes a while (~20s)

FileRead, nameString, p022_names.txt ; read the file (ignores #MaxMem: https://www.autohotkey.com/docs/commands/FileRead.htm#Remarks)
totalCharacters := StrLen(nameString)
nameList := []
numNames := 0 ; ends up being 5163
counter := 1
while (counter < totalCharacters)
{
	if (SubStr(nameString, counter, 1) == """") ; this loop could be done without this conditional
	{
		counter := counter + 1
		nameLength := 1
		while (SubStr(nameString, counter+nameLength, 1) != """") ; AHK has weird escape sequences (https://www.autohotkey.com/docs/commands/_EscapeChar.htm#Escape_Sequences)
		{
			nameLength := nameLength + 1
		}
		nameList.Push(SubStr(nameString, counter, nameLength))
		numNames := numNames + 1
		counter := counter + nameLength + 1 ; counter = the comma
	}
	counter := counter + 1
}

sortedNameList := []
sortedNameListLength := 0
while (numNames > 0)
{
	indexOfFirstString := 1
	counter := 1
	while (counter <= numNames)
	{
		if (nameList[counter] < nameList[indexOfFirstString])
		{
			indexOfFirstString := counter
		}
		counter := counter + 1
	}
	sortedNameList.Push(nameList[indexOfFirstString])
	sortedNameListLength := sortedNameListLength + 1
	nameList.Remove(indexOfFirstString)
	numNames := numNames - 1
}

sum := 0
counter := 1
while (counter <= sortedNameListLength)
{
	index := 1
	stringSum := 0
	while (index <= StrLen(sortedNameList[counter]))
	{
		stringSum := stringSum + Asc(SubStr(sortedNameList[counter], index, 1)) - 64
		index := index + 1
	}
	sum := sum + (stringSum * counter)
	counter := counter + 1
}
answer := sum

msgbox, %answer%
Clipboard := answer

ExitApp