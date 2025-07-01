.data
#random generated input from python script
# arr : .float 8543.200734956363, -583.7564186452296 ,-2754.636553907333, 3647.9539166256764 ,-1446.6787970337818 ,-281.7831878895815,1385.0352102102102, 2901.154069507728, -8142.008307181097, 1123.314740104986, -2014.709381473809, -5955.902411539329,25236.103122730572, -776.7793690687698, 1995.3801054231478, -62.62675964909027, 1028.8135245122276, 9809.247116360617,-2325.80950321639, 5799.913407821229, 620.9523550724638, -2874.319851405711, -2548.6485416712735, -112665.99078341013,-5520.035545410076, -2006.9842974628987, 3065.8343272205534, -6928.120853566787, 579.042470441817, -2142.262475758914

#unique Soln
#    arr :   .float -6,4,6,-8,-3,-50, -4,3,4,-4,-9,11, -3,-1,-1,-6,2,-29, -2,-4,6,-5,7,-53, -7,-9,-10,5,9,12
#inf Sol
    # arr :   .float  1,2,3,4,5,6,1,2,3,4,5,6,1,2,5,4,5,6,9,2,3,7,5,9,1,9,3,4,8,6
#no Soln
    #  arr :   .float  1,2,3,4,5,6,1,2,3,4,5,8,9,2,3,7,5,9,1,9,3,4,8,6,1,2,3,4,5,9
  soln_arr : .float  0,0,0,0,0
  errMsg : .asciiz "Diagonal Element cannot be zero\n"
  gaussMat : .asciiz "Matrix in Row Echleon: \n"
  solnAre : .asciiz "Linear System is consistent. Solutions Are: \n"
  xSP     : .asciiz "X["
  xEP    : .asciiz "]: "
  xSpace : .asciiz "    "
  xNewline : .asciiz "\n"
  noSoln  : .asciiz "No solution exists \n"
  infiSoln : .asciiz "Infinitely many solution exists \n"
  temp1 : .asciiz "  	here swap at i    	"
  temp2 : .asciiz "here i_i     "
 

 #only 14 integer register including x0 and x10,x11 for ecall
