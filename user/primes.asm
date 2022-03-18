
user/_primes:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
//primes.c
#include "kernel/types.h"
#include "user/user.h"
#include "kernel/stat.h"

int main(){
   0:	7139                	addi	sp,sp,-64
   2:	fc06                	sd	ra,56(sp)
   4:	f822                	sd	s0,48(sp)
   6:	f426                	sd	s1,40(sp)
   8:	f04a                	sd	s2,32(sp)
   a:	ec4e                	sd	s3,24(sp)
   c:	e852                	sd	s4,16(sp)
   e:	0080                	addi	s0,sp,64
    static int number=2;
    
    while(number++<=35){
  10:	00001717          	auipc	a4,0x1
  14:	95c70713          	addi	a4,a4,-1700 # 96c <number.1087>
  18:	431c                	lw	a5,0(a4)
  1a:	0017869b          	addiw	a3,a5,1
  1e:	c314                	sw	a3,0(a4)
  20:	02300713          	li	a4,35
  24:	12f74863          	blt	a4,a5,154 <main+0x154>
        int p[2];
        pipe(p);
        int pid=fork();   
        if(pid==0){
            close(p[1]);
            if(read(p[0],&number,sizeof(number))==0){
  28:	00001497          	auipc	s1,0x1
  2c:	94448493          	addi	s1,s1,-1724 # 96c <number.1087>
                printf("child process read fail!\n");
                exit(1);
            }else{
                int tn=2;
                while(tn<number){
  30:	4909                	li	s2,2
                    if(number%tn==0)
                        break;
                    tn++;
                }
                if(tn==number){
                    printf("prime %d\n",number);
  32:	00001a17          	auipc	s4,0x1
  36:	8dea0a13          	addi	s4,s4,-1826 # 910 <malloc+0x106>
    while(number++<=35){
  3a:	02300993          	li	s3,35
  3e:	a825                	j	76 <main+0x76>
                printf("child process read fail!\n");
  40:	00001517          	auipc	a0,0x1
  44:	8b050513          	addi	a0,a0,-1872 # 8f0 <malloc+0xe6>
  48:	00000097          	auipc	ra,0x0
  4c:	704080e7          	jalr	1796(ra) # 74c <printf>
                exit(1);
  50:	4505                	li	a0,1
  52:	00000097          	auipc	ra,0x0
  56:	382080e7          	jalr	898(ra) # 3d4 <exit>
                if(tn==number){
  5a:	07258963          	beq	a1,s2,cc <main+0xcc>
                }
                close(p[0]);
  5e:	fc842503          	lw	a0,-56(s0)
  62:	00000097          	auipc	ra,0x0
  66:	39a080e7          	jalr	922(ra) # 3fc <close>
    while(number++<=35){
  6a:	409c                	lw	a5,0(s1)
  6c:	0017871b          	addiw	a4,a5,1
  70:	c098                	sw	a4,0(s1)
  72:	0ef9c163          	blt	s3,a5,154 <main+0x154>
        pipe(p);
  76:	fc840513          	addi	a0,s0,-56
  7a:	00000097          	auipc	ra,0x0
  7e:	36a080e7          	jalr	874(ra) # 3e4 <pipe>
        int pid=fork();   
  82:	00000097          	auipc	ra,0x0
  86:	34a080e7          	jalr	842(ra) # 3cc <fork>
        if(pid==0){
  8a:	e539                	bnez	a0,d8 <main+0xd8>
            close(p[1]);
  8c:	fcc42503          	lw	a0,-52(s0)
  90:	00000097          	auipc	ra,0x0
  94:	36c080e7          	jalr	876(ra) # 3fc <close>
            if(read(p[0],&number,sizeof(number))==0){
  98:	4611                	li	a2,4
  9a:	85a6                	mv	a1,s1
  9c:	fc842503          	lw	a0,-56(s0)
  a0:	00000097          	auipc	ra,0x0
  a4:	34c080e7          	jalr	844(ra) # 3ec <read>
  a8:	dd41                	beqz	a0,40 <main+0x40>
                while(tn<number){
  aa:	408c                	lw	a1,0(s1)
  ac:	fab957e3          	bge	s2,a1,5a <main+0x5a>
                    if(number%tn==0)
  b0:	0015f793          	andi	a5,a1,1
  b4:	d7cd                	beqz	a5,5e <main+0x5e>
                int tn=2;
  b6:	874a                	mv	a4,s2
                    tn++;
  b8:	0017079b          	addiw	a5,a4,1
  bc:	0007871b          	sext.w	a4,a5
                while(tn<number){
  c0:	00b70663          	beq	a4,a1,cc <main+0xcc>
                    if(number%tn==0)
  c4:	02f5e7bb          	remw	a5,a1,a5
  c8:	fbe5                	bnez	a5,b8 <main+0xb8>
  ca:	bf51                	j	5e <main+0x5e>
                    printf("prime %d\n",number);
  cc:	8552                	mv	a0,s4
  ce:	00000097          	auipc	ra,0x0
  d2:	67e080e7          	jalr	1662(ra) # 74c <printf>
  d6:	b761                	j	5e <main+0x5e>
            }
        }else if(pid>0){
  d8:	06a05163          	blez	a0,13a <main+0x13a>
            close(p[0]);
  dc:	fc842503          	lw	a0,-56(s0)
  e0:	00000097          	auipc	ra,0x0
  e4:	31c080e7          	jalr	796(ra) # 3fc <close>
            if(write(p[1],&number,sizeof(number))==0){
  e8:	4611                	li	a2,4
  ea:	00001597          	auipc	a1,0x1
  ee:	88258593          	addi	a1,a1,-1918 # 96c <number.1087>
  f2:	fcc42503          	lw	a0,-52(s0)
  f6:	00000097          	auipc	ra,0x0
  fa:	2fe080e7          	jalr	766(ra) # 3f4 <write>
  fe:	ed11                	bnez	a0,11a <main+0x11a>
                printf("parent process write fail!\n");
 100:	00001517          	auipc	a0,0x1
 104:	82050513          	addi	a0,a0,-2016 # 920 <malloc+0x116>
 108:	00000097          	auipc	ra,0x0
 10c:	644080e7          	jalr	1604(ra) # 74c <printf>
                exit(1);
 110:	4505                	li	a0,1
 112:	00000097          	auipc	ra,0x0
 116:	2c2080e7          	jalr	706(ra) # 3d4 <exit>
            }
            close(p[1]);
 11a:	fcc42503          	lw	a0,-52(s0)
 11e:	00000097          	auipc	ra,0x0
 122:	2de080e7          	jalr	734(ra) # 3fc <close>
            wait((int*)0);
 126:	4501                	li	a0,0
 128:	00000097          	auipc	ra,0x0
 12c:	2b4080e7          	jalr	692(ra) # 3dc <wait>
            exit(0);
 130:	4501                	li	a0,0
 132:	00000097          	auipc	ra,0x0
 136:	2a2080e7          	jalr	674(ra) # 3d4 <exit>
        }else{
            printf("fork fail!\n");
 13a:	00001517          	auipc	a0,0x1
 13e:	80650513          	addi	a0,a0,-2042 # 940 <malloc+0x136>
 142:	00000097          	auipc	ra,0x0
 146:	60a080e7          	jalr	1546(ra) # 74c <printf>
            exit(1);
 14a:	4505                	li	a0,1
 14c:	00000097          	auipc	ra,0x0
 150:	288080e7          	jalr	648(ra) # 3d4 <exit>
        }
    }
    exit(0);
 154:	4501                	li	a0,0
 156:	00000097          	auipc	ra,0x0
 15a:	27e080e7          	jalr	638(ra) # 3d4 <exit>

000000000000015e <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
 15e:	1141                	addi	sp,sp,-16
 160:	e422                	sd	s0,8(sp)
 162:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 164:	87aa                	mv	a5,a0
 166:	0585                	addi	a1,a1,1
 168:	0785                	addi	a5,a5,1
 16a:	fff5c703          	lbu	a4,-1(a1)
 16e:	fee78fa3          	sb	a4,-1(a5)
 172:	fb75                	bnez	a4,166 <strcpy+0x8>
    ;
  return os;
}
 174:	6422                	ld	s0,8(sp)
 176:	0141                	addi	sp,sp,16
 178:	8082                	ret

000000000000017a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 17a:	1141                	addi	sp,sp,-16
 17c:	e422                	sd	s0,8(sp)
 17e:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 180:	00054783          	lbu	a5,0(a0)
 184:	cb91                	beqz	a5,198 <strcmp+0x1e>
 186:	0005c703          	lbu	a4,0(a1)
 18a:	00f71763          	bne	a4,a5,198 <strcmp+0x1e>
    p++, q++;
 18e:	0505                	addi	a0,a0,1
 190:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 192:	00054783          	lbu	a5,0(a0)
 196:	fbe5                	bnez	a5,186 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 198:	0005c503          	lbu	a0,0(a1)
}
 19c:	40a7853b          	subw	a0,a5,a0
 1a0:	6422                	ld	s0,8(sp)
 1a2:	0141                	addi	sp,sp,16
 1a4:	8082                	ret

00000000000001a6 <strlen>:

uint
strlen(const char *s)
{
 1a6:	1141                	addi	sp,sp,-16
 1a8:	e422                	sd	s0,8(sp)
 1aa:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 1ac:	00054783          	lbu	a5,0(a0)
 1b0:	cf91                	beqz	a5,1cc <strlen+0x26>
 1b2:	0505                	addi	a0,a0,1
 1b4:	87aa                	mv	a5,a0
 1b6:	4685                	li	a3,1
 1b8:	9e89                	subw	a3,a3,a0
 1ba:	00f6853b          	addw	a0,a3,a5
 1be:	0785                	addi	a5,a5,1
 1c0:	fff7c703          	lbu	a4,-1(a5)
 1c4:	fb7d                	bnez	a4,1ba <strlen+0x14>
    ;
  return n;
}
 1c6:	6422                	ld	s0,8(sp)
 1c8:	0141                	addi	sp,sp,16
 1ca:	8082                	ret
  for(n = 0; s[n]; n++)
 1cc:	4501                	li	a0,0
 1ce:	bfe5                	j	1c6 <strlen+0x20>

00000000000001d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d0:	1141                	addi	sp,sp,-16
 1d2:	e422                	sd	s0,8(sp)
 1d4:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 1d6:	ce09                	beqz	a2,1f0 <memset+0x20>
 1d8:	87aa                	mv	a5,a0
 1da:	fff6071b          	addiw	a4,a2,-1
 1de:	1702                	slli	a4,a4,0x20
 1e0:	9301                	srli	a4,a4,0x20
 1e2:	0705                	addi	a4,a4,1
 1e4:	972a                	add	a4,a4,a0
    cdst[i] = c;
 1e6:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 1ea:	0785                	addi	a5,a5,1
 1ec:	fee79de3          	bne	a5,a4,1e6 <memset+0x16>
  }
  return dst;
}
 1f0:	6422                	ld	s0,8(sp)
 1f2:	0141                	addi	sp,sp,16
 1f4:	8082                	ret

00000000000001f6 <strchr>:

char*
strchr(const char *s, char c)
{
 1f6:	1141                	addi	sp,sp,-16
 1f8:	e422                	sd	s0,8(sp)
 1fa:	0800                	addi	s0,sp,16
  for(; *s; s++)
 1fc:	00054783          	lbu	a5,0(a0)
 200:	cb99                	beqz	a5,216 <strchr+0x20>
    if(*s == c)
 202:	00f58763          	beq	a1,a5,210 <strchr+0x1a>
  for(; *s; s++)
 206:	0505                	addi	a0,a0,1
 208:	00054783          	lbu	a5,0(a0)
 20c:	fbfd                	bnez	a5,202 <strchr+0xc>
      return (char*)s;
  return 0;
 20e:	4501                	li	a0,0
}
 210:	6422                	ld	s0,8(sp)
 212:	0141                	addi	sp,sp,16
 214:	8082                	ret
  return 0;
 216:	4501                	li	a0,0
 218:	bfe5                	j	210 <strchr+0x1a>

000000000000021a <gets>:

char*
gets(char *buf, int max)
{
 21a:	711d                	addi	sp,sp,-96
 21c:	ec86                	sd	ra,88(sp)
 21e:	e8a2                	sd	s0,80(sp)
 220:	e4a6                	sd	s1,72(sp)
 222:	e0ca                	sd	s2,64(sp)
 224:	fc4e                	sd	s3,56(sp)
 226:	f852                	sd	s4,48(sp)
 228:	f456                	sd	s5,40(sp)
 22a:	f05a                	sd	s6,32(sp)
 22c:	ec5e                	sd	s7,24(sp)
 22e:	1080                	addi	s0,sp,96
 230:	8baa                	mv	s7,a0
 232:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 234:	892a                	mv	s2,a0
 236:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 238:	4aa9                	li	s5,10
 23a:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 23c:	89a6                	mv	s3,s1
 23e:	2485                	addiw	s1,s1,1
 240:	0344d863          	bge	s1,s4,270 <gets+0x56>
    cc = read(0, &c, 1);
 244:	4605                	li	a2,1
 246:	faf40593          	addi	a1,s0,-81
 24a:	4501                	li	a0,0
 24c:	00000097          	auipc	ra,0x0
 250:	1a0080e7          	jalr	416(ra) # 3ec <read>
    if(cc < 1)
 254:	00a05e63          	blez	a0,270 <gets+0x56>
    buf[i++] = c;
 258:	faf44783          	lbu	a5,-81(s0)
 25c:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 260:	01578763          	beq	a5,s5,26e <gets+0x54>
 264:	0905                	addi	s2,s2,1
 266:	fd679be3          	bne	a5,s6,23c <gets+0x22>
  for(i=0; i+1 < max; ){
 26a:	89a6                	mv	s3,s1
 26c:	a011                	j	270 <gets+0x56>
 26e:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 270:	99de                	add	s3,s3,s7
 272:	00098023          	sb	zero,0(s3)
  return buf;
}
 276:	855e                	mv	a0,s7
 278:	60e6                	ld	ra,88(sp)
 27a:	6446                	ld	s0,80(sp)
 27c:	64a6                	ld	s1,72(sp)
 27e:	6906                	ld	s2,64(sp)
 280:	79e2                	ld	s3,56(sp)
 282:	7a42                	ld	s4,48(sp)
 284:	7aa2                	ld	s5,40(sp)
 286:	7b02                	ld	s6,32(sp)
 288:	6be2                	ld	s7,24(sp)
 28a:	6125                	addi	sp,sp,96
 28c:	8082                	ret

000000000000028e <stat>:

int
stat(const char *n, struct stat *st)
{
 28e:	1101                	addi	sp,sp,-32
 290:	ec06                	sd	ra,24(sp)
 292:	e822                	sd	s0,16(sp)
 294:	e426                	sd	s1,8(sp)
 296:	e04a                	sd	s2,0(sp)
 298:	1000                	addi	s0,sp,32
 29a:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 29c:	4581                	li	a1,0
 29e:	00000097          	auipc	ra,0x0
 2a2:	176080e7          	jalr	374(ra) # 414 <open>
  if(fd < 0)
 2a6:	02054563          	bltz	a0,2d0 <stat+0x42>
 2aa:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 2ac:	85ca                	mv	a1,s2
 2ae:	00000097          	auipc	ra,0x0
 2b2:	17e080e7          	jalr	382(ra) # 42c <fstat>
 2b6:	892a                	mv	s2,a0
  close(fd);
 2b8:	8526                	mv	a0,s1
 2ba:	00000097          	auipc	ra,0x0
 2be:	142080e7          	jalr	322(ra) # 3fc <close>
  return r;
}
 2c2:	854a                	mv	a0,s2
 2c4:	60e2                	ld	ra,24(sp)
 2c6:	6442                	ld	s0,16(sp)
 2c8:	64a2                	ld	s1,8(sp)
 2ca:	6902                	ld	s2,0(sp)
 2cc:	6105                	addi	sp,sp,32
 2ce:	8082                	ret
    return -1;
 2d0:	597d                	li	s2,-1
 2d2:	bfc5                	j	2c2 <stat+0x34>

00000000000002d4 <atoi>:

int
atoi(const char *s)
{
 2d4:	1141                	addi	sp,sp,-16
 2d6:	e422                	sd	s0,8(sp)
 2d8:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2da:	00054603          	lbu	a2,0(a0)
 2de:	fd06079b          	addiw	a5,a2,-48
 2e2:	0ff7f793          	andi	a5,a5,255
 2e6:	4725                	li	a4,9
 2e8:	02f76963          	bltu	a4,a5,31a <atoi+0x46>
 2ec:	86aa                	mv	a3,a0
  n = 0;
 2ee:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
 2f0:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 2f2:	0685                	addi	a3,a3,1
 2f4:	0025179b          	slliw	a5,a0,0x2
 2f8:	9fa9                	addw	a5,a5,a0
 2fa:	0017979b          	slliw	a5,a5,0x1
 2fe:	9fb1                	addw	a5,a5,a2
 300:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 304:	0006c603          	lbu	a2,0(a3)
 308:	fd06071b          	addiw	a4,a2,-48
 30c:	0ff77713          	andi	a4,a4,255
 310:	fee5f1e3          	bgeu	a1,a4,2f2 <atoi+0x1e>
  return n;
}
 314:	6422                	ld	s0,8(sp)
 316:	0141                	addi	sp,sp,16
 318:	8082                	ret
  n = 0;
 31a:	4501                	li	a0,0
 31c:	bfe5                	j	314 <atoi+0x40>

000000000000031e <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 31e:	1141                	addi	sp,sp,-16
 320:	e422                	sd	s0,8(sp)
 322:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 324:	02b57663          	bgeu	a0,a1,350 <memmove+0x32>
    while(n-- > 0)
 328:	02c05163          	blez	a2,34a <memmove+0x2c>
 32c:	fff6079b          	addiw	a5,a2,-1
 330:	1782                	slli	a5,a5,0x20
 332:	9381                	srli	a5,a5,0x20
 334:	0785                	addi	a5,a5,1
 336:	97aa                	add	a5,a5,a0
  dst = vdst;
 338:	872a                	mv	a4,a0
      *dst++ = *src++;
 33a:	0585                	addi	a1,a1,1
 33c:	0705                	addi	a4,a4,1
 33e:	fff5c683          	lbu	a3,-1(a1)
 342:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 346:	fee79ae3          	bne	a5,a4,33a <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 34a:	6422                	ld	s0,8(sp)
 34c:	0141                	addi	sp,sp,16
 34e:	8082                	ret
    dst += n;
 350:	00c50733          	add	a4,a0,a2
    src += n;
 354:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 356:	fec05ae3          	blez	a2,34a <memmove+0x2c>
 35a:	fff6079b          	addiw	a5,a2,-1
 35e:	1782                	slli	a5,a5,0x20
 360:	9381                	srli	a5,a5,0x20
 362:	fff7c793          	not	a5,a5
 366:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 368:	15fd                	addi	a1,a1,-1
 36a:	177d                	addi	a4,a4,-1
 36c:	0005c683          	lbu	a3,0(a1)
 370:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 374:	fee79ae3          	bne	a5,a4,368 <memmove+0x4a>
 378:	bfc9                	j	34a <memmove+0x2c>

000000000000037a <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 37a:	1141                	addi	sp,sp,-16
 37c:	e422                	sd	s0,8(sp)
 37e:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 380:	ca05                	beqz	a2,3b0 <memcmp+0x36>
 382:	fff6069b          	addiw	a3,a2,-1
 386:	1682                	slli	a3,a3,0x20
 388:	9281                	srli	a3,a3,0x20
 38a:	0685                	addi	a3,a3,1
 38c:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 38e:	00054783          	lbu	a5,0(a0)
 392:	0005c703          	lbu	a4,0(a1)
 396:	00e79863          	bne	a5,a4,3a6 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 39a:	0505                	addi	a0,a0,1
    p2++;
 39c:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 39e:	fed518e3          	bne	a0,a3,38e <memcmp+0x14>
  }
  return 0;
 3a2:	4501                	li	a0,0
 3a4:	a019                	j	3aa <memcmp+0x30>
      return *p1 - *p2;
 3a6:	40e7853b          	subw	a0,a5,a4
}
 3aa:	6422                	ld	s0,8(sp)
 3ac:	0141                	addi	sp,sp,16
 3ae:	8082                	ret
  return 0;
 3b0:	4501                	li	a0,0
 3b2:	bfe5                	j	3aa <memcmp+0x30>

00000000000003b4 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 3b4:	1141                	addi	sp,sp,-16
 3b6:	e406                	sd	ra,8(sp)
 3b8:	e022                	sd	s0,0(sp)
 3ba:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 3bc:	00000097          	auipc	ra,0x0
 3c0:	f62080e7          	jalr	-158(ra) # 31e <memmove>
}
 3c4:	60a2                	ld	ra,8(sp)
 3c6:	6402                	ld	s0,0(sp)
 3c8:	0141                	addi	sp,sp,16
 3ca:	8082                	ret

00000000000003cc <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 3cc:	4885                	li	a7,1
 ecall
 3ce:	00000073          	ecall
 ret
 3d2:	8082                	ret

00000000000003d4 <exit>:
.global exit
exit:
 li a7, SYS_exit
 3d4:	4889                	li	a7,2
 ecall
 3d6:	00000073          	ecall
 ret
 3da:	8082                	ret

00000000000003dc <wait>:
.global wait
wait:
 li a7, SYS_wait
 3dc:	488d                	li	a7,3
 ecall
 3de:	00000073          	ecall
 ret
 3e2:	8082                	ret

00000000000003e4 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 3e4:	4891                	li	a7,4
 ecall
 3e6:	00000073          	ecall
 ret
 3ea:	8082                	ret

00000000000003ec <read>:
.global read
read:
 li a7, SYS_read
 3ec:	4895                	li	a7,5
 ecall
 3ee:	00000073          	ecall
 ret
 3f2:	8082                	ret

00000000000003f4 <write>:
.global write
write:
 li a7, SYS_write
 3f4:	48c1                	li	a7,16
 ecall
 3f6:	00000073          	ecall
 ret
 3fa:	8082                	ret

00000000000003fc <close>:
.global close
close:
 li a7, SYS_close
 3fc:	48d5                	li	a7,21
 ecall
 3fe:	00000073          	ecall
 ret
 402:	8082                	ret

0000000000000404 <kill>:
.global kill
kill:
 li a7, SYS_kill
 404:	4899                	li	a7,6
 ecall
 406:	00000073          	ecall
 ret
 40a:	8082                	ret

000000000000040c <exec>:
.global exec
exec:
 li a7, SYS_exec
 40c:	489d                	li	a7,7
 ecall
 40e:	00000073          	ecall
 ret
 412:	8082                	ret

0000000000000414 <open>:
.global open
open:
 li a7, SYS_open
 414:	48bd                	li	a7,15
 ecall
 416:	00000073          	ecall
 ret
 41a:	8082                	ret

000000000000041c <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 41c:	48c5                	li	a7,17
 ecall
 41e:	00000073          	ecall
 ret
 422:	8082                	ret

0000000000000424 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 424:	48c9                	li	a7,18
 ecall
 426:	00000073          	ecall
 ret
 42a:	8082                	ret

000000000000042c <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 42c:	48a1                	li	a7,8
 ecall
 42e:	00000073          	ecall
 ret
 432:	8082                	ret

0000000000000434 <link>:
.global link
link:
 li a7, SYS_link
 434:	48cd                	li	a7,19
 ecall
 436:	00000073          	ecall
 ret
 43a:	8082                	ret

000000000000043c <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 43c:	48d1                	li	a7,20
 ecall
 43e:	00000073          	ecall
 ret
 442:	8082                	ret

0000000000000444 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 444:	48a5                	li	a7,9
 ecall
 446:	00000073          	ecall
 ret
 44a:	8082                	ret

000000000000044c <dup>:
.global dup
dup:
 li a7, SYS_dup
 44c:	48a9                	li	a7,10
 ecall
 44e:	00000073          	ecall
 ret
 452:	8082                	ret

0000000000000454 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 454:	48ad                	li	a7,11
 ecall
 456:	00000073          	ecall
 ret
 45a:	8082                	ret

000000000000045c <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 45c:	48b1                	li	a7,12
 ecall
 45e:	00000073          	ecall
 ret
 462:	8082                	ret

0000000000000464 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 464:	48b5                	li	a7,13
 ecall
 466:	00000073          	ecall
 ret
 46a:	8082                	ret

000000000000046c <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 46c:	48b9                	li	a7,14
 ecall
 46e:	00000073          	ecall
 ret
 472:	8082                	ret

0000000000000474 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 474:	1101                	addi	sp,sp,-32
 476:	ec06                	sd	ra,24(sp)
 478:	e822                	sd	s0,16(sp)
 47a:	1000                	addi	s0,sp,32
 47c:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 480:	4605                	li	a2,1
 482:	fef40593          	addi	a1,s0,-17
 486:	00000097          	auipc	ra,0x0
 48a:	f6e080e7          	jalr	-146(ra) # 3f4 <write>
}
 48e:	60e2                	ld	ra,24(sp)
 490:	6442                	ld	s0,16(sp)
 492:	6105                	addi	sp,sp,32
 494:	8082                	ret

0000000000000496 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 496:	7139                	addi	sp,sp,-64
 498:	fc06                	sd	ra,56(sp)
 49a:	f822                	sd	s0,48(sp)
 49c:	f426                	sd	s1,40(sp)
 49e:	f04a                	sd	s2,32(sp)
 4a0:	ec4e                	sd	s3,24(sp)
 4a2:	0080                	addi	s0,sp,64
 4a4:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4a6:	c299                	beqz	a3,4ac <printint+0x16>
 4a8:	0805c863          	bltz	a1,538 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 4ac:	2581                	sext.w	a1,a1
  neg = 0;
 4ae:	4881                	li	a7,0
 4b0:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 4b4:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 4b6:	2601                	sext.w	a2,a2
 4b8:	00000517          	auipc	a0,0x0
 4bc:	4a050513          	addi	a0,a0,1184 # 958 <digits>
 4c0:	883a                	mv	a6,a4
 4c2:	2705                	addiw	a4,a4,1
 4c4:	02c5f7bb          	remuw	a5,a1,a2
 4c8:	1782                	slli	a5,a5,0x20
 4ca:	9381                	srli	a5,a5,0x20
 4cc:	97aa                	add	a5,a5,a0
 4ce:	0007c783          	lbu	a5,0(a5)
 4d2:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 4d6:	0005879b          	sext.w	a5,a1
 4da:	02c5d5bb          	divuw	a1,a1,a2
 4de:	0685                	addi	a3,a3,1
 4e0:	fec7f0e3          	bgeu	a5,a2,4c0 <printint+0x2a>
  if(neg)
 4e4:	00088b63          	beqz	a7,4fa <printint+0x64>
    buf[i++] = '-';
 4e8:	fd040793          	addi	a5,s0,-48
 4ec:	973e                	add	a4,a4,a5
 4ee:	02d00793          	li	a5,45
 4f2:	fef70823          	sb	a5,-16(a4)
 4f6:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 4fa:	02e05863          	blez	a4,52a <printint+0x94>
 4fe:	fc040793          	addi	a5,s0,-64
 502:	00e78933          	add	s2,a5,a4
 506:	fff78993          	addi	s3,a5,-1
 50a:	99ba                	add	s3,s3,a4
 50c:	377d                	addiw	a4,a4,-1
 50e:	1702                	slli	a4,a4,0x20
 510:	9301                	srli	a4,a4,0x20
 512:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 516:	fff94583          	lbu	a1,-1(s2)
 51a:	8526                	mv	a0,s1
 51c:	00000097          	auipc	ra,0x0
 520:	f58080e7          	jalr	-168(ra) # 474 <putc>
  while(--i >= 0)
 524:	197d                	addi	s2,s2,-1
 526:	ff3918e3          	bne	s2,s3,516 <printint+0x80>
}
 52a:	70e2                	ld	ra,56(sp)
 52c:	7442                	ld	s0,48(sp)
 52e:	74a2                	ld	s1,40(sp)
 530:	7902                	ld	s2,32(sp)
 532:	69e2                	ld	s3,24(sp)
 534:	6121                	addi	sp,sp,64
 536:	8082                	ret
    x = -xx;
 538:	40b005bb          	negw	a1,a1
    neg = 1;
 53c:	4885                	li	a7,1
    x = -xx;
 53e:	bf8d                	j	4b0 <printint+0x1a>

