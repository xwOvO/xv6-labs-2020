//sleep.c

#include "kernel/types.h"
#include "kernel/syscall.h"
#include "user/user.h"

int main(int argc,char* argv[]){
    if(argc<1){
        printf("parameter error\n");
    }else{
        sleep(atoi(argv[1]));
    }
    exit(0);
}