# 	Instructions: 
#   	Connect bitmap display:
#       Set pixel dim to 8x8
#       Set display dim to 256x256
#	Set $gp as base address
#   	Connect keyboard and run
#	Use w (up), s (down), a (left), d (right), space (exit)

# width of screen in pixels
# 256 / 8 = 32
.eqv WIDTH 32
# height of screen in pixels
.eqv HEIGHT 32
# colors
.eqv	RED 	0x00FF0000
.eqv	GREEN	0x0000FF00
.eqv	BLUE	0x000000FF
.eqv	WHITE	0x00FFFFFF
.eqv 	YELLOW	0x00FFFF00
.eqv	CYAN	0x0000FFFF
.eqv	MAGENTA 0x00FF00FF
.eqv	PURPLE	0x008B00FF 
.eqv	ORANGE 	0x00FF7000 
.eqv	GREY	0x00D5D5D5
.eqv	BLACK	0x00000000

	.data
welcomeMessage:	.asciiz "Welcome to Pixel Paint! Info needed below:"
goodbyeMessage:	.asciiz "Goodbye thanks for Drawing!" 

space:	.space 400
 
magentaColorChangeMsg:	.asciiz "The color of your pixel brush is now magenta"
redColorChangeMsg:	.asciiz "The color of your pixel brush is now red"
greenColorChangeMsg:	.asciiz "The color of your pixel brush is now green"
blueColorChangeMsg:	.asciiz "The color of your pixel brush is now blue"
whiteColorChangeMsg:	.asciiz "The color of your pixel brush is now white"
yellowColorChangeMsg:	.asciiz "The color of your pixel brush is now yellow"
cyanColorChangeMsg:	.asciiz "The color of your pixel brush is now cyan"
purpleColorChangeMsg:	.asciiz "The color of your pixel brush is now purple"
orangeColorChangeMsg:	.asciiz "The color of your pixel brush is now orange"
blackColorChangeMsg:	.asciiz "The color of your pixel brush is now black"

magentaBackgroundChangeMsg:	.asciiz "Changing background to magenta"
redBackgroundChangeMsg:		.asciiz "Changing background to red"
greenBackgroundChangeMsg:	.asciiz "Changing background to green"
blueBackgroundChangeMsg:	.asciiz "Changing background to blue"
whiteBackgroundChangeMsg:	.asciiz "Changing background to white"
yellowBackgroundChangeMsg:	.asciiz "Changing background to yellow"
cyanBackgroundChangeMsg:	.asciiz "Changing background to cyan"
purpleBackgroundChangeMsg:	.asciiz "Changing background to purple"
orangeBackgroundChangeMsg:	.asciiz "Changing background to orange"
blackBackgroundChangeMsg:	.asciiz "Changing background to black"

centerPixelMsg:	.asciiz "Your pixel brush is now centered"
fullResetMsg:	.asciiz "Your canvas has been reset"

infoMsg1:	.asciiz "Mips pixel paint information: \n"
infoMsg2:	.asciiz "Use w(up), s(down), a(left), d(right) to control your pixel brush \n"
infoMsg3:	.asciiz "Use the number keys to change your current color: \n"
infoMsg4:	.asciiz "0 - Black \n"
infoMsg5:	.asciiz "1 - Red \n"
infoMsg6:	.asciiz "2 - Green \n"
infoMsg7:	.asciiz "3 - Blue \n"
infoMsg8:	.asciiz "4 - White \n"
infoMsg9:	.asciiz "5 - Yellow \n"
infoMsg10:	.asciiz "6 - Cyan \n"
infoMsg11:	.asciiz "7 - Magenta \n"
infoMsg12:	.asciiz "8 - Purple \n"
infoMsg13:	.asciiz "9 - Orange \n"
infoMsg14:	.asciiz "Use b to change the background color to what your current color is \n"
infoMsg15:	.asciiz "Warning: changing the background erases your drawing \n"
infoMsg16:	.asciiz "Use r to fully reset the canvas \n"
infoMsg17:	.asciiz "Use c to center your pixel brush \n"

	.text
	# First animation step in the welcome frame
welcomeAnimationSetOne:  
	# sets the current pixel to the top left
	addi	$a0, $0, 0
	sra 	$a0, $a0, 1
	addi	$a1, $0, 0
	sra 	$a1, $a1, 1
	
	# sets the limit for the loop
	li	$t5, 0
	li	$t4, 1024
	
	# Draws the first frame of the welcome animation