0000000000000540 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 540:	7119                	addi	sp,sp,-128
 542:	fc86                	sd	ra,120(sp)
 544:	f8a2                	sd	s0,112(sp)
 546:	f4a6                	sd	s1,104(sp)
 548:	f0ca                	sd	s2,96(sp)
 54a:	ecce                	sd	s3,88(sp)
 54c:	e8d2                	sd	s4,80(sp)
 54e:	e4d6                	sd	s5,72(sp)
 550:	e0da                	sd	s6,64(sp)
 552:	fc5e                	sd	s7,56(sp)
 554:	f862                	sd	s8,48(sp)
 556:	f466                	sd	s9,40(sp)
 558:	f06a                	sd	s10,32(sp)
 55a:	ec6e                	sd	s11,24(sp)
 55c:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 55e:	0005c903          	lbu	s2,0(a1)
 562:	18090f63          	beqz	s2,700 <vprintf+0x1c0>
 566:	8aaa                	mv	s5,a0
 568:	8b32                	mv	s6,a2
 56a:	00158493          	addi	s1,a1,1
  state = 0;
 56e:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 570:	02500a13          	li	s4,37
      if(c == 'd'){
 574:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 578:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 57c:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 580:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 584:	00000b97          	auipc	s7,0x0
 588:	3d4b8b93          	addi	s7,s7,980 # 958 <digits>
 58c:	a839                	j	5aa <vprintf+0x6a>
        putc(fd, c);
 58e:	85ca                	mv	a1,s2
 590:	8556                	mv	a0,s5
 592:	00000097          	auipc	ra,0x0
 596:	ee2080e7          	jalr	-286(ra) # 474 <putc>
 59a:	a019                	j	5a0 <vprintf+0x60>
    } else if(state == '%'){
 59c:	01498f63          	beq	s3,s4,5ba <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 5a0:	0485                	addi	s1,s1,1
 5a2:	fff4c903          	lbu	s2,-1(s1)
 5a6:	14090d63          	beqz	s2,700 <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 5aa:	0009079b          	sext.w	a5,s2
    if(state == 0){
 5ae:	fe0997e3          	bnez	s3,59c <vprintf+0x5c>
      if(c == '%'){
 5b2:	fd479ee3          	bne	a5,s4,58e <vprintf+0x4e>
        state = '%';
 5b6:	89be                	mv	s3,a5
 5b8:	b7e5                	j	5a0 <vprintf+0x60>
      if(c == 'd'){
 5ba:	05878063          	beq	a5,s8,5fa <vprintf+0xba>
      } else if(c == 'l') {
 5be:	05978c63          	beq	a5,s9,616 <vprintf+0xd6>
      } else if(c == 'x') {
 5c2:	07a78863          	beq	a5,s10,632 <vprintf+0xf2>
      } else if(c == 'p') {
 5c6:	09b78463          	beq	a5,s11,64e <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 5ca:	07300713          	li	a4,115
 5ce:	0ce78663          	beq	a5,a4,69a <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5d2:	06300713          	li	a4,99
 5d6:	0ee78e63          	beq	a5,a4,6d2 <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 5da:	11478863          	beq	a5,s4,6ea <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5de:	85d2                	mv	a1,s4
 5e0:	8556                	mv	a0,s5
 5e2:	00000097          	auipc	ra,0x0
 5e6:	e92080e7          	jalr	-366(ra) # 474 <putc>
        putc(fd, c);
 5ea:	85ca                	mv	a1,s2
 5ec:	8556                	mv	a0,s5
 5ee:	00000097          	auipc	ra,0x0
 5f2:	e86080e7          	jalr	-378(ra) # 474 <putc>
      }
      state = 0;
 5f6:	4981                	li	s3,0
 5f8:	b765                	j	5a0 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 5fa:	008b0913          	addi	s2,s6,8
 5fe:	4685                	li	a3,1
 600:	4629                	li	a2,10
 602:	000b2583          	lw	a1,0(s6)
 606:	8556                	mv	a0,s5
 608:	00000097          	auipc	ra,0x0
 60c:	e8e080e7          	jalr	-370(ra) # 496 <printint>
 610:	8b4a                	mv	s6,s2
      state = 0;
 612:	4981                	li	s3,0
 614:	b771                	j	5a0 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 616:	008b0913          	addi	s2,s6,8
 61a:	4681                	li	a3,0
 61c:	4629                	li	a2,10
 61e:	000b2583          	lw	a1,0(s6)
 622:	8556                	mv	a0,s5
 624:	00000097          	auipc	ra,0x0
 628:	e72080e7          	jalr	-398(ra) # 496 <printint>
 62c:	8b4a                	mv	s6,s2
      state = 0;
 62e:	4981                	li	s3,0
 630:	bf85                	j	5a0 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 632:	008b0913          	addi	s2,s6,8
 636:	4681                	li	a3,0
 638:	4641                	li	a2,16
 63a:	000b2583          	lw	a1,0(s6)
 63e:	8556                	mv	a0,s5
 640:	00000097          	auipc	ra,0x0
 644:	e56080e7          	jalr	-426(ra) # 496 <printint>
 648:	8b4a                	mv	s6,s2
      state = 0;
 64a:	4981                	li	s3,0
 64c:	bf91                	j	5a0 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 64e:	008b0793          	addi	a5,s6,8
 652:	f8f43423          	sd	a5,-120(s0)
 656:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 65a:	03000593          	li	a1,48
 65e:	8556                	mv	a0,s5
 660:	00000097          	auipc	ra,0x0
 664:	e14080e7          	jalr	-492(ra) # 474 <putc>
  putc(fd, 'x');
 668:	85ea                	mv	a1,s10
 66a:	8556                	mv	a0,s5
 66c:	00000097          	auipc	ra,0x0
 670:	e08080e7          	jalr	-504(ra) # 474 <putc>
 674:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 676:	03c9d793          	srli	a5,s3,0x3c
 67a:	97de                	add	a5,a5,s7
 67c:	0007c583          	lbu	a1,0(a5)
 680:	8556                	mv	a0,s5
 682:	00000097          	auipc	ra,0x0
 686:	df2080e7          	jalr	-526(ra) # 474 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 68a:	0992                	slli	s3,s3,0x4
 68c:	397d                	addiw	s2,s2,-1
 68e:	fe0914e3          	bnez	s2,676 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 692:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 696:	4981                	li	s3,0
 698:	b721                	j	5a0 <vprintf+0x60>
        s = va_arg(ap, char*);
 69a:	008b0993          	addi	s3,s6,8
 69e:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 6a2:	02090163          	beqz	s2,6c4 <vprintf+0x184>
        while(*s != 0){
 6a6:	00094583          	lbu	a1,0(s2)
 6aa:	c9a1                	beqz	a1,6fa <vprintf+0x1ba>
          putc(fd, *s);
 6ac:	8556                	mv	a0,s5
 6ae:	00000097          	auipc	ra,0x0
 6b2:	dc6080e7          	jalr	-570(ra) # 474 <putc>
          s++;
 6b6:	0905                	addi	s2,s2,1
        while(*s != 0){
 6b8:	00094583          	lbu	a1,0(s2)
 6bc:	f9e5                	bnez	a1,6ac <vprintf+0x16c>
        s = va_arg(ap, char*);
 6be:	8b4e                	mv	s6,s3
      state = 0;
 6c0:	4981                	li	s3,0
 6c2:	bdf9                	j	5a0 <vprintf+0x60>
          s = "(null)";
 6c4:	00000917          	auipc	s2,0x0
 6c8:	28c90913          	addi	s2,s2,652 # 950 <malloc+0x146>
        while(*s != 0){
 6cc:	02800593          	li	a1,40
 6d0:	bff1                	j	6ac <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 6d2:	008b0913          	addi	s2,s6,8
 6d6:	000b4583          	lbu	a1,0(s6)
 6da:	8556                	mv	a0,s5
 6dc:	00000097          	auipc	ra,0x0
 6e0:	d98080e7          	jalr	-616(ra) # 474 <putc>
 6e4:	8b4a                	mv	s6,s2
      state = 0;
 6e6:	4981                	li	s3,0
 6e8:	bd65                	j	5a0 <vprintf+0x60>
        putc(fd, c);
 6ea:	85d2                	mv	a1,s4
 6ec:	8556                	mv	a0,s5
 6ee:	00000097          	auipc	ra,0x0
 6f2:	d86080e7          	jalr	-634(ra) # 474 <putc>
      state = 0;
 6f6:	4981                	li	s3,0
 6f8:	b565                	j	5a0 <vprintf+0x60>
        s = va_arg(ap, char*);
 6fa:	8b4e                	mv	s6,s3
      state = 0;
 6fc:	4981                	li	s3,0
 6fe:	b54d                	j	5a0 <vprintf+0x60>
    }
  }
}
 700:	70e6                	ld	ra,120(sp)
 702:	7446                	ld	s0,112(sp)
 704:	74a6                	ld	s1,104(sp)
 706:	7906                	ld	s2,96(sp)
 708:	69e6                	ld	s3,88(sp)
 70a:	6a46                	ld	s4,80(sp)
 70c:	6aa6                	ld	s5,72(sp)
 70e:	6b06                	ld	s6,64(sp)
 710:	7be2                	ld	s7,56(sp)
 712:	7c42                	ld	s8,48(sp)
 714:	7ca2                	ld	s9,40(sp)
 716:	7d02                	ld	s10,32(sp)
 718:	6de2                	ld	s11,24(sp)
 71a:	6109                	addi	sp,sp,128
 71c:	8082                	ret

000000000000071e <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 71e:	715d                	addi	sp,sp,-80
 720:	ec06                	sd	ra,24(sp)
 722:	e822                	sd	s0,16(sp)
 724:	1000                	addi	s0,sp,32
 726:	e010                	sd	a2,0(s0)
 728:	e414                	sd	a3,8(s0)
 72a:	e818                	sd	a4,16(s0)
 72c:	ec1c                	sd	a5,24(s0)
 72e:	03043023          	sd	a6,32(s0)
 732:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 736:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 73a:	8622                	mv	a2,s0
 73c:	00000097          	auipc	ra,0x0
 740:	e04080e7          	jalr	-508(ra) # 540 <vprintf>
}
 744:	60e2                	ld	ra,24(sp)
 746:	6442                	ld	s0,16(sp)
 748:	6161                	addi	sp,sp,80
 74a:	8082                	ret

000000000000074c <printf>:

void
printf(const char *fmt, ...)
{
 74c:	711d                	addi	sp,sp,-96
 74e:	ec06                	sd	ra,24(sp)
 750:	e822                	sd	s0,16(sp)
 752:	1000                	addi	s0,sp,32
 754:	e40c                	sd	a1,8(s0)
 756:	e810                	sd	a2,16(s0)
 758:	ec14                	sd	a3,24(s0)
 75a:	f018                	sd	a4,32(s0)
 75c:	f41c                	sd	a5,40(s0)
 75e:	03043823          	sd	a6,48(s0)
 762:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 766:	00840613          	addi	a2,s0,8
 76a:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 76e:	85aa                	mv	a1,a0
 770:	4505                	li	a0,1
 772:	00000097          	auipc	ra,0x0
 776:	dce080e7          	jalr	-562(ra) # 540 <vprintf>
}
 77a:	60e2                	ld	ra,24(sp)
 77c:	6442                	ld	s0,16(sp)
 77e:	6125                	addi	sp,sp,96
 780:	8082                	ret

0000000000000782 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 782:	1141                	addi	sp,sp,-16
 784:	e422                	sd	s0,8(sp)
 786:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 788:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 78c:	00000797          	auipc	a5,0x0
 790:	1e47b783          	ld	a5,484(a5) # 970 <freep>
 794:	a805                	j	7c4 <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 796:	4618                	lw	a4,8(a2)
 798:	9db9                	addw	a1,a1,a4
 79a:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 79e:	6398                	ld	a4,0(a5)
 7a0:	6318                	ld	a4,0(a4)
 7a2:	fee53823          	sd	a4,-16(a0)
 7a6:	a091                	j	7ea <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 7a8:	ff852703          	lw	a4,-8(a0)
 7ac:	9e39                	addw	a2,a2,a4
 7ae:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 7b0:	ff053703          	ld	a4,-16(a0)
 7b4:	e398                	sd	a4,0(a5)
 7b6:	a099                	j	7fc <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7b8:	6398                	ld	a4,0(a5)
 7ba:	00e7e463          	bltu	a5,a4,7c2 <free+0x40>
 7be:	00e6ea63          	bltu	a3,a4,7d2 <free+0x50>
{
 7c2:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7c4:	fed7fae3          	bgeu	a5,a3,7b8 <free+0x36>
 7c8:	6398                	ld	a4,0(a5)
 7ca:	00e6e463          	bltu	a3,a4,7d2 <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7ce:	fee7eae3          	bltu	a5,a4,7c2 <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 7d2:	ff852583          	lw	a1,-8(a0)
 7d6:	6390                	ld	a2,0(a5)
 7d8:	02059713          	slli	a4,a1,0x20
 7dc:	9301                	srli	a4,a4,0x20
 7de:	0712                	slli	a4,a4,0x4
 7e0:	9736                	add	a4,a4,a3
 7e2:	fae60ae3          	beq	a2,a4,796 <free+0x14>
    bp->s.ptr = p->s.ptr;
 7e6:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 7ea:	4790                	lw	a2,8(a5)
 7ec:	02061713          	slli	a4,a2,0x20
 7f0:	9301                	srli	a4,a4,0x20
 7f2:	0712                	slli	a4,a4,0x4
 7f4:	973e                	add	a4,a4,a5
 7f6:	fae689e3          	beq	a3,a4,7a8 <free+0x26>
  } else
    p->s.ptr = bp;
 7fa:	e394                	sd	a3,0(a5)
  freep = p;
 7fc:	00000717          	auipc	a4,0x0
 800:	16f73a23          	sd	a5,372(a4) # 970 <freep>
}
 804:	6422                	ld	s0,8(sp)
 806:	0141                	addi	sp,sp,16
 808:	8082                	ret

000000000000080a <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 80a:	7139                	addi	sp,sp,-64
 80c:	fc06                	sd	ra,56(sp)
 80e:	f822                	sd	s0,48(sp)
 810:	f426                	sd	s1,40(sp)
 812:	f04a                	sd	s2,32(sp)
 814:	ec4e                	sd	s3,24(sp)
 816:	e852                	sd	s4,16(sp)
 818:	e456                	sd	s5,8(sp)
 81a:	e05a                	sd	s6,0(sp)
 81c:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 81e:	02051493          	slli	s1,a0,0x20
 822:	9081                	srli	s1,s1,0x20
 824:	04bd                	addi	s1,s1,15
 826:	8091                	srli	s1,s1,0x4
 828:	0014899b          	addiw	s3,s1,1
 82c:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 82e:	00000517          	auipc	a0,0x0
 832:	14253503          	ld	a0,322(a0) # 970 <freep>
 836:	c515                	beqz	a0,862 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 838:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 83a:	4798                	lw	a4,8(a5)
 83c:	02977f63          	bgeu	a4,s1,87a <malloc+0x70>
 840:	8a4e                	mv	s4,s3
 842:	0009871b          	sext.w	a4,s3
 846:	6685                	lui	a3,0x1
 848:	00d77363          	bgeu	a4,a3,84e <malloc+0x44>
 84c:	6a05                	lui	s4,0x1
 84e:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 852:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 856:	00000917          	auipc	s2,0x0
 85a:	11a90913          	addi	s2,s2,282 # 970 <freep>
  if(p == (char*)-1)
 85e:	5afd                	li	s5,-1
 860:	a88d                	j	8d2 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 862:	00000797          	auipc	a5,0x0
 866:	11678793          	addi	a5,a5,278 # 978 <base>
 86a:	00000717          	auipc	a4,0x0
 86e:	10f73323          	sd	a5,262(a4) # 970 <freep>
 872:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 874:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 878:	b7e1                	j	840 <malloc+0x36>
      if(p->s.size == nunits)
 87a:	02e48b63          	beq	s1,a4,8b0 <malloc+0xa6>
        p->s.size -= nunits;
 87e:	4137073b          	subw	a4,a4,s3
 882:	c798                	sw	a4,8(a5)
        p += p->s.size;
 884:	1702                	slli	a4,a4,0x20
 886:	9301                	srli	a4,a4,0x20
 888:	0712                	slli	a4,a4,0x4
 88a:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 88c:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 890:	00000717          	auipc	a4,0x0
 894:	0ea73023          	sd	a0,224(a4) # 970 <freep>
      return (void*)(p + 1);
 898:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 89c:	70e2                	ld	ra,56(sp)
 89e:	7442                	ld	s0,48(sp)
 8a0:	74a2                	ld	s1,40(sp)
 8a2:	7902                	ld	s2,32(sp)
 8a4:	69e2                	ld	s3,24(sp)
 8a6:	6a42                	ld	s4,16(sp)
 8a8:	6aa2                	ld	s5,8(sp)
 8aa:	6b02                	ld	s6,0(sp)
 8ac:	6121                	addi	sp,sp,64
 8ae:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 8b0:	6398                	ld	a4,0(a5)
 8b2:	e118                	sd	a4,0(a0)
 8b4:	bff1                	j	890 <malloc+0x86>
  hp->s.size = nu;
 8b6:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 8ba:	0541                	addi	a0,a0,16
 8bc:	00000097          	auipc	ra,0x0
 8c0:	ec6080e7          	jalr	-314(ra) # 782 <free>
  return freep;
 8c4:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 8c8:	d971                	beqz	a0,89c <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8ca:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 8cc:	4798                	lw	a4,8(a5)
 8ce:	fa9776e3          	bgeu	a4,s1,87a <malloc+0x70>
    if(p == freep)
 8d2:	00093703          	ld	a4,0(s2)
 8d6:	853e                	mv	a0,a5
 8d8:	fef719e3          	bne	a4,a5,8ca <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 8dc:	8552                	mv	a0,s4
 8de:	00000097          	auipc	ra,0x0
 8e2:	b7e080e7          	jalr	-1154(ra) # 45c <sbrk>
  if(p == (char*)-1)
 8e6:	fd5518e3          	bne	a0,s5,8b6 <malloc+0xac>
        return 0;
 8ea:	4501                	li	a0,0
 8ec:	bf45                	j	89c <malloc+0x92>
