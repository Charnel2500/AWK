#!/bin/bash
printf "All employees, their names and working hours. \n"
awk '{print $0}' emp.data
printf "\n\nThe name and pay (rate times hours) for everyone who
worked more than zero hours. \n"
awk '$3>0 {print $1, $2*$3}' emp.data #pattern { action } 
printf "\n\nThe names of those employees who did not work\n"
awk '$3 == 0 {print $1}' emp.data

printf "\n\nThe statement print by itself prints the current input line \n"
awk '{ print }' emp.data

printf "\n\nDoes the same thing \n"
awk '{ print $0 }' emp.data

printf "\n\nPrinting Certain Fields  \n"
awk '{  print $1, $3 }' emp.data

printf "\n\nPrints the number of fields and the first and last fields of each input line. \n"
awk '{  print NF, $1, $NF }' emp.data

printf "\n\nPrints the name and total pay (rate times hours) for each employee. \n"
awk '{  print NF, $1, $NF }' emp.data

printf "\n\nWe can use NR and $0 to prefix each line of emp. data with its line number. \n"
awk '{  print NR, $0 }' emp.data

printf "\n\nPrint words in the midst of fields and computed values: \n"
awk '{  print "Total value for", $1, "is", $2*$3 }' emp.data

printf "\n\nBy using printf: \n"
awk '{  printf("Total value for %s is %.2f.\n", $1, $2*$3) }' emp.data

printf "\n\nThe first specification, prints a name as a string of characters left justified in a field 8 characters wide. The second specification, prints the pay as a number with two digits after the decimal point, in a field 6 characters wide: \n"
awk '{ printf("%-8s $%6.2f\n", $1, $2 * $3) } ' emp.data

printf "\n\nWith sort: \n"
awk '{   printf("%-8s $%6.2f\n", $1, $2 * $3) }' emp.data | sort

printf "\n\nPeople who earn more than 50 total: \n"
awk '$2 * $3 >= 50 {printf ("%.2f for %s \n", $2 * $3, $1)}' emp.data

printf "\n\n Print only Susie line: \n"
awk '$1 == "Susie"' emp.data

printf "\n\n Print only Susie line: \n"
awk '$1 == "Susie"' emp.data

printf "\n\n Pay per hour is min 4 and work hours is min 20: \n"
awk '$2 >= 4 && $3 >= 20' emp.data

printf "\n\n Pay per hour is not min 4 and work hours is not min 20: \n"
awk '!($2 >= 4 && $3 >= 20)' emp.data

printf "\n\n Check values: \n"
awk 'NF != 3 { print $0, "number of fields is not equal to 3" }' emp.data
awk '$2 < 3.35 { print $0, "rate is below minimum wage" }' emp.data
awk '$2 > 10 { print $0, "rate exceeds $10 per hour" }' emp.data
awk '$3 < 0 { print $0, "negative hours worked" }' emp.data
awk '$3 > 60 { print $0, "too many hours worked" }' emp.data

printf "\n\n Let's check begin: \n"
awk 'BEGIN { print "NAME RATE HOURS"; print ""}
	{print }' emp.data

awk '$3 > 15 {emp += 1}
END { printf("There is/are %i employee(s) who work more than 15 hours \n", emp) }' emp.data

printf "\n\n Employees number:\n"
awk 'END {print NR " employees"}' emp.data 

printf "\n\nLet's compute average pay:\n"
awk 'pay = pay + $2 * $3
END { print NR " employees"; print "Total pay is: " pay; print "Average pay is: " pay/NR }' emp.data

printf "\n\nLet's check who get the most money:\n"
awk '$2 > max_pay {max_pay = $2; name_max = $1}
END { printf("%s earns the most money and it is %s. \n", name_max, max_pay) }' emp.data

printf "\n\nPrint all names:\n"
#dodane jest names po lewej, bo dzięki temu przy każdej linii dodaje z poprzednich
awk '{ names = names $1 " " } 
END { print names }' emp.data


printf "\n\nPrint last line:\n"
awk '{ last = $0 } 
END { print last }' emp.data

printf "\n\nBuild-in length function:\n"
awk '{ print $1, length($1) }' emp.data

printf "\n\nBuild-in length function:\n"
awk '{ nc = nc + length($0) +1 
	nw = nw + NF }
END {print NR, "lines", nw, "words", nc, "characters"}' emp.data

printf "\n\nCompute all money that people earn, who earn more than 6 euro per hour:\n"
awk '$2 > 6 { n = n + 1; pay = pay + $2 * $3 }
END { if  (n > 0) { print "There are" n  "People who earn more than 6 euros per hour earn" pay}
	else { print "There is no people who earn more than 6 euros per hour"}}' emp.data

# interest1 - compute compound interest
#input: amount rate years
#output: compounded value at the end of each year
awk '{ i = 1
  while (i <= $3) {
	printf("\t%.2f\n", $1 * (1 + $2) ^ i )
	i = i + 1
	}
}' value.txt

# interest1 - compute compound interest
#input: amount rate years
#output: compounded value at the end of each year
awk '{for (i = 1; i <= $3; i += 1) {
	printf("\t%.2f\n", $1 * (1 + $2) ^ i )}}' value.txt

printf "\n\nPrint in reverse order:\n"
awk '{ line[NR] = $0}
END { i = NR
   while (i > 0) {
	print line[i]
	i = i - 1
}}' emp.data

printf "\n\nPrint in reverse order (for loop version):\n"
awk '{ line[NR] = $0 }
END { for (i = NR; i > 0; i -= 1) {
	print line[i]}}' emp.data