anamationFrameOne:	
	# Draws eavh row the specified color until the bitmap is filled	
	la	$a2, RED	#loads red into the current pixel color	
	jal	draw_pixel
	addi	$a0, $a0, 1
	la	$a2, RED	#loads red into the current pixel color
	jal	draw_pixel
	addi	$t5, $t5, 1
	beq 	$t5, $t4, welcomeAnimationSetTwo
	j 	anamationFrameOne

	# Second animation step in the welcome frame
welcomeAnimationSetTwo: 
	# delay added for animation effect	
	li $v0, 32
	li $a0, 200
	syscall
	
	# sets the current pixel to the top left
	addi	$a0, $0, 0
	sra 	$a0, $a0, 1
	addi	$a1, $0, 0
	sra 	$a1, $a1, 1
	
	# sets the limit for the loop
	li	$t5, 0
	li	$t4, 1024
	
	# Draws the second frame of the welcome animation
anamationFrameTwo:		
	la	$a2, ORANGE	#loads orange into the current pixel color	
	jal	draw_pixel
	addi	$a0, $a0, 1
	la	$a2, ORANGE	#loads orange into the current pixel color
	jal	draw_pixel
	addi	$t5, $t5, 1
	beq 	$t5, $t4, welcomeAnimationsSetThree
	j 	anamationFrameTwo
	
	# Third animation step in the welcome frame
welcomeAnimationsSetThree:
	# delay added for animation effect	
	li $v0, 32
	li $a0, 200
	syscall
	
	# sets the current pixel to the top left
	addi	$a0, $0, 0
	sra 	$a0, $a0, 1
	addi	$a1, $0, 0
	sra 	$a1, $a1, 1
	
	# sets the limit for the loop
	li	$t5, 0
	li	$t4, 1024
	
	# Draws the third frame of the welcome animation
anamationFrameThree:		
	la	$a2, YELLOW		#loads yellow into the current pixel color
	jal	draw_pixel
	addi	$a0, $a0, 1
	la	$a2, YELLOW		#loads yellow into the current pixel color
	jal	draw_pixel
	addi	$t5, $t5, 1
	beq 	$t5, $t4, welcomeAnimationsSetFour
	j 	anamationFrameThree
	
	# Fourth animation step in the welcome frame
welcomeAnimationsSetFour:
	# delay added for animation effect	
	li $v0, 32
	li $a0, 200
	syscall
	
	# sets the current pixel to the top left
	addi	$a0, $0, 0
	sra 	$a0, $a0, 1
	addi	$a1, $0, 0
	sra 	$a1, $a1, 1
	
	# sets the limit for the loop
	li	$t5, 0
	li	$t4, 1024
	
	# Draws the four frame of the welcome animation
anamationFrameFour:		
	la	$a2, GREEN		#loads green into the current pixel color
	jal	draw_pixel
	addi	$a0, $a0, 1
	la	$a2, GREEN		#loads green into the current pixel color
	jal	draw_pixel
	addi	$t5, $t5, 1
	beq 	$t5, $t4, welcomeAnimationsSetFive
	j 	anamationFrameFour
	
	# Fifth animation step in the welcome frame
welcomeAnimationsSetFive:
	# delay added for animation effect	
	li $v0, 32
	li $a0, 200
	syscall
	
	# sets the current pixel to the top left
	addi	$a0, $0, 0
	sra 	$a0, $a0, 1
	addi	$a1, $0, 0
	sra 	$a1, $a1, 1
	
	# sets the limit for the loop
	li	$t5, 0
	li	$t4, 1024
	
	# Draws the fifth frame of the welcome animation
anamationFrameFive:		
	la	$a2, BLUE		#loads blue into the current pixel color
	jal	draw_pixel
	addi	$a0, $a0, 1
	la	$a2, BLUE		#loads blue into the current pixel color
	jal	draw_pixel
	addi	$t5, $t5, 1
	beq 	$t5, $t4, welcomeAnimationsSetSix
	j 	anamationFrameFive
	
	# Sixth animation step in the welcome frame
welcomeAnimationsSetSix:
	# delay added for animation effect	
	li $v0, 32
	li $a0, 200
	syscall
	
	# sets the current pixel to the top left
	addi	$a0, $0, 0
	sra 	$a0, $a0, 1
	addi	$a1, $0, 0
	sra 	$a1, $a1, 1
	
	# sets the limit for the loop
	li	$t5, 0
	li	$t4, 1024
	
	# Draws the sixth frame of the welcome animation
anamationFrameSix:		
	la	$a2, PURPLE		#loads purple into the current pixel color
	jal	draw_pixel
	addi	$a0, $a0, 1
	la	$a2, PURPLE		#loads purple into the current pixel color
	jal	draw_pixel
	addi	$t5, $t5, 1
	beq 	$t5, $t4, welcomeAnimationsSetSeven
	j 	anamationFrameSix
	
	# Seventh animation step in the welcome frame
