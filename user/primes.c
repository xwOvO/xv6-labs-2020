//primes.c
#include "kernel/types.h"
#include "user/user.h"
#include "kernel/stat.h"

int main(){
    static int number=2;
    
    while(number++<=35){
        int p[2];
        pipe(p);
        int pid=fork();   
        if(pid==0){
            close(p[1]);
            if(read(p[0],&number,sizeof(number))==0){
                printf("child process read fail!\n");
                exit(1);
            }else{
                int tn=2;
                while(tn<number){
                    if(number%tn==0)
                        break;
                    tn++;
                }
                if(tn==number){
                    printf("prime %d\n",number);
                }
                close(p[0]);
            }
        }else if(pid>0){
            close(p[0]);
            if(write(p[1],&number,sizeof(number))==0){
                printf("parent process write fail!\n");
                exit(1);
            }
            close(p[1]);
            wait((int*)0);
            exit(0);
        }else{
            printf("fork fail!\n");
            exit(1);
        }
    }
    exit(0);
}