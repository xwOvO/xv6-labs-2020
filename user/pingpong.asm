
user/_pingpong:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
//pingpong.c
#include "kernel/types.h"
#include "user/user.h"

int main(void){
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	1800                	addi	s0,sp,48
    char byte = 'a';
   8:	06100793          	li	a5,97
   c:	fef407a3          	sb	a5,-17(s0)
    int p1[2],p2[2];
    pipe(p1);
  10:	fe040513          	addi	a0,s0,-32
  14:	00000097          	auipc	ra,0x0
  18:	414080e7          	jalr	1044(ra) # 428 <pipe>
    pipe(p2);
  1c:	fd840513          	addi	a0,s0,-40
  20:	00000097          	auipc	ra,0x0
  24:	408080e7          	jalr	1032(ra) # 428 <pipe>
    if(fork()==0){
  28:	00000097          	auipc	ra,0x0
  2c:	3e8080e7          	jalr	1000(ra) # 410 <fork>
  30:	ed4d                	bnez	a0,ea <main+0xea>
        close(p1[1]);
  32:	fe442503          	lw	a0,-28(s0)
  36:	00000097          	auipc	ra,0x0
  3a:	40a080e7          	jalr	1034(ra) # 440 <close>
        close(p2[0]);
  3e:	fd842503          	lw	a0,-40(s0)
  42:	00000097          	auipc	ra,0x0
  46:	3fe080e7          	jalr	1022(ra) # 440 <close>
        if(read(p1[0],&byte,sizeof(byte))!=sizeof(byte)){
  4a:	4605                	li	a2,1
  4c:	fef40593          	addi	a1,s0,-17
  50:	fe042503          	lw	a0,-32(s0)
  54:	00000097          	auipc	ra,0x0
  58:	3dc080e7          	jalr	988(ra) # 430 <read>
  5c:	4785                	li	a5,1
  5e:	00f50f63          	beq	a0,a5,7c <main+0x7c>
            printf("child process read fail!\n");
  62:	00001517          	auipc	a0,0x1
  66:	8d650513          	addi	a0,a0,-1834 # 938 <malloc+0xea>
  6a:	00000097          	auipc	ra,0x0
  6e:	726080e7          	jalr	1830(ra) # 790 <printf>
            exit(1);
  72:	4505                	li	a0,1
  74:	00000097          	auipc	ra,0x0
  78:	3a4080e7          	jalr	932(ra) # 418 <exit>
        }
        close(p1[0]);
  7c:	fe042503          	lw	a0,-32(s0)
  80:	00000097          	auipc	ra,0x0
  84:	3c0080e7          	jalr	960(ra) # 440 <close>
        printf("%d: received ping\n",getpid());
  88:	00000097          	auipc	ra,0x0
  8c:	410080e7          	jalr	1040(ra) # 498 <getpid>
  90:	85aa                	mv	a1,a0
  92:	00001517          	auipc	a0,0x1
  96:	8c650513          	addi	a0,a0,-1850 # 958 <malloc+0x10a>
  9a:	00000097          	auipc	ra,0x0
  9e:	6f6080e7          	jalr	1782(ra) # 790 <printf>
        if(write(p2[1],&byte,sizeof(byte))!=sizeof(byte)){
  a2:	4605                	li	a2,1
  a4:	fef40593          	addi	a1,s0,-17
  a8:	fdc42503          	lw	a0,-36(s0)
  ac:	00000097          	auipc	ra,0x0
  b0:	38c080e7          	jalr	908(ra) # 438 <write>
  b4:	4785                	li	a5,1
  b6:	00f50f63          	beq	a0,a5,d4 <main+0xd4>
            printf("child process write fail!\n");
  ba:	00001517          	auipc	a0,0x1
  be:	8b650513          	addi	a0,a0,-1866 # 970 <malloc+0x122>
  c2:	00000097          	auipc	ra,0x0
  c6:	6ce080e7          	jalr	1742(ra) # 790 <printf>
            exit(1);
  ca:	4505                	li	a0,1
  cc:	00000097          	auipc	ra,0x0
  d0:	34c080e7          	jalr	844(ra) # 418 <exit>
        }
        close(p2[1]);
  d4:	fdc42503          	lw	a0,-36(s0)
  d8:	00000097          	auipc	ra,0x0
  dc:	368080e7          	jalr	872(ra) # 440 <close>
        exit(0);
  e0:	4501                	li	a0,0
  e2:	00000097          	auipc	ra,0x0
  e6:	336080e7          	jalr	822(ra) # 418 <exit>
    }else{
        close(p1[0]);
  ea:	fe042503          	lw	a0,-32(s0)
  ee:	00000097          	auipc	ra,0x0
  f2:	352080e7          	jalr	850(ra) # 440 <close>
        close(p2[1]);
  f6:	fdc42503          	lw	a0,-36(s0)
  fa:	00000097          	auipc	ra,0x0
  fe:	346080e7          	jalr	838(ra) # 440 <close>
        if(write(p1[1],&byte,sizeof(byte))!=sizeof(byte)){
 102:	4605                	li	a2,1
 104:	fef40593          	addi	a1,s0,-17
 108:	fe442503          	lw	a0,-28(s0)
 10c:	00000097          	auipc	ra,0x0
 110:	32c080e7          	jalr	812(ra) # 438 <write>
 114:	4785                	li	a5,1
 116:	00f50f63          	beq	a0,a5,134 <main+0x134>
            printf("parent process write fail!\n");
 11a:	00001517          	auipc	a0,0x1
 11e:	87650513          	addi	a0,a0,-1930 # 990 <malloc+0x142>
 122:	00000097          	auipc	ra,0x0
 126:	66e080e7          	jalr	1646(ra) # 790 <printf>
            exit(1);
 12a:	4505                	li	a0,1
 12c:	00000097          	auipc	ra,0x0
 130:	2ec080e7          	jalr	748(ra) # 418 <exit>
        }
        close(p1[1]);
 134:	fe442503          	lw	a0,-28(s0)
 138:	00000097          	auipc	ra,0x0
 13c:	308080e7          	jalr	776(ra) # 440 <close>
        if(read(p2[0],&byte,sizeof(byte))!=sizeof(byte)){
 140:	4605                	li	a2,1
 142:	fef40593          	addi	a1,s0,-17
 146:	fd842503          	lw	a0,-40(s0)
 14a:	00000097          	auipc	ra,0x0
 14e:	2e6080e7          	jalr	742(ra) # 430 <read>
 152:	4785                	li	a5,1
 154:	00f50f63          	beq	a0,a5,172 <main+0x172>
            printf("parent process read fail!\n");
 158:	00001517          	auipc	a0,0x1
 15c:	85850513          	addi	a0,a0,-1960 # 9b0 <malloc+0x162>
 160:	00000097          	auipc	ra,0x0
 164:	630080e7          	jalr	1584(ra) # 790 <printf>
            exit(1);
 168:	4505                	li	a0,1
 16a:	00000097          	auipc	ra,0x0
 16e:	2ae080e7          	jalr	686(ra) # 418 <exit>
        }
        close(p2[0]);
 172:	fd842503          	lw	a0,-40(s0)
 176:	00000097          	auipc	ra,0x0
 17a:	2ca080e7          	jalr	714(ra) # 440 <close>
        printf("%d: received pong\n",getpid());
 17e:	00000097          	auipc	ra,0x0
 182:	31a080e7          	jalr	794(ra) # 498 <getpid>
 186:	85aa                	mv	a1,a0
 188:	00001517          	auipc	a0,0x1
 18c:	84850513          	addi	a0,a0,-1976 # 9d0 <malloc+0x182>
 190:	00000097          	auipc	ra,0x0
 194:	600080e7          	jalr	1536(ra) # 790 <printf>
        exit(0);
 198:	4501                	li	a0,0
 19a:	00000097          	auipc	ra,0x0
 19e:	27e080e7          	jalr	638(ra) # 418 <exit>

00000000000001a2 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
 1a2:	1141                	addi	sp,sp,-16
 1a4:	e422                	sd	s0,8(sp)
 1a6:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1a8:	87aa                	mv	a5,a0
 1aa:	0585                	addi	a1,a1,1
 1ac:	0785                	addi	a5,a5,1
 1ae:	fff5c703          	lbu	a4,-1(a1)
 1b2:	fee78fa3          	sb	a4,-1(a5)
 1b6:	fb75                	bnez	a4,1aa <strcpy+0x8>
    ;
  return os;
}
 1b8:	6422                	ld	s0,8(sp)
 1ba:	0141                	addi	sp,sp,16
 1bc:	8082                	ret

00000000000001be <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1be:	1141                	addi	sp,sp,-16
 1c0:	e422                	sd	s0,8(sp)
 1c2:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 1c4:	00054783          	lbu	a5,0(a0)
 1c8:	cb91                	beqz	a5,1dc <strcmp+0x1e>
 1ca:	0005c703          	lbu	a4,0(a1)
 1ce:	00f71763          	bne	a4,a5,1dc <strcmp+0x1e>
    p++, q++;
 1d2:	0505                	addi	a0,a0,1
 1d4:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 1d6:	00054783          	lbu	a5,0(a0)
 1da:	fbe5                	bnez	a5,1ca <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 1dc:	0005c503          	lbu	a0,0(a1)
}
 1e0:	40a7853b          	subw	a0,a5,a0
 1e4:	6422                	ld	s0,8(sp)
 1e6:	0141                	addi	sp,sp,16
 1e8:	8082                	ret