welcomeAnimationsSetSeven:
	# delay added for animation effect	
	li $v0, 32
	li $a0, 200
	syscall
	
	# sets the current pixel to the top left
	addi	$a0, $0, 0
	sra 	$a0, $a0, 1
	addi	$a1, $0, 0
	sra 	$a1, $a1, 1
	
	# sets the limit for the loop
	li	$t5, 0
	li	$t4, 1024
	
	# Draws the seventh frame of the welcome animation
anamationFrameSeven:		
	la	$a2, MAGENTA		#loads magenta into the current pixel color
	jal	draw_pixel
	addi	$a0, $a0, 1
	la	$a2, MAGENTA		#loads magenta into the current pixel color
	jal	draw_pixel
	addi	$t5, $t5, 1
	beq 	$t5, $t4, welcomeAnimationsSetEight
	j 	anamationFrameSeven
	
	# Eighth animation step in the welcome frame
welcomeAnimationsSetEight:
	# delay added for animation effect	
	li $v0, 32
	li $a0, 200
	syscall
	
	# sets the current pixel to the top left
	addi	$a0, $0, 0
	sra 	$a0, $a0, 1
	addi	$a1, $0, 0
	sra 	$a1, $a1, 1
	
	# sets the limit for the loop
	li	$t5, 0
	li	$t4, 1024
	
	# Draws the eighth frame of the welcome animation
anamationFrameEight:	
	la	$a2, BLACK		#loads black into the current pixel color
	jal	draw_pixel
	addi	$a0, $a0, 1
	la	$a2, BLACK		#loads black into the current pixel color
	jal	draw_pixel
	addi	$t5, $t5, 1
	beq 	$t5, $t4, welcomeGreeting
	j 	anamationFrameEight

	# Prints the infoprmation such as controls needed to use the program
welcomeGreeting:	
	la 	$a0, welcomeMessage
	la	$a1, space
	li 	$v0, 59
	syscall	
	
	# Prints the infoprmation such as controls needed to use the program
info:	
	la	$a0, infoMsg1
	li	$v0, 4
	syscall
	
	la	$a0, infoMsg2
	li	$v0, 4
	syscall
	
	la	$a0, infoMsg3
	li	$v0, 4
	syscall
	
	la	$a0, infoMsg4
	li	$v0, 4
	syscall
	
	la	$a0, infoMsg5
	li	$v0, 4
	syscall
	
	la	$a0, infoMsg6
	li	$v0, 4
	syscall
	
	la	$a0, infoMsg7
	li	$v0, 4
	syscall
	
	la	$a0, infoMsg8
	li	$v0, 4
	syscall
	
	la	$a0, infoMsg9
	li	$v0, 4
	syscall
	
	la	$a0, infoMsg10
	li	$v0, 4
	syscall
	
	la	$a0, infoMsg11
	li	$v0, 4
	syscall
	
	la	$a0, infoMsg12
	li	$v0, 4
	syscall
	
	la	$a0, infoMsg13
	li	$v0, 4
	syscall
	
	la	$a0, infoMsg14
	li	$v0, 4
	syscall
	
	la	$a0, infoMsg15
	li	$v0, 4
	syscall
	
	la	$a0, infoMsg16
	li	$v0, 4
	syscall
	
	la	$a0, infoMsg17
	li	$v0, 4
	syscall
		
main:
	# set up starting position
	addi 	$a0, $0, WIDTH    # a0 = X = WIDTH/2
	sra 	$a0, $a0, 1
	addi 	$a1, $0, HEIGHT   # a1 = Y = HEIGHT/2
	sra 	$a1, $a1, 1
	addi 	$t8, $0, RED  
	la	$a2, ($t8)
	
loop:	# draw a grey  pixel
	la	$a2, GREY 
	jal 	draw_pixel
	
	# check for input
	lw $t0, 0xffff0000  #t1 holds if input available
    	beq $t0, 0, loop   #If no input, keep displaying
	
	# process input
	lw 	$s1, 0xffff0004
	beq	$s1, 32, exitAnimationSetOne	# input space
	beq	$s1, 119, up 	# input w
	beq	$s1, 115, down 	# input s
	beq	$s1, 97, left  	# input a
	beq	$s1, 100, right	# input d
	
	# keys used to red the input to change the current color
	beq	$s1, 48, colorChangeBlack # input 0
	beq	$s1, 49, colorChangeRed	# input 1
	beq	$s1, 50, colorChangeGreen # input 2
	beq	$s1, 51, colorChangeBlue # input 3
	beq	$s1, 52, colorChangeWhite # input 4
	beq	$s1, 53, colorChangeYellow # input 5
	beq	$s1, 54, colorChangeCyan # input 6
	beq	$s1, 55, colorChangeMagenta # input 7
	beq	$s1, 56, colorChangePurple # input 8
	beq	$s1, 57, colorChangeOrange # input 9
	
	# keys used for funtionality in the program
	beq	$s1, 98, backgroundColorChange # input b
	beq	$s1, 114, fullReset # input r
	beq	$s1, 99, centerPixel # input c
	
	# used as a checker for the center pixel function
	li	$t3, 0
	
	# invalid input, ignore
	j	loop
	
	# process valid input
	
	# changes the current color to red and prints the confirmation message
