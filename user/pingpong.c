//pingpong.c
#include "kernel/types.h"
#include "user/user.h"

int main(void){
    char byte = 'a';
    int p1[2],p2[2];
    pipe(p1);
    pipe(p2);
    if(fork()==0){
        close(p1[1]);
        close(p2[0]);
        if(read(p1[0],&byte,sizeof(byte))!=sizeof(byte)){
            printf("child process read fail!\n");
            exit(1);
        }
        close(p1[0]);
        printf("%d: received ping\n",getpid());
        if(write(p2[1],&byte,sizeof(byte))!=sizeof(byte)){
            printf("child process write fail!\n");
            exit(1);
        }
        close(p2[1]);
        exit(0);
    }else{
        close(p1[0]);
        close(p2[1]);
        if(write(p1[1],&byte,sizeof(byte))!=sizeof(byte)){
            printf("parent process write fail!\n");
            exit(1);
        }
        close(p1[1]);
        if(read(p2[0],&byte,sizeof(byte))!=sizeof(byte)){
            printf("parent process read fail!\n");
            exit(1);
        }
        close(p2[0]);
        printf("%d: received pong\n",getpid());
        exit(0);
    }
    
    exit(0);
}