00000000000001ea <strlen>:

uint
strlen(const char *s)
{
 1ea:	1141                	addi	sp,sp,-16
 1ec:	e422                	sd	s0,8(sp)
 1ee:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 1f0:	00054783          	lbu	a5,0(a0)
 1f4:	cf91                	beqz	a5,210 <strlen+0x26>
 1f6:	0505                	addi	a0,a0,1
 1f8:	87aa                	mv	a5,a0
 1fa:	4685                	li	a3,1
 1fc:	9e89                	subw	a3,a3,a0
 1fe:	00f6853b          	addw	a0,a3,a5
 202:	0785                	addi	a5,a5,1
 204:	fff7c703          	lbu	a4,-1(a5)
 208:	fb7d                	bnez	a4,1fe <strlen+0x14>
    ;
  return n;
}
 20a:	6422                	ld	s0,8(sp)
 20c:	0141                	addi	sp,sp,16
 20e:	8082                	ret
  for(n = 0; s[n]; n++)
 210:	4501                	li	a0,0
 212:	bfe5                	j	20a <strlen+0x20>

0000000000000214 <memset>:

void*
memset(void *dst, int c, uint n)
{
 214:	1141                	addi	sp,sp,-16
 216:	e422                	sd	s0,8(sp)
 218:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 21a:	ce09                	beqz	a2,234 <memset+0x20>
 21c:	87aa                	mv	a5,a0
 21e:	fff6071b          	addiw	a4,a2,-1
 222:	1702                	slli	a4,a4,0x20
 224:	9301                	srli	a4,a4,0x20
 226:	0705                	addi	a4,a4,1
 228:	972a                	add	a4,a4,a0
    cdst[i] = c;
 22a:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 22e:	0785                	addi	a5,a5,1
 230:	fee79de3          	bne	a5,a4,22a <memset+0x16>
  }
  return dst;
}
 234:	6422                	ld	s0,8(sp)
 236:	0141                	addi	sp,sp,16
 238:	8082                	ret

000000000000023a <strchr>:

char*
strchr(const char *s, char c)
{
 23a:	1141                	addi	sp,sp,-16
 23c:	e422                	sd	s0,8(sp)
 23e:	0800                	addi	s0,sp,16
  for(; *s; s++)
 240:	00054783          	lbu	a5,0(a0)
 244:	cb99                	beqz	a5,25a <strchr+0x20>
    if(*s == c)
 246:	00f58763          	beq	a1,a5,254 <strchr+0x1a>
  for(; *s; s++)
 24a:	0505                	addi	a0,a0,1
 24c:	00054783          	lbu	a5,0(a0)
 250:	fbfd                	bnez	a5,246 <strchr+0xc>
      return (char*)s;
  return 0;
 252:	4501                	li	a0,0
}
 254:	6422                	ld	s0,8(sp)
 256:	0141                	addi	sp,sp,16
 258:	8082                	ret
  return 0;
 25a:	4501                	li	a0,0
 25c:	bfe5                	j	254 <strchr+0x1a>