colorChangeRed:
	addi 	$t8, $0, RED  #loads red into the current pixel color
	la	$a2, ($t8)
	j	colorChangeRedConfirm
	
colorChangeRedConfirm:
	# Saves the current pixel xy values
	la	$t7, ($a0)
	la	$t6, ($a1)
	la 	$a0, redColorChangeMsg
	la	$a1, space
	li 	$v0, 59
	syscall
	# restores the previous pixel xy values
	la	$a0, ($t7)
	la	$a1, ($t6)
	j	loop
	
	# changes the current color to green and prints the confirmation message
colorChangeGreen:
	addi 	$t8, $0, GREEN #loads green into the current pixel color
	la	$a2, ($t8)
	j	colorChangeGreenConfirm
	
colorChangeGreenConfirm:
	# Saves the current pixel xy values
	la	$t7, ($a0)
	la	$t6, ($a1)
	la 	$a0, greenColorChangeMsg
	la	$a1, space
	li 	$v0, 59
	syscall
	# restores the previous pixel xy values
	la	$a0, ($t7)
	la	$a1, ($t6)
	j	loop
	
	# changes the current color to blue and prints the confirmation message
colorChangeBlue:
	addi 	$t8, $0, BLUE #loads blue into the current pixel color
	la	$a2, ($t8)
	j	colorChangeBlueConfirm
	
colorChangeBlueConfirm:
	# Saves the current pixel xy values
	la	$t7, ($a0)
	la	$t6, ($a1)
	la 	$a0, blueColorChangeMsg
	la	$a1, space
	li 	$v0, 59
	syscall
	# restores the previous pixel xy values
	la	$a0, ($t7)
	la	$a1, ($t6)
	j	loop
	
	# changes the current color to white and prints the confirmation message
colorChangeWhite:
	addi 	$t8, $0, WHITE #loads white into the current pixel color
	la	$a2, ($t8)
	j	colorChangeWhiteConfirm
	
colorChangeWhiteConfirm:
	# Saves the current pixel xy values
	la 	$t7, ($a0)
	la	$t6, ($a1)
	la 	$a0, whiteColorChangeMsg
	la	$a1, space
	li 	$v0, 59
	syscall
	# restores the previous pixel xy values
	la	$a0, ($t7)
	la	$a1, ($t6)
	j	loop
	
	# changes the current color to yellow and prints the confirmation message
colorChangeYellow:
	addi 	$t8, $0, YELLOW	#loads yellow into the current pixel color
	la	$a2, ($t8)
	j	colorChangeYellowConfirm
	
colorChangeYellowConfirm:
	# Saves the current pixel xy values
	la	$t7, ($a0)
	la	$t6, ($a1)
	la 	$a0, yellowColorChangeMsg
	la	$a1, space
	li 	$v0, 59
	syscall
	# restores the previous pixel xy values
	la	$a0, ($t7)
	la	$a1, ($t6)
	j	loop
	
	# changes the current color to cyan and prints the confirmation message
colorChangeCyan:
	addi 	$t8, $0, CYAN #loads cyan into the current pixel color
	la	$a2, ($t8)
	j	colorChangeCyanConfirm
	
colorChangeCyanConfirm:
	# Saves the current pixel xy values
	la	$t7, ($a0)
	la	$t6, ($a1)
	la 	$a0, cyanColorChangeMsg
	la	$a1, space
	li 	$v0, 59
	syscall
	# restores the previous pixel xy values
	la	$a0, ($t7)
	la	$a1, ($t6)
	j	loop
	
	# changes the current color to magenta and prints the confirmation message
colorChangeMagenta:
	addi 	$t8, $0, MAGENTA #loads magenta into the current pixel color
	la	$a2, ($t8)
	j	colorChangeMagentaConfirm
	
colorChangeMagentaConfirm:
	# Saves the current pixel xy values
	la	$t7, ($a0)
	la	$t6, ($a1)
	la 	$a0, magentaColorChangeMsg
	la	$a1, space
	li 	$v0, 59
	syscall
	# restores the previous pixel xy values
	la	$a0, ($t7)
	la	$a1, ($t6)
	j	loop
	
	# changes the current color to purple and prints the confirmation message
