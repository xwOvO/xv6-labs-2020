//xargs.c

#include "kernel/types.h"
#include "kernel/param.h"
#include "user/user.h"

int main(int argc,char* argv[]){
    char* newargv[32];
    
    char buf[512];
    if(argc < 2){
        fprintf(2,"please input arguments\n");
        exit(0);
    }
    if(argc >= 2){
        newargv[0]=argv[1];
        int i;
        for(i=2;i<argc;++i){
            newargv[i-1]=argv[i];
        }

    }
    
    int numArg=argc-1;
    char* p = buf;
    while((read(0,p,1))>0){
        if(*p=='\n'){
            *p=0;
            if(fork()==0){
                newargv[numArg]=buf;
                exec(newargv[0],newargv);
            }else{
                wait(0);
            }
            p=buf;
        }else{
            ++p;
        }
    }
    exit(0);
}