000000000000025e <gets>:

char*
gets(char *buf, int max)
{
 25e:	711d                	addi	sp,sp,-96
 260:	ec86                	sd	ra,88(sp)
 262:	e8a2                	sd	s0,80(sp)
 264:	e4a6                	sd	s1,72(sp)
 266:	e0ca                	sd	s2,64(sp)
 268:	fc4e                	sd	s3,56(sp)
 26a:	f852                	sd	s4,48(sp)
 26c:	f456                	sd	s5,40(sp)
 26e:	f05a                	sd	s6,32(sp)
 270:	ec5e                	sd	s7,24(sp)
 272:	1080                	addi	s0,sp,96
 274:	8baa                	mv	s7,a0
 276:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 278:	892a                	mv	s2,a0
 27a:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 27c:	4aa9                	li	s5,10
 27e:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 280:	89a6                	mv	s3,s1
 282:	2485                	addiw	s1,s1,1
 284:	0344d863          	bge	s1,s4,2b4 <gets+0x56>
    cc = read(0, &c, 1);
 288:	4605                	li	a2,1
 28a:	faf40593          	addi	a1,s0,-81
 28e:	4501                	li	a0,0
 290:	00000097          	auipc	ra,0x0
 294:	1a0080e7          	jalr	416(ra) # 430 <read>
    if(cc < 1)
 298:	00a05e63          	blez	a0,2b4 <gets+0x56>
    buf[i++] = c;
 29c:	faf44783          	lbu	a5,-81(s0)
 2a0:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 2a4:	01578763          	beq	a5,s5,2b2 <gets+0x54>
 2a8:	0905                	addi	s2,s2,1
 2aa:	fd679be3          	bne	a5,s6,280 <gets+0x22>
  for(i=0; i+1 < max; ){
 2ae:	89a6                	mv	s3,s1
 2b0:	a011                	j	2b4 <gets+0x56>
 2b2:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 2b4:	99de                	add	s3,s3,s7
 2b6:	00098023          	sb	zero,0(s3)
  return buf;
}
 2ba:	855e                	mv	a0,s7
 2bc:	60e6                	ld	ra,88(sp)
 2be:	6446                	ld	s0,80(sp)
 2c0:	64a6                	ld	s1,72(sp)
 2c2:	6906                	ld	s2,64(sp)
 2c4:	79e2                	ld	s3,56(sp)
 2c6:	7a42                	ld	s4,48(sp)
 2c8:	7aa2                	ld	s5,40(sp)
 2ca:	7b02                	ld	s6,32(sp)
 2cc:	6be2                	ld	s7,24(sp)
 2ce:	6125                	addi	sp,sp,96
 2d0:	8082                	ret

00000000000002d2 <stat>:

int
stat(const char *n, struct stat *st)
{
 2d2:	1101                	addi	sp,sp,-32
 2d4:	ec06                	sd	ra,24(sp)
 2d6:	e822                	sd	s0,16(sp)
 2d8:	e426                	sd	s1,8(sp)
 2da:	e04a                	sd	s2,0(sp)
 2dc:	1000                	addi	s0,sp,32
 2de:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2e0:	4581                	li	a1,0
 2e2:	00000097          	auipc	ra,0x0
 2e6:	176080e7          	jalr	374(ra) # 458 <open>
  if(fd < 0)
 2ea:	02054563          	bltz	a0,314 <stat+0x42>
 2ee:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 2f0:	85ca                	mv	a1,s2
 2f2:	00000097          	auipc	ra,0x0
 2f6:	17e080e7          	jalr	382(ra) # 470 <fstat>
 2fa:	892a                	mv	s2,a0
  close(fd);
 2fc:	8526                	mv	a0,s1
 2fe:	00000097          	auipc	ra,0x0
 302:	142080e7          	jalr	322(ra) # 440 <close>
  return r;
}
 306:	854a                	mv	a0,s2
 308:	60e2                	ld	ra,24(sp)
 30a:	6442                	ld	s0,16(sp)
 30c:	64a2                	ld	s1,8(sp)
 30e:	6902                	ld	s2,0(sp)
 310:	6105                	addi	sp,sp,32
 312:	8082                	ret
    return -1;
 314:	597d                	li	s2,-1
 316:	bfc5                	j	306 <stat+0x34>

0000000000000318 <atoi>:

int
atoi(const char *s)
{
 318:	1141                	addi	sp,sp,-16
 31a:	e422                	sd	s0,8(sp)
 31c:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 31e:	00054603          	lbu	a2,0(a0)
 322:	fd06079b          	addiw	a5,a2,-48
 326:	0ff7f793          	andi	a5,a5,255
 32a:	4725                	li	a4,9
 32c:	02f76963          	bltu	a4,a5,35e <atoi+0x46>
 330:	86aa                	mv	a3,a0
  n = 0;
 332:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
 334:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 336:	0685                	addi	a3,a3,1
 338:	0025179b          	slliw	a5,a0,0x2
 33c:	9fa9                	addw	a5,a5,a0
 33e:	0017979b          	slliw	a5,a5,0x1
 342:	9fb1                	addw	a5,a5,a2
 344:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 348:	0006c603          	lbu	a2,0(a3)
 34c:	fd06071b          	addiw	a4,a2,-48
 350:	0ff77713          	andi	a4,a4,255
 354:	fee5f1e3          	bgeu	a1,a4,336 <atoi+0x1e>
  return n;
}
 358:	6422                	ld	s0,8(sp)
 35a:	0141                	addi	sp,sp,16
 35c:	8082                	ret
  n = 0;
 35e:	4501                	li	a0,0
 360:	bfe5                	j	358 <atoi+0x40>

0000000000000362 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 362:	1141                	addi	sp,sp,-16
 364:	e422                	sd	s0,8(sp)
 366:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 368:	02b57663          	bgeu	a0,a1,394 <memmove+0x32>
    while(n-- > 0)
 36c:	02c05163          	blez	a2,38e <memmove+0x2c>
 370:	fff6079b          	addiw	a5,a2,-1
 374:	1782                	slli	a5,a5,0x20
 376:	9381                	srli	a5,a5,0x20
 378:	0785                	addi	a5,a5,1
 37a:	97aa                	add	a5,a5,a0
  dst = vdst;
 37c:	872a                	mv	a4,a0
      *dst++ = *src++;
 37e:	0585                	addi	a1,a1,1
 380:	0705                	addi	a4,a4,1
 382:	fff5c683          	lbu	a3,-1(a1)
 386:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 38a:	fee79ae3          	bne	a5,a4,37e <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 38e:	6422                	ld	s0,8(sp)
 390:	0141                	addi	sp,sp,16
 392:	8082                	ret
    dst += n;
 394:	00c50733          	add	a4,a0,a2
    src += n;
 398:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 39a:	fec05ae3          	blez	a2,38e <memmove+0x2c>
 39e:	fff6079b          	addiw	a5,a2,-1
 3a2:	1782                	slli	a5,a5,0x20
 3a4:	9381                	srli	a5,a5,0x20
 3a6:	fff7c793          	not	a5,a5
 3aa:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 3ac:	15fd                	addi	a1,a1,-1
 3ae:	177d                	addi	a4,a4,-1
 3b0:	0005c683          	lbu	a3,0(a1)
 3b4:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 3b8:	fee79ae3          	bne	a5,a4,3ac <memmove+0x4a>
 3bc:	bfc9                	j	38e <memmove+0x2c>

00000000000003be <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 3be:	1141                	addi	sp,sp,-16
 3c0:	e422                	sd	s0,8(sp)
 3c2:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 3c4:	ca05                	beqz	a2,3f4 <memcmp+0x36>
 3c6:	fff6069b          	addiw	a3,a2,-1
 3ca:	1682                	slli	a3,a3,0x20
 3cc:	9281                	srli	a3,a3,0x20
 3ce:	0685                	addi	a3,a3,1
 3d0:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 3d2:	00054783          	lbu	a5,0(a0)
 3d6:	0005c703          	lbu	a4,0(a1)
 3da:	00e79863          	bne	a5,a4,3ea <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 3de:	0505                	addi	a0,a0,1
    p2++;
 3e0:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 3e2:	fed518e3          	bne	a0,a3,3d2 <memcmp+0x14>
  }
  return 0;
 3e6:	4501                	li	a0,0
 3e8:	a019                	j	3ee <memcmp+0x30>
      return *p1 - *p2;
 3ea:	40e7853b          	subw	a0,a5,a4
}
 3ee:	6422                	ld	s0,8(sp)
 3f0:	0141                	addi	sp,sp,16
 3f2:	8082                	ret
  return 0;
 3f4:	4501                	li	a0,0
 3f6:	bfe5                	j	3ee <memcmp+0x30>