colorChangePurple:
	addi 	$t8, $0, PURPLE #loads purple into the current pixel color
	la	$a2, ($t8)
	j	colorChangePurpleConfirm
	
colorChangePurpleConfirm:
	# Saves the current pixel xy values
	la	$t7, ($a0)
	la	$t6, ($a1)
	la 	$a0, purpleColorChangeMsg
	la	$a1, space
	li	$v0, 59
	syscall
	# restores the previous pixel xy values
	la	$a0, ($t7)
	la	$a1, ($t6)
	j	loop

	# changes the current color to orange and prints the confirmation message
colorChangeOrange:
	addi 	$t8, $0, ORANGE #loads orange into the current pixel color
	la	$a2, ($t8)
	j	colorChangeOrangeConfirm
	
colorChangeOrangeConfirm:
	# Saves the current pixel xy values
	la	$t7, ($a0)
	la	$t6, ($a1)
	la 	$a0, orangeColorChangeMsg
	la	$a1, space
	li 	$v0, 59
	syscall
	# restores the previous pixel xy values
	la	$a0, ($t7)
	la	$a1, ($t6)
	j	loop
	
	# changes the current color to black and prints the confirmation message
colorChangeBlack:
	addi 	$t8, $0, BLACK #loads black into the current pixel color
	la	$a2, ($t8)
	j	colorChangeBlackConfirm
	
colorChangeBlackConfirm:
	# Saves the current pixel xy values
	la	$t7, ($a0)
	la	$t6, ($a1)
	la 	$a0, blackColorChangeMsg
	la	$a1, space
	li 	$v0, 59
	syscall
	# restores the previous pixel xy values
	la	$a0, ($t7)
	la	$a1, ($t6)
	j	loop
	
	# moves the pixel brush up if w is pressed
up:	
	la	$a2, ($t8)		
	jal	draw_pixel
	addi	$a1, $a1, -1
	la	$a2, ($t8)
	jal	draw_pixel
	j	loop

	# moves the pixel brush down if s is pressed
down:	
	la	$a2, ($t8)		
	jal	draw_pixel
	addi	$a1, $a1, 1
	la	$a2, ($t8)
	jal	draw_pixel
	j	loop
	
	# moves the pixel brush left if a is pressed
left:	
	la	$a2, ($t8)		
	jal	draw_pixel
	addi	$a0, $a0, -1
	la	$a2, ($t8)
	jal	draw_pixel
	j	loop
	
	# moves the pixel brush right if d is pressed
right:	
	la	$a2, ($t8)		
	jal	draw_pixel
	addi	$a0, $a0, 1
	la	$a2, ($t8)
	jal	draw_pixel
	j	loop
	
	# First animation step in the extit frame	
exitAnimationSetOne: 
	# sets the current pixel to the top left		
	addi	$a0, $0, 0
	sra 	$a0, $a0, 1
	addi	$a1, $0, 0
	sra 	$a1, $a1, 1
	
	# sets the limit for the loop
	li	$t5, 0
	li	$t4, 1024
	
	# Draws the first frame of the welcome animation
exitFrameOne:		
	la	$a2, RED	#loads red into the current pixel color	
	jal	draw_pixel
	addi	$a0, $a0, 1
	la	$a2, RED	#loads red into the current pixel color
	jal	draw_pixel
	addi	$t5, $t5, 1
	beq 	$t5, $t4, exitAnimationSetTwo
	j 	exitFrameOne
	
	# Second animation step in the extit frame
exitAnimationSetTwo:
	# delay added for animation effect		
	li $v0, 32
	li $a0, 200
	syscall
	
	# sets the current pixel to the top left
	addi	$a0, $0, 0
	sra 	$a0, $a0, 1
	addi	$a1, $0, 0
	sra 	$a1, $a1, 1
	
	# sets the limit for the loop
	li	$t5, 0
	li	$t4, 1024
	
	# Draws the second frame of the welcome animation
exitFrameTwo:		
	la	$a2, ORANGE	#loads orange into the current pixel color	
	jal	draw_pixel
	addi	$a0, $a0, 1
	la	$a2, ORANGE	#loads orange into the current pixel color
	jal	draw_pixel
	addi	$t5, $t5, 1
	beq 	$t5, $t4, exitAnimationsSetThree
	j 	exitFrameTwo
	
	# Third animation step in the extit frame
exitAnimationsSetThree:	
	# delay added for animation effect	
	li $v0, 32
	li $a0, 200
	syscall
	
	# sets the current pixel to the top left
	addi	$a0, $0, 0
	sra 	$a0, $a0, 1
	addi	$a1, $0, 0
	sra 	$a1, $a1, 1
	
	# sets the limit for the loop
	li	$t5, 0
	li	$t4, 1024
	
	# Draws the third frame of the welcome animation
