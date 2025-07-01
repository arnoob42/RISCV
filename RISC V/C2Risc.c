#include<conio.h>
#include<math.h>
#include<stdlib.h>
#include<string.h>
int puts(const char *s); 

int main()
{
    int i,j,k, n=5;
    float A[5][6] = {
                        {1,2,3,4,5,6},
                        {3,2,3,4,5,3},
                        {1,2,5,4,5,6},
                        {9,2,3,7,5,9},
                        {1,9,3,4,8,6}};
    float x[5] ={0,0,0,0,0},ratio,sum=0.0;

    for (i = 0; i < n; i++) {
    if (A[i][i] == 0.0) {
      if(A[i][n]!=0.0)
      {
        printf("No Solution");
        exit(0);
      }
      else{
        printf("May Have infinite Solution");
        exit(0);
      }

    } else {
      for (int j = i + 1; j < n; j++) {
        ratio = A[j][i] / A[i][i];

        for (int k = 0; k < n + 1; k++) {
          A[j][k] = A[j][k] - ratio * A[i][k];
        }
      }

    }

  }


  for (i = n - 1; i >= 0; i--) {
    sum = 0.0;
    for (j = n - 1; j > i; j--) {
      sum = sum + x[j] * A[i][j];
    }
    x[i] = (A[i][n] - sum) / A[i][i];
  }

  puts("\nSolution:\n");
  for (i = 0; i < n; i++) {
    puts("X["+i);
  }
  return (0);
}