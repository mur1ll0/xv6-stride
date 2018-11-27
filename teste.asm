
_teste:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
    //i=1;
  }
  return r;
}

int main(){
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
   f:	51                   	push   %ecx
  int numProc = 5;  //Definir numero de processos a serem alocados
  int i, pid, r;

  for(i=0;i<numProc;i++){
  10:	31 db                	xor    %ebx,%ebx
int main(){
  12:	83 ec 1c             	sub    $0x1c,%esp

    if(i < 2){
  15:	83 fb 01             	cmp    $0x1,%ebx
  18:	0f 8e 09 01 00 00    	jle    127 <main+0x127>
      pid = fork(10);
      printf(1, "Processo %d tem 10 tickets\n", getpid());
    }
    else if(i < 3){
  1e:	83 fb 02             	cmp    $0x2,%ebx
  21:	75 3d                	jne    60 <main+0x60>
      pid = fork(200);
  23:	83 ec 0c             	sub    $0xc,%esp
  26:	68 c8 00 00 00       	push   $0xc8
  2b:	e8 ba 03 00 00       	call   3ea <fork>
  30:	89 c6                	mov    %eax,%esi
      printf(1, "Processo %d tem 200 tickets\n", getpid());
  32:	e8 3b 04 00 00       	call   472 <getpid>
  37:	83 c4 0c             	add    $0xc,%esp
  3a:	50                   	push   %eax
  3b:	68 7c 08 00 00       	push   $0x87c
  40:	6a 01                	push   $0x1
  42:	e8 f9 04 00 00       	call   540 <printf>
  47:	83 c4 10             	add    $0x10,%esp
    else{
      pid = fork(1000);
      printf(1, "Processo %d tem 1000 tickets\n", getpid());
    }
    
    if(pid <0) printf(1, "Falha ao forkar %d\n", getpid());
  4a:	85 f6                	test   %esi,%esi
  4c:	78 3d                	js     8b <main+0x8b>
    else if(pid >0) continue;
  4e:	74 53                	je     a3 <main+0xa3>
  for(i=0;i<numProc;i++){
  50:	83 c3 01             	add    $0x1,%ebx
  53:	83 fb 05             	cmp    $0x5,%ebx
  56:	75 bd                	jne    15 <main+0x15>
      r = teste(getpid());
      printf(1, "\nTERMINOU %d - Resultado %d\n", getpid(), r);
      break;
    }
  }
  exit();
  58:	e8 95 03 00 00       	call   3f2 <exit>
  5d:	8d 76 00             	lea    0x0(%esi),%esi
      pid = fork(1000);
  60:	83 ec 0c             	sub    $0xc,%esp
  63:	68 e8 03 00 00       	push   $0x3e8
  68:	e8 7d 03 00 00       	call   3ea <fork>
  6d:	89 c6                	mov    %eax,%esi
      printf(1, "Processo %d tem 1000 tickets\n", getpid());
  6f:	e8 fe 03 00 00       	call   472 <getpid>
  74:	83 c4 0c             	add    $0xc,%esp
  77:	50                   	push   %eax
  78:	68 99 08 00 00       	push   $0x899
  7d:	6a 01                	push   $0x1
  7f:	e8 bc 04 00 00       	call   540 <printf>
  84:	83 c4 10             	add    $0x10,%esp
    if(pid <0) printf(1, "Falha ao forkar %d\n", getpid());
  87:	85 f6                	test   %esi,%esi
  89:	79 c3                	jns    4e <main+0x4e>
  8b:	e8 e2 03 00 00       	call   472 <getpid>
  90:	52                   	push   %edx
  91:	50                   	push   %eax
  92:	68 b7 08 00 00       	push   $0x8b7
  97:	6a 01                	push   $0x1
  99:	e8 a2 04 00 00       	call   540 <printf>
  9e:	83 c4 10             	add    $0x10,%esp
  a1:	eb ad                	jmp    50 <main+0x50>
      r = teste(getpid());
  a3:	e8 ca 03 00 00       	call   472 <getpid>
  int i, j=0, r = 1;
  a8:	bb 01 00 00 00       	mov    $0x1,%ebx
  for(i=1; i<=80000000;i++){
  ad:	b8 01 00 00 00       	mov    $0x1,%eax
  b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    r = (i+r) * (666 + j) +5 - 2;
  b8:	8d 96 9a 02 00 00    	lea    0x29a(%esi),%edx
  be:	01 c3                	add    %eax,%ebx
    j++;
  c0:	83 c6 01             	add    $0x1,%esi
    r = (i+r) * (666 + j) +5 - 2;
  c3:	0f af da             	imul   %edx,%ebx
  c6:	83 c3 03             	add    $0x3,%ebx
    if(j < 80000000) i=1;
  c9:	81 fe ff b3 c4 04    	cmp    $0x4c4b3ff,%esi
  cf:	7e 4f                	jle    120 <main+0x120>
  for(i=1; i<=80000000;i++){
  d1:	83 c0 01             	add    $0x1,%eax
  d4:	3d 00 b4 c4 04       	cmp    $0x4c4b400,%eax
  d9:	7e dd                	jle    b8 <main+0xb8>
      printf(1, "\nTERMINOU %d - Resultado %d\n", getpid(), r);
  db:	e8 92 03 00 00       	call   472 <getpid>
      r = teste(getpid());
  e0:	d9 7d e6             	fnstcw -0x1a(%ebp)
  e3:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  return r;
  e7:	89 5d dc             	mov    %ebx,-0x24(%ebp)
  ea:	db 45 dc             	fildl  -0x24(%ebp)
      r = teste(getpid());
  ed:	80 ce 0c             	or     $0xc,%dh
  f0:	66 89 55 e4          	mov    %dx,-0x1c(%ebp)
  f4:	d9 6d e4             	fldcw  -0x1c(%ebp)
  f7:	db 5d e0             	fistpl -0x20(%ebp)
  fa:	d9 6d e6             	fldcw  -0x1a(%ebp)
  fd:	8b 55 e0             	mov    -0x20(%ebp),%edx
      printf(1, "\nTERMINOU %d - Resultado %d\n", getpid(), r);
 100:	52                   	push   %edx
 101:	50                   	push   %eax
 102:	68 cb 08 00 00       	push   $0x8cb
 107:	6a 01                	push   $0x1
 109:	e8 32 04 00 00       	call   540 <printf>
      break;
 10e:	83 c4 10             	add    $0x10,%esp
 111:	e9 42 ff ff ff       	jmp    58 <main+0x58>
 116:	8d 76 00             	lea    0x0(%esi),%esi
 119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  for(i=1; i<=80000000;i++){
 120:	b8 02 00 00 00       	mov    $0x2,%eax
 125:	eb 91                	jmp    b8 <main+0xb8>
      pid = fork(10);
 127:	83 ec 0c             	sub    $0xc,%esp
 12a:	6a 0a                	push   $0xa
 12c:	e8 b9 02 00 00       	call   3ea <fork>
 131:	89 c6                	mov    %eax,%esi
      printf(1, "Processo %d tem 10 tickets\n", getpid());
 133:	e8 3a 03 00 00       	call   472 <getpid>
 138:	83 c4 0c             	add    $0xc,%esp
 13b:	50                   	push   %eax
 13c:	68 60 08 00 00       	push   $0x860
 141:	6a 01                	push   $0x1
 143:	e8 f8 03 00 00       	call   540 <printf>
 148:	83 c4 10             	add    $0x10,%esp
 14b:	e9 fa fe ff ff       	jmp    4a <main+0x4a>

00000150 <teste>:
float teste(int pid){
 150:	55                   	push   %ebp
  int i, j=0, r = 1;
 151:	b8 01 00 00 00       	mov    $0x1,%eax
 156:	31 d2                	xor    %edx,%edx
  for(i=1; i<=80000000;i++){
 158:	b9 01 00 00 00       	mov    $0x1,%ecx
float teste(int pid){
 15d:	89 e5                	mov    %esp,%ebp
 15f:	53                   	push   %ebx
 160:	83 ec 04             	sub    $0x4,%esp
 163:	90                   	nop
 164:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    r = (i+r) * (666 + j) +5 - 2;
 168:	8d 9a 9a 02 00 00    	lea    0x29a(%edx),%ebx
 16e:	01 c8                	add    %ecx,%eax
    j++;
 170:	83 c2 01             	add    $0x1,%edx
    r = (i+r) * (666 + j) +5 - 2;
 173:	0f af c3             	imul   %ebx,%eax
 176:	83 c0 03             	add    $0x3,%eax
    if(j < 80000000) i=1;
 179:	81 fa ff b3 c4 04    	cmp    $0x4c4b3ff,%edx
 17f:	7e 1f                	jle    1a0 <teste+0x50>
  for(i=1; i<=80000000;i++){
 181:	83 c1 01             	add    $0x1,%ecx
 184:	81 f9 00 b4 c4 04    	cmp    $0x4c4b400,%ecx
 18a:	7e dc                	jle    168 <teste+0x18>
  return r;
 18c:	89 45 f8             	mov    %eax,-0x8(%ebp)
 18f:	db 45 f8             	fildl  -0x8(%ebp)
}
 192:	83 c4 04             	add    $0x4,%esp
 195:	5b                   	pop    %ebx
 196:	5d                   	pop    %ebp
 197:	c3                   	ret    
 198:	90                   	nop
 199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(i=1; i<=80000000;i++){
 1a0:	b9 02 00 00 00       	mov    $0x2,%ecx
 1a5:	eb c1                	jmp    168 <teste+0x18>
 1a7:	66 90                	xchg   %ax,%ax
 1a9:	66 90                	xchg   %ax,%ax
 1ab:	66 90                	xchg   %ax,%ax
 1ad:	66 90                	xchg   %ax,%ax
 1af:	90                   	nop

000001b0 <strcpy>:
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	53                   	push   %ebx
 1b4:	8b 45 08             	mov    0x8(%ebp),%eax
 1b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1ba:	89 c2                	mov    %eax,%edx
 1bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1c0:	83 c1 01             	add    $0x1,%ecx
 1c3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 1c7:	83 c2 01             	add    $0x1,%edx
 1ca:	84 db                	test   %bl,%bl
 1cc:	88 5a ff             	mov    %bl,-0x1(%edx)
 1cf:	75 ef                	jne    1c0 <strcpy+0x10>
 1d1:	5b                   	pop    %ebx
 1d2:	5d                   	pop    %ebp
 1d3:	c3                   	ret    
 1d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001e0 <strcmp>:
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	56                   	push   %esi
 1e4:	53                   	push   %ebx
 1e5:	8b 55 08             	mov    0x8(%ebp),%edx
 1e8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1eb:	0f b6 02             	movzbl (%edx),%eax
 1ee:	0f b6 19             	movzbl (%ecx),%ebx
 1f1:	84 c0                	test   %al,%al
 1f3:	75 1e                	jne    213 <strcmp+0x33>
 1f5:	eb 29                	jmp    220 <strcmp+0x40>
 1f7:	89 f6                	mov    %esi,%esi
 1f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 200:	83 c2 01             	add    $0x1,%edx
 203:	0f b6 02             	movzbl (%edx),%eax
 206:	8d 71 01             	lea    0x1(%ecx),%esi
 209:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 20d:	84 c0                	test   %al,%al
 20f:	74 0f                	je     220 <strcmp+0x40>
 211:	89 f1                	mov    %esi,%ecx
 213:	38 d8                	cmp    %bl,%al
 215:	74 e9                	je     200 <strcmp+0x20>
 217:	29 d8                	sub    %ebx,%eax
 219:	5b                   	pop    %ebx
 21a:	5e                   	pop    %esi
 21b:	5d                   	pop    %ebp
 21c:	c3                   	ret    
 21d:	8d 76 00             	lea    0x0(%esi),%esi
 220:	31 c0                	xor    %eax,%eax
 222:	29 d8                	sub    %ebx,%eax
 224:	5b                   	pop    %ebx
 225:	5e                   	pop    %esi
 226:	5d                   	pop    %ebp
 227:	c3                   	ret    
 228:	90                   	nop
 229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000230 <strlen>:
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	8b 4d 08             	mov    0x8(%ebp),%ecx
 236:	80 39 00             	cmpb   $0x0,(%ecx)
 239:	74 12                	je     24d <strlen+0x1d>
 23b:	31 d2                	xor    %edx,%edx
 23d:	8d 76 00             	lea    0x0(%esi),%esi
 240:	83 c2 01             	add    $0x1,%edx
 243:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 247:	89 d0                	mov    %edx,%eax
 249:	75 f5                	jne    240 <strlen+0x10>
 24b:	5d                   	pop    %ebp
 24c:	c3                   	ret    
 24d:	31 c0                	xor    %eax,%eax
 24f:	5d                   	pop    %ebp
 250:	c3                   	ret    
 251:	eb 0d                	jmp    260 <memset>
 253:	90                   	nop
 254:	90                   	nop
 255:	90                   	nop
 256:	90                   	nop
 257:	90                   	nop
 258:	90                   	nop
 259:	90                   	nop
 25a:	90                   	nop
 25b:	90                   	nop
 25c:	90                   	nop
 25d:	90                   	nop
 25e:	90                   	nop
 25f:	90                   	nop

00000260 <memset>:
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	57                   	push   %edi
 264:	8b 55 08             	mov    0x8(%ebp),%edx
 267:	8b 4d 10             	mov    0x10(%ebp),%ecx
 26a:	8b 45 0c             	mov    0xc(%ebp),%eax
 26d:	89 d7                	mov    %edx,%edi
 26f:	fc                   	cld    
 270:	f3 aa                	rep stos %al,%es:(%edi)
 272:	89 d0                	mov    %edx,%eax
 274:	5f                   	pop    %edi
 275:	5d                   	pop    %ebp
 276:	c3                   	ret    
 277:	89 f6                	mov    %esi,%esi
 279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000280 <strchr>:
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	53                   	push   %ebx
 284:	8b 45 08             	mov    0x8(%ebp),%eax
 287:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 28a:	0f b6 10             	movzbl (%eax),%edx
 28d:	84 d2                	test   %dl,%dl
 28f:	74 1d                	je     2ae <strchr+0x2e>
 291:	38 d3                	cmp    %dl,%bl
 293:	89 d9                	mov    %ebx,%ecx
 295:	75 0d                	jne    2a4 <strchr+0x24>
 297:	eb 17                	jmp    2b0 <strchr+0x30>
 299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2a0:	38 ca                	cmp    %cl,%dl
 2a2:	74 0c                	je     2b0 <strchr+0x30>
 2a4:	83 c0 01             	add    $0x1,%eax
 2a7:	0f b6 10             	movzbl (%eax),%edx
 2aa:	84 d2                	test   %dl,%dl
 2ac:	75 f2                	jne    2a0 <strchr+0x20>
 2ae:	31 c0                	xor    %eax,%eax
 2b0:	5b                   	pop    %ebx
 2b1:	5d                   	pop    %ebp
 2b2:	c3                   	ret    
 2b3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002c0 <gets>:
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	57                   	push   %edi
 2c4:	56                   	push   %esi
 2c5:	53                   	push   %ebx
 2c6:	31 f6                	xor    %esi,%esi
 2c8:	8d 7d e7             	lea    -0x19(%ebp),%edi
 2cb:	83 ec 1c             	sub    $0x1c,%esp
 2ce:	eb 29                	jmp    2f9 <gets+0x39>
 2d0:	83 ec 04             	sub    $0x4,%esp
 2d3:	6a 01                	push   $0x1
 2d5:	57                   	push   %edi
 2d6:	6a 00                	push   $0x0
 2d8:	e8 2d 01 00 00       	call   40a <read>
 2dd:	83 c4 10             	add    $0x10,%esp
 2e0:	85 c0                	test   %eax,%eax
 2e2:	7e 1d                	jle    301 <gets+0x41>
 2e4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2e8:	8b 55 08             	mov    0x8(%ebp),%edx
 2eb:	89 de                	mov    %ebx,%esi
 2ed:	3c 0a                	cmp    $0xa,%al
 2ef:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 2f3:	74 1b                	je     310 <gets+0x50>
 2f5:	3c 0d                	cmp    $0xd,%al
 2f7:	74 17                	je     310 <gets+0x50>
 2f9:	8d 5e 01             	lea    0x1(%esi),%ebx
 2fc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2ff:	7c cf                	jl     2d0 <gets+0x10>
 301:	8b 45 08             	mov    0x8(%ebp),%eax
 304:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
 308:	8d 65 f4             	lea    -0xc(%ebp),%esp
 30b:	5b                   	pop    %ebx
 30c:	5e                   	pop    %esi
 30d:	5f                   	pop    %edi
 30e:	5d                   	pop    %ebp
 30f:	c3                   	ret    
 310:	8b 45 08             	mov    0x8(%ebp),%eax
 313:	89 de                	mov    %ebx,%esi
 315:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
 319:	8d 65 f4             	lea    -0xc(%ebp),%esp
 31c:	5b                   	pop    %ebx
 31d:	5e                   	pop    %esi
 31e:	5f                   	pop    %edi
 31f:	5d                   	pop    %ebp
 320:	c3                   	ret    
 321:	eb 0d                	jmp    330 <stat>
 323:	90                   	nop
 324:	90                   	nop
 325:	90                   	nop
 326:	90                   	nop
 327:	90                   	nop
 328:	90                   	nop
 329:	90                   	nop
 32a:	90                   	nop
 32b:	90                   	nop
 32c:	90                   	nop
 32d:	90                   	nop
 32e:	90                   	nop
 32f:	90                   	nop

00000330 <stat>:
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	56                   	push   %esi
 334:	53                   	push   %ebx
 335:	83 ec 08             	sub    $0x8,%esp
 338:	6a 00                	push   $0x0
 33a:	ff 75 08             	pushl  0x8(%ebp)
 33d:	e8 f0 00 00 00       	call   432 <open>
 342:	83 c4 10             	add    $0x10,%esp
 345:	85 c0                	test   %eax,%eax
 347:	78 27                	js     370 <stat+0x40>
 349:	83 ec 08             	sub    $0x8,%esp
 34c:	ff 75 0c             	pushl  0xc(%ebp)
 34f:	89 c3                	mov    %eax,%ebx
 351:	50                   	push   %eax
 352:	e8 f3 00 00 00       	call   44a <fstat>
 357:	89 1c 24             	mov    %ebx,(%esp)
 35a:	89 c6                	mov    %eax,%esi
 35c:	e8 b9 00 00 00       	call   41a <close>
 361:	83 c4 10             	add    $0x10,%esp
 364:	8d 65 f8             	lea    -0x8(%ebp),%esp
 367:	89 f0                	mov    %esi,%eax
 369:	5b                   	pop    %ebx
 36a:	5e                   	pop    %esi
 36b:	5d                   	pop    %ebp
 36c:	c3                   	ret    
 36d:	8d 76 00             	lea    0x0(%esi),%esi
 370:	be ff ff ff ff       	mov    $0xffffffff,%esi
 375:	eb ed                	jmp    364 <stat+0x34>
 377:	89 f6                	mov    %esi,%esi
 379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000380 <atoi>:
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	53                   	push   %ebx
 384:	8b 4d 08             	mov    0x8(%ebp),%ecx
 387:	0f be 11             	movsbl (%ecx),%edx
 38a:	8d 42 d0             	lea    -0x30(%edx),%eax
 38d:	3c 09                	cmp    $0x9,%al
 38f:	b8 00 00 00 00       	mov    $0x0,%eax
 394:	77 1f                	ja     3b5 <atoi+0x35>
 396:	8d 76 00             	lea    0x0(%esi),%esi
 399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 3a0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 3a3:	83 c1 01             	add    $0x1,%ecx
 3a6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
 3aa:	0f be 11             	movsbl (%ecx),%edx
 3ad:	8d 5a d0             	lea    -0x30(%edx),%ebx
 3b0:	80 fb 09             	cmp    $0x9,%bl
 3b3:	76 eb                	jbe    3a0 <atoi+0x20>
 3b5:	5b                   	pop    %ebx
 3b6:	5d                   	pop    %ebp
 3b7:	c3                   	ret    
 3b8:	90                   	nop
 3b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003c0 <memmove>:
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	56                   	push   %esi
 3c4:	53                   	push   %ebx
 3c5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3c8:	8b 45 08             	mov    0x8(%ebp),%eax
 3cb:	8b 75 0c             	mov    0xc(%ebp),%esi
 3ce:	85 db                	test   %ebx,%ebx
 3d0:	7e 14                	jle    3e6 <memmove+0x26>
 3d2:	31 d2                	xor    %edx,%edx
 3d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3d8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 3dc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 3df:	83 c2 01             	add    $0x1,%edx
 3e2:	39 da                	cmp    %ebx,%edx
 3e4:	75 f2                	jne    3d8 <memmove+0x18>
 3e6:	5b                   	pop    %ebx
 3e7:	5e                   	pop    %esi
 3e8:	5d                   	pop    %ebp
 3e9:	c3                   	ret    

000003ea <fork>:
 3ea:	b8 01 00 00 00       	mov    $0x1,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <exit>:
 3f2:	b8 02 00 00 00       	mov    $0x2,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <wait>:
 3fa:	b8 03 00 00 00       	mov    $0x3,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <pipe>:
 402:	b8 04 00 00 00       	mov    $0x4,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <read>:
 40a:	b8 05 00 00 00       	mov    $0x5,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <write>:
 412:	b8 10 00 00 00       	mov    $0x10,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <close>:
 41a:	b8 15 00 00 00       	mov    $0x15,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <kill>:
 422:	b8 06 00 00 00       	mov    $0x6,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <exec>:
 42a:	b8 07 00 00 00       	mov    $0x7,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <open>:
 432:	b8 0f 00 00 00       	mov    $0xf,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <mknod>:
 43a:	b8 11 00 00 00       	mov    $0x11,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <unlink>:
 442:	b8 12 00 00 00       	mov    $0x12,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <fstat>:
 44a:	b8 08 00 00 00       	mov    $0x8,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <link>:
 452:	b8 13 00 00 00       	mov    $0x13,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <mkdir>:
 45a:	b8 14 00 00 00       	mov    $0x14,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <chdir>:
 462:	b8 09 00 00 00       	mov    $0x9,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <dup>:
 46a:	b8 0a 00 00 00       	mov    $0xa,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <getpid>:
 472:	b8 0b 00 00 00       	mov    $0xb,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <sbrk>:
 47a:	b8 0c 00 00 00       	mov    $0xc,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <sleep>:
 482:	b8 0d 00 00 00       	mov    $0xd,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <uptime>:
 48a:	b8 0e 00 00 00       	mov    $0xe,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    
 492:	66 90                	xchg   %ax,%ax
 494:	66 90                	xchg   %ax,%ax
 496:	66 90                	xchg   %ax,%ax
 498:	66 90                	xchg   %ax,%ax
 49a:	66 90                	xchg   %ax,%ax
 49c:	66 90                	xchg   %ax,%ax
 49e:	66 90                	xchg   %ax,%ax

000004a0 <printint>:
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	57                   	push   %edi
 4a4:	56                   	push   %esi
 4a5:	53                   	push   %ebx
 4a6:	89 c6                	mov    %eax,%esi
 4a8:	83 ec 3c             	sub    $0x3c,%esp
 4ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
 4ae:	85 db                	test   %ebx,%ebx
 4b0:	74 7e                	je     530 <printint+0x90>
 4b2:	89 d0                	mov    %edx,%eax
 4b4:	c1 e8 1f             	shr    $0x1f,%eax
 4b7:	84 c0                	test   %al,%al
 4b9:	74 75                	je     530 <printint+0x90>
 4bb:	89 d0                	mov    %edx,%eax
 4bd:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 4c4:	f7 d8                	neg    %eax
 4c6:	89 75 c0             	mov    %esi,-0x40(%ebp)
 4c9:	31 ff                	xor    %edi,%edi
 4cb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 4ce:	89 ce                	mov    %ecx,%esi
 4d0:	eb 08                	jmp    4da <printint+0x3a>
 4d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 4d8:	89 cf                	mov    %ecx,%edi
 4da:	31 d2                	xor    %edx,%edx
 4dc:	8d 4f 01             	lea    0x1(%edi),%ecx
 4df:	f7 f6                	div    %esi
 4e1:	0f b6 92 f0 08 00 00 	movzbl 0x8f0(%edx),%edx
 4e8:	85 c0                	test   %eax,%eax
 4ea:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
 4ed:	75 e9                	jne    4d8 <printint+0x38>
 4ef:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 4f2:	8b 75 c0             	mov    -0x40(%ebp),%esi
 4f5:	85 c0                	test   %eax,%eax
 4f7:	74 08                	je     501 <printint+0x61>
 4f9:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 4fe:	8d 4f 02             	lea    0x2(%edi),%ecx
 501:	8d 79 ff             	lea    -0x1(%ecx),%edi
 504:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 508:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 50d:	83 ec 04             	sub    $0x4,%esp
 510:	83 ef 01             	sub    $0x1,%edi
 513:	6a 01                	push   $0x1
 515:	53                   	push   %ebx
 516:	56                   	push   %esi
 517:	88 45 d7             	mov    %al,-0x29(%ebp)
 51a:	e8 f3 fe ff ff       	call   412 <write>
 51f:	83 c4 10             	add    $0x10,%esp
 522:	83 ff ff             	cmp    $0xffffffff,%edi
 525:	75 e1                	jne    508 <printint+0x68>
 527:	8d 65 f4             	lea    -0xc(%ebp),%esp
 52a:	5b                   	pop    %ebx
 52b:	5e                   	pop    %esi
 52c:	5f                   	pop    %edi
 52d:	5d                   	pop    %ebp
 52e:	c3                   	ret    
 52f:	90                   	nop
 530:	89 d0                	mov    %edx,%eax
 532:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 539:	eb 8b                	jmp    4c6 <printint+0x26>
 53b:	90                   	nop
 53c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000540 <printf>:
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	57                   	push   %edi
 544:	56                   	push   %esi
 545:	53                   	push   %ebx
 546:	8d 45 10             	lea    0x10(%ebp),%eax
 549:	83 ec 2c             	sub    $0x2c,%esp
 54c:	8b 75 0c             	mov    0xc(%ebp),%esi
 54f:	8b 7d 08             	mov    0x8(%ebp),%edi
 552:	89 45 d0             	mov    %eax,-0x30(%ebp)
 555:	0f b6 1e             	movzbl (%esi),%ebx
 558:	83 c6 01             	add    $0x1,%esi
 55b:	84 db                	test   %bl,%bl
 55d:	0f 84 b0 00 00 00    	je     613 <printf+0xd3>
 563:	31 d2                	xor    %edx,%edx
 565:	eb 39                	jmp    5a0 <printf+0x60>
 567:	89 f6                	mov    %esi,%esi
 569:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 570:	83 f8 25             	cmp    $0x25,%eax
 573:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 576:	ba 25 00 00 00       	mov    $0x25,%edx
 57b:	74 18                	je     595 <printf+0x55>
 57d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 580:	83 ec 04             	sub    $0x4,%esp
 583:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 586:	6a 01                	push   $0x1
 588:	50                   	push   %eax
 589:	57                   	push   %edi
 58a:	e8 83 fe ff ff       	call   412 <write>
 58f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 592:	83 c4 10             	add    $0x10,%esp
 595:	83 c6 01             	add    $0x1,%esi
 598:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 59c:	84 db                	test   %bl,%bl
 59e:	74 73                	je     613 <printf+0xd3>
 5a0:	85 d2                	test   %edx,%edx
 5a2:	0f be cb             	movsbl %bl,%ecx
 5a5:	0f b6 c3             	movzbl %bl,%eax
 5a8:	74 c6                	je     570 <printf+0x30>
 5aa:	83 fa 25             	cmp    $0x25,%edx
 5ad:	75 e6                	jne    595 <printf+0x55>
 5af:	83 f8 64             	cmp    $0x64,%eax
 5b2:	0f 84 f8 00 00 00    	je     6b0 <printf+0x170>
 5b8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 5be:	83 f9 70             	cmp    $0x70,%ecx
 5c1:	74 5d                	je     620 <printf+0xe0>
 5c3:	83 f8 73             	cmp    $0x73,%eax
 5c6:	0f 84 84 00 00 00    	je     650 <printf+0x110>
 5cc:	83 f8 63             	cmp    $0x63,%eax
 5cf:	0f 84 ea 00 00 00    	je     6bf <printf+0x17f>
 5d5:	83 f8 25             	cmp    $0x25,%eax
 5d8:	0f 84 c2 00 00 00    	je     6a0 <printf+0x160>
 5de:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5e1:	83 ec 04             	sub    $0x4,%esp
 5e4:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5e8:	6a 01                	push   $0x1
 5ea:	50                   	push   %eax
 5eb:	57                   	push   %edi
 5ec:	e8 21 fe ff ff       	call   412 <write>
 5f1:	83 c4 0c             	add    $0xc,%esp
 5f4:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 5f7:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 5fa:	6a 01                	push   $0x1
 5fc:	50                   	push   %eax
 5fd:	57                   	push   %edi
 5fe:	83 c6 01             	add    $0x1,%esi
 601:	e8 0c fe ff ff       	call   412 <write>
 606:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 60a:	83 c4 10             	add    $0x10,%esp
 60d:	31 d2                	xor    %edx,%edx
 60f:	84 db                	test   %bl,%bl
 611:	75 8d                	jne    5a0 <printf+0x60>
 613:	8d 65 f4             	lea    -0xc(%ebp),%esp
 616:	5b                   	pop    %ebx
 617:	5e                   	pop    %esi
 618:	5f                   	pop    %edi
 619:	5d                   	pop    %ebp
 61a:	c3                   	ret    
 61b:	90                   	nop
 61c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 620:	83 ec 0c             	sub    $0xc,%esp
 623:	b9 10 00 00 00       	mov    $0x10,%ecx
 628:	6a 00                	push   $0x0
 62a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 62d:	89 f8                	mov    %edi,%eax
 62f:	8b 13                	mov    (%ebx),%edx
 631:	e8 6a fe ff ff       	call   4a0 <printint>
 636:	89 d8                	mov    %ebx,%eax
 638:	83 c4 10             	add    $0x10,%esp
 63b:	31 d2                	xor    %edx,%edx
 63d:	83 c0 04             	add    $0x4,%eax
 640:	89 45 d0             	mov    %eax,-0x30(%ebp)
 643:	e9 4d ff ff ff       	jmp    595 <printf+0x55>
 648:	90                   	nop
 649:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 650:	8b 45 d0             	mov    -0x30(%ebp),%eax
 653:	8b 18                	mov    (%eax),%ebx
 655:	83 c0 04             	add    $0x4,%eax
 658:	89 45 d0             	mov    %eax,-0x30(%ebp)
 65b:	85 db                	test   %ebx,%ebx
 65d:	74 7c                	je     6db <printf+0x19b>
 65f:	0f b6 03             	movzbl (%ebx),%eax
 662:	84 c0                	test   %al,%al
 664:	74 29                	je     68f <printf+0x14f>
 666:	8d 76 00             	lea    0x0(%esi),%esi
 669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 670:	88 45 e3             	mov    %al,-0x1d(%ebp)
 673:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 676:	83 ec 04             	sub    $0x4,%esp
 679:	6a 01                	push   $0x1
 67b:	83 c3 01             	add    $0x1,%ebx
 67e:	50                   	push   %eax
 67f:	57                   	push   %edi
 680:	e8 8d fd ff ff       	call   412 <write>
 685:	0f b6 03             	movzbl (%ebx),%eax
 688:	83 c4 10             	add    $0x10,%esp
 68b:	84 c0                	test   %al,%al
 68d:	75 e1                	jne    670 <printf+0x130>
 68f:	31 d2                	xor    %edx,%edx
 691:	e9 ff fe ff ff       	jmp    595 <printf+0x55>
 696:	8d 76 00             	lea    0x0(%esi),%esi
 699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 6a0:	83 ec 04             	sub    $0x4,%esp
 6a3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 6a6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 6a9:	6a 01                	push   $0x1
 6ab:	e9 4c ff ff ff       	jmp    5fc <printf+0xbc>
 6b0:	83 ec 0c             	sub    $0xc,%esp
 6b3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6b8:	6a 01                	push   $0x1
 6ba:	e9 6b ff ff ff       	jmp    62a <printf+0xea>
 6bf:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6c2:	83 ec 04             	sub    $0x4,%esp
 6c5:	8b 03                	mov    (%ebx),%eax
 6c7:	6a 01                	push   $0x1
 6c9:	88 45 e4             	mov    %al,-0x1c(%ebp)
 6cc:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 6cf:	50                   	push   %eax
 6d0:	57                   	push   %edi
 6d1:	e8 3c fd ff ff       	call   412 <write>
 6d6:	e9 5b ff ff ff       	jmp    636 <printf+0xf6>
 6db:	b8 28 00 00 00       	mov    $0x28,%eax
 6e0:	bb e8 08 00 00       	mov    $0x8e8,%ebx
 6e5:	eb 89                	jmp    670 <printf+0x130>
 6e7:	66 90                	xchg   %ax,%ax
 6e9:	66 90                	xchg   %ax,%ax
 6eb:	66 90                	xchg   %ax,%ax
 6ed:	66 90                	xchg   %ax,%ax
 6ef:	90                   	nop

000006f0 <free>:
 6f0:	55                   	push   %ebp
 6f1:	a1 b8 0b 00 00       	mov    0xbb8,%eax
 6f6:	89 e5                	mov    %esp,%ebp
 6f8:	57                   	push   %edi
 6f9:	56                   	push   %esi
 6fa:	53                   	push   %ebx
 6fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6fe:	8b 10                	mov    (%eax),%edx
 700:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 703:	39 c8                	cmp    %ecx,%eax
 705:	73 19                	jae    720 <free+0x30>
 707:	89 f6                	mov    %esi,%esi
 709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 710:	39 d1                	cmp    %edx,%ecx
 712:	72 1c                	jb     730 <free+0x40>
 714:	39 d0                	cmp    %edx,%eax
 716:	73 18                	jae    730 <free+0x40>
 718:	89 d0                	mov    %edx,%eax
 71a:	39 c8                	cmp    %ecx,%eax
 71c:	8b 10                	mov    (%eax),%edx
 71e:	72 f0                	jb     710 <free+0x20>
 720:	39 d0                	cmp    %edx,%eax
 722:	72 f4                	jb     718 <free+0x28>
 724:	39 d1                	cmp    %edx,%ecx
 726:	73 f0                	jae    718 <free+0x28>
 728:	90                   	nop
 729:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 730:	8b 73 fc             	mov    -0x4(%ebx),%esi
 733:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 736:	39 fa                	cmp    %edi,%edx
 738:	74 19                	je     753 <free+0x63>
 73a:	89 53 f8             	mov    %edx,-0x8(%ebx)
 73d:	8b 50 04             	mov    0x4(%eax),%edx
 740:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 743:	39 f1                	cmp    %esi,%ecx
 745:	74 23                	je     76a <free+0x7a>
 747:	89 08                	mov    %ecx,(%eax)
 749:	a3 b8 0b 00 00       	mov    %eax,0xbb8
 74e:	5b                   	pop    %ebx
 74f:	5e                   	pop    %esi
 750:	5f                   	pop    %edi
 751:	5d                   	pop    %ebp
 752:	c3                   	ret    
 753:	03 72 04             	add    0x4(%edx),%esi
 756:	89 73 fc             	mov    %esi,-0x4(%ebx)
 759:	8b 10                	mov    (%eax),%edx
 75b:	8b 12                	mov    (%edx),%edx
 75d:	89 53 f8             	mov    %edx,-0x8(%ebx)
 760:	8b 50 04             	mov    0x4(%eax),%edx
 763:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 766:	39 f1                	cmp    %esi,%ecx
 768:	75 dd                	jne    747 <free+0x57>
 76a:	03 53 fc             	add    -0x4(%ebx),%edx
 76d:	a3 b8 0b 00 00       	mov    %eax,0xbb8
 772:	89 50 04             	mov    %edx,0x4(%eax)
 775:	8b 53 f8             	mov    -0x8(%ebx),%edx
 778:	89 10                	mov    %edx,(%eax)
 77a:	5b                   	pop    %ebx
 77b:	5e                   	pop    %esi
 77c:	5f                   	pop    %edi
 77d:	5d                   	pop    %ebp
 77e:	c3                   	ret    
 77f:	90                   	nop

00000780 <malloc>:
 780:	55                   	push   %ebp
 781:	89 e5                	mov    %esp,%ebp
 783:	57                   	push   %edi
 784:	56                   	push   %esi
 785:	53                   	push   %ebx
 786:	83 ec 0c             	sub    $0xc,%esp
 789:	8b 45 08             	mov    0x8(%ebp),%eax
 78c:	8b 15 b8 0b 00 00    	mov    0xbb8,%edx
 792:	8d 78 07             	lea    0x7(%eax),%edi
 795:	c1 ef 03             	shr    $0x3,%edi
 798:	83 c7 01             	add    $0x1,%edi
 79b:	85 d2                	test   %edx,%edx
 79d:	0f 84 93 00 00 00    	je     836 <malloc+0xb6>
 7a3:	8b 02                	mov    (%edx),%eax
 7a5:	8b 48 04             	mov    0x4(%eax),%ecx
 7a8:	39 cf                	cmp    %ecx,%edi
 7aa:	76 64                	jbe    810 <malloc+0x90>
 7ac:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 7b2:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7b7:	0f 43 df             	cmovae %edi,%ebx
 7ba:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 7c1:	eb 0e                	jmp    7d1 <malloc+0x51>
 7c3:	90                   	nop
 7c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7c8:	8b 02                	mov    (%edx),%eax
 7ca:	8b 48 04             	mov    0x4(%eax),%ecx
 7cd:	39 cf                	cmp    %ecx,%edi
 7cf:	76 3f                	jbe    810 <malloc+0x90>
 7d1:	39 05 b8 0b 00 00    	cmp    %eax,0xbb8
 7d7:	89 c2                	mov    %eax,%edx
 7d9:	75 ed                	jne    7c8 <malloc+0x48>
 7db:	83 ec 0c             	sub    $0xc,%esp
 7de:	56                   	push   %esi
 7df:	e8 96 fc ff ff       	call   47a <sbrk>
 7e4:	83 c4 10             	add    $0x10,%esp
 7e7:	83 f8 ff             	cmp    $0xffffffff,%eax
 7ea:	74 1c                	je     808 <malloc+0x88>
 7ec:	89 58 04             	mov    %ebx,0x4(%eax)
 7ef:	83 ec 0c             	sub    $0xc,%esp
 7f2:	83 c0 08             	add    $0x8,%eax
 7f5:	50                   	push   %eax
 7f6:	e8 f5 fe ff ff       	call   6f0 <free>
 7fb:	8b 15 b8 0b 00 00    	mov    0xbb8,%edx
 801:	83 c4 10             	add    $0x10,%esp
 804:	85 d2                	test   %edx,%edx
 806:	75 c0                	jne    7c8 <malloc+0x48>
 808:	31 c0                	xor    %eax,%eax
 80a:	eb 1c                	jmp    828 <malloc+0xa8>
 80c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 810:	39 cf                	cmp    %ecx,%edi
 812:	74 1c                	je     830 <malloc+0xb0>
 814:	29 f9                	sub    %edi,%ecx
 816:	89 48 04             	mov    %ecx,0x4(%eax)
 819:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 81c:	89 78 04             	mov    %edi,0x4(%eax)
 81f:	89 15 b8 0b 00 00    	mov    %edx,0xbb8
 825:	83 c0 08             	add    $0x8,%eax
 828:	8d 65 f4             	lea    -0xc(%ebp),%esp
 82b:	5b                   	pop    %ebx
 82c:	5e                   	pop    %esi
 82d:	5f                   	pop    %edi
 82e:	5d                   	pop    %ebp
 82f:	c3                   	ret    
 830:	8b 08                	mov    (%eax),%ecx
 832:	89 0a                	mov    %ecx,(%edx)
 834:	eb e9                	jmp    81f <malloc+0x9f>
 836:	c7 05 b8 0b 00 00 bc 	movl   $0xbbc,0xbb8
 83d:	0b 00 00 
 840:	c7 05 bc 0b 00 00 bc 	movl   $0xbbc,0xbbc
 847:	0b 00 00 
 84a:	b8 bc 0b 00 00       	mov    $0xbbc,%eax
 84f:	c7 05 c0 0b 00 00 00 	movl   $0x0,0xbc0
 856:	00 00 00 
 859:	e9 4e ff ff ff       	jmp    7ac <malloc+0x2c>