exitFrameThree:			
	la	$a2, YELLOW		#loads yellow into the current pixel color
	jal	draw_pixel
	addi	$a0, $a0, 1
	la	$a2, YELLOW		#loads yellow into the current pixel color
	jal	draw_pixel
	addi	$t5, $t5, 1
	beq 	$t5, $t4, exitAnimationsSetFour
	j 	exitFrameThree
	
	# Fourth animation step in the extit frame
exitAnimationsSetFour:
	# delay added for animation effect		
	li $v0, 32
	li $a0, 200
	syscall
	
	# sets the current pixel to the top left
	addi	$a0, $0, 0
	sra 	$a0, $a0, 1
	addi	$a1, $0, 0
	sra 	$a1, $a1, 1
	
	# sets the limit for the loop
	li	$t5, 0
	li	$t4, 1024
	
	# Draws the fourth frame of the welcome animation
exitFrameFour:			
	la	$a2, GREEN		#loads green into the current pixel color
	jal	draw_pixel
	addi	$a0, $a0, 1
	la	$a2, GREEN		#loads green into the current pixel color
	jal	draw_pixel
	addi	$t5, $t5, 1
	beq 	$t5, $t4, exitAnimationsSetFive
	j 	exitFrameFour
	
	# Fifth animation step in the extit frame
exitAnimationsSetFive:	
	# delay added for animation effect	
	li $v0, 32
	li $a0, 200
	syscall
	
	# sets the current pixel to the top left
	addi	$a0, $0, 0
	sra 	$a0, $a0, 1
	addi	$a1, $0, 0
	sra 	$a1, $a1, 1
	
	# sets the limit for the loop
	li	$t5, 0
	li	$t4, 1024
		
	# Draws the fifth frame of the welcome animation
exitFrameFive:			
	la	$a2, BLUE		#loads blue into the current pixel color
	jal	draw_pixel
	addi	$a0, $a0, 1
	la	$a2, BLUE		#loads blue into the current pixel color
	jal	draw_pixel
	addi	$t5, $t5, 1
	beq 	$t5, $t4, exitAnimationsSetSix
	j 	exitFrameFive
	
	# Sixth animation step in the extit frame
exitAnimationsSetSix:	
	# delay added for animation effect	
	li $v0, 32
	li $a0, 200
	syscall
	
	# sets the current pixel to the top left
	addi	$a0, $0, 0
	sra 	$a0, $a0, 1
	addi	$a1, $0, 0
	sra 	$a1, $a1, 1
	
	# sets the limit for the loop
	li	$t5, 0
	li	$t4, 1024
	
	# Draws the sixth frame of the welcome animation
exitFrameSix:			
	la	$a2, PURPLE		#loads purple into the current pixel color
	jal	draw_pixel
	addi	$a0, $a0, 1
	la	$a2, PURPLE		#loads purple into the current pixel color
	jal	draw_pixel
	addi	$t5, $t5, 1
	beq 	$t5, $t4, exitAnimationsSetSeven
	j 	exitFrameSix
	
	#Seventh animation step in the extit frame
exitAnimationsSetSeven:	
	# delay added for animation effect	
	li $v0, 32
	li $a0, 200
	syscall
	
	# sets the current pixel to the top left
	addi	$a0, $0, 0
	sra 	$a0, $a0, 1
	addi	$a1, $0, 0
	sra 	$a1, $a1, 1
	
	# sets the limit for the loop
	li	$t5, 0
	li	$t4, 1024
	
	# Draws the seventh frame of the welcome animation
exitFrameSeven:			
	la	$a2, MAGENTA		#loads magenta into the current pixel color
	jal	draw_pixel
	addi	$a0, $a0, 1
	la	$a2, MAGENTA		#loads magenta into the current pixel color
	jal	draw_pixel
	addi	$t5, $t5, 1
	beq 	$t5, $t4, exitAnimationsSetEight
	j 	exitFrameSeven
	
	# Eighth animation step in the extit frame
exitAnimationsSetEight:	
	# delay added for animation effect	
	li $v0, 32
	li $a0, 200
	syscall

	# sets the current pixel to the top left
	addi	$a0, $0, 0
	sra 	$a0, $a0, 1
	addi	$a1, $0, 0
	sra 	$a1, $a1, 1
	
	# sets the limit for the loop
	li	$t5, 0
	li	$t4, 1024
	
	# Draws the eighth frame of the welcome animation