00000000000003f8 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 3f8:	1141                	addi	sp,sp,-16
 3fa:	e406                	sd	ra,8(sp)
 3fc:	e022                	sd	s0,0(sp)
 3fe:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 400:	00000097          	auipc	ra,0x0
 404:	f62080e7          	jalr	-158(ra) # 362 <memmove>
}
 408:	60a2                	ld	ra,8(sp)
 40a:	6402                	ld	s0,0(sp)
 40c:	0141                	addi	sp,sp,16
 40e:	8082                	ret

0000000000000410 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 410:	4885                	li	a7,1
 ecall
 412:	00000073          	ecall
 ret
 416:	8082                	ret

0000000000000418 <exit>:
.global exit
exit:
 li a7, SYS_exit
 418:	4889                	li	a7,2
 ecall
 41a:	00000073          	ecall
 ret
 41e:	8082                	ret

0000000000000420 <wait>:
.global wait
wait:
 li a7, SYS_wait
 420:	488d                	li	a7,3
 ecall
 422:	00000073          	ecall
 ret
 426:	8082                	ret

0000000000000428 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 428:	4891                	li	a7,4
 ecall
 42a:	00000073          	ecall
 ret
 42e:	8082                	ret

0000000000000430 <read>:
.global read
read:
 li a7, SYS_read
 430:	4895                	li	a7,5
 ecall
 432:	00000073          	ecall
 ret
 436:	8082                	ret

0000000000000438 <write>:
.global write
write:
 li a7, SYS_write
 438:	48c1                	li	a7,16
 ecall
 43a:	00000073          	ecall
 ret
 43e:	8082                	ret

0000000000000440 <close>:
.global close
close:
 li a7, SYS_close
 440:	48d5                	li	a7,21
 ecall
 442:	00000073          	ecall
 ret
 446:	8082                	ret

0000000000000448 <kill>:
.global kill
kill:
 li a7, SYS_kill
 448:	4899                	li	a7,6
 ecall
 44a:	00000073          	ecall
 ret
 44e:	8082                	ret

0000000000000450 <exec>:
.global exec
exec:
 li a7, SYS_exec
 450:	489d                	li	a7,7
 ecall
 452:	00000073          	ecall
 ret
 456:	8082                	ret

0000000000000458 <open>:
.global open
open:
 li a7, SYS_open
 458:	48bd                	li	a7,15
 ecall
 45a:	00000073          	ecall
 ret
 45e:	8082                	ret

0000000000000460 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 460:	48c5                	li	a7,17
 ecall
 462:	00000073          	ecall
 ret
 466:	8082                	ret

0000000000000468 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 468:	48c9                	li	a7,18
 ecall
 46a:	00000073          	ecall
 ret
 46e:	8082                	ret

0000000000000470 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 470:	48a1                	li	a7,8
 ecall
 472:	00000073          	ecall
 ret
 476:	8082                	ret

