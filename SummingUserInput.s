# Title: Homework5 Problem 1		Filename: SummingUserInput.s
# Author: William Lawecki		Date: 2/22/2023
# Description: This program will take user input and sum the values until a 0 is input.
# After the program reads 0, it will stop asking for numbers from the user and output
# the running sum.

### Data Segment ###

.data

# This segment will prompt the user to do things for us

str1:  .asciiz "This program will sum all the numbers you input. Entering a 0 will quit the program.\n"
str2:  .asciiz  "\nPlease enter a number: "
str3:  .asciiz  "\nSum = "

### Code Segment ###

.text
.globl main

main:						

add $s1, $zero, $zero			#initilizing our sum to 0

li $v0, 4					#Print String system call to welcome user
la $a0, str1				
syscall					

Loop:

li $v0, 4					#prompting user to enter first number
la $a0, str2
syscall

li $v0, 5					#storing user's input 
syscall

add $s1, $s1, $v0				#adding user's input to our sum
beq $v0, $zero, End			#if our user enter's a zero, we will go to the end of our program

j Loop

End:


li $v0, 4					#System call to report our User's sum
la $a0, str3
syscall

li $v0, 1					#System call to report the interger value of sum
move $a0, $s1
syscall

li $v0, 10					#System call to end the program
syscall