exitFrameEight:			
	la	$a2, BLACK	#loads black into the current pixel color	
	jal	draw_pixel
	addi	$a0, $a0, 1
	la	$a2, BLACK	#loads black into the current pixel color
	jal	draw_pixel
	addi	$t5, $t5, 1
	beq 	$t5, $t4, exitMsg
	j 	exitFrameEight

	# prints an exit message 
exitMsg:		
	la 	$a0, goodbyeMessage
	la	$a1, space
	li 	$v0, 59
	syscall	
	
	# closes the program		
exitCall:	
	li	$v0, 10
	syscall

# $a0 = X
# $a1 = Y
# $a2 = color
draw_pixel:
	# s1 = address = $gp + 4*(x + y*width)
	mul	$t9, $a1, WIDTH   # y * WIDTH
	add	$t9, $t9, $a0	  # add X
	mul	$t9, $t9, 4	  # multiply by 4 to get word offset
	add	$t9, $t9, $gp	  # add to base address
	sw	$a2, ($t9)	  # store color at memory location
	jr 	$ra
	
# sets the canvas back to black and centers the pixel
fullReset: 
	# sets the limit for the loop	
	li	$t5, 0
	li	$t4, 1024
	
	# loads in the color black for the pixel color
	la	$t3, ($t8)
	addi 	$t8, $0, BLACK 
	la	$a2, ($t8)
	
	# sets the current pixel to the top left
	addi	$a0, $0, 0
	sra 	$a0, $a0, 1
	addi	$a1, $0, 0
	sra 	$a1, $a1, 1
	
	j	resetLoop
# loop that resets the background to the original black color
resetLoop:		
	la	$a2, ($t8)		
	jal	draw_pixel
	addi	$a0, $a0, 1
	la	$a2, ($t8)
	jal	draw_pixel
	addi	$t5, $t5, 1
	beq 	$t5, $t4, colorReset
	j 	resetLoop
	
colorReset:
	la	$t8, ($t3)
	# uses t3 as a checker to display the right message when center pixel is called
	li	$t3, 1		
	j	centerPixel
# centers your pixel brush 
centerPixel:
	la	$a2, ($t8)		
	jal	draw_pixel
	addi 	$a0, $0, WIDTH    # a0 = X = WIDTH/2
	sra 	$a0, $a0, 1
	addi 	$a1, $0, HEIGHT   # a1 = Y = HEIGHT/2
	sra 	$a1, $a1, 1
	
	beq	$t3, 1, canvasResetMsg # if t3 is one print the canvas reset msg
	beqz	$t3, centeredPixelMsg # if t3 is zero print the center pixel message
# loop to change color to the background color		
backgroundColorChange:
	# Saves the current pixel xy values
	la	$t7, ($a0)
	la	$t6, ($a1)
	
	# sets a limit for the loop
	li	$t5, 0
	li	$t4, 1024
	
	# decides what message to print out depending on current color
	beq	$t8, RED, backgroundChangeRed
	beq	$t8, GREEN, backgroundChangeGreen
	beq	$t8, BLUE, backgroundChangeBlue
	beq	$t8, WHITE, backgroundChangeWhite
	beq	$t8, YELLOW, backgroundChangeYellow
	beq	$t8, CYAN, backgroundChangeCyan
	beq	$t8, MAGENTA, backgroundChangeMagenta
	beq	$t8, PURPLE, backgroundChangePurple
	beq	$t8, ORANGE, backgroundChangeOrange
	beq	$t8, BLACK, backgroundChangeBlack 
	
	# goes to the top left the bitmap
backgroundColorChangeSetup:
	# sets the current pixel to the top left
	addi	$a0, $0, 0
	sra 	$a0, $a0, 1
	addi	$a1, $0, 0
	sra 	$a1, $a1, 1
	
	# loop that goes line by line to change the color
backgroundLoop:		
	la	$a2, ($t8)		
	jal	draw_pixel
	addi	$a0, $a0, 1
	la	$a2, ($t8)
	jal	draw_pixel
	addi	$t5, $t5, 1
	beq 	$t5, $t4, backgroundReset
	j 	backgroundLoop
	
	# resets pixel brush position to the the postion prior the background change
backgroundReset:
	# restores the previous pixel xy values
	la	$a0, ($t7)
	la	$a1, ($t6)
	j 	loop
	
	# Prints message for magenta background
backgroundChangeMagenta:
	# Saves the current pixel xy values
	la	$t7, ($a0)
	la	$t6, ($a1)
	la 	$a0, magentaBackgroundChangeMsg
	la	$a1, space
	li 	$v0, 59
	syscall
	
	# restores the previous pixel xy values
	la	$a0, ($t7)
	la	$a1, ($t6)
	j	backgroundColorChangeSetup	
	
	# Prints message for red background
