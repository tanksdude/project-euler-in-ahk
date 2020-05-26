; Project Euler Problem #9

; Problem #9 text:
; A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
; a^2 + b^2 = c^2
; For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
; There exists exactly one Pythagorean triplet for which a + b + c = 1000.
; Find the product abc.

; code
#SingleInstance

; warning: this takes a little while (~40s on my computer)

NUM := 1000
answer := 0

a := 1
b := 2
c := 3
done := false
while (a <= NUM)
{
	b := a + 1
	while (b + a <= NUM)
	{
		c := b + 1
		while (c + b + a <= NUM)
		{
			if (a*a + b*b == c*c)
			{
				if (a + b + c == NUM)
				{
					done := True
					break
				}
			}
			c := c + 1
		}
		if (done) {
			break
		}
		b := b + 1
	}
	if (done) {
		break
	}
	a := a + 1
}

if (done) { ; sanity check
	answer := a * b * c
}

msgbox, %answer%
Clipboard := answer

ExitApp