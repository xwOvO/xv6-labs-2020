
//fork.c: create a new process

#include "kernel/types.h"
#include "user/user.h"

int main(void){
    int pid = fork();
    if(pid > 0){
        printf("parent: child=%d\n",pid);
        pid = wait((int*) 0);
        printf("child %d is done\n",pid);
    } else if(pid == 0){
        printf("child: exiting\n");
        exit(0);
    } else {
        printf("fork error\n");
    }
    exit(0);
}