0000000000000478 <link>:
.global link
link:
 li a7, SYS_link
 478:	48cd                	li	a7,19
 ecall
 47a:	00000073          	ecall
 ret
 47e:	8082                	ret

0000000000000480 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 480:	48d1                	li	a7,20
 ecall
 482:	00000073          	ecall
 ret
 486:	8082                	ret

0000000000000488 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 488:	48a5                	li	a7,9
 ecall
 48a:	00000073          	ecall
 ret
 48e:	8082                	ret

0000000000000490 <dup>:
.global dup
dup:
 li a7, SYS_dup
 490:	48a9                	li	a7,10
 ecall
 492:	00000073          	ecall
 ret
 496:	8082                	ret

0000000000000498 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 498:	48ad                	li	a7,11
 ecall
 49a:	00000073          	ecall
 ret
 49e:	8082                	ret

00000000000004a0 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 4a0:	48b1                	li	a7,12
 ecall
 4a2:	00000073          	ecall
 ret
 4a6:	8082                	ret

00000000000004a8 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 4a8:	48b5                	li	a7,13
 ecall
 4aa:	00000073          	ecall
 ret
 4ae:	8082                	ret

00000000000004b0 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 4b0:	48b9                	li	a7,14
 ecall
 4b2:	00000073          	ecall
 ret
 4b6:	8082                	ret

00000000000004b8 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 4b8:	1101                	addi	sp,sp,-32
 4ba:	ec06                	sd	ra,24(sp)
 4bc:	e822                	sd	s0,16(sp)
 4be:	1000                	addi	s0,sp,32
 4c0:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 4c4:	4605                	li	a2,1
 4c6:	fef40593          	addi	a1,s0,-17
 4ca:	00000097          	auipc	ra,0x0
 4ce:	f6e080e7          	jalr	-146(ra) # 438 <write>
}
 4d2:	60e2                	ld	ra,24(sp)
 4d4:	6442                	ld	s0,16(sp)
 4d6:	6105                	addi	sp,sp,32
 4d8:	8082                	ret

00000000000004da <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4da:	7139                	addi	sp,sp,-64
 4dc:	fc06                	sd	ra,56(sp)
 4de:	f822                	sd	s0,48(sp)
 4e0:	f426                	sd	s1,40(sp)
 4e2:	f04a                	sd	s2,32(sp)
 4e4:	ec4e                	sd	s3,24(sp)
 4e6:	0080                	addi	s0,sp,64
 4e8:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4ea:	c299                	beqz	a3,4f0 <printint+0x16>
 4ec:	0805c863          	bltz	a1,57c <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 4f0:	2581                	sext.w	a1,a1
  neg = 0;
 4f2:	4881                	li	a7,0
 4f4:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 4f8:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 4fa:	2601                	sext.w	a2,a2
 4fc:	00000517          	auipc	a0,0x0
 500:	4f450513          	addi	a0,a0,1268 # 9f0 <digits>
 504:	883a                	mv	a6,a4
 506:	2705                	addiw	a4,a4,1
 508:	02c5f7bb          	remuw	a5,a1,a2
 50c:	1782                	slli	a5,a5,0x20
 50e:	9381                	srli	a5,a5,0x20
 510:	97aa                	add	a5,a5,a0
 512:	0007c783          	lbu	a5,0(a5)
 516:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 51a:	0005879b          	sext.w	a5,a1
 51e:	02c5d5bb          	divuw	a1,a1,a2
 522:	0685                	addi	a3,a3,1
 524:	fec7f0e3          	bgeu	a5,a2,504 <printint+0x2a>
  if(neg)
 528:	00088b63          	beqz	a7,53e <printint+0x64>
    buf[i++] = '-';
 52c:	fd040793          	addi	a5,s0,-48
 530:	973e                	add	a4,a4,a5
 532:	02d00793          	li	a5,45
 536:	fef70823          	sb	a5,-16(a4)
 53a:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 53e:	02e05863          	blez	a4,56e <printint+0x94>
 542:	fc040793          	addi	a5,s0,-64
 546:	00e78933          	add	s2,a5,a4
 54a:	fff78993          	addi	s3,a5,-1
 54e:	99ba                	add	s3,s3,a4
 550:	377d                	addiw	a4,a4,-1
 552:	1702                	slli	a4,a4,0x20
 554:	9301                	srli	a4,a4,0x20
 556:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 55a:	fff94583          	lbu	a1,-1(s2)
 55e:	8526                	mv	a0,s1
 560:	00000097          	auipc	ra,0x0
 564:	f58080e7          	jalr	-168(ra) # 4b8 <putc>
  while(--i >= 0)
 568:	197d                	addi	s2,s2,-1
 56a:	ff3918e3          	bne	s2,s3,55a <printint+0x80>
}
 56e:	70e2                	ld	ra,56(sp)
 570:	7442                	ld	s0,48(sp)
 572:	74a2                	ld	s1,40(sp)
 574:	7902                	ld	s2,32(sp)
 576:	69e2                	ld	s3,24(sp)
 578:	6121                	addi	sp,sp,64
 57a:	8082                	ret
    x = -xx;
 57c:	40b005bb          	negw	a1,a1
    neg = 1;
 580:	4885                	li	a7,1
    x = -xx;
 582:	bf8d                	j	4f4 <printint+0x1a>

