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




