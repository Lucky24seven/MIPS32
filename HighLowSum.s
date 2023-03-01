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
str5: .asciiz "\nThe sum of the integers entered is: "
str6: .asciiz "\nThe smallest number entered was: "
str7: .asciiz "\nYour largest value entered was: "

##### Code Segment #####

.text
.globl main

main:

add $s0, $zero, $zero		#initilizing our Sum to Zero

li $v0, 4				#initial user prompt on starting program
la $a0, str1
syscall

li $v0, 4				#asking for first user input
la $a0, str2
syscall

li $v0, 5				#storing user's input 
syscall

#since this is the first number entered, it will be BOTH the largest and smallest value

move $s1, $v0			#$s1 will act as our smallest 
move $s2, $v0			#$s2 will serve as our largest

add $s0, $s0, $v0			#adding user's input to our running total sum

li $v0, 4				#asking for second user input
la $a0, str3
syscall

li $v0, 5				#accepting user input and storing in temp to compare
syscall				
move $t0, $v0			#moving to a temp register for comparison later

add $s0, $s0, $t0			#adding to our running sum

li $v0, 4				#asking for last user input
la $a0, str4
syscall

li $v0, 5				#accepting user input and storing in temp to compare
syscall
move $t1, $v0

add $s0, $s0, $t1			#final sum of our three numbers

li $v0, 4				#System call to report our User's sum
la $a0, str5
syscall

li $v0, 1				#System call to report the integer value of sum
move $a0, $s0
syscall

#Now we need to compare and find the smallest and largest integers entered
#Our values are stored in $s1 is the smallest int and $s2 is largest int
#At this point the first number we entered is both our largest and smallest as $s1 and $s2

#checking smallest first
 # if input 2 < than the current smallest 
      bgt $s1, $t0, one
      j continue

one:
      #make input 2 the new smallest
      move $s1, $t0

continue:

      #if input 3 < than the current smallest 
      bgt $s1, $t1, two
      j continue_2

two:
      #make input 3 the new smallest
      move $s1, $t1

continue_2:

#checking largest next
 # if input 2 > than the current largest 
      ble $s2, $t0, largeone
      j largecontinue

largeone:
      #make input 2 the new largest
      move $s2, $t0

largecontinue:

      #if input 3 > than the current largest 
      ble $s2, $t1, largetwo
      j end

largetwo:
      #make input 3 the new largest
      move $s2, $t1

end:

li $v0, 4				#prompting user on smallest value entered
la $a0, str6
syscall

li $v0, 1				#reporting smallest value
move $a0, $s1
syscall

li $v0, 4				#prompting user for largest value entered
la $a0, str7
syscall

li $v0, 1				#reporting largest value
move $a0, $s2
syscall

li $v0, 10				#System call to end the program
syscall
