# Title: Homework6 Problem 1		Filename: HighLowSum.s
# Author: William Lawecki		Date: 2/28/2023
# Description: This program will take 3 user inputs. After the inputs are entered
# the program will sum all 3 values, and determine the largest and smallest
# of the 3 inputs.  It will then output that data back to the user.
# Input: Intergers input by user
# Output: Integer sum, largest, and smallest values entered.

##### Data Segment #####

.data

str1: .asciiz "Welcome to the High Low Sum program.  Please enter 3 integer values.\n"
str2: .asciiz "\nPlease enter the first number: "
str3: .asciiz "\nPlease enter the second number: "
str4: .asciiz "\nEnter the last number, please: "
str5: .asciiz "\nThe sum of the largest two integers entered is: "
str6: .asciiz "\nThe smallest number entered was: "
str7: .asciiz "\nYour largest value entered was: "

##### Code Segment #####

.text
.globl main

main: 

li $v0, 4				# initial user prompt on starting program
la $a0, str1
syscall

li $v0, 4				# asking for first user input
la $a0, str2
syscall

li $v0, 5           		# read in input to reg $t0
syscall
move $t0, $v0

li $v0, 4				# asking for second user input
la $a0, str3
syscall

li $v0, 5           		# read in input to reg $t1
syscall
move $t1, $v0

li $v0, 4				# asking for last user input
la $a0, str4
syscall
   
li $v0, 5		           	# read in input to reg $t2
syscall
move $t2, $v0

### calculate sum and store result in $t3 ###

add $t3, $zero, $zero		# Clearing register value
add $t3, $t0, $t1
add $t3, $t3, $t2

### finding the smallest value here ###
      
move $t4, $t0			# Assume input 1 is smallest

### if input 2 < than the current smallest ### 

bgt $t4, $t1, check_1
j continue

check_1:
      
move $t4, $t1			# Make input 2 the new smallest

continue:

### If input 3 < than the current smallest ### 

bgt $t4, $t2, check_2
j continue_2

check_2:

move $t4, $t2			# Make input 3 the new smallest

continue_2:


### Remove the smallest from the sum of all three ###

sub $t3, $t3, $t4 

### Need to check for largest ###

move $t5, $t0			# Assume input 1 is largest

### If input 2 > than the current largest ### 

ble $t5, $t1, largeccheck
j largecontinue

largecheck:
move $t5, $t1			# Make input 2 largest

largecontinue:

### If input 3 > than the current largest ### 

ble $t5, $t2, lastcompare
j exit

lastcompare: 
move $t5, $t2			# Make input 3 largest

exit:

li $v0, 4				# System call to report our User's sum
la $a0, str5
syscall

li $v0, 1				# Reporting Sum
move $a0, $t3
syscall

li $v0, 4				# Prompting user on smallest value entered
la $a0, str6
syscall

li $v0, 1				# Reporting smallest value
move $a0, $t4
syscall

li $v0, 4				# Prompting user for largest value entered
la $a0, str7
syscall

li $v0, 1				# Reporting largest value
move $a0, $t5
syscall

li $v0, 10				# System call to end the program
syscall
