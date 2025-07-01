  n=5;
//    for(i=1;i<=n-1;i++)
// 	 {   n=5;
//         if(A[i][i] == 0.0)
// 		  {     printf("Test %d \n", n);
// 			   printf("Mathematical Error!");
// 			   exit(0);
// 		  }
// 		  for(j=i+1;j<=n;j++)
// 		  {
// 			   ratio = A[j][i]/A[i][i];
			   
// 			   for(k=1;k<n+1;k++)
// 			   {
// 			  		A[j][k] = A[j][k] - ratio*A[i][k];
// 			   }
              
// 		  }
          
// 	 }
     
//     printf("Test %d  \n", n);
    

// 	 /* Obtaining Solution by Back Subsitution */
// 	 x[n] = A[n][n+1]/A[n][n];
	
// 	 for(i=n-1;i>=1;i--)
// 	 {   n=5;
// 		  x[i] = A[i][n+1];
// 		  for(j=i+1;j<=n;j++)
// 		  {
// 		  		x[i] = x[i] - A[i][j]*x[j];
// 		  }
// 		  x[i] = x[i]/A[i][i];
// 	 }
// 	 /* Displaying Solution */ 
// 	 printf("\nSolution:\n");
// 	 for(i=1;i<=n;i++)
// 	 {
// 	  	printf("x[%d] = %0.10f\n",i, x[i]);
// 	 }