0000000000000584 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 584:	7119                	addi	sp,sp,-128
 586:	fc86                	sd	ra,120(sp)
 588:	f8a2                	sd	s0,112(sp)
 58a:	f4a6                	sd	s1,104(sp)
 58c:	f0ca                	sd	s2,96(sp)
 58e:	ecce                	sd	s3,88(sp)
 590:	e8d2                	sd	s4,80(sp)
 592:	e4d6                	sd	s5,72(sp)
 594:	e0da                	sd	s6,64(sp)
 596:	fc5e                	sd	s7,56(sp)
 598:	f862                	sd	s8,48(sp)
 59a:	f466                	sd	s9,40(sp)
 59c:	f06a                	sd	s10,32(sp)
 59e:	ec6e                	sd	s11,24(sp)
 5a0:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 5a2:	0005c903          	lbu	s2,0(a1)
 5a6:	18090f63          	beqz	s2,744 <vprintf+0x1c0>
 5aa:	8aaa                	mv	s5,a0
 5ac:	8b32                	mv	s6,a2
 5ae:	00158493          	addi	s1,a1,1
  state = 0;
 5b2:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 5b4:	02500a13          	li	s4,37
      if(c == 'd'){
 5b8:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 5bc:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 5c0:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 5c4:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 5c8:	00000b97          	auipc	s7,0x0
 5cc:	428b8b93          	addi	s7,s7,1064 # 9f0 <digits>
 5d0:	a839                	j	5ee <vprintf+0x6a>
        putc(fd, c);
 5d2:	85ca                	mv	a1,s2
 5d4:	8556                	mv	a0,s5
 5d6:	00000097          	auipc	ra,0x0
 5da:	ee2080e7          	jalr	-286(ra) # 4b8 <putc>
 5de:	a019                	j	5e4 <vprintf+0x60>
    } else if(state == '%'){
 5e0:	01498f63          	beq	s3,s4,5fe <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 5e4:	0485                	addi	s1,s1,1
 5e6:	fff4c903          	lbu	s2,-1(s1)
 5ea:	14090d63          	beqz	s2,744 <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 5ee:	0009079b          	sext.w	a5,s2
    if(state == 0){
 5f2:	fe0997e3          	bnez	s3,5e0 <vprintf+0x5c>
      if(c == '%'){
 5f6:	fd479ee3          	bne	a5,s4,5d2 <vprintf+0x4e>
        state = '%';
 5fa:	89be                	mv	s3,a5
 5fc:	b7e5                	j	5e4 <vprintf+0x60>
      if(c == 'd'){
 5fe:	05878063          	beq	a5,s8,63e <vprintf+0xba>
      } else if(c == 'l') {
 602:	05978c63          	beq	a5,s9,65a <vprintf+0xd6>
      } else if(c == 'x') {
 606:	07a78863          	beq	a5,s10,676 <vprintf+0xf2>
      } else if(c == 'p') {
 60a:	09b78463          	beq	a5,s11,692 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 60e:	07300713          	li	a4,115
 612:	0ce78663          	beq	a5,a4,6de <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 616:	06300713          	li	a4,99
 61a:	0ee78e63          	beq	a5,a4,716 <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 61e:	11478863          	beq	a5,s4,72e <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 622:	85d2                	mv	a1,s4
 624:	8556                	mv	a0,s5
 626:	00000097          	auipc	ra,0x0
 62a:	e92080e7          	jalr	-366(ra) # 4b8 <putc>
        putc(fd, c);
 62e:	85ca                	mv	a1,s2
 630:	8556                	mv	a0,s5
 632:	00000097          	auipc	ra,0x0
 636:	e86080e7          	jalr	-378(ra) # 4b8 <putc>
      }
      state = 0;
 63a:	4981                	li	s3,0
 63c:	b765                	j	5e4 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 63e:	008b0913          	addi	s2,s6,8
 642:	4685                	li	a3,1
 644:	4629                	li	a2,10
 646:	000b2583          	lw	a1,0(s6)
 64a:	8556                	mv	a0,s5
 64c:	00000097          	auipc	ra,0x0
 650:	e8e080e7          	jalr	-370(ra) # 4da <printint>
 654:	8b4a                	mv	s6,s2
      state = 0;
 656:	4981                	li	s3,0
 658:	b771                	j	5e4 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 65a:	008b0913          	addi	s2,s6,8
 65e:	4681                	li	a3,0
 660:	4629                	li	a2,10
 662:	000b2583          	lw	a1,0(s6)
 666:	8556                	mv	a0,s5
 668:	00000097          	auipc	ra,0x0
 66c:	e72080e7          	jalr	-398(ra) # 4da <printint>
 670:	8b4a                	mv	s6,s2
      state = 0;
 672:	4981                	li	s3,0
 674:	bf85                	j	5e4 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 676:	008b0913          	addi	s2,s6,8
 67a:	4681                	li	a3,0
 67c:	4641                	li	a2,16
 67e:	000b2583          	lw	a1,0(s6)
 682:	8556                	mv	a0,s5
 684:	00000097          	auipc	ra,0x0
 688:	e56080e7          	jalr	-426(ra) # 4da <printint>
 68c:	8b4a                	mv	s6,s2
      state = 0;
 68e:	4981                	li	s3,0
 690:	bf91                	j	5e4 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 692:	008b0793          	addi	a5,s6,8
 696:	f8f43423          	sd	a5,-120(s0)
 69a:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 69e:	03000593          	li	a1,48
 6a2:	8556                	mv	a0,s5
 6a4:	00000097          	auipc	ra,0x0
 6a8:	e14080e7          	jalr	-492(ra) # 4b8 <putc>
  putc(fd, 'x');
 6ac:	85ea                	mv	a1,s10
 6ae:	8556                	mv	a0,s5
 6b0:	00000097          	auipc	ra,0x0
 6b4:	e08080e7          	jalr	-504(ra) # 4b8 <putc>
 6b8:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 6ba:	03c9d793          	srli	a5,s3,0x3c
 6be:	97de                	add	a5,a5,s7
 6c0:	0007c583          	lbu	a1,0(a5)
 6c4:	8556                	mv	a0,s5
 6c6:	00000097          	auipc	ra,0x0
 6ca:	df2080e7          	jalr	-526(ra) # 4b8 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 6ce:	0992                	slli	s3,s3,0x4
 6d0:	397d                	addiw	s2,s2,-1
 6d2:	fe0914e3          	bnez	s2,6ba <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 6d6:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 6da:	4981                	li	s3,0
 6dc:	b721                	j	5e4 <vprintf+0x60>
        s = va_arg(ap, char*);
 6de:	008b0993          	addi	s3,s6,8
 6e2:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 6e6:	02090163          	beqz	s2,708 <vprintf+0x184>
        while(*s != 0){
 6ea:	00094583          	lbu	a1,0(s2)
 6ee:	c9a1                	beqz	a1,73e <vprintf+0x1ba>
          putc(fd, *s);
 6f0:	8556                	mv	a0,s5
 6f2:	00000097          	auipc	ra,0x0
 6f6:	dc6080e7          	jalr	-570(ra) # 4b8 <putc>
          s++;
 6fa:	0905                	addi	s2,s2,1
        while(*s != 0){
 6fc:	00094583          	lbu	a1,0(s2)
 700:	f9e5                	bnez	a1,6f0 <vprintf+0x16c>
        s = va_arg(ap, char*);
 702:	8b4e                	mv	s6,s3
      state = 0;
 704:	4981                	li	s3,0
 706:	bdf9                	j	5e4 <vprintf+0x60>
          s = "(null)";
 708:	00000917          	auipc	s2,0x0
 70c:	2e090913          	addi	s2,s2,736 # 9e8 <malloc+0x19a>
        while(*s != 0){
 710:	02800593          	li	a1,40
 714:	bff1                	j	6f0 <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 716:	008b0913          	addi	s2,s6,8
 71a:	000b4583          	lbu	a1,0(s6)
 71e:	8556                	mv	a0,s5
 720:	00000097          	auipc	ra,0x0
 724:	d98080e7          	jalr	-616(ra) # 4b8 <putc>
 728:	8b4a                	mv	s6,s2
      state = 0;
 72a:	4981                	li	s3,0
 72c:	bd65                	j	5e4 <vprintf+0x60>
        putc(fd, c);
 72e:	85d2                	mv	a1,s4
 730:	8556                	mv	a0,s5
 732:	00000097          	auipc	ra,0x0
 736:	d86080e7          	jalr	-634(ra) # 4b8 <putc>
      state = 0;
 73a:	4981                	li	s3,0
 73c:	b565                	j	5e4 <vprintf+0x60>
        s = va_arg(ap, char*);
 73e:	8b4e                	mv	s6,s3
      state = 0;
 740:	4981                	li	s3,0
 742:	b54d                	j	5e4 <vprintf+0x60>
    }
  }
}
 744:	70e6                	ld	ra,120(sp)
 746:	7446                	ld	s0,112(sp)
 748:	74a6                	ld	s1,104(sp)
 74a:	7906                	ld	s2,96(sp)
 74c:	69e6                	ld	s3,88(sp)
 74e:	6a46                	ld	s4,80(sp)
 750:	6aa6                	ld	s5,72(sp)
 752:	6b06                	ld	s6,64(sp)
 754:	7be2                	ld	s7,56(sp)
 756:	7c42                	ld	s8,48(sp)
 758:	7ca2                	ld	s9,40(sp)
 75a:	7d02                	ld	s10,32(sp)
 75c:	6de2                	ld	s11,24(sp)
 75e:	6109                	addi	sp,sp,128
 760:	8082                	ret

0000000000000762 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 762:	715d                	addi	sp,sp,-80
 764:	ec06                	sd	ra,24(sp)
 766:	e822                	sd	s0,16(sp)
 768:	1000                	addi	s0,sp,32
 76a:	e010                	sd	a2,0(s0)
 76c:	e414                	sd	a3,8(s0)
 76e:	e818                	sd	a4,16(s0)
 770:	ec1c                	sd	a5,24(s0)
 772:	03043023          	sd	a6,32(s0)
 776:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 77a:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 77e:	8622                	mv	a2,s0
 780:	00000097          	auipc	ra,0x0
 784:	e04080e7          	jalr	-508(ra) # 584 <vprintf>
}
 788:	60e2                	ld	ra,24(sp)
 78a:	6442                	ld	s0,16(sp)
 78c:	6161                	addi	sp,sp,80
 78e:	8082                	ret

0000000000000790 <printf>:

void
printf(const char *fmt, ...)
{
 790:	711d                	addi	sp,sp,-96
 792:	ec06                	sd	ra,24(sp)
 794:	e822                	sd	s0,16(sp)
 796:	1000                	addi	s0,sp,32
 798:	e40c                	sd	a1,8(s0)
 79a:	e810                	sd	a2,16(s0)
 79c:	ec14                	sd	a3,24(s0)
 79e:	f018                	sd	a4,32(s0)
 7a0:	f41c                	sd	a5,40(s0)
 7a2:	03043823          	sd	a6,48(s0)
 7a6:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 7aa:	00840613          	addi	a2,s0,8
 7ae:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 7b2:	85aa                	mv	a1,a0
 7b4:	4505                	li	a0,1
 7b6:	00000097          	auipc	ra,0x0
 7ba:	dce080e7          	jalr	-562(ra) # 584 <vprintf>
}
 7be:	60e2                	ld	ra,24(sp)
 7c0:	6442                	ld	s0,16(sp)
 7c2:	6125                	addi	sp,sp,96
 7c4:	8082                	ret

00000000000007c6 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7c6:	1141                	addi	sp,sp,-16
 7c8:	e422                	sd	s0,8(sp)
 7ca:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7cc:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7d0:	00000797          	auipc	a5,0x0
 7d4:	2387b783          	ld	a5,568(a5) # a08 <freep>
 7d8:	a805                	j	808 <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 7da:	4618                	lw	a4,8(a2)
 7dc:	9db9                	addw	a1,a1,a4
 7de:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 7e2:	6398                	ld	a4,0(a5)
 7e4:	6318                	ld	a4,0(a4)
 7e6:	fee53823          	sd	a4,-16(a0)
 7ea:	a091                	j	82e <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 7ec:	ff852703          	lw	a4,-8(a0)
 7f0:	9e39                	addw	a2,a2,a4
 7f2:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 7f4:	ff053703          	ld	a4,-16(a0)
 7f8:	e398                	sd	a4,0(a5)
 7fa:	a099                	j	840 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7fc:	6398                	ld	a4,0(a5)
 7fe:	00e7e463          	bltu	a5,a4,806 <free+0x40>
 802:	00e6ea63          	bltu	a3,a4,816 <free+0x50>
{
 806:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 808:	fed7fae3          	bgeu	a5,a3,7fc <free+0x36>
 80c:	6398                	ld	a4,0(a5)
 80e:	00e6e463          	bltu	a3,a4,816 <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 812:	fee7eae3          	bltu	a5,a4,806 <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 816:	ff852583          	lw	a1,-8(a0)
 81a:	6390                	ld	a2,0(a5)
 81c:	02059713          	slli	a4,a1,0x20
 820:	9301                	srli	a4,a4,0x20
 822:	0712                	slli	a4,a4,0x4
 824:	9736                	add	a4,a4,a3
 826:	fae60ae3          	beq	a2,a4,7da <free+0x14>
    bp->s.ptr = p->s.ptr;
 82a:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 82e:	4790                	lw	a2,8(a5)
 830:	02061713          	slli	a4,a2,0x20
 834:	9301                	srli	a4,a4,0x20
 836:	0712                	slli	a4,a4,0x4
 838:	973e                	add	a4,a4,a5
 83a:	fae689e3          	beq	a3,a4,7ec <free+0x26>
  } else
    p->s.ptr = bp;
 83e:	e394                	sd	a3,0(a5)
  freep = p;
 840:	00000717          	auipc	a4,0x0
 844:	1cf73423          	sd	a5,456(a4) # a08 <freep>
}
 848:	6422                	ld	s0,8(sp)
 84a:	0141                	addi	sp,sp,16
 84c:	8082                	ret

000000000000084e <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 84e:	7139                	addi	sp,sp,-64
 850:	fc06                	sd	ra,56(sp)
 852:	f822                	sd	s0,48(sp)
 854:	f426                	sd	s1,40(sp)
 856:	f04a                	sd	s2,32(sp)
 858:	ec4e                	sd	s3,24(sp)
 85a:	e852                	sd	s4,16(sp)
 85c:	e456                	sd	s5,8(sp)
 85e:	e05a                	sd	s6,0(sp)
 860:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 862:	02051493          	slli	s1,a0,0x20
 866:	9081                	srli	s1,s1,0x20
 868:	04bd                	addi	s1,s1,15
 86a:	8091                	srli	s1,s1,0x4
 86c:	0014899b          	addiw	s3,s1,1
 870:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 872:	00000517          	auipc	a0,0x0
 876:	19653503          	ld	a0,406(a0) # a08 <freep>
 87a:	c515                	beqz	a0,8a6 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 87c:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 87e:	4798                	lw	a4,8(a5)
 880:	02977f63          	bgeu	a4,s1,8be <malloc+0x70>
 884:	8a4e                	mv	s4,s3
 886:	0009871b          	sext.w	a4,s3
 88a:	6685                	lui	a3,0x1
 88c:	00d77363          	bgeu	a4,a3,892 <malloc+0x44>
 890:	6a05                	lui	s4,0x1
 892:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 896:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 89a:	00000917          	auipc	s2,0x0
 89e:	16e90913          	addi	s2,s2,366 # a08 <freep>
  if(p == (char*)-1)
 8a2:	5afd                	li	s5,-1
 8a4:	a88d                	j	916 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 8a6:	00000797          	auipc	a5,0x0
 8aa:	16a78793          	addi	a5,a5,362 # a10 <base>
 8ae:	00000717          	auipc	a4,0x0
 8b2:	14f73d23          	sd	a5,346(a4) # a08 <freep>
 8b6:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 8b8:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 8bc:	b7e1                	j	884 <malloc+0x36>
      if(p->s.size == nunits)
 8be:	02e48b63          	beq	s1,a4,8f4 <malloc+0xa6>
        p->s.size -= nunits;
 8c2:	4137073b          	subw	a4,a4,s3
 8c6:	c798                	sw	a4,8(a5)
        p += p->s.size;
 8c8:	1702                	slli	a4,a4,0x20
 8ca:	9301                	srli	a4,a4,0x20
 8cc:	0712                	slli	a4,a4,0x4
 8ce:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 8d0:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 8d4:	00000717          	auipc	a4,0x0
 8d8:	12a73a23          	sd	a0,308(a4) # a08 <freep>
      return (void*)(p + 1);
 8dc:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8e0:	70e2                	ld	ra,56(sp)
 8e2:	7442                	ld	s0,48(sp)
 8e4:	74a2                	ld	s1,40(sp)
 8e6:	7902                	ld	s2,32(sp)
 8e8:	69e2                	ld	s3,24(sp)
 8ea:	6a42                	ld	s4,16(sp)
 8ec:	6aa2                	ld	s5,8(sp)
 8ee:	6b02                	ld	s6,0(sp)
 8f0:	6121                	addi	sp,sp,64
 8f2:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 8f4:	6398                	ld	a4,0(a5)
 8f6:	e118                	sd	a4,0(a0)
 8f8:	bff1                	j	8d4 <malloc+0x86>
  hp->s.size = nu;
 8fa:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 8fe:	0541                	addi	a0,a0,16
 900:	00000097          	auipc	ra,0x0
 904:	ec6080e7          	jalr	-314(ra) # 7c6 <free>
  return freep;
 908:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 90c:	d971                	beqz	a0,8e0 <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 90e:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 910:	4798                	lw	a4,8(a5)
 912:	fa9776e3          	bgeu	a4,s1,8be <malloc+0x70>
    if(p == freep)
 916:	00093703          	ld	a4,0(s2)
 91a:	853e                	mv	a0,a5
 91c:	fef719e3          	bne	a4,a5,90e <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 920:	8552                	mv	a0,s4
 922:	00000097          	auipc	ra,0x0
 926:	b7e080e7          	jalr	-1154(ra) # 4a0 <sbrk>
  if(p == (char*)-1)
 92a:	fd5518e3          	bne	a0,s5,8fa <malloc+0xac>
        return 0;
 92e:	4501                	li	a0,0
 930:	bf45                	j	8e0 <malloc+0x92>
