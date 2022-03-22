//find.c

#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"
#include "kernel/fs.h"


void find(char* entrance,char* filename){
    char path[64], *p;
    int fd1,fd2;
    struct dirent de;
    struct stat st;
    strcpy(path,entrance);
    p=path+strlen(path);
    *p++='/';
    strcpy(p,filename);
    //printf("%s\n",entrance);
    
    if((fd1=open(path,0))>=0){
       printf("%s\n",path);
    }
    while(read((fd2=open(entrance,0)), &de, sizeof(de)) == sizeof(de)){
            if(de.inum == 0) continue;
            if(!strcmp(de.name,".")||!strcmp(de.name,"..")) continue;
            char tempath[64];
            strcpy(tempath,entrance);
            p=tempath+strlen(tempath);
            *p++='/';
            strcpy(p,de.name);
            stat(tempath,&st);
            if(st.type==T_DIR) find(tempath,filename);
            printf("%s %d %d %d\n", tempath, st.type, st.ino, st.size);
        }
    //char buf[64];read(fd,buf,sizeof(buf));write(1,buf,sizeof(buf));
    close(fd1);
    close(fd2);
}

int main(int argc,char *argv[]){

    find(argv[1],argv[2]);
    
    exit(0);
}