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

printf "\n\nPrint the total number of input lines:\n"
awk 'END {print NR}' emp.data

printf "\n\nPrint the tenth input line:\n"
awk 'NR == 10' emp.data

printf "\n\nPrint the last field of every input line:\n"
awk '{print $NF}' emp.data

printf "\n\nPrint the last field of the last input line:\n"
awk '{field = $NF}
END  {print field}' emp.data

printf "\n\nPrint every input line with more than four fields:\n"
awk 'NF > 4' emp.data

printf "\n\nPrint every input line in which the last field is more than 4:\n"
awk '$NF > 4' emp.data

printf "\n\nPrint the total number of fields in all input lines:\n"
awk 'nf = nf + $NF
END {print $NF}' emp.data

printf "\n\nPrint the total number of lines that contain Beth:\n"
awk '/Beth/ { nlines = nlines + 1 }
END {nlines}'  emp.data

printf "\n\nPrint the largest first field and the line that contains it (assumes some
1 is positive):\n"
awk '$1 > max {max=$1 max_line = $0}
END {print max, max_line}' emp.data

printf "\n\nPrint every line that has at least one field:\n"
awk 'NF > 0' emp.data

printf "\n\nPrint every line longer than 80 characters:\n"
awk 'length($0) > 80' emp.data

printf "\n\nPrint the number of fields in every line followed by the line itself:\n"
awk '{print $NF, $0}' emp.data

printf "\n\nPrint the first two fields, in opposite order, of every line:\n"
awk '{print $2, $1}' emp.data

printf "\n\nExchange the first two fields of every line and then print the line:\n"
awk '{temp = $1, $1 = $2, $2 = temp, print}' emp.data

printf "\n\nPrint every line with the first field replaced by the line number:\n"
awk '{$1 = NR, print}' emp.data

printf "\n\nPrint every line after erasing the second field:\n"
awk '{$2 = "", print}' emp.data

printf "\n\nPrint in reverse order the fields of every line:\n"
awk '{for (i = NR; i > 0; i -= 1) {printf("%s" $i)}; printf{"\n"}' emp.data

printf "\n\nPrint the sums of the fields of every line:\n"
awk '{ sum = 0
	for (i = 1; i <= NF; i = i + 1) sum = sum + $i
	print sum
}' emp.data

printf "\n\nAdd up all fields in all lines and print the sum:\n"
awk '{ sum = 0
	for (i = 1; i <= NF; i = i + 1) sum = sum + $i
END {print sum}' emp.data

printf "\n\nPrint every line after replacing each field by its absolute value:\n"
awk '{for (i = 1; i <= NF; i = i + 1) if (i < 0) $i = -$i
	print
}' emp.data