.text
    main:
   	 la   x1, arr #Initialize base address
   	 la   x2, soln_arr #Initialize base address
   	 addi x8, x0, 5 #array row dimension Size
   	 addi x9, x0, 6 #array column dimension size
   	 addi x3, x0, 0 #Row Index for Loop aka ith
   	 addi x4, x0, 0 # 2nd row Index for loop aka jth
   	 addi x5, x0, 0 #coloumm index for loop aka kth
   	 addi x12, x0,4 # cell size (constant)
   	 addi x13, x0,-1 #register set to -1 for decrement loop till 0

	#forward elimanation
    fwdEliOuterLoop:
		bge x3, x8, endFwdEliOuterLoop #checking condition if i<n then enter else exit loop
		addi x4, x3, 1  	  # j=i+1

		partialPivotOuter:
			bge x4, x8, fwdElimInnerLoop
			mul x6, x3, x9 	#traversing to ith row index 1st cell
			add x6, x6, x3 	#traversing to ith column cell
			mul x6, x6, x12 	#cell size multiply
			add x6, x6, x1	#adding base address of the array
			flw  f12, 0(x6) 	#loading the value of diagonal element
			mul x6, x4, x9	#traversing to jth row index 1st cell
			add x6, x6, x3    #traversing to ith column cell
			mul x6, x6, x12    #cell size multiply
			add x6, x1, x6   #adding base address of the array
			flw f14, 0(x6)     #loading the value
			
			#partial Pivot starts
			fle.s x6, f14,f12   #checking if f12<f14 , if yes x6=1
			beq  x6, x0, swapRow
			addi x4, x4, 1
			addi x5, x0,0
			j partialPivotOuter
			
			#swap ith and jth row
			swapRow:
			bge x5, x9, endParitalPivot
			mul x7, x3, x9	#traversing to jth row index 1st cell
			add x7, x7, x5    #traversing to ith column cell
			mul x7, x7, x12    #cell size multiply
			add x7, x1, x7   #adding base address of the array
			flw f12, 0(x7)     #loading the value
			mul x6, x4, x9	#traversing to jth row index 1st cell
			add x6, x6, x5    #traversing to ith column cell
			mul x6, x6, x12    #cell size multiply
			add x6, x1, x6   #adding base address of the array
			flw f14, 0(x6)     #loading the value
			fsw f14, 0(x7)
			fsw f12, 0(x6)
			addi x5,x5,1
			j swapRow

			endParitalPivot:
			addi x4,x4,1
			addi x5, x5, 0
			j partialPivotOuter
			#end partial pivot

			#row echelon form creation
		fwdElimInnerLoop:
			addi x4,x3,1
			addi x5,x0,0
			mul x6, x3, x9 	#traversing to ith row index 1st cell
			add x6, x6, x3 	#traversing to ith column cell
			mul x6, x6, x12 	#cell size multiply
			add x6, x6, x1	#adding base address of the array
			flw  f12, 0(x6)	#loading the value of diagonal element
			feq.s x6, f12,f0	#checking if ith diagonal element = 0
			bne x6,x0, checkForSingular
			
			begRowOperation:
				bge x4, x8, endRowOperation	#checking if j<n then enter else the current loop
				addi x5, x0, 0 #resetting column index
				#fetch 1st element for ratio
				mul x6, x4, x9	#traversing to jth row index 1st cell
				add x6, x6, x3    #traversing to ith column cell
				mul x6, x6, x12    #cell size multiply
				add x6, x1, x6   #adding base address of the array
				flw f14, 0(x6)     #loading the value
				fdiv.s f18, f14,f12	#getting ratio a[j][i]/a[i][i] and stored in f18
				
				begInnerRowOperation:
					beq x5, x9, endInnerRowOperation
					#load ith row kth column value
					mul x6, x3, x9   #traversing to ith row index 1st cell
					add x6, x6, x5   #traversing to kth column cell
					mul x6, x6, x12   #cell size multiply
					add x6, x1,x6   #adding base address of the array
					flw f22, 0(x6)    #loading the value to f22
					#load jth row kth column value
					mul x6, x4, x9   #traversing to jth row index 1st cell
					add x6, x6, x5   #traversing to kth column cell
					mul x6, x6, x12   #cell size multiply
					add x6, x6, x1  #adding base address of the array
					flw f16, 0(x6)    #loading the value to f16
					#changing the value of Jth row and kth columm
					fmul.s f22, f18, f22 #f22= ratio * a[i][k]
					fsub.s f16, f16, f22 #f16 = a[j][k]- f22
					#store the value
					fsw f16, 0(x6)  	  #storing the value back to memory address
					addi x5, x5,1
					j begInnerRowOperation

					endInnerRowOperation:
					addi x4, x4, 1
					j begRowOperation  

				endRowOperation:
				addi x3, x3,1
   	 j fwdEliOuterLoop

    endFwdEliOuterLoop:
   	 addi x3, x0, 0	#Row Index for Loop aka ith
   	 addi x4, x0, 0	#Column Index for Loop aka jth
   	 addi x13, x9, -1 #x27= columm size -1
 	 addi a0, x0, 4
   	 la a1,gaussMat
   	 ecall

	#printiing upper traingular matrix
    printGaussian:
 	 #load Jth value of Ith row
   	 bge x4, x9, endGaussianPrint
   	 mul x6, x3, x9    #traversing to ith row index 1st cell
   	 add x6, x6, x4    #traversing to jth column cell
   	 mul x6, x6, x12    #cell size multiply
   	 add x6, x6, x1   #adding base address of the array
   	 flw f16, 0(x6)    #loading the value to f16
   	 addi a0,x0,34
   	 lw a1 , 0(x6)
   	 ecall
   	 addi a0, x0, 4
   	 la a1,xSpace
   	 ecall
   	 addi x4,x4,1
   	 j printGaussian
    
    endGaussianPrint:
	 addi a0, x0, 4
   	 la a1,xNewline
   	 ecall
   	 addi x3,x3,1
   	 addi x4, x0, 0
   	 bge x3,x8, begBackSubs
   	 j printGaussian
    
	#back substituion
    begBackSubs:
   	 addi x3, x8, -1  #i=n-1
   	 addi x4, x8, -1  #j=n-1
	 addi x13, x0,-1 #register set to -1 for decrement loop till 0

	 #back summation for ith iteration
   	 j begBackSubsCalculation

		begBackSubsCalculation:
		ble x3, x13, solnPrint  
		fadd.s f20, f0, f0 #initialize a variable f20 aka sum

		endBackSubsCalculationInner:
		ble x4, x3, endBackSubsCalculation # if j>i then  proceed else jump
		#fetch ith row jth column
		mul x6, x3, x9     #traversing to ith row index 1st cell
		add x6, x6, x4     #traversing to jth column cell
		mul x6, x6, x12     #cell size multiply
		add x6, x1, x6    #adding base address of the array
		flw f14, 0(x6) 	 #loading the value to f14
		#fetch X jth row
		add x6, x4, x0 	 #traversing to jth cell of X matrix
		mul x6, x6, x12     #cell size multiply
		add x6, x2, x6    #adding base address of the array
		flw f22, 0(x6) 	 #loading the value to f14
		fmul.s f22, f22,f14  # f22 = X[j]*a[i][j]
		fadd.s f20, f20, f22 # f20(sum) = f20(sum) + f22
		addi x4, x4, -1  	   #decrement j--
		j endBackSubsCalculationInner

		#Solving for ith element solution matrix X
		endBackSubsCalculation:
		#fetch A ith row nth column
		mul x6, x3, x9 	 #traversing to ith row index 1st cell
		add x6, x6, x9     #traversing to nth column cell
		addi x6, x6, -1
		mul x6, x6, x12 	 #cell size multiply
		add x6, x1, x6     #adding base address of the array
		flw f14, 0(x6)  	 #loading the value A[i][n] to f14
		#fetching diagonal matrix
		mul x6, x3, x9  	#traversing to ith row index 1st cell
		add x6, x6, x3 	 #traversing to ith column cell
		mul x6, x6, x12 	 #cell size multiply
		add x6, x1, x6     #adding base address of the array
		flw  f12, 0(x6) 	 #loading the value A[i][i] to f12
		#calculation
		fsub.s f14, f14, f20  # f14= f14(A[i][n]) - f20(sum)
		fdiv.s f22, f14, f12  #f22 = f14/ f12( A[i][i])
		#fetch X ith row
		add x6, x3, x0  		  #traversing to ith cell of X matrix
		mul x6, x6, x12   	 #cell size multiply
		add x6, x2, x6  	 #adding base address of the array
		fsw f22, 0(x6)		 #loading the value to f14
		addi x4, x8, -1  	 #resetting j = n-1
		addi x3,x3, -1  		  #decrement i--
		j begBackSubsCalculation
	
		#solution Print
		solnPrint:
		addi a0, x0, 4
		la a1,solnAre
		ecall
		addi x3,x0,0
		addi x6, x0,20
		solnPrintLoop:
		#fetch X ith row
		bge x3,x8, endProgram
		add x6, x3, x0
		mul x6, x6, x12
		add x6, x2, x6
		flw f10, 0(x6)
		addi a0,x0,4
		la a1, xSP
		ecall
		addi a0,x0,1
		add a1,x0,x3
		ecall
		addi a0, x0, 4
		la a1,xEP
		ecall
		addi a0,x0,34
		lw a1, 0(x6)
		ecall
		addi a0, x0, 4
		la a1,xSpace
		ecall
		addi x6, x6, -2
		addi x3,x3,1
		j solnPrintLoop

    checkForNoSoln:
   	 addi a0, x0, 4
   	 la a1,noSoln
   	 ecall
   	 j endProgram

    checkForInfiSoln:
   	 addi a0, x0, 4
   	 la a1,infiSoln
   	 ecall
   	 j endProgram

    checkForSingular:
	#load Nth value of Ith row
   	 mul x6, x3, x9     #traversing to ith row index 1st cell
   	 add x6, x6, x9    #traversing to nth column cell
   	 addi x6, x6, -1
   	 mul x6, x6, x12     #cell size multiply
   	 add x6, x6, x1    #adding base address of the array
   	 flw f16, 0(x6) 	 #loading the value to f16
   	 feq.s x6, f16,f0    #checking if f16 == 0 , if yes x6=0
   	 bne  x6, x0, checkForInfiSoln #if x6 =1 implies, element is zero thus whole row is zero. and iterate to next ith row
   	 j checkForNoSoln
      

    endProgram:
   	 li 	 a0, 10   	 # Load system call code for exit
   	 ecall