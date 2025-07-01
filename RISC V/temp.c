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
      puts("Mathematical Error!");
      exit(0);
    } else {
      for (int j = i + 1; j < n; j++) {
        ratio = A[j][i] / A[i][i];

        for (int k = 0; k < n + 1; k++) {
          A[j][k] = A[j][k] - ratio * A[i][k];
        }
      }

    }

  }

int rankA=0,rankAB=0;
      for (int i = 0; i < n; i++) {
        
        for (int j = n-2; j >=0; j--) {
            if (A[i][j] != 0) {
                rankA = rankA + 1;
                break;
            }
        }
    }
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N + 1; j++) {
            if (mat[i][j] != 0) {
                rankAB = rankAB + 1;
                break;
            }
        }
    }



  return (0);
}