backgroundChangeRed:
	# Saves the current pixel xy values
	la	$t7, ($a0)
	la	$t6, ($a1)
	la 	$a0, redBackgroundChangeMsg
	la	$a1, space
	li 	$v0, 59
	syscall
	
	# restores the previous pixel xy values
	la	$a0, ($t7)
	la	$a1, ($t6)
	j	backgroundColorChangeSetup	
	
	# Prints message for green background
backgroundChangeGreen:
	# Saves the current pixel xy values
	la	$t7, ($a0)
	la	$t6, ($a1)
	la 	$a0, greenBackgroundChangeMsg
	la	$a1, space
	li 	$v0, 59
	syscall
	
	# restores the previous pixel xy values
	la	$a0, ($t7)
	la	$a1, ($t6)
	j	backgroundColorChangeSetup	
	
	# Prints message for blue background
backgroundChangeBlue:
	# Saves the current pixel xy values
	la	$t7, ($a0)
	la	$t6, ($a1)
	la 	$a0, blueBackgroundChangeMsg
	la	$a1, space
	li 	$v0, 59
	syscall
	
	# restores the previous pixel xy values
	la	$a0, ($t7)
	la	$a1, ($t6)
	j	backgroundColorChangeSetup	
	
	# Prints message for white background
backgroundChangeWhite:
	# Saves the current pixel xy values
	la	$t7, ($a0)
	la	$t6, ($a1)
	la 	$a0, whiteBackgroundChangeMsg
	la	$a1, space
	li 	$v0, 59
	syscall
	
	# restores the previous pixel xy values
	la	$a0, ($t7)
	la	$a1, ($t6)
	j	backgroundColorChangeSetup	
	
	# Prints message for yellow background
backgroundChangeYellow:
	# Saves the current pixel xy values
	la	$t7, ($a0)
	la	$t6, ($a1)
	la 	$a0, yellowBackgroundChangeMsg
	la	$a1, space
	li 	$v0, 59
	syscall
	
	# restores the previous pixel xy values
	la	$a0, ($t7)
	la	$a1, ($t6)
	j	backgroundColorChangeSetup	
	
	# Prints message for cyan background
backgroundChangeCyan:
	# Saves the current pixel xy values:
	la	$t7, ($a0)
	la	$t6, ($a1)
	la 	$a0, cyanBackgroundChangeMsg
	la	$a1, space
	li 	$v0, 59
	syscall
	
	# restores the previous pixel xy values
	la	$a0, ($t7)
	la	$a1, ($t6)
	j	backgroundColorChangeSetup	
	
	# Prints message for purple background
backgroundChangePurple:
	# Saves the current pixel xy values
	la	$t7, ($a0)
	la	$t6, ($a1)
	la 	$a0, purpleBackgroundChangeMsg
	la	$a1, space
	li 	$v0, 59
	syscall
	
	# restores the previous pixel xy values
	la	$a0, ($t7)
	la	$a1, ($t6)
	j	backgroundColorChangeSetup	
	
	# Prints message for orange background
backgroundChangeOrange:
	# Saves the current pixel xy values
	la	$t7, ($a0)
	la	$t6, ($a1)
	la 	$a0, orangeBackgroundChangeMsg
	la	$a1, space
	li 	$v0, 59
	syscall
	
	# restores the previous pixel xy values
	la	$a0, ($t7)
	la	$a1, ($t6)
	j	backgroundColorChangeSetup	
	
	# Prints message for black background
backgroundChangeBlack:
	# Saves the current pixel xy values
	la	$t7, ($a0)
	la	$t6, ($a1)
	la 	$a0, blackBackgroundChangeMsg
	la	$a1, space
	li 	$v0, 59
	syscall
	
	# restores the previous pixel xy values
	la	$a0, ($t7)
	la	$a1, ($t6)
	j	backgroundColorChangeSetup
		
	# Prints message for centered pixel brush
centeredPixelMsg:
	# Saves the current pixel xy values
	la	$t7, ($a0)
	la	$t6, ($a1)
	la 	$a0, centerPixelMsg
	la	$a1, space
	li 	$v0, 59
	syscall
	
	# restores the previous pixel xy values
	la	$a0, ($t7)
	la	$a1, ($t6)
	j loop

	# Prints message for canvas reset
canvasResetMsg:
	# Saves the current pixel xy values
	la	$t7, ($a0) 
	la	$t6, ($a1)
	la 	$a0, fullResetMsg
	la	$a1, space
	li 	$v0, 59
	syscall
	
	# restores the previous pixel xy values
	la	$a0, ($t7)
	la	$a1, ($t6)
	j loop
	
