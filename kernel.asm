
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:
8010000c:	0f 20 e0             	mov    %cr4,%eax
8010000f:	83 c8 10             	or     $0x10,%eax
80100012:	0f 22 e0             	mov    %eax,%cr4
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
8010001a:	0f 22 d8             	mov    %eax,%cr3
8010001d:	0f 20 c0             	mov    %cr0,%eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
80100025:	0f 22 c0             	mov    %eax,%cr0
80100028:	bc 80 bf 10 80       	mov    $0x8010bf80,%esp
8010002d:	b8 80 2e 10 80       	mov    $0x80102e80,%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx
80100044:	bb b4 bf 10 80       	mov    $0x8010bfb4,%ebx
80100049:	83 ec 0c             	sub    $0xc,%esp
8010004c:	68 40 71 10 80       	push   $0x80107140
80100051:	68 80 bf 10 80       	push   $0x8010bf80
80100056:	e8 05 42 00 00       	call   80104260 <initlock>
8010005b:	c7 05 cc 06 11 80 7c 	movl   $0x8011067c,0x801106cc
80100062:	06 11 80 
80100065:	c7 05 d0 06 11 80 7c 	movl   $0x8011067c,0x801106d0
8010006c:	06 11 80 
8010006f:	83 c4 10             	add    $0x10,%esp
80100072:	ba 7c 06 11 80       	mov    $0x8011067c,%edx
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c3                	mov    %eax,%ebx
80100082:	8d 43 0c             	lea    0xc(%ebx),%eax
80100085:	83 ec 08             	sub    $0x8,%esp
80100088:	89 53 54             	mov    %edx,0x54(%ebx)
8010008b:	c7 43 50 7c 06 11 80 	movl   $0x8011067c,0x50(%ebx)
80100092:	68 47 71 10 80       	push   $0x80107147
80100097:	50                   	push   %eax
80100098:	e8 93 40 00 00       	call   80104130 <initsleeplock>
8010009d:	a1 d0 06 11 80       	mov    0x801106d0,%eax
801000a2:	83 c4 10             	add    $0x10,%esp
801000a5:	89 da                	mov    %ebx,%edx
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)
801000aa:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
801000b0:	89 1d d0 06 11 80    	mov    %ebx,0x801106d0
801000b6:	3d 7c 06 11 80       	cmp    $0x8011067c,%eax
801000bb:	72 c3                	jb     80100080 <binit+0x40>
801000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c0:	c9                   	leave  
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
801000df:	68 80 bf 10 80       	push   $0x8010bf80
801000e4:	e8 d7 42 00 00       	call   801043c0 <acquire>
801000e9:	8b 1d d0 06 11 80    	mov    0x801106d0,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb 7c 06 11 80    	cmp    $0x8011067c,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb 7c 06 11 80    	cmp    $0x8011067c,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100120:	8b 1d cc 06 11 80    	mov    0x801106cc,%ebx
80100126:	81 fb 7c 06 11 80    	cmp    $0x8011067c,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 60                	jmp    80100190 <bread+0xc0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb 7c 06 11 80    	cmp    $0x8011067c,%ebx
80100139:	74 55                	je     80100190 <bread+0xc0>
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 80 bf 10 80       	push   $0x8010bf80
80100162:	e8 09 43 00 00       	call   80104470 <release>
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 fe 3f 00 00       	call   80104170 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	75 0c                	jne    80100186 <bread+0xb6>
8010017a:	83 ec 0c             	sub    $0xc,%esp
8010017d:	53                   	push   %ebx
8010017e:	e8 6d 1f 00 00       	call   801020f0 <iderw>
80100183:	83 c4 10             	add    $0x10,%esp
80100186:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100189:	89 d8                	mov    %ebx,%eax
8010018b:	5b                   	pop    %ebx
8010018c:	5e                   	pop    %esi
8010018d:	5f                   	pop    %edi
8010018e:	5d                   	pop    %ebp
8010018f:	c3                   	ret    
80100190:	83 ec 0c             	sub    $0xc,%esp
80100193:	68 4e 71 10 80       	push   $0x8010714e
80100198:	e8 d3 01 00 00       	call   80100370 <panic>
8010019d:	8d 76 00             	lea    0x0(%esi),%esi

801001a0 <bwrite>:
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 10             	sub    $0x10,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	50                   	push   %eax
801001ae:	e8 5d 40 00 00       	call   80104210 <holdingsleep>
801001b3:	83 c4 10             	add    $0x10,%esp
801001b6:	85 c0                	test   %eax,%eax
801001b8:	74 0f                	je     801001c9 <bwrite+0x29>
801001ba:	83 0b 04             	orl    $0x4,(%ebx)
801001bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
801001c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c3:	c9                   	leave  
801001c4:	e9 27 1f 00 00       	jmp    801020f0 <iderw>
801001c9:	83 ec 0c             	sub    $0xc,%esp
801001cc:	68 5f 71 10 80       	push   $0x8010715f
801001d1:	e8 9a 01 00 00       	call   80100370 <panic>
801001d6:	8d 76 00             	lea    0x0(%esi),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001e8:	83 ec 0c             	sub    $0xc,%esp
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	56                   	push   %esi
801001ef:	e8 1c 40 00 00       	call   80104210 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 cc 3f 00 00       	call   801041d0 <releasesleep>
80100204:	c7 04 24 80 bf 10 80 	movl   $0x8010bf80,(%esp)
8010020b:	e8 b0 41 00 00       	call   801043c0 <acquire>
80100210:	8b 43 4c             	mov    0x4c(%ebx),%eax
80100213:	83 c4 10             	add    $0x10,%esp
80100216:	83 e8 01             	sub    $0x1,%eax
80100219:	85 c0                	test   %eax,%eax
8010021b:	89 43 4c             	mov    %eax,0x4c(%ebx)
8010021e:	75 2f                	jne    8010024f <brelse+0x6f>
80100220:	8b 43 54             	mov    0x54(%ebx),%eax
80100223:	8b 53 50             	mov    0x50(%ebx),%edx
80100226:	89 50 50             	mov    %edx,0x50(%eax)
80100229:	8b 43 50             	mov    0x50(%ebx),%eax
8010022c:	8b 53 54             	mov    0x54(%ebx),%edx
8010022f:	89 50 54             	mov    %edx,0x54(%eax)
80100232:	a1 d0 06 11 80       	mov    0x801106d0,%eax
80100237:	c7 43 50 7c 06 11 80 	movl   $0x8011067c,0x50(%ebx)
8010023e:	89 43 54             	mov    %eax,0x54(%ebx)
80100241:	a1 d0 06 11 80       	mov    0x801106d0,%eax
80100246:	89 58 50             	mov    %ebx,0x50(%eax)
80100249:	89 1d d0 06 11 80    	mov    %ebx,0x801106d0
8010024f:	c7 45 08 80 bf 10 80 	movl   $0x8010bf80,0x8(%ebp)
80100256:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100259:	5b                   	pop    %ebx
8010025a:	5e                   	pop    %esi
8010025b:	5d                   	pop    %ebp
8010025c:	e9 0f 42 00 00       	jmp    80104470 <release>
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 66 71 10 80       	push   $0x80107166
80100269:	e8 02 01 00 00       	call   80100370 <panic>
8010026e:	66 90                	xchg   %ax,%ax

80100270 <consoleread>:
  }
}

int
consoleread(struct inode *ip, char *dst, int n)
{
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 28             	sub    $0x28,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
  uint target;
  int c;

  iunlock(ip);
8010027f:	57                   	push   %edi
80100280:	e8 cb 14 00 00       	call   80101750 <iunlock>
  target = n;
  acquire(&cons.lock);
80100285:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010028c:	e8 2f 41 00 00       	call   801043c0 <acquire>
  while(n > 0){
80100291:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100294:	83 c4 10             	add    $0x10,%esp
80100297:	31 c0                	xor    %eax,%eax
80100299:	85 db                	test   %ebx,%ebx
8010029b:	0f 8e 9a 00 00 00    	jle    8010033b <consoleread+0xcb>
    while(input.r == input.w){
801002a1:	a1 60 09 11 80       	mov    0x80110960,%eax
801002a6:	3b 05 64 09 11 80    	cmp    0x80110964,%eax
801002ac:	74 24                	je     801002d2 <consoleread+0x62>
801002ae:	eb 58                	jmp    80100308 <consoleread+0x98>
      if(myproc()->killed){
        release(&cons.lock);
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
801002b0:	83 ec 08             	sub    $0x8,%esp
801002b3:	68 20 a5 10 80       	push   $0x8010a520
801002b8:	68 60 09 11 80       	push   $0x80110960
801002bd:	e8 ee 3a 00 00       	call   80103db0 <sleep>
    while(input.r == input.w){
801002c2:	a1 60 09 11 80       	mov    0x80110960,%eax
801002c7:	83 c4 10             	add    $0x10,%esp
801002ca:	3b 05 64 09 11 80    	cmp    0x80110964,%eax
801002d0:	75 36                	jne    80100308 <consoleread+0x98>
      if(myproc()->killed){
801002d2:	e8 c9 34 00 00       	call   801037a0 <myproc>
801002d7:	8b 40 24             	mov    0x24(%eax),%eax
801002da:	85 c0                	test   %eax,%eax
801002dc:	74 d2                	je     801002b0 <consoleread+0x40>
        release(&cons.lock);
801002de:	83 ec 0c             	sub    $0xc,%esp
801002e1:	68 20 a5 10 80       	push   $0x8010a520
801002e6:	e8 85 41 00 00       	call   80104470 <release>
        ilock(ip);
801002eb:	89 3c 24             	mov    %edi,(%esp)
801002ee:	e8 7d 13 00 00       	call   80101670 <ilock>
        return -1;
801002f3:	83 c4 10             	add    $0x10,%esp
801002f6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  release(&cons.lock);
  ilock(ip);

  return target - n;
}
801002fb:	8d 65 f4             	lea    -0xc(%ebp),%esp
801002fe:	5b                   	pop    %ebx
801002ff:	5e                   	pop    %esi
80100300:	5f                   	pop    %edi
80100301:	5d                   	pop    %ebp
80100302:	c3                   	ret    
80100303:	90                   	nop
80100304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = input.buf[input.r++ % INPUT_BUF];
80100308:	8d 50 01             	lea    0x1(%eax),%edx
8010030b:	89 15 60 09 11 80    	mov    %edx,0x80110960
80100311:	89 c2                	mov    %eax,%edx
80100313:	83 e2 7f             	and    $0x7f,%edx
80100316:	0f be 92 e0 08 11 80 	movsbl -0x7feef720(%edx),%edx
    if(c == C('D')){  // EOF
8010031d:	83 fa 04             	cmp    $0x4,%edx
80100320:	74 39                	je     8010035b <consoleread+0xeb>
    *dst++ = c;
80100322:	83 c6 01             	add    $0x1,%esi
    --n;
80100325:	83 eb 01             	sub    $0x1,%ebx
    if(c == '\n')
80100328:	83 fa 0a             	cmp    $0xa,%edx
    *dst++ = c;
8010032b:	88 56 ff             	mov    %dl,-0x1(%esi)
    if(c == '\n')
8010032e:	74 35                	je     80100365 <consoleread+0xf5>
  while(n > 0){
80100330:	85 db                	test   %ebx,%ebx
80100332:	0f 85 69 ff ff ff    	jne    801002a1 <consoleread+0x31>
80100338:	8b 45 10             	mov    0x10(%ebp),%eax
  release(&cons.lock);
8010033b:	83 ec 0c             	sub    $0xc,%esp
8010033e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100341:	68 20 a5 10 80       	push   $0x8010a520
80100346:	e8 25 41 00 00       	call   80104470 <release>
  ilock(ip);
8010034b:	89 3c 24             	mov    %edi,(%esp)
8010034e:	e8 1d 13 00 00       	call   80101670 <ilock>
  return target - n;
80100353:	83 c4 10             	add    $0x10,%esp
80100356:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100359:	eb a0                	jmp    801002fb <consoleread+0x8b>
      if(n < target){
8010035b:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010035e:	76 05                	jbe    80100365 <consoleread+0xf5>
        input.r--;
80100360:	a3 60 09 11 80       	mov    %eax,0x80110960
80100365:	8b 45 10             	mov    0x10(%ebp),%eax
80100368:	29 d8                	sub    %ebx,%eax
8010036a:	eb cf                	jmp    8010033b <consoleread+0xcb>
8010036c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100370 <panic>:
{
80100370:	55                   	push   %ebp
80100371:	89 e5                	mov    %esp,%ebp
80100373:	56                   	push   %esi
80100374:	53                   	push   %ebx
80100375:	83 ec 30             	sub    $0x30,%esp
}

static inline void
cli(void)
{
  asm volatile("cli");
80100378:	fa                   	cli    
  cons.locking = 0;
80100379:	c7 05 54 a5 10 80 00 	movl   $0x0,0x8010a554
80100380:	00 00 00 
  getcallerpcs(&s, pcs);
80100383:	8d 5d d0             	lea    -0x30(%ebp),%ebx
80100386:	8d 75 f8             	lea    -0x8(%ebp),%esi
  cprintf("lapicid %d: panic: ", lapicid());
80100389:	e8 72 23 00 00       	call   80102700 <lapicid>
8010038e:	83 ec 08             	sub    $0x8,%esp
80100391:	50                   	push   %eax
80100392:	68 6d 71 10 80       	push   $0x8010716d
80100397:	e8 c4 02 00 00       	call   80100660 <cprintf>
  cprintf(s);
8010039c:	58                   	pop    %eax
8010039d:	ff 75 08             	pushl  0x8(%ebp)
801003a0:	e8 bb 02 00 00       	call   80100660 <cprintf>
  cprintf("\n");
801003a5:	c7 04 24 d7 7a 10 80 	movl   $0x80107ad7,(%esp)
801003ac:	e8 af 02 00 00       	call   80100660 <cprintf>
  getcallerpcs(&s, pcs);
801003b1:	5a                   	pop    %edx
801003b2:	8d 45 08             	lea    0x8(%ebp),%eax
801003b5:	59                   	pop    %ecx
801003b6:	53                   	push   %ebx
801003b7:	50                   	push   %eax
801003b8:	e8 c3 3e 00 00       	call   80104280 <getcallerpcs>
801003bd:	83 c4 10             	add    $0x10,%esp
    cprintf(" %p", pcs[i]);
801003c0:	83 ec 08             	sub    $0x8,%esp
801003c3:	ff 33                	pushl  (%ebx)
801003c5:	83 c3 04             	add    $0x4,%ebx
801003c8:	68 81 71 10 80       	push   $0x80107181
801003cd:	e8 8e 02 00 00       	call   80100660 <cprintf>
  for(i=0; i<10; i++)
801003d2:	83 c4 10             	add    $0x10,%esp
801003d5:	39 f3                	cmp    %esi,%ebx
801003d7:	75 e7                	jne    801003c0 <panic+0x50>
  panicked = 1; // freeze other CPU
801003d9:	c7 05 58 a5 10 80 01 	movl   $0x1,0x8010a558
801003e0:	00 00 00 
801003e3:	eb fe                	jmp    801003e3 <panic+0x73>
801003e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801003e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801003f0 <consputc>:
  if(panicked){
801003f0:	8b 15 58 a5 10 80    	mov    0x8010a558,%edx
801003f6:	85 d2                	test   %edx,%edx
801003f8:	74 06                	je     80100400 <consputc+0x10>
801003fa:	fa                   	cli    
801003fb:	eb fe                	jmp    801003fb <consputc+0xb>
801003fd:	8d 76 00             	lea    0x0(%esi),%esi
{
80100400:	55                   	push   %ebp
80100401:	89 e5                	mov    %esp,%ebp
80100403:	57                   	push   %edi
80100404:	56                   	push   %esi
80100405:	53                   	push   %ebx
80100406:	89 c3                	mov    %eax,%ebx
80100408:	83 ec 0c             	sub    $0xc,%esp
  if(c == BACKSPACE){
8010040b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100410:	0f 84 b8 00 00 00    	je     801004ce <consputc+0xde>
    uartputc(c);
80100416:	83 ec 0c             	sub    $0xc,%esp
80100419:	50                   	push   %eax
8010041a:	e8 21 57 00 00       	call   80105b40 <uartputc>
8010041f:	83 c4 10             	add    $0x10,%esp
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100422:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100427:	b8 0e 00 00 00       	mov    $0xe,%eax
8010042c:	89 fa                	mov    %edi,%edx
8010042e:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010042f:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
80100434:	89 ca                	mov    %ecx,%edx
80100436:	ec                   	in     (%dx),%al
  pos = inb(CRTPORT+1) << 8;
80100437:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010043a:	89 fa                	mov    %edi,%edx
8010043c:	c1 e0 08             	shl    $0x8,%eax
8010043f:	89 c6                	mov    %eax,%esi
80100441:	b8 0f 00 00 00       	mov    $0xf,%eax
80100446:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80100447:	89 ca                	mov    %ecx,%edx
80100449:	ec                   	in     (%dx),%al
  pos |= inb(CRTPORT+1);
8010044a:	0f b6 c0             	movzbl %al,%eax
8010044d:	09 f0                	or     %esi,%eax
  if(c == '\n')
8010044f:	83 fb 0a             	cmp    $0xa,%ebx
80100452:	0f 84 0b 01 00 00    	je     80100563 <consputc+0x173>
  else if(c == BACKSPACE){
80100458:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
8010045e:	0f 84 e6 00 00 00    	je     8010054a <consputc+0x15a>
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
80100464:	0f b6 d3             	movzbl %bl,%edx
80100467:	8d 78 01             	lea    0x1(%eax),%edi
8010046a:	80 ce 07             	or     $0x7,%dh
8010046d:	66 89 94 00 00 80 0b 	mov    %dx,-0x7ff48000(%eax,%eax,1)
80100474:	80 
  if(pos < 0 || pos > 25*80)
80100475:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
8010047b:	0f 8f bc 00 00 00    	jg     8010053d <consputc+0x14d>
  if((pos/80) >= 24){  // Scroll up.
80100481:	81 ff 7f 07 00 00    	cmp    $0x77f,%edi
80100487:	7f 6f                	jg     801004f8 <consputc+0x108>
80100489:	89 f8                	mov    %edi,%eax
8010048b:	8d 9c 3f 00 80 0b 80 	lea    -0x7ff48000(%edi,%edi,1),%ebx
80100492:	89 f9                	mov    %edi,%ecx
80100494:	c1 e8 08             	shr    $0x8,%eax
80100497:	89 c6                	mov    %eax,%esi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100499:	bf d4 03 00 00       	mov    $0x3d4,%edi
8010049e:	b8 0e 00 00 00       	mov    $0xe,%eax
801004a3:	89 fa                	mov    %edi,%edx
801004a5:	ee                   	out    %al,(%dx)
801004a6:	ba d5 03 00 00       	mov    $0x3d5,%edx
801004ab:	89 f0                	mov    %esi,%eax
801004ad:	ee                   	out    %al,(%dx)
801004ae:	b8 0f 00 00 00       	mov    $0xf,%eax
801004b3:	89 fa                	mov    %edi,%edx
801004b5:	ee                   	out    %al,(%dx)
801004b6:	ba d5 03 00 00       	mov    $0x3d5,%edx
801004bb:	89 c8                	mov    %ecx,%eax
801004bd:	ee                   	out    %al,(%dx)
  crt[pos] = ' ' | 0x0700;
801004be:	b8 20 07 00 00       	mov    $0x720,%eax
801004c3:	66 89 03             	mov    %ax,(%ebx)
}
801004c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004c9:	5b                   	pop    %ebx
801004ca:	5e                   	pop    %esi
801004cb:	5f                   	pop    %edi
801004cc:	5d                   	pop    %ebp
801004cd:	c3                   	ret    
    uartputc('\b'); uartputc(' '); uartputc('\b');
801004ce:	83 ec 0c             	sub    $0xc,%esp
801004d1:	6a 08                	push   $0x8
801004d3:	e8 68 56 00 00       	call   80105b40 <uartputc>
801004d8:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004df:	e8 5c 56 00 00       	call   80105b40 <uartputc>
801004e4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004eb:	e8 50 56 00 00       	call   80105b40 <uartputc>
801004f0:	83 c4 10             	add    $0x10,%esp
801004f3:	e9 2a ff ff ff       	jmp    80100422 <consputc+0x32>
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004f8:	83 ec 04             	sub    $0x4,%esp
    pos -= 80;
801004fb:	83 ef 50             	sub    $0x50,%edi
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
801004fe:	be 07 00 00 00       	mov    $0x7,%esi
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
80100503:	68 60 0e 00 00       	push   $0xe60
80100508:	68 a0 80 0b 80       	push   $0x800b80a0
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
8010050d:	8d 9c 3f 00 80 0b 80 	lea    -0x7ff48000(%edi,%edi,1),%ebx
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
80100514:	68 00 80 0b 80       	push   $0x800b8000
80100519:	e8 52 40 00 00       	call   80104570 <memmove>
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
8010051e:	b8 80 07 00 00       	mov    $0x780,%eax
80100523:	83 c4 0c             	add    $0xc,%esp
80100526:	29 f8                	sub    %edi,%eax
80100528:	01 c0                	add    %eax,%eax
8010052a:	50                   	push   %eax
8010052b:	6a 00                	push   $0x0
8010052d:	53                   	push   %ebx
8010052e:	e8 8d 3f 00 00       	call   801044c0 <memset>
80100533:	89 f9                	mov    %edi,%ecx
80100535:	83 c4 10             	add    $0x10,%esp
80100538:	e9 5c ff ff ff       	jmp    80100499 <consputc+0xa9>
    panic("pos under/overflow");
8010053d:	83 ec 0c             	sub    $0xc,%esp
80100540:	68 85 71 10 80       	push   $0x80107185
80100545:	e8 26 fe ff ff       	call   80100370 <panic>
    if(pos > 0) --pos;
8010054a:	85 c0                	test   %eax,%eax
8010054c:	8d 78 ff             	lea    -0x1(%eax),%edi
8010054f:	0f 85 20 ff ff ff    	jne    80100475 <consputc+0x85>
80100555:	bb 00 80 0b 80       	mov    $0x800b8000,%ebx
8010055a:	31 c9                	xor    %ecx,%ecx
8010055c:	31 f6                	xor    %esi,%esi
8010055e:	e9 36 ff ff ff       	jmp    80100499 <consputc+0xa9>
    pos += 80 - pos%80;
80100563:	ba 67 66 66 66       	mov    $0x66666667,%edx
80100568:	f7 ea                	imul   %edx
8010056a:	89 d0                	mov    %edx,%eax
8010056c:	c1 e8 05             	shr    $0x5,%eax
8010056f:	8d 04 80             	lea    (%eax,%eax,4),%eax
80100572:	c1 e0 04             	shl    $0x4,%eax
80100575:	8d 78 50             	lea    0x50(%eax),%edi
80100578:	e9 f8 fe ff ff       	jmp    80100475 <consputc+0x85>
8010057d:	8d 76 00             	lea    0x0(%esi),%esi

80100580 <printint>:
{
80100580:	55                   	push   %ebp
80100581:	89 e5                	mov    %esp,%ebp
80100583:	57                   	push   %edi
80100584:	56                   	push   %esi
80100585:	53                   	push   %ebx
80100586:	89 d6                	mov    %edx,%esi
80100588:	83 ec 1c             	sub    $0x1c,%esp
  if(sign && (sign = xx < 0))
8010058b:	85 c9                	test   %ecx,%ecx
8010058d:	74 04                	je     80100593 <printint+0x13>
8010058f:	85 c0                	test   %eax,%eax
80100591:	78 57                	js     801005ea <printint+0x6a>
    x = xx;
80100593:	31 ff                	xor    %edi,%edi
  i = 0;
80100595:	31 c9                	xor    %ecx,%ecx
80100597:	eb 09                	jmp    801005a2 <printint+0x22>
80100599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    buf[i++] = digits[x % base];
801005a0:	89 d9                	mov    %ebx,%ecx
801005a2:	31 d2                	xor    %edx,%edx
801005a4:	8d 59 01             	lea    0x1(%ecx),%ebx
801005a7:	f7 f6                	div    %esi
801005a9:	0f b6 92 b0 71 10 80 	movzbl -0x7fef8e50(%edx),%edx
  }while((x /= base) != 0);
801005b0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
801005b2:	88 54 1d d7          	mov    %dl,-0x29(%ebp,%ebx,1)
  }while((x /= base) != 0);
801005b6:	75 e8                	jne    801005a0 <printint+0x20>
  if(sign)
801005b8:	85 ff                	test   %edi,%edi
801005ba:	74 08                	je     801005c4 <printint+0x44>
    buf[i++] = '-';
801005bc:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
801005c1:	8d 59 02             	lea    0x2(%ecx),%ebx
  while(--i >= 0)
801005c4:	83 eb 01             	sub    $0x1,%ebx
801005c7:	89 f6                	mov    %esi,%esi
801005c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    consputc(buf[i]);
801005d0:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
  while(--i >= 0)
801005d5:	83 eb 01             	sub    $0x1,%ebx
    consputc(buf[i]);
801005d8:	e8 13 fe ff ff       	call   801003f0 <consputc>
  while(--i >= 0)
801005dd:	83 fb ff             	cmp    $0xffffffff,%ebx
801005e0:	75 ee                	jne    801005d0 <printint+0x50>
}
801005e2:	83 c4 1c             	add    $0x1c,%esp
801005e5:	5b                   	pop    %ebx
801005e6:	5e                   	pop    %esi
801005e7:	5f                   	pop    %edi
801005e8:	5d                   	pop    %ebp
801005e9:	c3                   	ret    
    x = -xx;
801005ea:	f7 d8                	neg    %eax
  if(sign && (sign = xx < 0))
801005ec:	bf 01 00 00 00       	mov    $0x1,%edi
    x = -xx;
801005f1:	eb a2                	jmp    80100595 <printint+0x15>
801005f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100600 <consolewrite>:

int
consolewrite(struct inode *ip, char *buf, int n)
{
80100600:	55                   	push   %ebp
80100601:	89 e5                	mov    %esp,%ebp
80100603:	57                   	push   %edi
80100604:	56                   	push   %esi
80100605:	53                   	push   %ebx
80100606:	83 ec 18             	sub    $0x18,%esp
  int i;

  iunlock(ip);
80100609:	ff 75 08             	pushl  0x8(%ebp)
{
8010060c:	8b 75 10             	mov    0x10(%ebp),%esi
  iunlock(ip);
8010060f:	e8 3c 11 00 00       	call   80101750 <iunlock>
  acquire(&cons.lock);
80100614:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010061b:	e8 a0 3d 00 00       	call   801043c0 <acquire>
80100620:	8b 7d 0c             	mov    0xc(%ebp),%edi
  for(i = 0; i < n; i++)
80100623:	83 c4 10             	add    $0x10,%esp
80100626:	85 f6                	test   %esi,%esi
80100628:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010062b:	7e 12                	jle    8010063f <consolewrite+0x3f>
8010062d:	8d 76 00             	lea    0x0(%esi),%esi
    consputc(buf[i] & 0xff);
80100630:	0f b6 07             	movzbl (%edi),%eax
80100633:	83 c7 01             	add    $0x1,%edi
80100636:	e8 b5 fd ff ff       	call   801003f0 <consputc>
  for(i = 0; i < n; i++)
8010063b:	39 fb                	cmp    %edi,%ebx
8010063d:	75 f1                	jne    80100630 <consolewrite+0x30>
  release(&cons.lock);
8010063f:	83 ec 0c             	sub    $0xc,%esp
80100642:	68 20 a5 10 80       	push   $0x8010a520
80100647:	e8 24 3e 00 00       	call   80104470 <release>
  ilock(ip);
8010064c:	58                   	pop    %eax
8010064d:	ff 75 08             	pushl  0x8(%ebp)
80100650:	e8 1b 10 00 00       	call   80101670 <ilock>

  return n;
}
80100655:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100658:	89 f0                	mov    %esi,%eax
8010065a:	5b                   	pop    %ebx
8010065b:	5e                   	pop    %esi
8010065c:	5f                   	pop    %edi
8010065d:	5d                   	pop    %ebp
8010065e:	c3                   	ret    
8010065f:	90                   	nop

80100660 <cprintf>:
{
80100660:	55                   	push   %ebp
80100661:	89 e5                	mov    %esp,%ebp
80100663:	57                   	push   %edi
80100664:	56                   	push   %esi
80100665:	53                   	push   %ebx
80100666:	83 ec 1c             	sub    $0x1c,%esp
  locking = cons.locking;
80100669:	a1 54 a5 10 80       	mov    0x8010a554,%eax
  if(locking)
8010066e:	85 c0                	test   %eax,%eax
  locking = cons.locking;
80100670:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(locking)
80100673:	0f 85 27 01 00 00    	jne    801007a0 <cprintf+0x140>
  if (fmt == 0)
80100679:	8b 75 08             	mov    0x8(%ebp),%esi
8010067c:	85 f6                	test   %esi,%esi
8010067e:	0f 84 40 01 00 00    	je     801007c4 <cprintf+0x164>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100684:	0f b6 06             	movzbl (%esi),%eax
80100687:	31 db                	xor    %ebx,%ebx
80100689:	8d 7d 0c             	lea    0xc(%ebp),%edi
8010068c:	85 c0                	test   %eax,%eax
8010068e:	75 51                	jne    801006e1 <cprintf+0x81>
80100690:	eb 64                	jmp    801006f6 <cprintf+0x96>
80100692:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    c = fmt[++i] & 0xff;
80100698:	83 c3 01             	add    $0x1,%ebx
8010069b:	0f b6 14 1e          	movzbl (%esi,%ebx,1),%edx
    if(c == 0)
8010069f:	85 d2                	test   %edx,%edx
801006a1:	74 53                	je     801006f6 <cprintf+0x96>
    switch(c){
801006a3:	83 fa 70             	cmp    $0x70,%edx
801006a6:	74 7a                	je     80100722 <cprintf+0xc2>
801006a8:	7f 6e                	jg     80100718 <cprintf+0xb8>
801006aa:	83 fa 25             	cmp    $0x25,%edx
801006ad:	0f 84 ad 00 00 00    	je     80100760 <cprintf+0x100>
801006b3:	83 fa 64             	cmp    $0x64,%edx
801006b6:	0f 85 84 00 00 00    	jne    80100740 <cprintf+0xe0>
      printint(*argp++, 10, 1);
801006bc:	8d 47 04             	lea    0x4(%edi),%eax
801006bf:	b9 01 00 00 00       	mov    $0x1,%ecx
801006c4:	ba 0a 00 00 00       	mov    $0xa,%edx
801006c9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801006cc:	8b 07                	mov    (%edi),%eax
801006ce:	e8 ad fe ff ff       	call   80100580 <printint>
801006d3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006d6:	83 c3 01             	add    $0x1,%ebx
801006d9:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
801006dd:	85 c0                	test   %eax,%eax
801006df:	74 15                	je     801006f6 <cprintf+0x96>
    if(c != '%'){
801006e1:	83 f8 25             	cmp    $0x25,%eax
801006e4:	74 b2                	je     80100698 <cprintf+0x38>
      consputc('%');
801006e6:	e8 05 fd ff ff       	call   801003f0 <consputc>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006eb:	83 c3 01             	add    $0x1,%ebx
801006ee:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
801006f2:	85 c0                	test   %eax,%eax
801006f4:	75 eb                	jne    801006e1 <cprintf+0x81>
  if(locking)
801006f6:	8b 45 e0             	mov    -0x20(%ebp),%eax
801006f9:	85 c0                	test   %eax,%eax
801006fb:	74 10                	je     8010070d <cprintf+0xad>
    release(&cons.lock);
801006fd:	83 ec 0c             	sub    $0xc,%esp
80100700:	68 20 a5 10 80       	push   $0x8010a520
80100705:	e8 66 3d 00 00       	call   80104470 <release>
8010070a:	83 c4 10             	add    $0x10,%esp
}
8010070d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100710:	5b                   	pop    %ebx
80100711:	5e                   	pop    %esi
80100712:	5f                   	pop    %edi
80100713:	5d                   	pop    %ebp
80100714:	c3                   	ret    
80100715:	8d 76 00             	lea    0x0(%esi),%esi
    switch(c){
80100718:	83 fa 73             	cmp    $0x73,%edx
8010071b:	74 53                	je     80100770 <cprintf+0x110>
8010071d:	83 fa 78             	cmp    $0x78,%edx
80100720:	75 1e                	jne    80100740 <cprintf+0xe0>
      printint(*argp++, 16, 0);
80100722:	8d 47 04             	lea    0x4(%edi),%eax
80100725:	31 c9                	xor    %ecx,%ecx
80100727:	ba 10 00 00 00       	mov    $0x10,%edx
8010072c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010072f:	8b 07                	mov    (%edi),%eax
80100731:	e8 4a fe ff ff       	call   80100580 <printint>
80100736:	8b 7d e4             	mov    -0x1c(%ebp),%edi
      break;
80100739:	eb 9b                	jmp    801006d6 <cprintf+0x76>
8010073b:	90                   	nop
8010073c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      consputc('%');
80100740:	b8 25 00 00 00       	mov    $0x25,%eax
80100745:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80100748:	e8 a3 fc ff ff       	call   801003f0 <consputc>
      consputc(c);
8010074d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80100750:	89 d0                	mov    %edx,%eax
80100752:	e8 99 fc ff ff       	call   801003f0 <consputc>
      break;
80100757:	e9 7a ff ff ff       	jmp    801006d6 <cprintf+0x76>
8010075c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      consputc('%');
80100760:	b8 25 00 00 00       	mov    $0x25,%eax
80100765:	e8 86 fc ff ff       	call   801003f0 <consputc>
8010076a:	e9 7c ff ff ff       	jmp    801006eb <cprintf+0x8b>
8010076f:	90                   	nop
      if((s = (char*)*argp++) == 0)
80100770:	8d 47 04             	lea    0x4(%edi),%eax
80100773:	8b 3f                	mov    (%edi),%edi
80100775:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100778:	85 ff                	test   %edi,%edi
8010077a:	75 0c                	jne    80100788 <cprintf+0x128>
8010077c:	eb 3a                	jmp    801007b8 <cprintf+0x158>
8010077e:	66 90                	xchg   %ax,%ax
      for(; *s; s++)
80100780:	83 c7 01             	add    $0x1,%edi
        consputc(*s);
80100783:	e8 68 fc ff ff       	call   801003f0 <consputc>
      for(; *s; s++)
80100788:	0f be 07             	movsbl (%edi),%eax
8010078b:	84 c0                	test   %al,%al
8010078d:	75 f1                	jne    80100780 <cprintf+0x120>
      if((s = (char*)*argp++) == 0)
8010078f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80100792:	e9 3f ff ff ff       	jmp    801006d6 <cprintf+0x76>
80100797:	89 f6                	mov    %esi,%esi
80100799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    acquire(&cons.lock);
801007a0:	83 ec 0c             	sub    $0xc,%esp
801007a3:	68 20 a5 10 80       	push   $0x8010a520
801007a8:	e8 13 3c 00 00       	call   801043c0 <acquire>
801007ad:	83 c4 10             	add    $0x10,%esp
801007b0:	e9 c4 fe ff ff       	jmp    80100679 <cprintf+0x19>
801007b5:	8d 76 00             	lea    0x0(%esi),%esi
      for(; *s; s++)
801007b8:	b8 28 00 00 00       	mov    $0x28,%eax
        s = "(null)";
801007bd:	bf 98 71 10 80       	mov    $0x80107198,%edi
801007c2:	eb bc                	jmp    80100780 <cprintf+0x120>
    panic("null fmt");
801007c4:	83 ec 0c             	sub    $0xc,%esp
801007c7:	68 9f 71 10 80       	push   $0x8010719f
801007cc:	e8 9f fb ff ff       	call   80100370 <panic>
801007d1:	eb 0d                	jmp    801007e0 <consoleintr>
801007d3:	90                   	nop
801007d4:	90                   	nop
801007d5:	90                   	nop
801007d6:	90                   	nop
801007d7:	90                   	nop
801007d8:	90                   	nop
801007d9:	90                   	nop
801007da:	90                   	nop
801007db:	90                   	nop
801007dc:	90                   	nop
801007dd:	90                   	nop
801007de:	90                   	nop
801007df:	90                   	nop

801007e0 <consoleintr>:
{
801007e0:	55                   	push   %ebp
801007e1:	89 e5                	mov    %esp,%ebp
801007e3:	57                   	push   %edi
801007e4:	56                   	push   %esi
801007e5:	53                   	push   %ebx
  int c, doprocdump = 0;
801007e6:	31 f6                	xor    %esi,%esi
{
801007e8:	83 ec 18             	sub    $0x18,%esp
801007eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&cons.lock);
801007ee:	68 20 a5 10 80       	push   $0x8010a520
801007f3:	e8 c8 3b 00 00       	call   801043c0 <acquire>
  while((c = getc()) >= 0){
801007f8:	83 c4 10             	add    $0x10,%esp
801007fb:	90                   	nop
801007fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100800:	ff d3                	call   *%ebx
80100802:	85 c0                	test   %eax,%eax
80100804:	89 c7                	mov    %eax,%edi
80100806:	78 48                	js     80100850 <consoleintr+0x70>
    switch(c){
80100808:	83 ff 10             	cmp    $0x10,%edi
8010080b:	0f 84 3f 01 00 00    	je     80100950 <consoleintr+0x170>
80100811:	7e 5d                	jle    80100870 <consoleintr+0x90>
80100813:	83 ff 15             	cmp    $0x15,%edi
80100816:	0f 84 dc 00 00 00    	je     801008f8 <consoleintr+0x118>
8010081c:	83 ff 7f             	cmp    $0x7f,%edi
8010081f:	75 54                	jne    80100875 <consoleintr+0x95>
      if(input.e != input.w){
80100821:	a1 68 09 11 80       	mov    0x80110968,%eax
80100826:	3b 05 64 09 11 80    	cmp    0x80110964,%eax
8010082c:	74 d2                	je     80100800 <consoleintr+0x20>
        input.e--;
8010082e:	83 e8 01             	sub    $0x1,%eax
80100831:	a3 68 09 11 80       	mov    %eax,0x80110968
        consputc(BACKSPACE);
80100836:	b8 00 01 00 00       	mov    $0x100,%eax
8010083b:	e8 b0 fb ff ff       	call   801003f0 <consputc>
  while((c = getc()) >= 0){
80100840:	ff d3                	call   *%ebx
80100842:	85 c0                	test   %eax,%eax
80100844:	89 c7                	mov    %eax,%edi
80100846:	79 c0                	jns    80100808 <consoleintr+0x28>
80100848:	90                   	nop
80100849:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  release(&cons.lock);
80100850:	83 ec 0c             	sub    $0xc,%esp
80100853:	68 20 a5 10 80       	push   $0x8010a520
80100858:	e8 13 3c 00 00       	call   80104470 <release>
  if(doprocdump) {
8010085d:	83 c4 10             	add    $0x10,%esp
80100860:	85 f6                	test   %esi,%esi
80100862:	0f 85 f8 00 00 00    	jne    80100960 <consoleintr+0x180>
}
80100868:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010086b:	5b                   	pop    %ebx
8010086c:	5e                   	pop    %esi
8010086d:	5f                   	pop    %edi
8010086e:	5d                   	pop    %ebp
8010086f:	c3                   	ret    
    switch(c){
80100870:	83 ff 08             	cmp    $0x8,%edi
80100873:	74 ac                	je     80100821 <consoleintr+0x41>
      if(c != 0 && input.e-input.r < INPUT_BUF){
80100875:	85 ff                	test   %edi,%edi
80100877:	74 87                	je     80100800 <consoleintr+0x20>
80100879:	a1 68 09 11 80       	mov    0x80110968,%eax
8010087e:	89 c2                	mov    %eax,%edx
80100880:	2b 15 60 09 11 80    	sub    0x80110960,%edx
80100886:	83 fa 7f             	cmp    $0x7f,%edx
80100889:	0f 87 71 ff ff ff    	ja     80100800 <consoleintr+0x20>
        input.buf[input.e++ % INPUT_BUF] = c;
8010088f:	8d 50 01             	lea    0x1(%eax),%edx
80100892:	83 e0 7f             	and    $0x7f,%eax
        c = (c == '\r') ? '\n' : c;
80100895:	83 ff 0d             	cmp    $0xd,%edi
        input.buf[input.e++ % INPUT_BUF] = c;
80100898:	89 15 68 09 11 80    	mov    %edx,0x80110968
        c = (c == '\r') ? '\n' : c;
8010089e:	0f 84 c8 00 00 00    	je     8010096c <consoleintr+0x18c>
        input.buf[input.e++ % INPUT_BUF] = c;
801008a4:	89 f9                	mov    %edi,%ecx
801008a6:	88 88 e0 08 11 80    	mov    %cl,-0x7feef720(%eax)
        consputc(c);
801008ac:	89 f8                	mov    %edi,%eax
801008ae:	e8 3d fb ff ff       	call   801003f0 <consputc>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
801008b3:	83 ff 0a             	cmp    $0xa,%edi
801008b6:	0f 84 c1 00 00 00    	je     8010097d <consoleintr+0x19d>
801008bc:	83 ff 04             	cmp    $0x4,%edi
801008bf:	0f 84 b8 00 00 00    	je     8010097d <consoleintr+0x19d>
801008c5:	a1 60 09 11 80       	mov    0x80110960,%eax
801008ca:	83 e8 80             	sub    $0xffffff80,%eax
801008cd:	39 05 68 09 11 80    	cmp    %eax,0x80110968
801008d3:	0f 85 27 ff ff ff    	jne    80100800 <consoleintr+0x20>
          wakeup(&input.r);
801008d9:	83 ec 0c             	sub    $0xc,%esp
          input.w = input.e;
801008dc:	a3 64 09 11 80       	mov    %eax,0x80110964
          wakeup(&input.r);
801008e1:	68 60 09 11 80       	push   $0x80110960
801008e6:	e8 85 36 00 00       	call   80103f70 <wakeup>
801008eb:	83 c4 10             	add    $0x10,%esp
801008ee:	e9 0d ff ff ff       	jmp    80100800 <consoleintr+0x20>
801008f3:	90                   	nop
801008f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      while(input.e != input.w &&
801008f8:	a1 68 09 11 80       	mov    0x80110968,%eax
801008fd:	39 05 64 09 11 80    	cmp    %eax,0x80110964
80100903:	75 2b                	jne    80100930 <consoleintr+0x150>
80100905:	e9 f6 fe ff ff       	jmp    80100800 <consoleintr+0x20>
8010090a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        input.e--;
80100910:	a3 68 09 11 80       	mov    %eax,0x80110968
        consputc(BACKSPACE);
80100915:	b8 00 01 00 00       	mov    $0x100,%eax
8010091a:	e8 d1 fa ff ff       	call   801003f0 <consputc>
      while(input.e != input.w &&
8010091f:	a1 68 09 11 80       	mov    0x80110968,%eax
80100924:	3b 05 64 09 11 80    	cmp    0x80110964,%eax
8010092a:	0f 84 d0 fe ff ff    	je     80100800 <consoleintr+0x20>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
80100930:	83 e8 01             	sub    $0x1,%eax
80100933:	89 c2                	mov    %eax,%edx
80100935:	83 e2 7f             	and    $0x7f,%edx
      while(input.e != input.w &&
80100938:	80 ba e0 08 11 80 0a 	cmpb   $0xa,-0x7feef720(%edx)
8010093f:	75 cf                	jne    80100910 <consoleintr+0x130>
80100941:	e9 ba fe ff ff       	jmp    80100800 <consoleintr+0x20>
80100946:	8d 76 00             	lea    0x0(%esi),%esi
80100949:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      doprocdump = 1;
80100950:	be 01 00 00 00       	mov    $0x1,%esi
80100955:	e9 a6 fe ff ff       	jmp    80100800 <consoleintr+0x20>
8010095a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
}
80100960:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100963:	5b                   	pop    %ebx
80100964:	5e                   	pop    %esi
80100965:	5f                   	pop    %edi
80100966:	5d                   	pop    %ebp
    procdump();  // now call procdump() wo. cons.lock held
80100967:	e9 f4 36 00 00       	jmp    80104060 <procdump>
        input.buf[input.e++ % INPUT_BUF] = c;
8010096c:	c6 80 e0 08 11 80 0a 	movb   $0xa,-0x7feef720(%eax)
        consputc(c);
80100973:	b8 0a 00 00 00       	mov    $0xa,%eax
80100978:	e8 73 fa ff ff       	call   801003f0 <consputc>
8010097d:	a1 68 09 11 80       	mov    0x80110968,%eax
80100982:	e9 52 ff ff ff       	jmp    801008d9 <consoleintr+0xf9>
80100987:	89 f6                	mov    %esi,%esi
80100989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100990 <consoleinit>:

void
consoleinit(void)
{
80100990:	55                   	push   %ebp
80100991:	89 e5                	mov    %esp,%ebp
80100993:	83 ec 10             	sub    $0x10,%esp
  initlock(&cons.lock, "console");
80100996:	68 a8 71 10 80       	push   $0x801071a8
8010099b:	68 20 a5 10 80       	push   $0x8010a520
801009a0:	e8 bb 38 00 00       	call   80104260 <initlock>

  devsw[CONSOLE].write = consolewrite;
  devsw[CONSOLE].read = consoleread;
  cons.locking = 1;

  ioapicenable(IRQ_KBD, 0);
801009a5:	58                   	pop    %eax
801009a6:	5a                   	pop    %edx
801009a7:	6a 00                	push   $0x0
801009a9:	6a 01                	push   $0x1
  devsw[CONSOLE].write = consolewrite;
801009ab:	c7 05 2c 13 11 80 00 	movl   $0x80100600,0x8011132c
801009b2:	06 10 80 
  devsw[CONSOLE].read = consoleread;
801009b5:	c7 05 28 13 11 80 70 	movl   $0x80100270,0x80111328
801009bc:	02 10 80 
  cons.locking = 1;
801009bf:	c7 05 54 a5 10 80 01 	movl   $0x1,0x8010a554
801009c6:	00 00 00 
  ioapicenable(IRQ_KBD, 0);
801009c9:	e8 d2 18 00 00       	call   801022a0 <ioapicenable>
}
801009ce:	83 c4 10             	add    $0x10,%esp
801009d1:	c9                   	leave  
801009d2:	c3                   	ret    
801009d3:	66 90                	xchg   %ax,%ax
801009d5:	66 90                	xchg   %ax,%ax
801009d7:	66 90                	xchg   %ax,%ax
801009d9:	66 90                	xchg   %ax,%ax
801009db:	66 90                	xchg   %ax,%ax
801009dd:	66 90                	xchg   %ax,%ax
801009df:	90                   	nop

801009e0 <exec>:
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
{
801009e0:	55                   	push   %ebp
801009e1:	89 e5                	mov    %esp,%ebp
801009e3:	57                   	push   %edi
801009e4:	56                   	push   %esi
801009e5:	53                   	push   %ebx
801009e6:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
  uint argc, sz, sp, ustack[3+MAXARG+1];
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pde_t *pgdir, *oldpgdir;
  struct proc *curproc = myproc();
801009ec:	e8 af 2d 00 00       	call   801037a0 <myproc>
801009f1:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)

  begin_op();
801009f7:	e8 74 21 00 00       	call   80102b70 <begin_op>

  if((ip = namei(path)) == 0){
801009fc:	83 ec 0c             	sub    $0xc,%esp
801009ff:	ff 75 08             	pushl  0x8(%ebp)
80100a02:	e8 b9 14 00 00       	call   80101ec0 <namei>
80100a07:	83 c4 10             	add    $0x10,%esp
80100a0a:	85 c0                	test   %eax,%eax
80100a0c:	0f 84 9c 01 00 00    	je     80100bae <exec+0x1ce>
    end_op();
    cprintf("exec: fail\n");
    return -1;
  }
  ilock(ip);
80100a12:	83 ec 0c             	sub    $0xc,%esp
80100a15:	89 c3                	mov    %eax,%ebx
80100a17:	50                   	push   %eax
80100a18:	e8 53 0c 00 00       	call   80101670 <ilock>
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
80100a1d:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a23:	6a 34                	push   $0x34
80100a25:	6a 00                	push   $0x0
80100a27:	50                   	push   %eax
80100a28:	53                   	push   %ebx
80100a29:	e8 22 0f 00 00       	call   80101950 <readi>
80100a2e:	83 c4 20             	add    $0x20,%esp
80100a31:	83 f8 34             	cmp    $0x34,%eax
80100a34:	74 22                	je     80100a58 <exec+0x78>

 bad:
  if(pgdir)
    freevm(pgdir);
  if(ip){
    iunlockput(ip);
80100a36:	83 ec 0c             	sub    $0xc,%esp
80100a39:	53                   	push   %ebx
80100a3a:	e8 c1 0e 00 00       	call   80101900 <iunlockput>
    end_op();
80100a3f:	e8 9c 21 00 00       	call   80102be0 <end_op>
80100a44:	83 c4 10             	add    $0x10,%esp
  }
  return -1;
80100a47:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100a4c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a4f:	5b                   	pop    %ebx
80100a50:	5e                   	pop    %esi
80100a51:	5f                   	pop    %edi
80100a52:	5d                   	pop    %ebp
80100a53:	c3                   	ret    
80100a54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(elf.magic != ELF_MAGIC)
80100a58:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100a5f:	45 4c 46 
80100a62:	75 d2                	jne    80100a36 <exec+0x56>
  if((pgdir = setupkvm()) == 0)
80100a64:	e8 57 62 00 00       	call   80106cc0 <setupkvm>
80100a69:	85 c0                	test   %eax,%eax
80100a6b:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100a71:	74 c3                	je     80100a36 <exec+0x56>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100a73:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100a7a:	00 
80100a7b:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
80100a81:	c7 85 ec fe ff ff 00 	movl   $0x0,-0x114(%ebp)
80100a88:	00 00 00 
80100a8b:	0f 84 c5 00 00 00    	je     80100b56 <exec+0x176>
80100a91:	31 ff                	xor    %edi,%edi
80100a93:	eb 18                	jmp    80100aad <exec+0xcd>
80100a95:	8d 76 00             	lea    0x0(%esi),%esi
80100a98:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100a9f:	83 c7 01             	add    $0x1,%edi
80100aa2:	83 c6 20             	add    $0x20,%esi
80100aa5:	39 f8                	cmp    %edi,%eax
80100aa7:	0f 8e a9 00 00 00    	jle    80100b56 <exec+0x176>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100aad:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100ab3:	6a 20                	push   $0x20
80100ab5:	56                   	push   %esi
80100ab6:	50                   	push   %eax
80100ab7:	53                   	push   %ebx
80100ab8:	e8 93 0e 00 00       	call   80101950 <readi>
80100abd:	83 c4 10             	add    $0x10,%esp
80100ac0:	83 f8 20             	cmp    $0x20,%eax
80100ac3:	75 7b                	jne    80100b40 <exec+0x160>
    if(ph.type != ELF_PROG_LOAD)
80100ac5:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100acc:	75 ca                	jne    80100a98 <exec+0xb8>
    if(ph.memsz < ph.filesz)
80100ace:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100ad4:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100ada:	72 64                	jb     80100b40 <exec+0x160>
80100adc:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100ae2:	72 5c                	jb     80100b40 <exec+0x160>
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100ae4:	83 ec 04             	sub    $0x4,%esp
80100ae7:	50                   	push   %eax
80100ae8:	ff b5 ec fe ff ff    	pushl  -0x114(%ebp)
80100aee:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100af4:	e8 27 60 00 00       	call   80106b20 <allocuvm>
80100af9:	83 c4 10             	add    $0x10,%esp
80100afc:	85 c0                	test   %eax,%eax
80100afe:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
80100b04:	74 3a                	je     80100b40 <exec+0x160>
    if(ph.vaddr % PGSIZE != 0)
80100b06:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b0c:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b11:	75 2d                	jne    80100b40 <exec+0x160>
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100b13:	83 ec 0c             	sub    $0xc,%esp
80100b16:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b1c:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b22:	53                   	push   %ebx
80100b23:	50                   	push   %eax
80100b24:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b2a:	e8 31 5f 00 00       	call   80106a60 <loaduvm>
80100b2f:	83 c4 20             	add    $0x20,%esp
80100b32:	85 c0                	test   %eax,%eax
80100b34:	0f 89 5e ff ff ff    	jns    80100a98 <exec+0xb8>
80100b3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    freevm(pgdir);
80100b40:	83 ec 0c             	sub    $0xc,%esp
80100b43:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b49:	e8 f2 60 00 00       	call   80106c40 <freevm>
80100b4e:	83 c4 10             	add    $0x10,%esp
80100b51:	e9 e0 fe ff ff       	jmp    80100a36 <exec+0x56>
  iunlockput(ip);
80100b56:	83 ec 0c             	sub    $0xc,%esp
80100b59:	53                   	push   %ebx
80100b5a:	e8 a1 0d 00 00       	call   80101900 <iunlockput>
  end_op();
80100b5f:	e8 7c 20 00 00       	call   80102be0 <end_op>
  sz = PGROUNDUP(sz);
80100b64:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100b6a:	83 c4 0c             	add    $0xc,%esp
  sz = PGROUNDUP(sz);
80100b6d:	05 ff 0f 00 00       	add    $0xfff,%eax
80100b72:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100b77:	8d 90 00 20 00 00    	lea    0x2000(%eax),%edx
80100b7d:	52                   	push   %edx
80100b7e:	50                   	push   %eax
80100b7f:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b85:	e8 96 5f 00 00       	call   80106b20 <allocuvm>
80100b8a:	83 c4 10             	add    $0x10,%esp
80100b8d:	85 c0                	test   %eax,%eax
80100b8f:	89 c6                	mov    %eax,%esi
80100b91:	75 3a                	jne    80100bcd <exec+0x1ed>
    freevm(pgdir);
80100b93:	83 ec 0c             	sub    $0xc,%esp
80100b96:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b9c:	e8 9f 60 00 00       	call   80106c40 <freevm>
80100ba1:	83 c4 10             	add    $0x10,%esp
  return -1;
80100ba4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100ba9:	e9 9e fe ff ff       	jmp    80100a4c <exec+0x6c>
    end_op();
80100bae:	e8 2d 20 00 00       	call   80102be0 <end_op>
    cprintf("exec: fail\n");
80100bb3:	83 ec 0c             	sub    $0xc,%esp
80100bb6:	68 c1 71 10 80       	push   $0x801071c1
80100bbb:	e8 a0 fa ff ff       	call   80100660 <cprintf>
    return -1;
80100bc0:	83 c4 10             	add    $0x10,%esp
80100bc3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bc8:	e9 7f fe ff ff       	jmp    80100a4c <exec+0x6c>
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100bcd:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100bd3:	83 ec 08             	sub    $0x8,%esp
  for(argc = 0; argv[argc]; argc++) {
80100bd6:	31 ff                	xor    %edi,%edi
80100bd8:	89 f3                	mov    %esi,%ebx
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100bda:	50                   	push   %eax
80100bdb:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100be1:	e8 7a 61 00 00       	call   80106d60 <clearpteu>
  for(argc = 0; argv[argc]; argc++) {
80100be6:	8b 45 0c             	mov    0xc(%ebp),%eax
80100be9:	83 c4 10             	add    $0x10,%esp
80100bec:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100bf2:	8b 00                	mov    (%eax),%eax
80100bf4:	85 c0                	test   %eax,%eax
80100bf6:	74 79                	je     80100c71 <exec+0x291>
80100bf8:	89 b5 ec fe ff ff    	mov    %esi,-0x114(%ebp)
80100bfe:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100c04:	eb 13                	jmp    80100c19 <exec+0x239>
80100c06:	8d 76 00             	lea    0x0(%esi),%esi
80100c09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(argc >= MAXARG)
80100c10:	83 ff 20             	cmp    $0x20,%edi
80100c13:	0f 84 7a ff ff ff    	je     80100b93 <exec+0x1b3>
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c19:	83 ec 0c             	sub    $0xc,%esp
80100c1c:	50                   	push   %eax
80100c1d:	e8 be 3a 00 00       	call   801046e0 <strlen>
80100c22:	f7 d0                	not    %eax
80100c24:	01 c3                	add    %eax,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c26:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c29:	5a                   	pop    %edx
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c2a:	83 e3 fc             	and    $0xfffffffc,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c2d:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c30:	e8 ab 3a 00 00       	call   801046e0 <strlen>
80100c35:	83 c0 01             	add    $0x1,%eax
80100c38:	50                   	push   %eax
80100c39:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c3c:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c3f:	53                   	push   %ebx
80100c40:	56                   	push   %esi
80100c41:	e8 7a 62 00 00       	call   80106ec0 <copyout>
80100c46:	83 c4 20             	add    $0x20,%esp
80100c49:	85 c0                	test   %eax,%eax
80100c4b:	0f 88 42 ff ff ff    	js     80100b93 <exec+0x1b3>
  for(argc = 0; argv[argc]; argc++) {
80100c51:	8b 45 0c             	mov    0xc(%ebp),%eax
    ustack[3+argc] = sp;
80100c54:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
  for(argc = 0; argv[argc]; argc++) {
80100c5b:	83 c7 01             	add    $0x1,%edi
    ustack[3+argc] = sp;
80100c5e:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
  for(argc = 0; argv[argc]; argc++) {
80100c64:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100c67:	85 c0                	test   %eax,%eax
80100c69:	75 a5                	jne    80100c10 <exec+0x230>
80100c6b:	8b b5 ec fe ff ff    	mov    -0x114(%ebp),%esi
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c71:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100c78:	89 d9                	mov    %ebx,%ecx
  ustack[3+argc] = 0;
80100c7a:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100c81:	00 00 00 00 
  ustack[0] = 0xffffffff;  // fake return PC
80100c85:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100c8c:	ff ff ff 
  ustack[1] = argc;
80100c8f:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c95:	29 c1                	sub    %eax,%ecx
  sp -= (3+argc+1) * 4;
80100c97:	83 c0 0c             	add    $0xc,%eax
80100c9a:	29 c3                	sub    %eax,%ebx
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100c9c:	50                   	push   %eax
80100c9d:	52                   	push   %edx
80100c9e:	53                   	push   %ebx
80100c9f:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100ca5:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100cab:	e8 10 62 00 00       	call   80106ec0 <copyout>
80100cb0:	83 c4 10             	add    $0x10,%esp
80100cb3:	85 c0                	test   %eax,%eax
80100cb5:	0f 88 d8 fe ff ff    	js     80100b93 <exec+0x1b3>
  for(last=s=path; *s; s++)
80100cbb:	8b 45 08             	mov    0x8(%ebp),%eax
80100cbe:	0f b6 10             	movzbl (%eax),%edx
80100cc1:	84 d2                	test   %dl,%dl
80100cc3:	74 19                	je     80100cde <exec+0x2fe>
80100cc5:	8b 4d 08             	mov    0x8(%ebp),%ecx
80100cc8:	83 c0 01             	add    $0x1,%eax
      last = s+1;
80100ccb:	80 fa 2f             	cmp    $0x2f,%dl
  for(last=s=path; *s; s++)
80100cce:	0f b6 10             	movzbl (%eax),%edx
      last = s+1;
80100cd1:	0f 44 c8             	cmove  %eax,%ecx
80100cd4:	83 c0 01             	add    $0x1,%eax
  for(last=s=path; *s; s++)
80100cd7:	84 d2                	test   %dl,%dl
80100cd9:	75 f0                	jne    80100ccb <exec+0x2eb>
80100cdb:	89 4d 08             	mov    %ecx,0x8(%ebp)
  safestrcpy(curproc->name, last, sizeof(curproc->name));
80100cde:	8b bd f4 fe ff ff    	mov    -0x10c(%ebp),%edi
80100ce4:	50                   	push   %eax
80100ce5:	6a 10                	push   $0x10
80100ce7:	ff 75 08             	pushl  0x8(%ebp)
80100cea:	89 f8                	mov    %edi,%eax
80100cec:	83 c0 6c             	add    $0x6c,%eax
80100cef:	50                   	push   %eax
80100cf0:	e8 ab 39 00 00       	call   801046a0 <safestrcpy>
  curproc->pgdir = pgdir;
80100cf5:	8b 8d f0 fe ff ff    	mov    -0x110(%ebp),%ecx
  oldpgdir = curproc->pgdir;
80100cfb:	89 f8                	mov    %edi,%eax
80100cfd:	8b 7f 04             	mov    0x4(%edi),%edi
  curproc->sz = sz;
80100d00:	89 30                	mov    %esi,(%eax)
  curproc->pgdir = pgdir;
80100d02:	89 48 04             	mov    %ecx,0x4(%eax)
  curproc->tf->eip = elf.entry;  // main
80100d05:	89 c1                	mov    %eax,%ecx
80100d07:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100d0d:	8b 40 18             	mov    0x18(%eax),%eax
80100d10:	89 50 38             	mov    %edx,0x38(%eax)
  curproc->tf->esp = sp;
80100d13:	8b 41 18             	mov    0x18(%ecx),%eax
80100d16:	89 58 44             	mov    %ebx,0x44(%eax)
  switchuvm(curproc);
80100d19:	89 0c 24             	mov    %ecx,(%esp)
80100d1c:	e8 af 5b 00 00       	call   801068d0 <switchuvm>
  freevm(oldpgdir);
80100d21:	89 3c 24             	mov    %edi,(%esp)
80100d24:	e8 17 5f 00 00       	call   80106c40 <freevm>
  return 0;
80100d29:	83 c4 10             	add    $0x10,%esp
80100d2c:	31 c0                	xor    %eax,%eax
80100d2e:	e9 19 fd ff ff       	jmp    80100a4c <exec+0x6c>
80100d33:	66 90                	xchg   %ax,%ax
80100d35:	66 90                	xchg   %ax,%ax
80100d37:	66 90                	xchg   %ax,%ax
80100d39:	66 90                	xchg   %ax,%ax
80100d3b:	66 90                	xchg   %ax,%ax
80100d3d:	66 90                	xchg   %ax,%ax
80100d3f:	90                   	nop

80100d40 <fileinit>:
80100d40:	55                   	push   %ebp
80100d41:	89 e5                	mov    %esp,%ebp
80100d43:	83 ec 10             	sub    $0x10,%esp
80100d46:	68 cd 71 10 80       	push   $0x801071cd
80100d4b:	68 80 09 11 80       	push   $0x80110980
80100d50:	e8 0b 35 00 00       	call   80104260 <initlock>
80100d55:	83 c4 10             	add    $0x10,%esp
80100d58:	c9                   	leave  
80100d59:	c3                   	ret    
80100d5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100d60 <filealloc>:
80100d60:	55                   	push   %ebp
80100d61:	89 e5                	mov    %esp,%ebp
80100d63:	53                   	push   %ebx
80100d64:	bb b4 09 11 80       	mov    $0x801109b4,%ebx
80100d69:	83 ec 10             	sub    $0x10,%esp
80100d6c:	68 80 09 11 80       	push   $0x80110980
80100d71:	e8 4a 36 00 00       	call   801043c0 <acquire>
80100d76:	83 c4 10             	add    $0x10,%esp
80100d79:	eb 10                	jmp    80100d8b <filealloc+0x2b>
80100d7b:	90                   	nop
80100d7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100d80:	83 c3 18             	add    $0x18,%ebx
80100d83:	81 fb 14 13 11 80    	cmp    $0x80111314,%ebx
80100d89:	73 25                	jae    80100db0 <filealloc+0x50>
80100d8b:	8b 43 04             	mov    0x4(%ebx),%eax
80100d8e:	85 c0                	test   %eax,%eax
80100d90:	75 ee                	jne    80100d80 <filealloc+0x20>
80100d92:	83 ec 0c             	sub    $0xc,%esp
80100d95:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
80100d9c:	68 80 09 11 80       	push   $0x80110980
80100da1:	e8 ca 36 00 00       	call   80104470 <release>
80100da6:	89 d8                	mov    %ebx,%eax
80100da8:	83 c4 10             	add    $0x10,%esp
80100dab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dae:	c9                   	leave  
80100daf:	c3                   	ret    
80100db0:	83 ec 0c             	sub    $0xc,%esp
80100db3:	31 db                	xor    %ebx,%ebx
80100db5:	68 80 09 11 80       	push   $0x80110980
80100dba:	e8 b1 36 00 00       	call   80104470 <release>
80100dbf:	89 d8                	mov    %ebx,%eax
80100dc1:	83 c4 10             	add    $0x10,%esp
80100dc4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dc7:	c9                   	leave  
80100dc8:	c3                   	ret    
80100dc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100dd0 <filedup>:
80100dd0:	55                   	push   %ebp
80100dd1:	89 e5                	mov    %esp,%ebp
80100dd3:	53                   	push   %ebx
80100dd4:	83 ec 10             	sub    $0x10,%esp
80100dd7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100dda:	68 80 09 11 80       	push   $0x80110980
80100ddf:	e8 dc 35 00 00       	call   801043c0 <acquire>
80100de4:	8b 43 04             	mov    0x4(%ebx),%eax
80100de7:	83 c4 10             	add    $0x10,%esp
80100dea:	85 c0                	test   %eax,%eax
80100dec:	7e 1a                	jle    80100e08 <filedup+0x38>
80100dee:	83 c0 01             	add    $0x1,%eax
80100df1:	83 ec 0c             	sub    $0xc,%esp
80100df4:	89 43 04             	mov    %eax,0x4(%ebx)
80100df7:	68 80 09 11 80       	push   $0x80110980
80100dfc:	e8 6f 36 00 00       	call   80104470 <release>
80100e01:	89 d8                	mov    %ebx,%eax
80100e03:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e06:	c9                   	leave  
80100e07:	c3                   	ret    
80100e08:	83 ec 0c             	sub    $0xc,%esp
80100e0b:	68 d4 71 10 80       	push   $0x801071d4
80100e10:	e8 5b f5 ff ff       	call   80100370 <panic>
80100e15:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e20 <fileclose>:
80100e20:	55                   	push   %ebp
80100e21:	89 e5                	mov    %esp,%ebp
80100e23:	57                   	push   %edi
80100e24:	56                   	push   %esi
80100e25:	53                   	push   %ebx
80100e26:	83 ec 28             	sub    $0x28,%esp
80100e29:	8b 7d 08             	mov    0x8(%ebp),%edi
80100e2c:	68 80 09 11 80       	push   $0x80110980
80100e31:	e8 8a 35 00 00       	call   801043c0 <acquire>
80100e36:	8b 47 04             	mov    0x4(%edi),%eax
80100e39:	83 c4 10             	add    $0x10,%esp
80100e3c:	85 c0                	test   %eax,%eax
80100e3e:	0f 8e 9b 00 00 00    	jle    80100edf <fileclose+0xbf>
80100e44:	83 e8 01             	sub    $0x1,%eax
80100e47:	85 c0                	test   %eax,%eax
80100e49:	89 47 04             	mov    %eax,0x4(%edi)
80100e4c:	74 1a                	je     80100e68 <fileclose+0x48>
80100e4e:	c7 45 08 80 09 11 80 	movl   $0x80110980,0x8(%ebp)
80100e55:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e58:	5b                   	pop    %ebx
80100e59:	5e                   	pop    %esi
80100e5a:	5f                   	pop    %edi
80100e5b:	5d                   	pop    %ebp
80100e5c:	e9 0f 36 00 00       	jmp    80104470 <release>
80100e61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100e68:	0f b6 47 09          	movzbl 0x9(%edi),%eax
80100e6c:	8b 1f                	mov    (%edi),%ebx
80100e6e:	83 ec 0c             	sub    $0xc,%esp
80100e71:	8b 77 0c             	mov    0xc(%edi),%esi
80100e74:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
80100e7a:	88 45 e7             	mov    %al,-0x19(%ebp)
80100e7d:	8b 47 10             	mov    0x10(%edi),%eax
80100e80:	68 80 09 11 80       	push   $0x80110980
80100e85:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100e88:	e8 e3 35 00 00       	call   80104470 <release>
80100e8d:	83 c4 10             	add    $0x10,%esp
80100e90:	83 fb 01             	cmp    $0x1,%ebx
80100e93:	74 13                	je     80100ea8 <fileclose+0x88>
80100e95:	83 fb 02             	cmp    $0x2,%ebx
80100e98:	74 26                	je     80100ec0 <fileclose+0xa0>
80100e9a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e9d:	5b                   	pop    %ebx
80100e9e:	5e                   	pop    %esi
80100e9f:	5f                   	pop    %edi
80100ea0:	5d                   	pop    %ebp
80100ea1:	c3                   	ret    
80100ea2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100ea8:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100eac:	83 ec 08             	sub    $0x8,%esp
80100eaf:	53                   	push   %ebx
80100eb0:	56                   	push   %esi
80100eb1:	e8 4a 24 00 00       	call   80103300 <pipeclose>
80100eb6:	83 c4 10             	add    $0x10,%esp
80100eb9:	eb df                	jmp    80100e9a <fileclose+0x7a>
80100ebb:	90                   	nop
80100ebc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100ec0:	e8 ab 1c 00 00       	call   80102b70 <begin_op>
80100ec5:	83 ec 0c             	sub    $0xc,%esp
80100ec8:	ff 75 e0             	pushl  -0x20(%ebp)
80100ecb:	e8 d0 08 00 00       	call   801017a0 <iput>
80100ed0:	83 c4 10             	add    $0x10,%esp
80100ed3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ed6:	5b                   	pop    %ebx
80100ed7:	5e                   	pop    %esi
80100ed8:	5f                   	pop    %edi
80100ed9:	5d                   	pop    %ebp
80100eda:	e9 01 1d 00 00       	jmp    80102be0 <end_op>
80100edf:	83 ec 0c             	sub    $0xc,%esp
80100ee2:	68 dc 71 10 80       	push   $0x801071dc
80100ee7:	e8 84 f4 ff ff       	call   80100370 <panic>
80100eec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100ef0 <filestat>:
80100ef0:	55                   	push   %ebp
80100ef1:	89 e5                	mov    %esp,%ebp
80100ef3:	53                   	push   %ebx
80100ef4:	83 ec 04             	sub    $0x4,%esp
80100ef7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100efa:	83 3b 02             	cmpl   $0x2,(%ebx)
80100efd:	75 31                	jne    80100f30 <filestat+0x40>
80100eff:	83 ec 0c             	sub    $0xc,%esp
80100f02:	ff 73 10             	pushl  0x10(%ebx)
80100f05:	e8 66 07 00 00       	call   80101670 <ilock>
80100f0a:	58                   	pop    %eax
80100f0b:	5a                   	pop    %edx
80100f0c:	ff 75 0c             	pushl  0xc(%ebp)
80100f0f:	ff 73 10             	pushl  0x10(%ebx)
80100f12:	e8 09 0a 00 00       	call   80101920 <stati>
80100f17:	59                   	pop    %ecx
80100f18:	ff 73 10             	pushl  0x10(%ebx)
80100f1b:	e8 30 08 00 00       	call   80101750 <iunlock>
80100f20:	83 c4 10             	add    $0x10,%esp
80100f23:	31 c0                	xor    %eax,%eax
80100f25:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f28:	c9                   	leave  
80100f29:	c3                   	ret    
80100f2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100f30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100f35:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f38:	c9                   	leave  
80100f39:	c3                   	ret    
80100f3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100f40 <fileread>:
80100f40:	55                   	push   %ebp
80100f41:	89 e5                	mov    %esp,%ebp
80100f43:	57                   	push   %edi
80100f44:	56                   	push   %esi
80100f45:	53                   	push   %ebx
80100f46:	83 ec 0c             	sub    $0xc,%esp
80100f49:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f4c:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f4f:	8b 7d 10             	mov    0x10(%ebp),%edi
80100f52:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100f56:	74 60                	je     80100fb8 <fileread+0x78>
80100f58:	8b 03                	mov    (%ebx),%eax
80100f5a:	83 f8 01             	cmp    $0x1,%eax
80100f5d:	74 41                	je     80100fa0 <fileread+0x60>
80100f5f:	83 f8 02             	cmp    $0x2,%eax
80100f62:	75 5b                	jne    80100fbf <fileread+0x7f>
80100f64:	83 ec 0c             	sub    $0xc,%esp
80100f67:	ff 73 10             	pushl  0x10(%ebx)
80100f6a:	e8 01 07 00 00       	call   80101670 <ilock>
80100f6f:	57                   	push   %edi
80100f70:	ff 73 14             	pushl  0x14(%ebx)
80100f73:	56                   	push   %esi
80100f74:	ff 73 10             	pushl  0x10(%ebx)
80100f77:	e8 d4 09 00 00       	call   80101950 <readi>
80100f7c:	83 c4 20             	add    $0x20,%esp
80100f7f:	85 c0                	test   %eax,%eax
80100f81:	89 c6                	mov    %eax,%esi
80100f83:	7e 03                	jle    80100f88 <fileread+0x48>
80100f85:	01 43 14             	add    %eax,0x14(%ebx)
80100f88:	83 ec 0c             	sub    $0xc,%esp
80100f8b:	ff 73 10             	pushl  0x10(%ebx)
80100f8e:	e8 bd 07 00 00       	call   80101750 <iunlock>
80100f93:	83 c4 10             	add    $0x10,%esp
80100f96:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f99:	89 f0                	mov    %esi,%eax
80100f9b:	5b                   	pop    %ebx
80100f9c:	5e                   	pop    %esi
80100f9d:	5f                   	pop    %edi
80100f9e:	5d                   	pop    %ebp
80100f9f:	c3                   	ret    
80100fa0:	8b 43 0c             	mov    0xc(%ebx),%eax
80100fa3:	89 45 08             	mov    %eax,0x8(%ebp)
80100fa6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fa9:	5b                   	pop    %ebx
80100faa:	5e                   	pop    %esi
80100fab:	5f                   	pop    %edi
80100fac:	5d                   	pop    %ebp
80100fad:	e9 fe 24 00 00       	jmp    801034b0 <piperead>
80100fb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100fb8:	be ff ff ff ff       	mov    $0xffffffff,%esi
80100fbd:	eb d7                	jmp    80100f96 <fileread+0x56>
80100fbf:	83 ec 0c             	sub    $0xc,%esp
80100fc2:	68 e6 71 10 80       	push   $0x801071e6
80100fc7:	e8 a4 f3 ff ff       	call   80100370 <panic>
80100fcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100fd0 <filewrite>:
80100fd0:	55                   	push   %ebp
80100fd1:	89 e5                	mov    %esp,%ebp
80100fd3:	57                   	push   %edi
80100fd4:	56                   	push   %esi
80100fd5:	53                   	push   %ebx
80100fd6:	83 ec 1c             	sub    $0x1c,%esp
80100fd9:	8b 75 08             	mov    0x8(%ebp),%esi
80100fdc:	8b 45 0c             	mov    0xc(%ebp),%eax
80100fdf:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)
80100fe3:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100fe6:	8b 45 10             	mov    0x10(%ebp),%eax
80100fe9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100fec:	0f 84 aa 00 00 00    	je     8010109c <filewrite+0xcc>
80100ff2:	8b 06                	mov    (%esi),%eax
80100ff4:	83 f8 01             	cmp    $0x1,%eax
80100ff7:	0f 84 c2 00 00 00    	je     801010bf <filewrite+0xef>
80100ffd:	83 f8 02             	cmp    $0x2,%eax
80101000:	0f 85 e4 00 00 00    	jne    801010ea <filewrite+0x11a>
80101006:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101009:	31 ff                	xor    %edi,%edi
8010100b:	85 c0                	test   %eax,%eax
8010100d:	7f 34                	jg     80101043 <filewrite+0x73>
8010100f:	e9 9c 00 00 00       	jmp    801010b0 <filewrite+0xe0>
80101014:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101018:	01 46 14             	add    %eax,0x14(%esi)
8010101b:	83 ec 0c             	sub    $0xc,%esp
8010101e:	ff 76 10             	pushl  0x10(%esi)
80101021:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101024:	e8 27 07 00 00       	call   80101750 <iunlock>
80101029:	e8 b2 1b 00 00       	call   80102be0 <end_op>
8010102e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101031:	83 c4 10             	add    $0x10,%esp
80101034:	39 d8                	cmp    %ebx,%eax
80101036:	0f 85 a1 00 00 00    	jne    801010dd <filewrite+0x10d>
8010103c:	01 c7                	add    %eax,%edi
8010103e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101041:	7e 6d                	jle    801010b0 <filewrite+0xe0>
80101043:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101046:	b8 00 06 00 00       	mov    $0x600,%eax
8010104b:	29 fb                	sub    %edi,%ebx
8010104d:	81 fb 00 06 00 00    	cmp    $0x600,%ebx
80101053:	0f 4f d8             	cmovg  %eax,%ebx
80101056:	e8 15 1b 00 00       	call   80102b70 <begin_op>
8010105b:	83 ec 0c             	sub    $0xc,%esp
8010105e:	ff 76 10             	pushl  0x10(%esi)
80101061:	e8 0a 06 00 00       	call   80101670 <ilock>
80101066:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101069:	53                   	push   %ebx
8010106a:	ff 76 14             	pushl  0x14(%esi)
8010106d:	01 f8                	add    %edi,%eax
8010106f:	50                   	push   %eax
80101070:	ff 76 10             	pushl  0x10(%esi)
80101073:	e8 d8 09 00 00       	call   80101a50 <writei>
80101078:	83 c4 20             	add    $0x20,%esp
8010107b:	85 c0                	test   %eax,%eax
8010107d:	7f 99                	jg     80101018 <filewrite+0x48>
8010107f:	83 ec 0c             	sub    $0xc,%esp
80101082:	ff 76 10             	pushl  0x10(%esi)
80101085:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101088:	e8 c3 06 00 00       	call   80101750 <iunlock>
8010108d:	e8 4e 1b 00 00       	call   80102be0 <end_op>
80101092:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101095:	83 c4 10             	add    $0x10,%esp
80101098:	85 c0                	test   %eax,%eax
8010109a:	74 98                	je     80101034 <filewrite+0x64>
8010109c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010109f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801010a4:	5b                   	pop    %ebx
801010a5:	5e                   	pop    %esi
801010a6:	5f                   	pop    %edi
801010a7:	5d                   	pop    %ebp
801010a8:	c3                   	ret    
801010a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801010b0:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
801010b3:	75 e7                	jne    8010109c <filewrite+0xcc>
801010b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010b8:	89 f8                	mov    %edi,%eax
801010ba:	5b                   	pop    %ebx
801010bb:	5e                   	pop    %esi
801010bc:	5f                   	pop    %edi
801010bd:	5d                   	pop    %ebp
801010be:	c3                   	ret    
801010bf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801010c2:	89 45 10             	mov    %eax,0x10(%ebp)
801010c5:	8b 45 dc             	mov    -0x24(%ebp),%eax
801010c8:	89 45 0c             	mov    %eax,0xc(%ebp)
801010cb:	8b 46 0c             	mov    0xc(%esi),%eax
801010ce:	89 45 08             	mov    %eax,0x8(%ebp)
801010d1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010d4:	5b                   	pop    %ebx
801010d5:	5e                   	pop    %esi
801010d6:	5f                   	pop    %edi
801010d7:	5d                   	pop    %ebp
801010d8:	e9 c3 22 00 00       	jmp    801033a0 <pipewrite>
801010dd:	83 ec 0c             	sub    $0xc,%esp
801010e0:	68 ef 71 10 80       	push   $0x801071ef
801010e5:	e8 86 f2 ff ff       	call   80100370 <panic>
801010ea:	83 ec 0c             	sub    $0xc,%esp
801010ed:	68 f5 71 10 80       	push   $0x801071f5
801010f2:	e8 79 f2 ff ff       	call   80100370 <panic>
801010f7:	66 90                	xchg   %ax,%ax
801010f9:	66 90                	xchg   %ax,%ax
801010fb:	66 90                	xchg   %ax,%ax
801010fd:	66 90                	xchg   %ax,%ax
801010ff:	90                   	nop

80101100 <balloc>:
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
80101100:	55                   	push   %ebp
80101101:	89 e5                	mov    %esp,%ebp
80101103:	57                   	push   %edi
80101104:	56                   	push   %esi
80101105:	53                   	push   %ebx
80101106:	83 ec 1c             	sub    $0x1c,%esp
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
80101109:	8b 0d 80 13 11 80    	mov    0x80111380,%ecx
{
8010110f:	89 45 d8             	mov    %eax,-0x28(%ebp)
  for(b = 0; b < sb.size; b += BPB){
80101112:	85 c9                	test   %ecx,%ecx
80101114:	0f 84 87 00 00 00    	je     801011a1 <balloc+0xa1>
8010111a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    bp = bread(dev, BBLOCK(b, sb));
80101121:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101124:	83 ec 08             	sub    $0x8,%esp
80101127:	89 f0                	mov    %esi,%eax
80101129:	c1 f8 0c             	sar    $0xc,%eax
8010112c:	03 05 98 13 11 80    	add    0x80111398,%eax
80101132:	50                   	push   %eax
80101133:	ff 75 d8             	pushl  -0x28(%ebp)
80101136:	e8 95 ef ff ff       	call   801000d0 <bread>
8010113b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010113e:	a1 80 13 11 80       	mov    0x80111380,%eax
80101143:	83 c4 10             	add    $0x10,%esp
80101146:	89 45 e0             	mov    %eax,-0x20(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
80101149:	31 c0                	xor    %eax,%eax
8010114b:	eb 2f                	jmp    8010117c <balloc+0x7c>
8010114d:	8d 76 00             	lea    0x0(%esi),%esi
      m = 1 << (bi % 8);
80101150:	89 c1                	mov    %eax,%ecx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101152:	8b 55 e4             	mov    -0x1c(%ebp),%edx
      m = 1 << (bi % 8);
80101155:	bb 01 00 00 00       	mov    $0x1,%ebx
8010115a:	83 e1 07             	and    $0x7,%ecx
8010115d:	d3 e3                	shl    %cl,%ebx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
8010115f:	89 c1                	mov    %eax,%ecx
80101161:	c1 f9 03             	sar    $0x3,%ecx
80101164:	0f b6 7c 0a 5c       	movzbl 0x5c(%edx,%ecx,1),%edi
80101169:	85 df                	test   %ebx,%edi
8010116b:	89 fa                	mov    %edi,%edx
8010116d:	74 41                	je     801011b0 <balloc+0xb0>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
8010116f:	83 c0 01             	add    $0x1,%eax
80101172:	83 c6 01             	add    $0x1,%esi
80101175:	3d 00 10 00 00       	cmp    $0x1000,%eax
8010117a:	74 05                	je     80101181 <balloc+0x81>
8010117c:	3b 75 e0             	cmp    -0x20(%ebp),%esi
8010117f:	72 cf                	jb     80101150 <balloc+0x50>
        brelse(bp);
        bzero(dev, b + bi);
        return b + bi;
      }
    }
    brelse(bp);
80101181:	83 ec 0c             	sub    $0xc,%esp
80101184:	ff 75 e4             	pushl  -0x1c(%ebp)
80101187:	e8 54 f0 ff ff       	call   801001e0 <brelse>
  for(b = 0; b < sb.size; b += BPB){
8010118c:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
80101193:	83 c4 10             	add    $0x10,%esp
80101196:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101199:	39 05 80 13 11 80    	cmp    %eax,0x80111380
8010119f:	77 80                	ja     80101121 <balloc+0x21>
  }
  panic("balloc: out of blocks");
801011a1:	83 ec 0c             	sub    $0xc,%esp
801011a4:	68 ff 71 10 80       	push   $0x801071ff
801011a9:	e8 c2 f1 ff ff       	call   80100370 <panic>
801011ae:	66 90                	xchg   %ax,%ax
        bp->data[bi/8] |= m;  // Mark block in use.
801011b0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
        log_write(bp);
801011b3:	83 ec 0c             	sub    $0xc,%esp
        bp->data[bi/8] |= m;  // Mark block in use.
801011b6:	09 da                	or     %ebx,%edx
801011b8:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
        log_write(bp);
801011bc:	57                   	push   %edi
801011bd:	e8 8e 1b 00 00       	call   80102d50 <log_write>
        brelse(bp);
801011c2:	89 3c 24             	mov    %edi,(%esp)
801011c5:	e8 16 f0 ff ff       	call   801001e0 <brelse>
  bp = bread(dev, bno);
801011ca:	58                   	pop    %eax
801011cb:	5a                   	pop    %edx
801011cc:	56                   	push   %esi
801011cd:	ff 75 d8             	pushl  -0x28(%ebp)
801011d0:	e8 fb ee ff ff       	call   801000d0 <bread>
801011d5:	89 c3                	mov    %eax,%ebx
  memset(bp->data, 0, BSIZE);
801011d7:	8d 40 5c             	lea    0x5c(%eax),%eax
801011da:	83 c4 0c             	add    $0xc,%esp
801011dd:	68 00 02 00 00       	push   $0x200
801011e2:	6a 00                	push   $0x0
801011e4:	50                   	push   %eax
801011e5:	e8 d6 32 00 00       	call   801044c0 <memset>
  log_write(bp);
801011ea:	89 1c 24             	mov    %ebx,(%esp)
801011ed:	e8 5e 1b 00 00       	call   80102d50 <log_write>
  brelse(bp);
801011f2:	89 1c 24             	mov    %ebx,(%esp)
801011f5:	e8 e6 ef ff ff       	call   801001e0 <brelse>
}
801011fa:	8d 65 f4             	lea    -0xc(%ebp),%esp
801011fd:	89 f0                	mov    %esi,%eax
801011ff:	5b                   	pop    %ebx
80101200:	5e                   	pop    %esi
80101201:	5f                   	pop    %edi
80101202:	5d                   	pop    %ebp
80101203:	c3                   	ret    
80101204:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010120a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101210 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
80101210:	55                   	push   %ebp
80101211:	89 e5                	mov    %esp,%ebp
80101213:	57                   	push   %edi
80101214:	56                   	push   %esi
80101215:	53                   	push   %ebx
80101216:	89 c7                	mov    %eax,%edi
  struct inode *ip, *empty;

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
80101218:	31 f6                	xor    %esi,%esi
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010121a:	bb d4 13 11 80       	mov    $0x801113d4,%ebx
{
8010121f:	83 ec 28             	sub    $0x28,%esp
80101222:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  acquire(&icache.lock);
80101225:	68 a0 13 11 80       	push   $0x801113a0
8010122a:	e8 91 31 00 00       	call   801043c0 <acquire>
8010122f:	83 c4 10             	add    $0x10,%esp
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101232:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101235:	eb 1b                	jmp    80101252 <iget+0x42>
80101237:	89 f6                	mov    %esi,%esi
80101239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101240:	85 f6                	test   %esi,%esi
80101242:	74 44                	je     80101288 <iget+0x78>
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101244:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010124a:	81 fb f4 2f 11 80    	cmp    $0x80112ff4,%ebx
80101250:	73 4e                	jae    801012a0 <iget+0x90>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
80101252:	8b 4b 08             	mov    0x8(%ebx),%ecx
80101255:	85 c9                	test   %ecx,%ecx
80101257:	7e e7                	jle    80101240 <iget+0x30>
80101259:	39 3b                	cmp    %edi,(%ebx)
8010125b:	75 e3                	jne    80101240 <iget+0x30>
8010125d:	39 53 04             	cmp    %edx,0x4(%ebx)
80101260:	75 de                	jne    80101240 <iget+0x30>
      release(&icache.lock);
80101262:	83 ec 0c             	sub    $0xc,%esp
      ip->ref++;
80101265:	83 c1 01             	add    $0x1,%ecx
      return ip;
80101268:	89 de                	mov    %ebx,%esi
      release(&icache.lock);
8010126a:	68 a0 13 11 80       	push   $0x801113a0
      ip->ref++;
8010126f:	89 4b 08             	mov    %ecx,0x8(%ebx)
      release(&icache.lock);
80101272:	e8 f9 31 00 00       	call   80104470 <release>
      return ip;
80101277:	83 c4 10             	add    $0x10,%esp
  ip->ref = 1;
  ip->valid = 0;
  release(&icache.lock);

  return ip;
}
8010127a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010127d:	89 f0                	mov    %esi,%eax
8010127f:	5b                   	pop    %ebx
80101280:	5e                   	pop    %esi
80101281:	5f                   	pop    %edi
80101282:	5d                   	pop    %ebp
80101283:	c3                   	ret    
80101284:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101288:	85 c9                	test   %ecx,%ecx
8010128a:	0f 44 f3             	cmove  %ebx,%esi
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010128d:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101293:	81 fb f4 2f 11 80    	cmp    $0x80112ff4,%ebx
80101299:	72 b7                	jb     80101252 <iget+0x42>
8010129b:	90                   	nop
8010129c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(empty == 0)
801012a0:	85 f6                	test   %esi,%esi
801012a2:	74 2d                	je     801012d1 <iget+0xc1>
  release(&icache.lock);
801012a4:	83 ec 0c             	sub    $0xc,%esp
  ip->dev = dev;
801012a7:	89 3e                	mov    %edi,(%esi)
  ip->inum = inum;
801012a9:	89 56 04             	mov    %edx,0x4(%esi)
  ip->ref = 1;
801012ac:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
  ip->valid = 0;
801012b3:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
  release(&icache.lock);
801012ba:	68 a0 13 11 80       	push   $0x801113a0
801012bf:	e8 ac 31 00 00       	call   80104470 <release>
  return ip;
801012c4:	83 c4 10             	add    $0x10,%esp
}
801012c7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012ca:	89 f0                	mov    %esi,%eax
801012cc:	5b                   	pop    %ebx
801012cd:	5e                   	pop    %esi
801012ce:	5f                   	pop    %edi
801012cf:	5d                   	pop    %ebp
801012d0:	c3                   	ret    
    panic("iget: no inodes");
801012d1:	83 ec 0c             	sub    $0xc,%esp
801012d4:	68 15 72 10 80       	push   $0x80107215
801012d9:	e8 92 f0 ff ff       	call   80100370 <panic>
801012de:	66 90                	xchg   %ax,%ax

801012e0 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
801012e0:	55                   	push   %ebp
801012e1:	89 e5                	mov    %esp,%ebp
801012e3:	57                   	push   %edi
801012e4:	56                   	push   %esi
801012e5:	53                   	push   %ebx
801012e6:	89 c6                	mov    %eax,%esi
801012e8:	83 ec 1c             	sub    $0x1c,%esp
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
801012eb:	83 fa 0b             	cmp    $0xb,%edx
801012ee:	77 18                	ja     80101308 <bmap+0x28>
801012f0:	8d 3c 90             	lea    (%eax,%edx,4),%edi
    if((addr = ip->addrs[bn]) == 0)
801012f3:	8b 5f 5c             	mov    0x5c(%edi),%ebx
801012f6:	85 db                	test   %ebx,%ebx
801012f8:	74 76                	je     80101370 <bmap+0x90>
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
801012fa:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012fd:	89 d8                	mov    %ebx,%eax
801012ff:	5b                   	pop    %ebx
80101300:	5e                   	pop    %esi
80101301:	5f                   	pop    %edi
80101302:	5d                   	pop    %ebp
80101303:	c3                   	ret    
80101304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  bn -= NDIRECT;
80101308:	8d 5a f4             	lea    -0xc(%edx),%ebx
  if(bn < NINDIRECT){
8010130b:	83 fb 7f             	cmp    $0x7f,%ebx
8010130e:	0f 87 8e 00 00 00    	ja     801013a2 <bmap+0xc2>
    if((addr = ip->addrs[NDIRECT]) == 0)
80101314:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
8010131a:	85 c0                	test   %eax,%eax
8010131c:	74 72                	je     80101390 <bmap+0xb0>
    bp = bread(ip->dev, addr);
8010131e:	83 ec 08             	sub    $0x8,%esp
80101321:	50                   	push   %eax
80101322:	ff 36                	pushl  (%esi)
80101324:	e8 a7 ed ff ff       	call   801000d0 <bread>
    if((addr = a[bn]) == 0){
80101329:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
8010132d:	83 c4 10             	add    $0x10,%esp
    bp = bread(ip->dev, addr);
80101330:	89 c7                	mov    %eax,%edi
    if((addr = a[bn]) == 0){
80101332:	8b 1a                	mov    (%edx),%ebx
80101334:	85 db                	test   %ebx,%ebx
80101336:	75 1d                	jne    80101355 <bmap+0x75>
      a[bn] = addr = balloc(ip->dev);
80101338:	8b 06                	mov    (%esi),%eax
8010133a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010133d:	e8 be fd ff ff       	call   80101100 <balloc>
80101342:	8b 55 e4             	mov    -0x1c(%ebp),%edx
      log_write(bp);
80101345:	83 ec 0c             	sub    $0xc,%esp
      a[bn] = addr = balloc(ip->dev);
80101348:	89 c3                	mov    %eax,%ebx
8010134a:	89 02                	mov    %eax,(%edx)
      log_write(bp);
8010134c:	57                   	push   %edi
8010134d:	e8 fe 19 00 00       	call   80102d50 <log_write>
80101352:	83 c4 10             	add    $0x10,%esp
    brelse(bp);
80101355:	83 ec 0c             	sub    $0xc,%esp
80101358:	57                   	push   %edi
80101359:	e8 82 ee ff ff       	call   801001e0 <brelse>
8010135e:	83 c4 10             	add    $0x10,%esp
}
80101361:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101364:	89 d8                	mov    %ebx,%eax
80101366:	5b                   	pop    %ebx
80101367:	5e                   	pop    %esi
80101368:	5f                   	pop    %edi
80101369:	5d                   	pop    %ebp
8010136a:	c3                   	ret    
8010136b:	90                   	nop
8010136c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      ip->addrs[bn] = addr = balloc(ip->dev);
80101370:	8b 00                	mov    (%eax),%eax
80101372:	e8 89 fd ff ff       	call   80101100 <balloc>
80101377:	89 47 5c             	mov    %eax,0x5c(%edi)
}
8010137a:	8d 65 f4             	lea    -0xc(%ebp),%esp
      ip->addrs[bn] = addr = balloc(ip->dev);
8010137d:	89 c3                	mov    %eax,%ebx
}
8010137f:	89 d8                	mov    %ebx,%eax
80101381:	5b                   	pop    %ebx
80101382:	5e                   	pop    %esi
80101383:	5f                   	pop    %edi
80101384:	5d                   	pop    %ebp
80101385:	c3                   	ret    
80101386:	8d 76 00             	lea    0x0(%esi),%esi
80101389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
80101390:	8b 06                	mov    (%esi),%eax
80101392:	e8 69 fd ff ff       	call   80101100 <balloc>
80101397:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
8010139d:	e9 7c ff ff ff       	jmp    8010131e <bmap+0x3e>
  panic("bmap: out of range");
801013a2:	83 ec 0c             	sub    $0xc,%esp
801013a5:	68 25 72 10 80       	push   $0x80107225
801013aa:	e8 c1 ef ff ff       	call   80100370 <panic>
801013af:	90                   	nop

801013b0 <readsb>:
{
801013b0:	55                   	push   %ebp
801013b1:	89 e5                	mov    %esp,%ebp
801013b3:	56                   	push   %esi
801013b4:	53                   	push   %ebx
801013b5:	8b 75 0c             	mov    0xc(%ebp),%esi
  bp = bread(dev, 1);
801013b8:	83 ec 08             	sub    $0x8,%esp
801013bb:	6a 01                	push   $0x1
801013bd:	ff 75 08             	pushl  0x8(%ebp)
801013c0:	e8 0b ed ff ff       	call   801000d0 <bread>
801013c5:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
801013c7:	8d 40 5c             	lea    0x5c(%eax),%eax
801013ca:	83 c4 0c             	add    $0xc,%esp
801013cd:	6a 1c                	push   $0x1c
801013cf:	50                   	push   %eax
801013d0:	56                   	push   %esi
801013d1:	e8 9a 31 00 00       	call   80104570 <memmove>
  brelse(bp);
801013d6:	89 5d 08             	mov    %ebx,0x8(%ebp)
801013d9:	83 c4 10             	add    $0x10,%esp
}
801013dc:	8d 65 f8             	lea    -0x8(%ebp),%esp
801013df:	5b                   	pop    %ebx
801013e0:	5e                   	pop    %esi
801013e1:	5d                   	pop    %ebp
  brelse(bp);
801013e2:	e9 f9 ed ff ff       	jmp    801001e0 <brelse>
801013e7:	89 f6                	mov    %esi,%esi
801013e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801013f0 <bfree>:
{
801013f0:	55                   	push   %ebp
801013f1:	89 e5                	mov    %esp,%ebp
801013f3:	56                   	push   %esi
801013f4:	53                   	push   %ebx
801013f5:	89 d3                	mov    %edx,%ebx
801013f7:	89 c6                	mov    %eax,%esi
  readsb(dev, &sb);
801013f9:	83 ec 08             	sub    $0x8,%esp
801013fc:	68 80 13 11 80       	push   $0x80111380
80101401:	50                   	push   %eax
80101402:	e8 a9 ff ff ff       	call   801013b0 <readsb>
  bp = bread(dev, BBLOCK(b, sb));
80101407:	58                   	pop    %eax
80101408:	5a                   	pop    %edx
80101409:	89 da                	mov    %ebx,%edx
8010140b:	c1 ea 0c             	shr    $0xc,%edx
8010140e:	03 15 98 13 11 80    	add    0x80111398,%edx
80101414:	52                   	push   %edx
80101415:	56                   	push   %esi
80101416:	e8 b5 ec ff ff       	call   801000d0 <bread>
  m = 1 << (bi % 8);
8010141b:	89 d9                	mov    %ebx,%ecx
  if((bp->data[bi/8] & m) == 0)
8010141d:	c1 fb 03             	sar    $0x3,%ebx
  m = 1 << (bi % 8);
80101420:	ba 01 00 00 00       	mov    $0x1,%edx
80101425:	83 e1 07             	and    $0x7,%ecx
  if((bp->data[bi/8] & m) == 0)
80101428:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
8010142e:	83 c4 10             	add    $0x10,%esp
  m = 1 << (bi % 8);
80101431:	d3 e2                	shl    %cl,%edx
  if((bp->data[bi/8] & m) == 0)
80101433:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
80101438:	85 d1                	test   %edx,%ecx
8010143a:	74 25                	je     80101461 <bfree+0x71>
  bp->data[bi/8] &= ~m;
8010143c:	f7 d2                	not    %edx
8010143e:	89 c6                	mov    %eax,%esi
  log_write(bp);
80101440:	83 ec 0c             	sub    $0xc,%esp
  bp->data[bi/8] &= ~m;
80101443:	21 ca                	and    %ecx,%edx
80101445:	88 54 1e 5c          	mov    %dl,0x5c(%esi,%ebx,1)
  log_write(bp);
80101449:	56                   	push   %esi
8010144a:	e8 01 19 00 00       	call   80102d50 <log_write>
  brelse(bp);
8010144f:	89 34 24             	mov    %esi,(%esp)
80101452:	e8 89 ed ff ff       	call   801001e0 <brelse>
}
80101457:	83 c4 10             	add    $0x10,%esp
8010145a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010145d:	5b                   	pop    %ebx
8010145e:	5e                   	pop    %esi
8010145f:	5d                   	pop    %ebp
80101460:	c3                   	ret    
    panic("freeing free block");
80101461:	83 ec 0c             	sub    $0xc,%esp
80101464:	68 38 72 10 80       	push   $0x80107238
80101469:	e8 02 ef ff ff       	call   80100370 <panic>
8010146e:	66 90                	xchg   %ax,%ax

80101470 <iinit>:
{
80101470:	55                   	push   %ebp
80101471:	89 e5                	mov    %esp,%ebp
80101473:	53                   	push   %ebx
80101474:	bb e0 13 11 80       	mov    $0x801113e0,%ebx
80101479:	83 ec 0c             	sub    $0xc,%esp
  initlock(&icache.lock, "icache");
8010147c:	68 4b 72 10 80       	push   $0x8010724b
80101481:	68 a0 13 11 80       	push   $0x801113a0
80101486:	e8 d5 2d 00 00       	call   80104260 <initlock>
8010148b:	83 c4 10             	add    $0x10,%esp
8010148e:	66 90                	xchg   %ax,%ax
    initsleeplock(&icache.inode[i].lock, "inode");
80101490:	83 ec 08             	sub    $0x8,%esp
80101493:	68 52 72 10 80       	push   $0x80107252
80101498:	53                   	push   %ebx
80101499:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010149f:	e8 8c 2c 00 00       	call   80104130 <initsleeplock>
  for(i = 0; i < NINODE; i++) {
801014a4:	83 c4 10             	add    $0x10,%esp
801014a7:	81 fb 00 30 11 80    	cmp    $0x80113000,%ebx
801014ad:	75 e1                	jne    80101490 <iinit+0x20>
  readsb(dev, &sb);
801014af:	83 ec 08             	sub    $0x8,%esp
801014b2:	68 80 13 11 80       	push   $0x80111380
801014b7:	ff 75 08             	pushl  0x8(%ebp)
801014ba:	e8 f1 fe ff ff       	call   801013b0 <readsb>
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
801014bf:	ff 35 98 13 11 80    	pushl  0x80111398
801014c5:	ff 35 94 13 11 80    	pushl  0x80111394
801014cb:	ff 35 90 13 11 80    	pushl  0x80111390
801014d1:	ff 35 8c 13 11 80    	pushl  0x8011138c
801014d7:	ff 35 88 13 11 80    	pushl  0x80111388
801014dd:	ff 35 84 13 11 80    	pushl  0x80111384
801014e3:	ff 35 80 13 11 80    	pushl  0x80111380
801014e9:	68 b8 72 10 80       	push   $0x801072b8
801014ee:	e8 6d f1 ff ff       	call   80100660 <cprintf>
}
801014f3:	83 c4 30             	add    $0x30,%esp
801014f6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801014f9:	c9                   	leave  
801014fa:	c3                   	ret    
801014fb:	90                   	nop
801014fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101500 <ialloc>:
{
80101500:	55                   	push   %ebp
80101501:	89 e5                	mov    %esp,%ebp
80101503:	57                   	push   %edi
80101504:	56                   	push   %esi
80101505:	53                   	push   %ebx
80101506:	83 ec 1c             	sub    $0x1c,%esp
  for(inum = 1; inum < sb.ninodes; inum++){
80101509:	83 3d 88 13 11 80 01 	cmpl   $0x1,0x80111388
{
80101510:	8b 45 0c             	mov    0xc(%ebp),%eax
80101513:	8b 75 08             	mov    0x8(%ebp),%esi
80101516:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(inum = 1; inum < sb.ninodes; inum++){
80101519:	0f 86 91 00 00 00    	jbe    801015b0 <ialloc+0xb0>
8010151f:	bb 01 00 00 00       	mov    $0x1,%ebx
80101524:	eb 21                	jmp    80101547 <ialloc+0x47>
80101526:	8d 76 00             	lea    0x0(%esi),%esi
80101529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    brelse(bp);
80101530:	83 ec 0c             	sub    $0xc,%esp
  for(inum = 1; inum < sb.ninodes; inum++){
80101533:	83 c3 01             	add    $0x1,%ebx
    brelse(bp);
80101536:	57                   	push   %edi
80101537:	e8 a4 ec ff ff       	call   801001e0 <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
8010153c:	83 c4 10             	add    $0x10,%esp
8010153f:	39 1d 88 13 11 80    	cmp    %ebx,0x80111388
80101545:	76 69                	jbe    801015b0 <ialloc+0xb0>
    bp = bread(dev, IBLOCK(inum, sb));
80101547:	89 d8                	mov    %ebx,%eax
80101549:	83 ec 08             	sub    $0x8,%esp
8010154c:	c1 e8 03             	shr    $0x3,%eax
8010154f:	03 05 94 13 11 80    	add    0x80111394,%eax
80101555:	50                   	push   %eax
80101556:	56                   	push   %esi
80101557:	e8 74 eb ff ff       	call   801000d0 <bread>
8010155c:	89 c7                	mov    %eax,%edi
    dip = (struct dinode*)bp->data + inum%IPB;
8010155e:	89 d8                	mov    %ebx,%eax
    if(dip->type == 0){  // a free inode
80101560:	83 c4 10             	add    $0x10,%esp
    dip = (struct dinode*)bp->data + inum%IPB;
80101563:	83 e0 07             	and    $0x7,%eax
80101566:	c1 e0 06             	shl    $0x6,%eax
80101569:	8d 4c 07 5c          	lea    0x5c(%edi,%eax,1),%ecx
    if(dip->type == 0){  // a free inode
8010156d:	66 83 39 00          	cmpw   $0x0,(%ecx)
80101571:	75 bd                	jne    80101530 <ialloc+0x30>
      memset(dip, 0, sizeof(*dip));
80101573:	83 ec 04             	sub    $0x4,%esp
80101576:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101579:	6a 40                	push   $0x40
8010157b:	6a 00                	push   $0x0
8010157d:	51                   	push   %ecx
8010157e:	e8 3d 2f 00 00       	call   801044c0 <memset>
      dip->type = type;
80101583:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
80101587:	8b 4d e0             	mov    -0x20(%ebp),%ecx
8010158a:	66 89 01             	mov    %ax,(%ecx)
      log_write(bp);   // mark it allocated on the disk
8010158d:	89 3c 24             	mov    %edi,(%esp)
80101590:	e8 bb 17 00 00       	call   80102d50 <log_write>
      brelse(bp);
80101595:	89 3c 24             	mov    %edi,(%esp)
80101598:	e8 43 ec ff ff       	call   801001e0 <brelse>
      return iget(dev, inum);
8010159d:	83 c4 10             	add    $0x10,%esp
}
801015a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return iget(dev, inum);
801015a3:	89 da                	mov    %ebx,%edx
801015a5:	89 f0                	mov    %esi,%eax
}
801015a7:	5b                   	pop    %ebx
801015a8:	5e                   	pop    %esi
801015a9:	5f                   	pop    %edi
801015aa:	5d                   	pop    %ebp
      return iget(dev, inum);
801015ab:	e9 60 fc ff ff       	jmp    80101210 <iget>
  panic("ialloc: no inodes");
801015b0:	83 ec 0c             	sub    $0xc,%esp
801015b3:	68 58 72 10 80       	push   $0x80107258
801015b8:	e8 b3 ed ff ff       	call   80100370 <panic>
801015bd:	8d 76 00             	lea    0x0(%esi),%esi

801015c0 <iupdate>:
{
801015c0:	55                   	push   %ebp
801015c1:	89 e5                	mov    %esp,%ebp
801015c3:	56                   	push   %esi
801015c4:	53                   	push   %ebx
801015c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801015c8:	83 ec 08             	sub    $0x8,%esp
801015cb:	8b 43 04             	mov    0x4(%ebx),%eax
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801015ce:	83 c3 5c             	add    $0x5c,%ebx
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801015d1:	c1 e8 03             	shr    $0x3,%eax
801015d4:	03 05 94 13 11 80    	add    0x80111394,%eax
801015da:	50                   	push   %eax
801015db:	ff 73 a4             	pushl  -0x5c(%ebx)
801015de:	e8 ed ea ff ff       	call   801000d0 <bread>
801015e3:	89 c6                	mov    %eax,%esi
  dip = (struct dinode*)bp->data + ip->inum%IPB;
801015e5:	8b 43 a8             	mov    -0x58(%ebx),%eax
  dip->type = ip->type;
801015e8:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801015ec:	83 c4 0c             	add    $0xc,%esp
  dip = (struct dinode*)bp->data + ip->inum%IPB;
801015ef:	83 e0 07             	and    $0x7,%eax
801015f2:	c1 e0 06             	shl    $0x6,%eax
801015f5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
  dip->type = ip->type;
801015f9:	66 89 10             	mov    %dx,(%eax)
  dip->major = ip->major;
801015fc:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
80101600:	83 c0 0c             	add    $0xc,%eax
  dip->major = ip->major;
80101603:	66 89 50 f6          	mov    %dx,-0xa(%eax)
  dip->minor = ip->minor;
80101607:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
8010160b:	66 89 50 f8          	mov    %dx,-0x8(%eax)
  dip->nlink = ip->nlink;
8010160f:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
80101613:	66 89 50 fa          	mov    %dx,-0x6(%eax)
  dip->size = ip->size;
80101617:	8b 53 fc             	mov    -0x4(%ebx),%edx
8010161a:	89 50 fc             	mov    %edx,-0x4(%eax)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010161d:	6a 34                	push   $0x34
8010161f:	53                   	push   %ebx
80101620:	50                   	push   %eax
80101621:	e8 4a 2f 00 00       	call   80104570 <memmove>
  log_write(bp);
80101626:	89 34 24             	mov    %esi,(%esp)
80101629:	e8 22 17 00 00       	call   80102d50 <log_write>
  brelse(bp);
8010162e:	89 75 08             	mov    %esi,0x8(%ebp)
80101631:	83 c4 10             	add    $0x10,%esp
}
80101634:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101637:	5b                   	pop    %ebx
80101638:	5e                   	pop    %esi
80101639:	5d                   	pop    %ebp
  brelse(bp);
8010163a:	e9 a1 eb ff ff       	jmp    801001e0 <brelse>
8010163f:	90                   	nop

80101640 <idup>:
{
80101640:	55                   	push   %ebp
80101641:	89 e5                	mov    %esp,%ebp
80101643:	53                   	push   %ebx
80101644:	83 ec 10             	sub    $0x10,%esp
80101647:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&icache.lock);
8010164a:	68 a0 13 11 80       	push   $0x801113a0
8010164f:	e8 6c 2d 00 00       	call   801043c0 <acquire>
  ip->ref++;
80101654:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
80101658:	c7 04 24 a0 13 11 80 	movl   $0x801113a0,(%esp)
8010165f:	e8 0c 2e 00 00       	call   80104470 <release>
}
80101664:	89 d8                	mov    %ebx,%eax
80101666:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101669:	c9                   	leave  
8010166a:	c3                   	ret    
8010166b:	90                   	nop
8010166c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101670 <ilock>:
{
80101670:	55                   	push   %ebp
80101671:	89 e5                	mov    %esp,%ebp
80101673:	56                   	push   %esi
80101674:	53                   	push   %ebx
80101675:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || ip->ref < 1)
80101678:	85 db                	test   %ebx,%ebx
8010167a:	0f 84 b7 00 00 00    	je     80101737 <ilock+0xc7>
80101680:	8b 53 08             	mov    0x8(%ebx),%edx
80101683:	85 d2                	test   %edx,%edx
80101685:	0f 8e ac 00 00 00    	jle    80101737 <ilock+0xc7>
  acquiresleep(&ip->lock);
8010168b:	8d 43 0c             	lea    0xc(%ebx),%eax
8010168e:	83 ec 0c             	sub    $0xc,%esp
80101691:	50                   	push   %eax
80101692:	e8 d9 2a 00 00       	call   80104170 <acquiresleep>
  if(ip->valid == 0){
80101697:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010169a:	83 c4 10             	add    $0x10,%esp
8010169d:	85 c0                	test   %eax,%eax
8010169f:	74 0f                	je     801016b0 <ilock+0x40>
}
801016a1:	8d 65 f8             	lea    -0x8(%ebp),%esp
801016a4:	5b                   	pop    %ebx
801016a5:	5e                   	pop    %esi
801016a6:	5d                   	pop    %ebp
801016a7:	c3                   	ret    
801016a8:	90                   	nop
801016a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801016b0:	8b 43 04             	mov    0x4(%ebx),%eax
801016b3:	83 ec 08             	sub    $0x8,%esp
801016b6:	c1 e8 03             	shr    $0x3,%eax
801016b9:	03 05 94 13 11 80    	add    0x80111394,%eax
801016bf:	50                   	push   %eax
801016c0:	ff 33                	pushl  (%ebx)
801016c2:	e8 09 ea ff ff       	call   801000d0 <bread>
801016c7:	89 c6                	mov    %eax,%esi
    dip = (struct dinode*)bp->data + ip->inum%IPB;
801016c9:	8b 43 04             	mov    0x4(%ebx),%eax
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801016cc:	83 c4 0c             	add    $0xc,%esp
    dip = (struct dinode*)bp->data + ip->inum%IPB;
801016cf:	83 e0 07             	and    $0x7,%eax
801016d2:	c1 e0 06             	shl    $0x6,%eax
801016d5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
    ip->type = dip->type;
801016d9:	0f b7 10             	movzwl (%eax),%edx
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801016dc:	83 c0 0c             	add    $0xc,%eax
    ip->type = dip->type;
801016df:	66 89 53 50          	mov    %dx,0x50(%ebx)
    ip->major = dip->major;
801016e3:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
801016e7:	66 89 53 52          	mov    %dx,0x52(%ebx)
    ip->minor = dip->minor;
801016eb:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
801016ef:	66 89 53 54          	mov    %dx,0x54(%ebx)
    ip->nlink = dip->nlink;
801016f3:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
801016f7:	66 89 53 56          	mov    %dx,0x56(%ebx)
    ip->size = dip->size;
801016fb:	8b 50 fc             	mov    -0x4(%eax),%edx
801016fe:	89 53 58             	mov    %edx,0x58(%ebx)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
80101701:	6a 34                	push   $0x34
80101703:	50                   	push   %eax
80101704:	8d 43 5c             	lea    0x5c(%ebx),%eax
80101707:	50                   	push   %eax
80101708:	e8 63 2e 00 00       	call   80104570 <memmove>
    brelse(bp);
8010170d:	89 34 24             	mov    %esi,(%esp)
80101710:	e8 cb ea ff ff       	call   801001e0 <brelse>
    if(ip->type == 0)
80101715:	83 c4 10             	add    $0x10,%esp
80101718:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
    ip->valid = 1;
8010171d:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
    if(ip->type == 0)
80101724:	0f 85 77 ff ff ff    	jne    801016a1 <ilock+0x31>
      panic("ilock: no type");
8010172a:	83 ec 0c             	sub    $0xc,%esp
8010172d:	68 70 72 10 80       	push   $0x80107270
80101732:	e8 39 ec ff ff       	call   80100370 <panic>
    panic("ilock");
80101737:	83 ec 0c             	sub    $0xc,%esp
8010173a:	68 6a 72 10 80       	push   $0x8010726a
8010173f:	e8 2c ec ff ff       	call   80100370 <panic>
80101744:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010174a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101750 <iunlock>:
{
80101750:	55                   	push   %ebp
80101751:	89 e5                	mov    %esp,%ebp
80101753:	56                   	push   %esi
80101754:	53                   	push   %ebx
80101755:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101758:	85 db                	test   %ebx,%ebx
8010175a:	74 28                	je     80101784 <iunlock+0x34>
8010175c:	8d 73 0c             	lea    0xc(%ebx),%esi
8010175f:	83 ec 0c             	sub    $0xc,%esp
80101762:	56                   	push   %esi
80101763:	e8 a8 2a 00 00       	call   80104210 <holdingsleep>
80101768:	83 c4 10             	add    $0x10,%esp
8010176b:	85 c0                	test   %eax,%eax
8010176d:	74 15                	je     80101784 <iunlock+0x34>
8010176f:	8b 43 08             	mov    0x8(%ebx),%eax
80101772:	85 c0                	test   %eax,%eax
80101774:	7e 0e                	jle    80101784 <iunlock+0x34>
  releasesleep(&ip->lock);
80101776:	89 75 08             	mov    %esi,0x8(%ebp)
}
80101779:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010177c:	5b                   	pop    %ebx
8010177d:	5e                   	pop    %esi
8010177e:	5d                   	pop    %ebp
  releasesleep(&ip->lock);
8010177f:	e9 4c 2a 00 00       	jmp    801041d0 <releasesleep>
    panic("iunlock");
80101784:	83 ec 0c             	sub    $0xc,%esp
80101787:	68 7f 72 10 80       	push   $0x8010727f
8010178c:	e8 df eb ff ff       	call   80100370 <panic>
80101791:	eb 0d                	jmp    801017a0 <iput>
80101793:	90                   	nop
80101794:	90                   	nop
80101795:	90                   	nop
80101796:	90                   	nop
80101797:	90                   	nop
80101798:	90                   	nop
80101799:	90                   	nop
8010179a:	90                   	nop
8010179b:	90                   	nop
8010179c:	90                   	nop
8010179d:	90                   	nop
8010179e:	90                   	nop
8010179f:	90                   	nop

801017a0 <iput>:
{
801017a0:	55                   	push   %ebp
801017a1:	89 e5                	mov    %esp,%ebp
801017a3:	57                   	push   %edi
801017a4:	56                   	push   %esi
801017a5:	53                   	push   %ebx
801017a6:	83 ec 28             	sub    $0x28,%esp
801017a9:	8b 75 08             	mov    0x8(%ebp),%esi
  acquiresleep(&ip->lock);
801017ac:	8d 7e 0c             	lea    0xc(%esi),%edi
801017af:	57                   	push   %edi
801017b0:	e8 bb 29 00 00       	call   80104170 <acquiresleep>
  if(ip->valid && ip->nlink == 0){
801017b5:	8b 56 4c             	mov    0x4c(%esi),%edx
801017b8:	83 c4 10             	add    $0x10,%esp
801017bb:	85 d2                	test   %edx,%edx
801017bd:	74 07                	je     801017c6 <iput+0x26>
801017bf:	66 83 7e 56 00       	cmpw   $0x0,0x56(%esi)
801017c4:	74 32                	je     801017f8 <iput+0x58>
  releasesleep(&ip->lock);
801017c6:	83 ec 0c             	sub    $0xc,%esp
801017c9:	57                   	push   %edi
801017ca:	e8 01 2a 00 00       	call   801041d0 <releasesleep>
  acquire(&icache.lock);
801017cf:	c7 04 24 a0 13 11 80 	movl   $0x801113a0,(%esp)
801017d6:	e8 e5 2b 00 00       	call   801043c0 <acquire>
  ip->ref--;
801017db:	83 6e 08 01          	subl   $0x1,0x8(%esi)
  release(&icache.lock);
801017df:	83 c4 10             	add    $0x10,%esp
801017e2:	c7 45 08 a0 13 11 80 	movl   $0x801113a0,0x8(%ebp)
}
801017e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801017ec:	5b                   	pop    %ebx
801017ed:	5e                   	pop    %esi
801017ee:	5f                   	pop    %edi
801017ef:	5d                   	pop    %ebp
  release(&icache.lock);
801017f0:	e9 7b 2c 00 00       	jmp    80104470 <release>
801017f5:	8d 76 00             	lea    0x0(%esi),%esi
    acquire(&icache.lock);
801017f8:	83 ec 0c             	sub    $0xc,%esp
801017fb:	68 a0 13 11 80       	push   $0x801113a0
80101800:	e8 bb 2b 00 00       	call   801043c0 <acquire>
    int r = ip->ref;
80101805:	8b 5e 08             	mov    0x8(%esi),%ebx
    release(&icache.lock);
80101808:	c7 04 24 a0 13 11 80 	movl   $0x801113a0,(%esp)
8010180f:	e8 5c 2c 00 00       	call   80104470 <release>
    if(r == 1){
80101814:	83 c4 10             	add    $0x10,%esp
80101817:	83 fb 01             	cmp    $0x1,%ebx
8010181a:	75 aa                	jne    801017c6 <iput+0x26>
8010181c:	8d 8e 8c 00 00 00    	lea    0x8c(%esi),%ecx
80101822:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101825:	8d 5e 5c             	lea    0x5c(%esi),%ebx
80101828:	89 cf                	mov    %ecx,%edi
8010182a:	eb 0b                	jmp    80101837 <iput+0x97>
8010182c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101830:	83 c3 04             	add    $0x4,%ebx
{
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
80101833:	39 fb                	cmp    %edi,%ebx
80101835:	74 19                	je     80101850 <iput+0xb0>
    if(ip->addrs[i]){
80101837:	8b 13                	mov    (%ebx),%edx
80101839:	85 d2                	test   %edx,%edx
8010183b:	74 f3                	je     80101830 <iput+0x90>
      bfree(ip->dev, ip->addrs[i]);
8010183d:	8b 06                	mov    (%esi),%eax
8010183f:	e8 ac fb ff ff       	call   801013f0 <bfree>
      ip->addrs[i] = 0;
80101844:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010184a:	eb e4                	jmp    80101830 <iput+0x90>
8010184c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  if(ip->addrs[NDIRECT]){
80101850:	8b 86 8c 00 00 00    	mov    0x8c(%esi),%eax
80101856:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101859:	85 c0                	test   %eax,%eax
8010185b:	75 33                	jne    80101890 <iput+0xf0>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
  iupdate(ip);
8010185d:	83 ec 0c             	sub    $0xc,%esp
  ip->size = 0;
80101860:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
  iupdate(ip);
80101867:	56                   	push   %esi
80101868:	e8 53 fd ff ff       	call   801015c0 <iupdate>
      ip->type = 0;
8010186d:	31 c0                	xor    %eax,%eax
8010186f:	66 89 46 50          	mov    %ax,0x50(%esi)
      iupdate(ip);
80101873:	89 34 24             	mov    %esi,(%esp)
80101876:	e8 45 fd ff ff       	call   801015c0 <iupdate>
      ip->valid = 0;
8010187b:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
80101882:	83 c4 10             	add    $0x10,%esp
80101885:	e9 3c ff ff ff       	jmp    801017c6 <iput+0x26>
8010188a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
80101890:	83 ec 08             	sub    $0x8,%esp
80101893:	50                   	push   %eax
80101894:	ff 36                	pushl  (%esi)
80101896:	e8 35 e8 ff ff       	call   801000d0 <bread>
8010189b:	8d 88 5c 02 00 00    	lea    0x25c(%eax),%ecx
801018a1:	89 7d e0             	mov    %edi,-0x20(%ebp)
801018a4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    a = (uint*)bp->data;
801018a7:	8d 58 5c             	lea    0x5c(%eax),%ebx
801018aa:	83 c4 10             	add    $0x10,%esp
801018ad:	89 cf                	mov    %ecx,%edi
801018af:	eb 0e                	jmp    801018bf <iput+0x11f>
801018b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801018b8:	83 c3 04             	add    $0x4,%ebx
    for(j = 0; j < NINDIRECT; j++){
801018bb:	39 fb                	cmp    %edi,%ebx
801018bd:	74 0f                	je     801018ce <iput+0x12e>
      if(a[j])
801018bf:	8b 13                	mov    (%ebx),%edx
801018c1:	85 d2                	test   %edx,%edx
801018c3:	74 f3                	je     801018b8 <iput+0x118>
        bfree(ip->dev, a[j]);
801018c5:	8b 06                	mov    (%esi),%eax
801018c7:	e8 24 fb ff ff       	call   801013f0 <bfree>
801018cc:	eb ea                	jmp    801018b8 <iput+0x118>
    brelse(bp);
801018ce:	83 ec 0c             	sub    $0xc,%esp
801018d1:	ff 75 e4             	pushl  -0x1c(%ebp)
801018d4:	8b 7d e0             	mov    -0x20(%ebp),%edi
801018d7:	e8 04 e9 ff ff       	call   801001e0 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
801018dc:	8b 96 8c 00 00 00    	mov    0x8c(%esi),%edx
801018e2:	8b 06                	mov    (%esi),%eax
801018e4:	e8 07 fb ff ff       	call   801013f0 <bfree>
    ip->addrs[NDIRECT] = 0;
801018e9:	c7 86 8c 00 00 00 00 	movl   $0x0,0x8c(%esi)
801018f0:	00 00 00 
801018f3:	83 c4 10             	add    $0x10,%esp
801018f6:	e9 62 ff ff ff       	jmp    8010185d <iput+0xbd>
801018fb:	90                   	nop
801018fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101900 <iunlockput>:
{
80101900:	55                   	push   %ebp
80101901:	89 e5                	mov    %esp,%ebp
80101903:	53                   	push   %ebx
80101904:	83 ec 10             	sub    $0x10,%esp
80101907:	8b 5d 08             	mov    0x8(%ebp),%ebx
  iunlock(ip);
8010190a:	53                   	push   %ebx
8010190b:	e8 40 fe ff ff       	call   80101750 <iunlock>
  iput(ip);
80101910:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101913:	83 c4 10             	add    $0x10,%esp
}
80101916:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101919:	c9                   	leave  
  iput(ip);
8010191a:	e9 81 fe ff ff       	jmp    801017a0 <iput>
8010191f:	90                   	nop

80101920 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
80101920:	55                   	push   %ebp
80101921:	89 e5                	mov    %esp,%ebp
80101923:	8b 55 08             	mov    0x8(%ebp),%edx
80101926:	8b 45 0c             	mov    0xc(%ebp),%eax
  st->dev = ip->dev;
80101929:	8b 0a                	mov    (%edx),%ecx
8010192b:	89 48 04             	mov    %ecx,0x4(%eax)
  st->ino = ip->inum;
8010192e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101931:	89 48 08             	mov    %ecx,0x8(%eax)
  st->type = ip->type;
80101934:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101938:	66 89 08             	mov    %cx,(%eax)
  st->nlink = ip->nlink;
8010193b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010193f:	66 89 48 0c          	mov    %cx,0xc(%eax)
  st->size = ip->size;
80101943:	8b 52 58             	mov    0x58(%edx),%edx
80101946:	89 50 10             	mov    %edx,0x10(%eax)
}
80101949:	5d                   	pop    %ebp
8010194a:	c3                   	ret    
8010194b:	90                   	nop
8010194c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101950 <readi>:
//PAGEBREAK!
// Read data from inode.
// Caller must hold ip->lock.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101950:	55                   	push   %ebp
80101951:	89 e5                	mov    %esp,%ebp
80101953:	57                   	push   %edi
80101954:	56                   	push   %esi
80101955:	53                   	push   %ebx
80101956:	83 ec 1c             	sub    $0x1c,%esp
80101959:	8b 45 08             	mov    0x8(%ebp),%eax
8010195c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010195f:	8b 75 10             	mov    0x10(%ebp),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101962:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
{
80101967:	89 7d e0             	mov    %edi,-0x20(%ebp)
8010196a:	8b 7d 14             	mov    0x14(%ebp),%edi
8010196d:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101970:	89 7d e4             	mov    %edi,-0x1c(%ebp)
  if(ip->type == T_DEV){
80101973:	0f 84 a7 00 00 00    	je     80101a20 <readi+0xd0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  }

  if(off > ip->size || off + n < off)
80101979:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010197c:	8b 40 58             	mov    0x58(%eax),%eax
8010197f:	39 f0                	cmp    %esi,%eax
80101981:	0f 82 ba 00 00 00    	jb     80101a41 <readi+0xf1>
80101987:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010198a:	89 f9                	mov    %edi,%ecx
8010198c:	01 f1                	add    %esi,%ecx
8010198e:	0f 82 ad 00 00 00    	jb     80101a41 <readi+0xf1>
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
80101994:	89 c2                	mov    %eax,%edx
80101996:	29 f2                	sub    %esi,%edx
80101998:	39 c8                	cmp    %ecx,%eax
8010199a:	0f 43 d7             	cmovae %edi,%edx

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
8010199d:	31 ff                	xor    %edi,%edi
8010199f:	85 d2                	test   %edx,%edx
    n = ip->size - off;
801019a1:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019a4:	74 6c                	je     80101a12 <readi+0xc2>
801019a6:	8d 76 00             	lea    0x0(%esi),%esi
801019a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801019b0:	8b 5d d8             	mov    -0x28(%ebp),%ebx
801019b3:	89 f2                	mov    %esi,%edx
801019b5:	c1 ea 09             	shr    $0x9,%edx
801019b8:	89 d8                	mov    %ebx,%eax
801019ba:	e8 21 f9 ff ff       	call   801012e0 <bmap>
801019bf:	83 ec 08             	sub    $0x8,%esp
801019c2:	50                   	push   %eax
801019c3:	ff 33                	pushl  (%ebx)
801019c5:	e8 06 e7 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
801019ca:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801019cd:	89 c2                	mov    %eax,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
801019cf:	89 f0                	mov    %esi,%eax
801019d1:	25 ff 01 00 00       	and    $0x1ff,%eax
801019d6:	b9 00 02 00 00       	mov    $0x200,%ecx
801019db:	83 c4 0c             	add    $0xc,%esp
801019de:	29 c1                	sub    %eax,%ecx
    memmove(dst, bp->data + off%BSIZE, m);
801019e0:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
801019e4:	89 55 dc             	mov    %edx,-0x24(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
801019e7:	29 fb                	sub    %edi,%ebx
801019e9:	39 d9                	cmp    %ebx,%ecx
801019eb:	0f 46 d9             	cmovbe %ecx,%ebx
    memmove(dst, bp->data + off%BSIZE, m);
801019ee:	53                   	push   %ebx
801019ef:	50                   	push   %eax
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019f0:	01 df                	add    %ebx,%edi
    memmove(dst, bp->data + off%BSIZE, m);
801019f2:	ff 75 e0             	pushl  -0x20(%ebp)
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019f5:	01 de                	add    %ebx,%esi
    memmove(dst, bp->data + off%BSIZE, m);
801019f7:	e8 74 2b 00 00       	call   80104570 <memmove>
    brelse(bp);
801019fc:	8b 55 dc             	mov    -0x24(%ebp),%edx
801019ff:	89 14 24             	mov    %edx,(%esp)
80101a02:	e8 d9 e7 ff ff       	call   801001e0 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101a07:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101a0a:	83 c4 10             	add    $0x10,%esp
80101a0d:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101a10:	77 9e                	ja     801019b0 <readi+0x60>
  }
  return n;
80101a12:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
80101a15:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a18:	5b                   	pop    %ebx
80101a19:	5e                   	pop    %esi
80101a1a:	5f                   	pop    %edi
80101a1b:	5d                   	pop    %ebp
80101a1c:	c3                   	ret    
80101a1d:	8d 76 00             	lea    0x0(%esi),%esi
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
80101a20:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101a24:	66 83 f8 09          	cmp    $0x9,%ax
80101a28:	77 17                	ja     80101a41 <readi+0xf1>
80101a2a:	8b 04 c5 20 13 11 80 	mov    -0x7feeece0(,%eax,8),%eax
80101a31:	85 c0                	test   %eax,%eax
80101a33:	74 0c                	je     80101a41 <readi+0xf1>
    return devsw[ip->major].read(ip, dst, n);
80101a35:	89 7d 10             	mov    %edi,0x10(%ebp)
}
80101a38:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a3b:	5b                   	pop    %ebx
80101a3c:	5e                   	pop    %esi
80101a3d:	5f                   	pop    %edi
80101a3e:	5d                   	pop    %ebp
    return devsw[ip->major].read(ip, dst, n);
80101a3f:	ff e0                	jmp    *%eax
      return -1;
80101a41:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a46:	eb cd                	jmp    80101a15 <readi+0xc5>
80101a48:	90                   	nop
80101a49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101a50 <writei>:
// PAGEBREAK!
// Write data to inode.
// Caller must hold ip->lock.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101a50:	55                   	push   %ebp
80101a51:	89 e5                	mov    %esp,%ebp
80101a53:	57                   	push   %edi
80101a54:	56                   	push   %esi
80101a55:	53                   	push   %ebx
80101a56:	83 ec 1c             	sub    $0x1c,%esp
80101a59:	8b 45 08             	mov    0x8(%ebp),%eax
80101a5c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101a5f:	8b 4d 14             	mov    0x14(%ebp),%ecx
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a62:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
{
80101a67:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101a6a:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101a6d:	8b 75 10             	mov    0x10(%ebp),%esi
80101a70:	89 4d e0             	mov    %ecx,-0x20(%ebp)
  if(ip->type == T_DEV){
80101a73:	0f 84 b7 00 00 00    	je     80101b30 <writei+0xe0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
  }

  if(off > ip->size || off + n < off)
80101a79:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a7c:	39 70 58             	cmp    %esi,0x58(%eax)
80101a7f:	0f 82 eb 00 00 00    	jb     80101b70 <writei+0x120>
    return -1;
  if(off + n > MAXFILE*BSIZE)
80101a85:	8b 4d e0             	mov    -0x20(%ebp),%ecx
80101a88:	89 c8                	mov    %ecx,%eax
80101a8a:	01 f0                	add    %esi,%eax
80101a8c:	0f 82 de 00 00 00    	jb     80101b70 <writei+0x120>
80101a92:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101a97:	0f 87 d3 00 00 00    	ja     80101b70 <writei+0x120>
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101a9d:	85 c9                	test   %ecx,%ecx
80101a9f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101aa6:	74 79                	je     80101b21 <writei+0xd1>
80101aa8:	90                   	nop
80101aa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101ab0:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101ab3:	89 f2                	mov    %esi,%edx
80101ab5:	c1 ea 09             	shr    $0x9,%edx
80101ab8:	89 f8                	mov    %edi,%eax
80101aba:	e8 21 f8 ff ff       	call   801012e0 <bmap>
80101abf:	83 ec 08             	sub    $0x8,%esp
80101ac2:	50                   	push   %eax
80101ac3:	ff 37                	pushl  (%edi)
80101ac5:	e8 06 e6 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
80101aca:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80101acd:	2b 5d e4             	sub    -0x1c(%ebp),%ebx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101ad0:	89 c7                	mov    %eax,%edi
    m = min(n - tot, BSIZE - off%BSIZE);
80101ad2:	89 f0                	mov    %esi,%eax
80101ad4:	b9 00 02 00 00       	mov    $0x200,%ecx
80101ad9:	83 c4 0c             	add    $0xc,%esp
80101adc:	25 ff 01 00 00       	and    $0x1ff,%eax
80101ae1:	29 c1                	sub    %eax,%ecx
    memmove(bp->data + off%BSIZE, src, m);
80101ae3:	8d 44 07 5c          	lea    0x5c(%edi,%eax,1),%eax
    m = min(n - tot, BSIZE - off%BSIZE);
80101ae7:	39 d9                	cmp    %ebx,%ecx
80101ae9:	0f 46 d9             	cmovbe %ecx,%ebx
    memmove(bp->data + off%BSIZE, src, m);
80101aec:	53                   	push   %ebx
80101aed:	ff 75 dc             	pushl  -0x24(%ebp)
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101af0:	01 de                	add    %ebx,%esi
    memmove(bp->data + off%BSIZE, src, m);
80101af2:	50                   	push   %eax
80101af3:	e8 78 2a 00 00       	call   80104570 <memmove>
    log_write(bp);
80101af8:	89 3c 24             	mov    %edi,(%esp)
80101afb:	e8 50 12 00 00       	call   80102d50 <log_write>
    brelse(bp);
80101b00:	89 3c 24             	mov    %edi,(%esp)
80101b03:	e8 d8 e6 ff ff       	call   801001e0 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101b08:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101b0b:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101b0e:	83 c4 10             	add    $0x10,%esp
80101b11:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101b14:	39 55 e0             	cmp    %edx,-0x20(%ebp)
80101b17:	77 97                	ja     80101ab0 <writei+0x60>
  }

  if(n > 0 && off > ip->size){
80101b19:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b1c:	3b 70 58             	cmp    0x58(%eax),%esi
80101b1f:	77 37                	ja     80101b58 <writei+0x108>
    ip->size = off;
    iupdate(ip);
  }
  return n;
80101b21:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
80101b24:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b27:	5b                   	pop    %ebx
80101b28:	5e                   	pop    %esi
80101b29:	5f                   	pop    %edi
80101b2a:	5d                   	pop    %ebp
80101b2b:	c3                   	ret    
80101b2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
80101b30:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b34:	66 83 f8 09          	cmp    $0x9,%ax
80101b38:	77 36                	ja     80101b70 <writei+0x120>
80101b3a:	8b 04 c5 24 13 11 80 	mov    -0x7feeecdc(,%eax,8),%eax
80101b41:	85 c0                	test   %eax,%eax
80101b43:	74 2b                	je     80101b70 <writei+0x120>
    return devsw[ip->major].write(ip, src, n);
80101b45:	89 4d 10             	mov    %ecx,0x10(%ebp)
}
80101b48:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b4b:	5b                   	pop    %ebx
80101b4c:	5e                   	pop    %esi
80101b4d:	5f                   	pop    %edi
80101b4e:	5d                   	pop    %ebp
    return devsw[ip->major].write(ip, src, n);
80101b4f:	ff e0                	jmp    *%eax
80101b51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    ip->size = off;
80101b58:	8b 45 d8             	mov    -0x28(%ebp),%eax
    iupdate(ip);
80101b5b:	83 ec 0c             	sub    $0xc,%esp
    ip->size = off;
80101b5e:	89 70 58             	mov    %esi,0x58(%eax)
    iupdate(ip);
80101b61:	50                   	push   %eax
80101b62:	e8 59 fa ff ff       	call   801015c0 <iupdate>
80101b67:	83 c4 10             	add    $0x10,%esp
80101b6a:	eb b5                	jmp    80101b21 <writei+0xd1>
80101b6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      return -1;
80101b70:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b75:	eb ad                	jmp    80101b24 <writei+0xd4>
80101b77:	89 f6                	mov    %esi,%esi
80101b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101b80 <namecmp>:
//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
80101b80:	55                   	push   %ebp
80101b81:	89 e5                	mov    %esp,%ebp
80101b83:	83 ec 0c             	sub    $0xc,%esp
  return strncmp(s, t, DIRSIZ);
80101b86:	6a 0e                	push   $0xe
80101b88:	ff 75 0c             	pushl  0xc(%ebp)
80101b8b:	ff 75 08             	pushl  0x8(%ebp)
80101b8e:	e8 4d 2a 00 00       	call   801045e0 <strncmp>
}
80101b93:	c9                   	leave  
80101b94:	c3                   	ret    
80101b95:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ba0 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
80101ba0:	55                   	push   %ebp
80101ba1:	89 e5                	mov    %esp,%ebp
80101ba3:	57                   	push   %edi
80101ba4:	56                   	push   %esi
80101ba5:	53                   	push   %ebx
80101ba6:	83 ec 1c             	sub    $0x1c,%esp
80101ba9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
80101bac:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101bb1:	0f 85 80 00 00 00    	jne    80101c37 <dirlookup+0x97>
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
80101bb7:	8b 53 58             	mov    0x58(%ebx),%edx
80101bba:	31 ff                	xor    %edi,%edi
80101bbc:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101bbf:	85 d2                	test   %edx,%edx
80101bc1:	75 0d                	jne    80101bd0 <dirlookup+0x30>
80101bc3:	eb 5b                	jmp    80101c20 <dirlookup+0x80>
80101bc5:	8d 76 00             	lea    0x0(%esi),%esi
80101bc8:	83 c7 10             	add    $0x10,%edi
80101bcb:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101bce:	76 50                	jbe    80101c20 <dirlookup+0x80>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101bd0:	6a 10                	push   $0x10
80101bd2:	57                   	push   %edi
80101bd3:	56                   	push   %esi
80101bd4:	53                   	push   %ebx
80101bd5:	e8 76 fd ff ff       	call   80101950 <readi>
80101bda:	83 c4 10             	add    $0x10,%esp
80101bdd:	83 f8 10             	cmp    $0x10,%eax
80101be0:	75 48                	jne    80101c2a <dirlookup+0x8a>
      panic("dirlookup read");
    if(de.inum == 0)
80101be2:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101be7:	74 df                	je     80101bc8 <dirlookup+0x28>
  return strncmp(s, t, DIRSIZ);
80101be9:	8d 45 da             	lea    -0x26(%ebp),%eax
80101bec:	83 ec 04             	sub    $0x4,%esp
80101bef:	6a 0e                	push   $0xe
80101bf1:	50                   	push   %eax
80101bf2:	ff 75 0c             	pushl  0xc(%ebp)
80101bf5:	e8 e6 29 00 00       	call   801045e0 <strncmp>
      continue;
    if(namecmp(name, de.name) == 0){
80101bfa:	83 c4 10             	add    $0x10,%esp
80101bfd:	85 c0                	test   %eax,%eax
80101bff:	75 c7                	jne    80101bc8 <dirlookup+0x28>
      // entry matches path element
      if(poff)
80101c01:	8b 45 10             	mov    0x10(%ebp),%eax
80101c04:	85 c0                	test   %eax,%eax
80101c06:	74 05                	je     80101c0d <dirlookup+0x6d>
        *poff = off;
80101c08:	8b 45 10             	mov    0x10(%ebp),%eax
80101c0b:	89 38                	mov    %edi,(%eax)
      inum = de.inum;
80101c0d:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
      return iget(dp->dev, inum);
80101c11:	8b 03                	mov    (%ebx),%eax
80101c13:	e8 f8 f5 ff ff       	call   80101210 <iget>
    }
  }

  return 0;
}
80101c18:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c1b:	5b                   	pop    %ebx
80101c1c:	5e                   	pop    %esi
80101c1d:	5f                   	pop    %edi
80101c1e:	5d                   	pop    %ebp
80101c1f:	c3                   	ret    
80101c20:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80101c23:	31 c0                	xor    %eax,%eax
}
80101c25:	5b                   	pop    %ebx
80101c26:	5e                   	pop    %esi
80101c27:	5f                   	pop    %edi
80101c28:	5d                   	pop    %ebp
80101c29:	c3                   	ret    
      panic("dirlookup read");
80101c2a:	83 ec 0c             	sub    $0xc,%esp
80101c2d:	68 99 72 10 80       	push   $0x80107299
80101c32:	e8 39 e7 ff ff       	call   80100370 <panic>
    panic("dirlookup not DIR");
80101c37:	83 ec 0c             	sub    $0xc,%esp
80101c3a:	68 87 72 10 80       	push   $0x80107287
80101c3f:	e8 2c e7 ff ff       	call   80100370 <panic>
80101c44:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101c4a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101c50 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101c50:	55                   	push   %ebp
80101c51:	89 e5                	mov    %esp,%ebp
80101c53:	57                   	push   %edi
80101c54:	56                   	push   %esi
80101c55:	53                   	push   %ebx
80101c56:	89 cf                	mov    %ecx,%edi
80101c58:	89 c3                	mov    %eax,%ebx
80101c5a:	83 ec 1c             	sub    $0x1c,%esp
  struct inode *ip, *next;

  if(*path == '/')
80101c5d:	80 38 2f             	cmpb   $0x2f,(%eax)
{
80101c60:	89 55 e0             	mov    %edx,-0x20(%ebp)
  if(*path == '/')
80101c63:	0f 84 55 01 00 00    	je     80101dbe <namex+0x16e>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);
80101c69:	e8 32 1b 00 00       	call   801037a0 <myproc>
  acquire(&icache.lock);
80101c6e:	83 ec 0c             	sub    $0xc,%esp
    ip = idup(myproc()->cwd);
80101c71:	8b 70 68             	mov    0x68(%eax),%esi
  acquire(&icache.lock);
80101c74:	68 a0 13 11 80       	push   $0x801113a0
80101c79:	e8 42 27 00 00       	call   801043c0 <acquire>
  ip->ref++;
80101c7e:	83 46 08 01          	addl   $0x1,0x8(%esi)
  release(&icache.lock);
80101c82:	c7 04 24 a0 13 11 80 	movl   $0x801113a0,(%esp)
80101c89:	e8 e2 27 00 00       	call   80104470 <release>
80101c8e:	83 c4 10             	add    $0x10,%esp
80101c91:	eb 08                	jmp    80101c9b <namex+0x4b>
80101c93:	90                   	nop
80101c94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    path++;
80101c98:	83 c3 01             	add    $0x1,%ebx
  while(*path == '/')
80101c9b:	0f b6 03             	movzbl (%ebx),%eax
80101c9e:	3c 2f                	cmp    $0x2f,%al
80101ca0:	74 f6                	je     80101c98 <namex+0x48>
  if(*path == 0)
80101ca2:	84 c0                	test   %al,%al
80101ca4:	0f 84 e3 00 00 00    	je     80101d8d <namex+0x13d>
  while(*path != '/' && *path != 0)
80101caa:	0f b6 03             	movzbl (%ebx),%eax
80101cad:	89 da                	mov    %ebx,%edx
80101caf:	84 c0                	test   %al,%al
80101cb1:	0f 84 ac 00 00 00    	je     80101d63 <namex+0x113>
80101cb7:	3c 2f                	cmp    $0x2f,%al
80101cb9:	75 09                	jne    80101cc4 <namex+0x74>
80101cbb:	e9 a3 00 00 00       	jmp    80101d63 <namex+0x113>
80101cc0:	84 c0                	test   %al,%al
80101cc2:	74 0a                	je     80101cce <namex+0x7e>
    path++;
80101cc4:	83 c2 01             	add    $0x1,%edx
  while(*path != '/' && *path != 0)
80101cc7:	0f b6 02             	movzbl (%edx),%eax
80101cca:	3c 2f                	cmp    $0x2f,%al
80101ccc:	75 f2                	jne    80101cc0 <namex+0x70>
80101cce:	89 d1                	mov    %edx,%ecx
80101cd0:	29 d9                	sub    %ebx,%ecx
  if(len >= DIRSIZ)
80101cd2:	83 f9 0d             	cmp    $0xd,%ecx
80101cd5:	0f 8e 8d 00 00 00    	jle    80101d68 <namex+0x118>
    memmove(name, s, DIRSIZ);
80101cdb:	83 ec 04             	sub    $0x4,%esp
80101cde:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101ce1:	6a 0e                	push   $0xe
80101ce3:	53                   	push   %ebx
80101ce4:	57                   	push   %edi
80101ce5:	e8 86 28 00 00       	call   80104570 <memmove>
    path++;
80101cea:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    memmove(name, s, DIRSIZ);
80101ced:	83 c4 10             	add    $0x10,%esp
    path++;
80101cf0:	89 d3                	mov    %edx,%ebx
  while(*path == '/')
80101cf2:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101cf5:	75 11                	jne    80101d08 <namex+0xb8>
80101cf7:	89 f6                	mov    %esi,%esi
80101cf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    path++;
80101d00:	83 c3 01             	add    $0x1,%ebx
  while(*path == '/')
80101d03:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101d06:	74 f8                	je     80101d00 <namex+0xb0>

  while((path = skipelem(path, name)) != 0){
    ilock(ip);
80101d08:	83 ec 0c             	sub    $0xc,%esp
80101d0b:	56                   	push   %esi
80101d0c:	e8 5f f9 ff ff       	call   80101670 <ilock>
    if(ip->type != T_DIR){
80101d11:	83 c4 10             	add    $0x10,%esp
80101d14:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101d19:	0f 85 7f 00 00 00    	jne    80101d9e <namex+0x14e>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
80101d1f:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101d22:	85 d2                	test   %edx,%edx
80101d24:	74 09                	je     80101d2f <namex+0xdf>
80101d26:	80 3b 00             	cmpb   $0x0,(%ebx)
80101d29:	0f 84 a5 00 00 00    	je     80101dd4 <namex+0x184>
      // Stop one level early.
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
80101d2f:	83 ec 04             	sub    $0x4,%esp
80101d32:	6a 00                	push   $0x0
80101d34:	57                   	push   %edi
80101d35:	56                   	push   %esi
80101d36:	e8 65 fe ff ff       	call   80101ba0 <dirlookup>
80101d3b:	83 c4 10             	add    $0x10,%esp
80101d3e:	85 c0                	test   %eax,%eax
80101d40:	74 5c                	je     80101d9e <namex+0x14e>
  iunlock(ip);
80101d42:	83 ec 0c             	sub    $0xc,%esp
80101d45:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101d48:	56                   	push   %esi
80101d49:	e8 02 fa ff ff       	call   80101750 <iunlock>
  iput(ip);
80101d4e:	89 34 24             	mov    %esi,(%esp)
80101d51:	e8 4a fa ff ff       	call   801017a0 <iput>
80101d56:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101d59:	83 c4 10             	add    $0x10,%esp
80101d5c:	89 c6                	mov    %eax,%esi
80101d5e:	e9 38 ff ff ff       	jmp    80101c9b <namex+0x4b>
  while(*path != '/' && *path != 0)
80101d63:	31 c9                	xor    %ecx,%ecx
80101d65:	8d 76 00             	lea    0x0(%esi),%esi
    memmove(name, s, len);
80101d68:	83 ec 04             	sub    $0x4,%esp
80101d6b:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101d6e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101d71:	51                   	push   %ecx
80101d72:	53                   	push   %ebx
80101d73:	57                   	push   %edi
80101d74:	e8 f7 27 00 00       	call   80104570 <memmove>
    name[len] = 0;
80101d79:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101d7c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101d7f:	83 c4 10             	add    $0x10,%esp
80101d82:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101d86:	89 d3                	mov    %edx,%ebx
80101d88:	e9 65 ff ff ff       	jmp    80101cf2 <namex+0xa2>
      return 0;
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
80101d8d:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101d90:	85 c0                	test   %eax,%eax
80101d92:	75 56                	jne    80101dea <namex+0x19a>
    iput(ip);
    return 0;
  }
  return ip;
}
80101d94:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d97:	89 f0                	mov    %esi,%eax
80101d99:	5b                   	pop    %ebx
80101d9a:	5e                   	pop    %esi
80101d9b:	5f                   	pop    %edi
80101d9c:	5d                   	pop    %ebp
80101d9d:	c3                   	ret    
  iunlock(ip);
80101d9e:	83 ec 0c             	sub    $0xc,%esp
80101da1:	56                   	push   %esi
80101da2:	e8 a9 f9 ff ff       	call   80101750 <iunlock>
  iput(ip);
80101da7:	89 34 24             	mov    %esi,(%esp)
      return 0;
80101daa:	31 f6                	xor    %esi,%esi
  iput(ip);
80101dac:	e8 ef f9 ff ff       	call   801017a0 <iput>
      return 0;
80101db1:	83 c4 10             	add    $0x10,%esp
}
80101db4:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101db7:	89 f0                	mov    %esi,%eax
80101db9:	5b                   	pop    %ebx
80101dba:	5e                   	pop    %esi
80101dbb:	5f                   	pop    %edi
80101dbc:	5d                   	pop    %ebp
80101dbd:	c3                   	ret    
    ip = iget(ROOTDEV, ROOTINO);
80101dbe:	ba 01 00 00 00       	mov    $0x1,%edx
80101dc3:	b8 01 00 00 00       	mov    $0x1,%eax
80101dc8:	e8 43 f4 ff ff       	call   80101210 <iget>
80101dcd:	89 c6                	mov    %eax,%esi
80101dcf:	e9 c7 fe ff ff       	jmp    80101c9b <namex+0x4b>
      iunlock(ip);
80101dd4:	83 ec 0c             	sub    $0xc,%esp
80101dd7:	56                   	push   %esi
80101dd8:	e8 73 f9 ff ff       	call   80101750 <iunlock>
      return ip;
80101ddd:	83 c4 10             	add    $0x10,%esp
}
80101de0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101de3:	89 f0                	mov    %esi,%eax
80101de5:	5b                   	pop    %ebx
80101de6:	5e                   	pop    %esi
80101de7:	5f                   	pop    %edi
80101de8:	5d                   	pop    %ebp
80101de9:	c3                   	ret    
    iput(ip);
80101dea:	83 ec 0c             	sub    $0xc,%esp
80101ded:	56                   	push   %esi
    return 0;
80101dee:	31 f6                	xor    %esi,%esi
    iput(ip);
80101df0:	e8 ab f9 ff ff       	call   801017a0 <iput>
    return 0;
80101df5:	83 c4 10             	add    $0x10,%esp
80101df8:	eb 9a                	jmp    80101d94 <namex+0x144>
80101dfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101e00 <dirlink>:
{
80101e00:	55                   	push   %ebp
80101e01:	89 e5                	mov    %esp,%ebp
80101e03:	57                   	push   %edi
80101e04:	56                   	push   %esi
80101e05:	53                   	push   %ebx
80101e06:	83 ec 20             	sub    $0x20,%esp
80101e09:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((ip = dirlookup(dp, name, 0)) != 0){
80101e0c:	6a 00                	push   $0x0
80101e0e:	ff 75 0c             	pushl  0xc(%ebp)
80101e11:	53                   	push   %ebx
80101e12:	e8 89 fd ff ff       	call   80101ba0 <dirlookup>
80101e17:	83 c4 10             	add    $0x10,%esp
80101e1a:	85 c0                	test   %eax,%eax
80101e1c:	75 67                	jne    80101e85 <dirlink+0x85>
  for(off = 0; off < dp->size; off += sizeof(de)){
80101e1e:	8b 7b 58             	mov    0x58(%ebx),%edi
80101e21:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e24:	85 ff                	test   %edi,%edi
80101e26:	74 29                	je     80101e51 <dirlink+0x51>
80101e28:	31 ff                	xor    %edi,%edi
80101e2a:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e2d:	eb 09                	jmp    80101e38 <dirlink+0x38>
80101e2f:	90                   	nop
80101e30:	83 c7 10             	add    $0x10,%edi
80101e33:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101e36:	76 19                	jbe    80101e51 <dirlink+0x51>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e38:	6a 10                	push   $0x10
80101e3a:	57                   	push   %edi
80101e3b:	56                   	push   %esi
80101e3c:	53                   	push   %ebx
80101e3d:	e8 0e fb ff ff       	call   80101950 <readi>
80101e42:	83 c4 10             	add    $0x10,%esp
80101e45:	83 f8 10             	cmp    $0x10,%eax
80101e48:	75 4e                	jne    80101e98 <dirlink+0x98>
    if(de.inum == 0)
80101e4a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101e4f:	75 df                	jne    80101e30 <dirlink+0x30>
  strncpy(de.name, name, DIRSIZ);
80101e51:	8d 45 da             	lea    -0x26(%ebp),%eax
80101e54:	83 ec 04             	sub    $0x4,%esp
80101e57:	6a 0e                	push   $0xe
80101e59:	ff 75 0c             	pushl  0xc(%ebp)
80101e5c:	50                   	push   %eax
80101e5d:	e8 de 27 00 00       	call   80104640 <strncpy>
  de.inum = inum;
80101e62:	8b 45 10             	mov    0x10(%ebp),%eax
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e65:	6a 10                	push   $0x10
80101e67:	57                   	push   %edi
80101e68:	56                   	push   %esi
80101e69:	53                   	push   %ebx
  de.inum = inum;
80101e6a:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e6e:	e8 dd fb ff ff       	call   80101a50 <writei>
80101e73:	83 c4 20             	add    $0x20,%esp
80101e76:	83 f8 10             	cmp    $0x10,%eax
80101e79:	75 2a                	jne    80101ea5 <dirlink+0xa5>
  return 0;
80101e7b:	31 c0                	xor    %eax,%eax
}
80101e7d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e80:	5b                   	pop    %ebx
80101e81:	5e                   	pop    %esi
80101e82:	5f                   	pop    %edi
80101e83:	5d                   	pop    %ebp
80101e84:	c3                   	ret    
    iput(ip);
80101e85:	83 ec 0c             	sub    $0xc,%esp
80101e88:	50                   	push   %eax
80101e89:	e8 12 f9 ff ff       	call   801017a0 <iput>
    return -1;
80101e8e:	83 c4 10             	add    $0x10,%esp
80101e91:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101e96:	eb e5                	jmp    80101e7d <dirlink+0x7d>
      panic("dirlink read");
80101e98:	83 ec 0c             	sub    $0xc,%esp
80101e9b:	68 a8 72 10 80       	push   $0x801072a8
80101ea0:	e8 cb e4 ff ff       	call   80100370 <panic>
    panic("dirlink");
80101ea5:	83 ec 0c             	sub    $0xc,%esp
80101ea8:	68 be 78 10 80       	push   $0x801078be
80101ead:	e8 be e4 ff ff       	call   80100370 <panic>
80101eb2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101eb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ec0 <namei>:

struct inode*
namei(char *path)
{
80101ec0:	55                   	push   %ebp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101ec1:	31 d2                	xor    %edx,%edx
{
80101ec3:	89 e5                	mov    %esp,%ebp
80101ec5:	83 ec 18             	sub    $0x18,%esp
  return namex(path, 0, name);
80101ec8:	8b 45 08             	mov    0x8(%ebp),%eax
80101ecb:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101ece:	e8 7d fd ff ff       	call   80101c50 <namex>
}
80101ed3:	c9                   	leave  
80101ed4:	c3                   	ret    
80101ed5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101ed9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ee0 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
80101ee0:	55                   	push   %ebp
  return namex(path, 1, name);
80101ee1:	ba 01 00 00 00       	mov    $0x1,%edx
{
80101ee6:	89 e5                	mov    %esp,%ebp
  return namex(path, 1, name);
80101ee8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101eeb:	8b 45 08             	mov    0x8(%ebp),%eax
}
80101eee:	5d                   	pop    %ebp
  return namex(path, 1, name);
80101eef:	e9 5c fd ff ff       	jmp    80101c50 <namex>
80101ef4:	66 90                	xchg   %ax,%ax
80101ef6:	66 90                	xchg   %ax,%ax
80101ef8:	66 90                	xchg   %ax,%ax
80101efa:	66 90                	xchg   %ax,%ax
80101efc:	66 90                	xchg   %ax,%ax
80101efe:	66 90                	xchg   %ax,%ax

80101f00 <idestart>:
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101f00:	55                   	push   %ebp
  if(b == 0)
80101f01:	85 c0                	test   %eax,%eax
{
80101f03:	89 e5                	mov    %esp,%ebp
80101f05:	56                   	push   %esi
80101f06:	53                   	push   %ebx
  if(b == 0)
80101f07:	0f 84 ad 00 00 00    	je     80101fba <idestart+0xba>
    panic("idestart");
  if(b->blockno >= FSSIZE)
80101f0d:	8b 58 08             	mov    0x8(%eax),%ebx
80101f10:	89 c1                	mov    %eax,%ecx
80101f12:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
80101f18:	0f 87 8f 00 00 00    	ja     80101fad <idestart+0xad>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101f1e:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f23:	90                   	nop
80101f24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101f28:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80101f29:	83 e0 c0             	and    $0xffffffc0,%eax
80101f2c:	3c 40                	cmp    $0x40,%al
80101f2e:	75 f8                	jne    80101f28 <idestart+0x28>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80101f30:	31 f6                	xor    %esi,%esi
80101f32:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101f37:	89 f0                	mov    %esi,%eax
80101f39:	ee                   	out    %al,(%dx)
80101f3a:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101f3f:	b8 01 00 00 00       	mov    $0x1,%eax
80101f44:	ee                   	out    %al,(%dx)
80101f45:	ba f3 01 00 00       	mov    $0x1f3,%edx
80101f4a:	89 d8                	mov    %ebx,%eax
80101f4c:	ee                   	out    %al,(%dx)

  idewait(0);
  outb(0x3f6, 0);  // generate interrupt
  outb(0x1f2, sector_per_block);  // number of sectors
  outb(0x1f3, sector & 0xff);
  outb(0x1f4, (sector >> 8) & 0xff);
80101f4d:	89 d8                	mov    %ebx,%eax
80101f4f:	ba f4 01 00 00       	mov    $0x1f4,%edx
80101f54:	c1 f8 08             	sar    $0x8,%eax
80101f57:	ee                   	out    %al,(%dx)
80101f58:	ba f5 01 00 00       	mov    $0x1f5,%edx
80101f5d:	89 f0                	mov    %esi,%eax
80101f5f:	ee                   	out    %al,(%dx)
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
80101f60:	0f b6 41 04          	movzbl 0x4(%ecx),%eax
80101f64:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101f69:	c1 e0 04             	shl    $0x4,%eax
80101f6c:	83 e0 10             	and    $0x10,%eax
80101f6f:	83 c8 e0             	or     $0xffffffe0,%eax
80101f72:	ee                   	out    %al,(%dx)
  if(b->flags & B_DIRTY){
80101f73:	f6 01 04             	testb  $0x4,(%ecx)
80101f76:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f7b:	75 13                	jne    80101f90 <idestart+0x90>
80101f7d:	b8 20 00 00 00       	mov    $0x20,%eax
80101f82:	ee                   	out    %al,(%dx)
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
  } else {
    outb(0x1f7, read_cmd);
  }
}
80101f83:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101f86:	5b                   	pop    %ebx
80101f87:	5e                   	pop    %esi
80101f88:	5d                   	pop    %ebp
80101f89:	c3                   	ret    
80101f8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101f90:	b8 30 00 00 00       	mov    $0x30,%eax
80101f95:	ee                   	out    %al,(%dx)
  asm volatile("cld; rep outsl" :
80101f96:	ba f0 01 00 00       	mov    $0x1f0,%edx
    outsl(0x1f0, b->data, BSIZE/4);
80101f9b:	8d 71 5c             	lea    0x5c(%ecx),%esi
80101f9e:	b9 80 00 00 00       	mov    $0x80,%ecx
80101fa3:	fc                   	cld    
80101fa4:	f3 6f                	rep outsl %ds:(%esi),(%dx)
}
80101fa6:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101fa9:	5b                   	pop    %ebx
80101faa:	5e                   	pop    %esi
80101fab:	5d                   	pop    %ebp
80101fac:	c3                   	ret    
    panic("incorrect blockno");
80101fad:	83 ec 0c             	sub    $0xc,%esp
80101fb0:	68 14 73 10 80       	push   $0x80107314
80101fb5:	e8 b6 e3 ff ff       	call   80100370 <panic>
    panic("idestart");
80101fba:	83 ec 0c             	sub    $0xc,%esp
80101fbd:	68 0b 73 10 80       	push   $0x8010730b
80101fc2:	e8 a9 e3 ff ff       	call   80100370 <panic>
80101fc7:	89 f6                	mov    %esi,%esi
80101fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101fd0 <ideinit>:
{
80101fd0:	55                   	push   %ebp
80101fd1:	89 e5                	mov    %esp,%ebp
80101fd3:	83 ec 10             	sub    $0x10,%esp
  initlock(&idelock, "ide");
80101fd6:	68 26 73 10 80       	push   $0x80107326
80101fdb:	68 80 a5 10 80       	push   $0x8010a580
80101fe0:	e8 7b 22 00 00       	call   80104260 <initlock>
  ioapicenable(IRQ_IDE, ncpu - 1);
80101fe5:	58                   	pop    %eax
80101fe6:	a1 c0 36 11 80       	mov    0x801136c0,%eax
80101feb:	5a                   	pop    %edx
80101fec:	83 e8 01             	sub    $0x1,%eax
80101fef:	50                   	push   %eax
80101ff0:	6a 0e                	push   $0xe
80101ff2:	e8 a9 02 00 00       	call   801022a0 <ioapicenable>
80101ff7:	83 c4 10             	add    $0x10,%esp
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101ffa:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101fff:	90                   	nop
80102000:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102001:	83 e0 c0             	and    $0xffffffc0,%eax
80102004:	3c 40                	cmp    $0x40,%al
80102006:	75 f8                	jne    80102000 <ideinit+0x30>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102008:	ba f6 01 00 00       	mov    $0x1f6,%edx
8010200d:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
80102012:	ee                   	out    %al,(%dx)
80102013:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102018:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010201d:	eb 06                	jmp    80102025 <ideinit+0x55>
8010201f:	90                   	nop
  for(i=0; i<1000; i++){
80102020:	83 e9 01             	sub    $0x1,%ecx
80102023:	74 0f                	je     80102034 <ideinit+0x64>
80102025:	ec                   	in     (%dx),%al
    if(inb(0x1f7) != 0){
80102026:	84 c0                	test   %al,%al
80102028:	74 f6                	je     80102020 <ideinit+0x50>
      havedisk1 = 1;
8010202a:	c7 05 60 a5 10 80 01 	movl   $0x1,0x8010a560
80102031:	00 00 00 
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102034:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102039:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
8010203e:	ee                   	out    %al,(%dx)
}
8010203f:	c9                   	leave  
80102040:	c3                   	ret    
80102041:	eb 0d                	jmp    80102050 <ideintr>
80102043:	90                   	nop
80102044:	90                   	nop
80102045:	90                   	nop
80102046:	90                   	nop
80102047:	90                   	nop
80102048:	90                   	nop
80102049:	90                   	nop
8010204a:	90                   	nop
8010204b:	90                   	nop
8010204c:	90                   	nop
8010204d:	90                   	nop
8010204e:	90                   	nop
8010204f:	90                   	nop

80102050 <ideintr>:

// Interrupt handler.
void
ideintr(void)
{
80102050:	55                   	push   %ebp
80102051:	89 e5                	mov    %esp,%ebp
80102053:	57                   	push   %edi
80102054:	56                   	push   %esi
80102055:	53                   	push   %ebx
80102056:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
80102059:	68 80 a5 10 80       	push   $0x8010a580
8010205e:	e8 5d 23 00 00       	call   801043c0 <acquire>

  if((b = idequeue) == 0){
80102063:	8b 1d 64 a5 10 80    	mov    0x8010a564,%ebx
80102069:	83 c4 10             	add    $0x10,%esp
8010206c:	85 db                	test   %ebx,%ebx
8010206e:	74 34                	je     801020a4 <ideintr+0x54>
    release(&idelock);
    return;
  }
  idequeue = b->qnext;
80102070:	8b 43 58             	mov    0x58(%ebx),%eax
80102073:	a3 64 a5 10 80       	mov    %eax,0x8010a564

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
80102078:	8b 33                	mov    (%ebx),%esi
8010207a:	f7 c6 04 00 00 00    	test   $0x4,%esi
80102080:	74 3e                	je     801020c0 <ideintr+0x70>
    insl(0x1f0, b->data, BSIZE/4);

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
80102082:	83 e6 fb             	and    $0xfffffffb,%esi
  wakeup(b);
80102085:	83 ec 0c             	sub    $0xc,%esp
  b->flags &= ~B_DIRTY;
80102088:	83 ce 02             	or     $0x2,%esi
8010208b:	89 33                	mov    %esi,(%ebx)
  wakeup(b);
8010208d:	53                   	push   %ebx
8010208e:	e8 dd 1e 00 00       	call   80103f70 <wakeup>

  // Start disk on next buf in queue.
  if(idequeue != 0)
80102093:	a1 64 a5 10 80       	mov    0x8010a564,%eax
80102098:	83 c4 10             	add    $0x10,%esp
8010209b:	85 c0                	test   %eax,%eax
8010209d:	74 05                	je     801020a4 <ideintr+0x54>
    idestart(idequeue);
8010209f:	e8 5c fe ff ff       	call   80101f00 <idestart>
    release(&idelock);
801020a4:	83 ec 0c             	sub    $0xc,%esp
801020a7:	68 80 a5 10 80       	push   $0x8010a580
801020ac:	e8 bf 23 00 00       	call   80104470 <release>

  release(&idelock);
}
801020b1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801020b4:	5b                   	pop    %ebx
801020b5:	5e                   	pop    %esi
801020b6:	5f                   	pop    %edi
801020b7:	5d                   	pop    %ebp
801020b8:	c3                   	ret    
801020b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801020c0:	ba f7 01 00 00       	mov    $0x1f7,%edx
801020c5:	8d 76 00             	lea    0x0(%esi),%esi
801020c8:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
801020c9:	89 c1                	mov    %eax,%ecx
801020cb:	83 e1 c0             	and    $0xffffffc0,%ecx
801020ce:	80 f9 40             	cmp    $0x40,%cl
801020d1:	75 f5                	jne    801020c8 <ideintr+0x78>
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
801020d3:	a8 21                	test   $0x21,%al
801020d5:	75 ab                	jne    80102082 <ideintr+0x32>
    insl(0x1f0, b->data, BSIZE/4);
801020d7:	8d 7b 5c             	lea    0x5c(%ebx),%edi
  asm volatile("cld; rep insl" :
801020da:	b9 80 00 00 00       	mov    $0x80,%ecx
801020df:	ba f0 01 00 00       	mov    $0x1f0,%edx
801020e4:	fc                   	cld    
801020e5:	f3 6d                	rep insl (%dx),%es:(%edi)
801020e7:	8b 33                	mov    (%ebx),%esi
801020e9:	eb 97                	jmp    80102082 <ideintr+0x32>
801020eb:	90                   	nop
801020ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801020f0 <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
801020f0:	55                   	push   %ebp
801020f1:	89 e5                	mov    %esp,%ebp
801020f3:	53                   	push   %ebx
801020f4:	83 ec 10             	sub    $0x10,%esp
801020f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf **pp;

  if(!holdingsleep(&b->lock))
801020fa:	8d 43 0c             	lea    0xc(%ebx),%eax
801020fd:	50                   	push   %eax
801020fe:	e8 0d 21 00 00       	call   80104210 <holdingsleep>
80102103:	83 c4 10             	add    $0x10,%esp
80102106:	85 c0                	test   %eax,%eax
80102108:	0f 84 ad 00 00 00    	je     801021bb <iderw+0xcb>
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
8010210e:	8b 03                	mov    (%ebx),%eax
80102110:	83 e0 06             	and    $0x6,%eax
80102113:	83 f8 02             	cmp    $0x2,%eax
80102116:	0f 84 b9 00 00 00    	je     801021d5 <iderw+0xe5>
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
8010211c:	8b 53 04             	mov    0x4(%ebx),%edx
8010211f:	85 d2                	test   %edx,%edx
80102121:	74 0d                	je     80102130 <iderw+0x40>
80102123:	a1 60 a5 10 80       	mov    0x8010a560,%eax
80102128:	85 c0                	test   %eax,%eax
8010212a:	0f 84 98 00 00 00    	je     801021c8 <iderw+0xd8>
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock
80102130:	83 ec 0c             	sub    $0xc,%esp
80102133:	68 80 a5 10 80       	push   $0x8010a580
80102138:	e8 83 22 00 00       	call   801043c0 <acquire>

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010213d:	8b 15 64 a5 10 80    	mov    0x8010a564,%edx
80102143:	83 c4 10             	add    $0x10,%esp
  b->qnext = 0;
80102146:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010214d:	85 d2                	test   %edx,%edx
8010214f:	75 09                	jne    8010215a <iderw+0x6a>
80102151:	eb 58                	jmp    801021ab <iderw+0xbb>
80102153:	90                   	nop
80102154:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102158:	89 c2                	mov    %eax,%edx
8010215a:	8b 42 58             	mov    0x58(%edx),%eax
8010215d:	85 c0                	test   %eax,%eax
8010215f:	75 f7                	jne    80102158 <iderw+0x68>
80102161:	83 c2 58             	add    $0x58,%edx
    ;
  *pp = b;
80102164:	89 1a                	mov    %ebx,(%edx)

  // Start disk if necessary.
  if(idequeue == b)
80102166:	3b 1d 64 a5 10 80    	cmp    0x8010a564,%ebx
8010216c:	74 44                	je     801021b2 <iderw+0xc2>
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
8010216e:	8b 03                	mov    (%ebx),%eax
80102170:	83 e0 06             	and    $0x6,%eax
80102173:	83 f8 02             	cmp    $0x2,%eax
80102176:	74 23                	je     8010219b <iderw+0xab>
80102178:	90                   	nop
80102179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    sleep(b, &idelock);
80102180:	83 ec 08             	sub    $0x8,%esp
80102183:	68 80 a5 10 80       	push   $0x8010a580
80102188:	53                   	push   %ebx
80102189:	e8 22 1c 00 00       	call   80103db0 <sleep>
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
8010218e:	8b 03                	mov    (%ebx),%eax
80102190:	83 c4 10             	add    $0x10,%esp
80102193:	83 e0 06             	and    $0x6,%eax
80102196:	83 f8 02             	cmp    $0x2,%eax
80102199:	75 e5                	jne    80102180 <iderw+0x90>
  }


  release(&idelock);
8010219b:	c7 45 08 80 a5 10 80 	movl   $0x8010a580,0x8(%ebp)
}
801021a2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801021a5:	c9                   	leave  
  release(&idelock);
801021a6:	e9 c5 22 00 00       	jmp    80104470 <release>
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
801021ab:	ba 64 a5 10 80       	mov    $0x8010a564,%edx
801021b0:	eb b2                	jmp    80102164 <iderw+0x74>
    idestart(b);
801021b2:	89 d8                	mov    %ebx,%eax
801021b4:	e8 47 fd ff ff       	call   80101f00 <idestart>
801021b9:	eb b3                	jmp    8010216e <iderw+0x7e>
    panic("iderw: buf not locked");
801021bb:	83 ec 0c             	sub    $0xc,%esp
801021be:	68 2a 73 10 80       	push   $0x8010732a
801021c3:	e8 a8 e1 ff ff       	call   80100370 <panic>
    panic("iderw: ide disk 1 not present");
801021c8:	83 ec 0c             	sub    $0xc,%esp
801021cb:	68 55 73 10 80       	push   $0x80107355
801021d0:	e8 9b e1 ff ff       	call   80100370 <panic>
    panic("iderw: nothing to do");
801021d5:	83 ec 0c             	sub    $0xc,%esp
801021d8:	68 40 73 10 80       	push   $0x80107340
801021dd:	e8 8e e1 ff ff       	call   80100370 <panic>
801021e2:	66 90                	xchg   %ax,%ax
801021e4:	66 90                	xchg   %ax,%ax
801021e6:	66 90                	xchg   %ax,%ax
801021e8:	66 90                	xchg   %ax,%ax
801021ea:	66 90                	xchg   %ax,%ax
801021ec:	66 90                	xchg   %ax,%ax
801021ee:	66 90                	xchg   %ax,%ax

801021f0 <ioapicinit>:
801021f0:	55                   	push   %ebp
801021f1:	c7 05 f4 2f 11 80 00 	movl   $0xfec00000,0x80112ff4
801021f8:	00 c0 fe 
801021fb:	89 e5                	mov    %esp,%ebp
801021fd:	56                   	push   %esi
801021fe:	53                   	push   %ebx
801021ff:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
80102206:	00 00 00 
80102209:	8b 15 f4 2f 11 80    	mov    0x80112ff4,%edx
8010220f:	8b 72 10             	mov    0x10(%edx),%esi
80102212:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
80102218:	8b 0d f4 2f 11 80    	mov    0x80112ff4,%ecx
8010221e:	0f b6 15 20 31 11 80 	movzbl 0x80113120,%edx
80102225:	c1 ee 10             	shr    $0x10,%esi
80102228:	89 f0                	mov    %esi,%eax
8010222a:	0f b6 f0             	movzbl %al,%esi
8010222d:	8b 41 10             	mov    0x10(%ecx),%eax
80102230:	c1 e8 18             	shr    $0x18,%eax
80102233:	39 d0                	cmp    %edx,%eax
80102235:	74 16                	je     8010224d <ioapicinit+0x5d>
80102237:	83 ec 0c             	sub    $0xc,%esp
8010223a:	68 74 73 10 80       	push   $0x80107374
8010223f:	e8 1c e4 ff ff       	call   80100660 <cprintf>
80102244:	8b 0d f4 2f 11 80    	mov    0x80112ff4,%ecx
8010224a:	83 c4 10             	add    $0x10,%esp
8010224d:	83 c6 21             	add    $0x21,%esi
80102250:	ba 10 00 00 00       	mov    $0x10,%edx
80102255:	b8 20 00 00 00       	mov    $0x20,%eax
8010225a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102260:	89 11                	mov    %edx,(%ecx)
80102262:	8b 0d f4 2f 11 80    	mov    0x80112ff4,%ecx
80102268:	89 c3                	mov    %eax,%ebx
8010226a:	81 cb 00 00 01 00    	or     $0x10000,%ebx
80102270:	83 c0 01             	add    $0x1,%eax
80102273:	89 59 10             	mov    %ebx,0x10(%ecx)
80102276:	8d 5a 01             	lea    0x1(%edx),%ebx
80102279:	83 c2 02             	add    $0x2,%edx
8010227c:	39 f0                	cmp    %esi,%eax
8010227e:	89 19                	mov    %ebx,(%ecx)
80102280:	8b 0d f4 2f 11 80    	mov    0x80112ff4,%ecx
80102286:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
8010228d:	75 d1                	jne    80102260 <ioapicinit+0x70>
8010228f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102292:	5b                   	pop    %ebx
80102293:	5e                   	pop    %esi
80102294:	5d                   	pop    %ebp
80102295:	c3                   	ret    
80102296:	8d 76 00             	lea    0x0(%esi),%esi
80102299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801022a0 <ioapicenable>:
801022a0:	55                   	push   %ebp
801022a1:	8b 0d f4 2f 11 80    	mov    0x80112ff4,%ecx
801022a7:	89 e5                	mov    %esp,%ebp
801022a9:	8b 45 08             	mov    0x8(%ebp),%eax
801022ac:	8d 50 20             	lea    0x20(%eax),%edx
801022af:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
801022b3:	89 01                	mov    %eax,(%ecx)
801022b5:	8b 0d f4 2f 11 80    	mov    0x80112ff4,%ecx
801022bb:	83 c0 01             	add    $0x1,%eax
801022be:	89 51 10             	mov    %edx,0x10(%ecx)
801022c1:	8b 55 0c             	mov    0xc(%ebp),%edx
801022c4:	89 01                	mov    %eax,(%ecx)
801022c6:	a1 f4 2f 11 80       	mov    0x80112ff4,%eax
801022cb:	c1 e2 18             	shl    $0x18,%edx
801022ce:	89 50 10             	mov    %edx,0x10(%eax)
801022d1:	5d                   	pop    %ebp
801022d2:	c3                   	ret    
801022d3:	66 90                	xchg   %ax,%ax
801022d5:	66 90                	xchg   %ax,%ax
801022d7:	66 90                	xchg   %ax,%ax
801022d9:	66 90                	xchg   %ax,%ax
801022db:	66 90                	xchg   %ax,%ax
801022dd:	66 90                	xchg   %ax,%ax
801022df:	90                   	nop

801022e0 <kfree>:
801022e0:	55                   	push   %ebp
801022e1:	89 e5                	mov    %esp,%ebp
801022e3:	53                   	push   %ebx
801022e4:	83 ec 04             	sub    $0x4,%esp
801022e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801022ea:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
801022f0:	75 70                	jne    80102362 <kfree+0x82>
801022f2:	81 fb 68 61 11 80    	cmp    $0x80116168,%ebx
801022f8:	72 68                	jb     80102362 <kfree+0x82>
801022fa:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80102300:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102305:	77 5b                	ja     80102362 <kfree+0x82>
80102307:	83 ec 04             	sub    $0x4,%esp
8010230a:	68 00 10 00 00       	push   $0x1000
8010230f:	6a 01                	push   $0x1
80102311:	53                   	push   %ebx
80102312:	e8 a9 21 00 00       	call   801044c0 <memset>
80102317:	8b 15 34 30 11 80    	mov    0x80113034,%edx
8010231d:	83 c4 10             	add    $0x10,%esp
80102320:	85 d2                	test   %edx,%edx
80102322:	75 2c                	jne    80102350 <kfree+0x70>
80102324:	a1 38 30 11 80       	mov    0x80113038,%eax
80102329:	89 03                	mov    %eax,(%ebx)
8010232b:	a1 34 30 11 80       	mov    0x80113034,%eax
80102330:	89 1d 38 30 11 80    	mov    %ebx,0x80113038
80102336:	85 c0                	test   %eax,%eax
80102338:	75 06                	jne    80102340 <kfree+0x60>
8010233a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010233d:	c9                   	leave  
8010233e:	c3                   	ret    
8010233f:	90                   	nop
80102340:	c7 45 08 00 30 11 80 	movl   $0x80113000,0x8(%ebp)
80102347:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010234a:	c9                   	leave  
8010234b:	e9 20 21 00 00       	jmp    80104470 <release>
80102350:	83 ec 0c             	sub    $0xc,%esp
80102353:	68 00 30 11 80       	push   $0x80113000
80102358:	e8 63 20 00 00       	call   801043c0 <acquire>
8010235d:	83 c4 10             	add    $0x10,%esp
80102360:	eb c2                	jmp    80102324 <kfree+0x44>
80102362:	83 ec 0c             	sub    $0xc,%esp
80102365:	68 a6 73 10 80       	push   $0x801073a6
8010236a:	e8 01 e0 ff ff       	call   80100370 <panic>
8010236f:	90                   	nop

80102370 <freerange>:
80102370:	55                   	push   %ebp
80102371:	89 e5                	mov    %esp,%ebp
80102373:	56                   	push   %esi
80102374:	53                   	push   %ebx
80102375:	8b 45 08             	mov    0x8(%ebp),%eax
80102378:	8b 75 0c             	mov    0xc(%ebp),%esi
8010237b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102381:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102387:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010238d:	39 de                	cmp    %ebx,%esi
8010238f:	72 23                	jb     801023b4 <freerange+0x44>
80102391:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102398:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010239e:	83 ec 0c             	sub    $0xc,%esp
801023a1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023a7:	50                   	push   %eax
801023a8:	e8 33 ff ff ff       	call   801022e0 <kfree>
801023ad:	83 c4 10             	add    $0x10,%esp
801023b0:	39 f3                	cmp    %esi,%ebx
801023b2:	76 e4                	jbe    80102398 <freerange+0x28>
801023b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801023b7:	5b                   	pop    %ebx
801023b8:	5e                   	pop    %esi
801023b9:	5d                   	pop    %ebp
801023ba:	c3                   	ret    
801023bb:	90                   	nop
801023bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801023c0 <kinit1>:
801023c0:	55                   	push   %ebp
801023c1:	89 e5                	mov    %esp,%ebp
801023c3:	56                   	push   %esi
801023c4:	53                   	push   %ebx
801023c5:	8b 75 0c             	mov    0xc(%ebp),%esi
801023c8:	83 ec 08             	sub    $0x8,%esp
801023cb:	68 ac 73 10 80       	push   $0x801073ac
801023d0:	68 00 30 11 80       	push   $0x80113000
801023d5:	e8 86 1e 00 00       	call   80104260 <initlock>
801023da:	8b 45 08             	mov    0x8(%ebp),%eax
801023dd:	83 c4 10             	add    $0x10,%esp
801023e0:	c7 05 34 30 11 80 00 	movl   $0x0,0x80113034
801023e7:	00 00 00 
801023ea:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801023f0:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801023f6:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023fc:	39 de                	cmp    %ebx,%esi
801023fe:	72 1c                	jb     8010241c <kinit1+0x5c>
80102400:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
80102406:	83 ec 0c             	sub    $0xc,%esp
80102409:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010240f:	50                   	push   %eax
80102410:	e8 cb fe ff ff       	call   801022e0 <kfree>
80102415:	83 c4 10             	add    $0x10,%esp
80102418:	39 de                	cmp    %ebx,%esi
8010241a:	73 e4                	jae    80102400 <kinit1+0x40>
8010241c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010241f:	5b                   	pop    %ebx
80102420:	5e                   	pop    %esi
80102421:	5d                   	pop    %ebp
80102422:	c3                   	ret    
80102423:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102430 <kinit2>:
80102430:	55                   	push   %ebp
80102431:	89 e5                	mov    %esp,%ebp
80102433:	56                   	push   %esi
80102434:	53                   	push   %ebx
80102435:	8b 45 08             	mov    0x8(%ebp),%eax
80102438:	8b 75 0c             	mov    0xc(%ebp),%esi
8010243b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102441:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102447:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010244d:	39 de                	cmp    %ebx,%esi
8010244f:	72 23                	jb     80102474 <kinit2+0x44>
80102451:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102458:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010245e:	83 ec 0c             	sub    $0xc,%esp
80102461:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102467:	50                   	push   %eax
80102468:	e8 73 fe ff ff       	call   801022e0 <kfree>
8010246d:	83 c4 10             	add    $0x10,%esp
80102470:	39 de                	cmp    %ebx,%esi
80102472:	73 e4                	jae    80102458 <kinit2+0x28>
80102474:	c7 05 34 30 11 80 01 	movl   $0x1,0x80113034
8010247b:	00 00 00 
8010247e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102481:	5b                   	pop    %ebx
80102482:	5e                   	pop    %esi
80102483:	5d                   	pop    %ebp
80102484:	c3                   	ret    
80102485:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102489:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102490 <kalloc>:
80102490:	55                   	push   %ebp
80102491:	89 e5                	mov    %esp,%ebp
80102493:	53                   	push   %ebx
80102494:	83 ec 04             	sub    $0x4,%esp
80102497:	a1 34 30 11 80       	mov    0x80113034,%eax
8010249c:	85 c0                	test   %eax,%eax
8010249e:	75 30                	jne    801024d0 <kalloc+0x40>
801024a0:	8b 1d 38 30 11 80    	mov    0x80113038,%ebx
801024a6:	85 db                	test   %ebx,%ebx
801024a8:	74 1c                	je     801024c6 <kalloc+0x36>
801024aa:	8b 13                	mov    (%ebx),%edx
801024ac:	89 15 38 30 11 80    	mov    %edx,0x80113038
801024b2:	85 c0                	test   %eax,%eax
801024b4:	74 10                	je     801024c6 <kalloc+0x36>
801024b6:	83 ec 0c             	sub    $0xc,%esp
801024b9:	68 00 30 11 80       	push   $0x80113000
801024be:	e8 ad 1f 00 00       	call   80104470 <release>
801024c3:	83 c4 10             	add    $0x10,%esp
801024c6:	89 d8                	mov    %ebx,%eax
801024c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801024cb:	c9                   	leave  
801024cc:	c3                   	ret    
801024cd:	8d 76 00             	lea    0x0(%esi),%esi
801024d0:	83 ec 0c             	sub    $0xc,%esp
801024d3:	68 00 30 11 80       	push   $0x80113000
801024d8:	e8 e3 1e 00 00       	call   801043c0 <acquire>
801024dd:	8b 1d 38 30 11 80    	mov    0x80113038,%ebx
801024e3:	83 c4 10             	add    $0x10,%esp
801024e6:	a1 34 30 11 80       	mov    0x80113034,%eax
801024eb:	85 db                	test   %ebx,%ebx
801024ed:	75 bb                	jne    801024aa <kalloc+0x1a>
801024ef:	eb c1                	jmp    801024b2 <kalloc+0x22>
801024f1:	66 90                	xchg   %ax,%ax
801024f3:	66 90                	xchg   %ax,%ax
801024f5:	66 90                	xchg   %ax,%ax
801024f7:	66 90                	xchg   %ax,%ax
801024f9:	66 90                	xchg   %ax,%ax
801024fb:	66 90                	xchg   %ax,%ax
801024fd:	66 90                	xchg   %ax,%ax
801024ff:	90                   	nop

80102500 <kbdgetc>:
80102500:	ba 64 00 00 00       	mov    $0x64,%edx
80102505:	ec                   	in     (%dx),%al
80102506:	a8 01                	test   $0x1,%al
80102508:	0f 84 c2 00 00 00    	je     801025d0 <kbdgetc+0xd0>
8010250e:	ba 60 00 00 00       	mov    $0x60,%edx
80102513:	ec                   	in     (%dx),%al
80102514:	0f b6 d0             	movzbl %al,%edx
80102517:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
8010251d:	0f 84 9d 00 00 00    	je     801025c0 <kbdgetc+0xc0>
80102523:	84 c0                	test   %al,%al
80102525:	78 59                	js     80102580 <kbdgetc+0x80>
80102527:	55                   	push   %ebp
80102528:	89 e5                	mov    %esp,%ebp
8010252a:	53                   	push   %ebx
8010252b:	8b 1d b4 a5 10 80    	mov    0x8010a5b4,%ebx
80102531:	f6 c3 40             	test   $0x40,%bl
80102534:	74 09                	je     8010253f <kbdgetc+0x3f>
80102536:	83 c8 80             	or     $0xffffff80,%eax
80102539:	83 e3 bf             	and    $0xffffffbf,%ebx
8010253c:	0f b6 d0             	movzbl %al,%edx
8010253f:	0f b6 8a e0 74 10 80 	movzbl -0x7fef8b20(%edx),%ecx
80102546:	0f b6 82 e0 73 10 80 	movzbl -0x7fef8c20(%edx),%eax
8010254d:	09 d9                	or     %ebx,%ecx
8010254f:	31 c1                	xor    %eax,%ecx
80102551:	89 c8                	mov    %ecx,%eax
80102553:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
80102559:	83 e0 03             	and    $0x3,%eax
8010255c:	83 e1 08             	and    $0x8,%ecx
8010255f:	8b 04 85 c0 73 10 80 	mov    -0x7fef8c40(,%eax,4),%eax
80102566:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
8010256a:	74 0b                	je     80102577 <kbdgetc+0x77>
8010256c:	8d 50 9f             	lea    -0x61(%eax),%edx
8010256f:	83 fa 19             	cmp    $0x19,%edx
80102572:	77 3c                	ja     801025b0 <kbdgetc+0xb0>
80102574:	83 e8 20             	sub    $0x20,%eax
80102577:	5b                   	pop    %ebx
80102578:	5d                   	pop    %ebp
80102579:	c3                   	ret    
8010257a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102580:	8b 0d b4 a5 10 80    	mov    0x8010a5b4,%ecx
80102586:	83 e0 7f             	and    $0x7f,%eax
80102589:	f6 c1 40             	test   $0x40,%cl
8010258c:	0f 44 d0             	cmove  %eax,%edx
8010258f:	0f b6 82 e0 74 10 80 	movzbl -0x7fef8b20(%edx),%eax
80102596:	83 c8 40             	or     $0x40,%eax
80102599:	0f b6 c0             	movzbl %al,%eax
8010259c:	f7 d0                	not    %eax
8010259e:	21 c8                	and    %ecx,%eax
801025a0:	a3 b4 a5 10 80       	mov    %eax,0x8010a5b4
801025a5:	31 c0                	xor    %eax,%eax
801025a7:	c3                   	ret    
801025a8:	90                   	nop
801025a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801025b0:	8d 48 bf             	lea    -0x41(%eax),%ecx
801025b3:	8d 50 20             	lea    0x20(%eax),%edx
801025b6:	5b                   	pop    %ebx
801025b7:	83 f9 19             	cmp    $0x19,%ecx
801025ba:	0f 46 c2             	cmovbe %edx,%eax
801025bd:	5d                   	pop    %ebp
801025be:	c3                   	ret    
801025bf:	90                   	nop
801025c0:	83 0d b4 a5 10 80 40 	orl    $0x40,0x8010a5b4
801025c7:	31 c0                	xor    %eax,%eax
801025c9:	c3                   	ret    
801025ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801025d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801025d5:	c3                   	ret    
801025d6:	8d 76 00             	lea    0x0(%esi),%esi
801025d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801025e0 <kbdintr>:
801025e0:	55                   	push   %ebp
801025e1:	89 e5                	mov    %esp,%ebp
801025e3:	83 ec 14             	sub    $0x14,%esp
801025e6:	68 00 25 10 80       	push   $0x80102500
801025eb:	e8 f0 e1 ff ff       	call   801007e0 <consoleintr>
801025f0:	83 c4 10             	add    $0x10,%esp
801025f3:	c9                   	leave  
801025f4:	c3                   	ret    
801025f5:	66 90                	xchg   %ax,%ax
801025f7:	66 90                	xchg   %ax,%ax
801025f9:	66 90                	xchg   %ax,%ax
801025fb:	66 90                	xchg   %ax,%ax
801025fd:	66 90                	xchg   %ax,%ax
801025ff:	90                   	nop

80102600 <lapicinit>:
80102600:	a1 3c 30 11 80       	mov    0x8011303c,%eax
80102605:	55                   	push   %ebp
80102606:	89 e5                	mov    %esp,%ebp
80102608:	85 c0                	test   %eax,%eax
8010260a:	0f 84 c8 00 00 00    	je     801026d8 <lapicinit+0xd8>
80102610:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80102617:	01 00 00 
8010261a:	8b 50 20             	mov    0x20(%eax),%edx
8010261d:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102624:	00 00 00 
80102627:	8b 50 20             	mov    0x20(%eax),%edx
8010262a:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
80102631:	00 02 00 
80102634:	8b 50 20             	mov    0x20(%eax),%edx
80102637:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010263e:	96 98 00 
80102641:	8b 50 20             	mov    0x20(%eax),%edx
80102644:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
8010264b:	00 01 00 
8010264e:	8b 50 20             	mov    0x20(%eax),%edx
80102651:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80102658:	00 01 00 
8010265b:	8b 50 20             	mov    0x20(%eax),%edx
8010265e:	8b 50 30             	mov    0x30(%eax),%edx
80102661:	c1 ea 10             	shr    $0x10,%edx
80102664:	80 fa 03             	cmp    $0x3,%dl
80102667:	77 77                	ja     801026e0 <lapicinit+0xe0>
80102669:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
80102670:	00 00 00 
80102673:	8b 50 20             	mov    0x20(%eax),%edx
80102676:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010267d:	00 00 00 
80102680:	8b 50 20             	mov    0x20(%eax),%edx
80102683:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010268a:	00 00 00 
8010268d:	8b 50 20             	mov    0x20(%eax),%edx
80102690:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102697:	00 00 00 
8010269a:	8b 50 20             	mov    0x20(%eax),%edx
8010269d:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
801026a4:	00 00 00 
801026a7:	8b 50 20             	mov    0x20(%eax),%edx
801026aa:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
801026b1:	85 08 00 
801026b4:	8b 50 20             	mov    0x20(%eax),%edx
801026b7:	89 f6                	mov    %esi,%esi
801026b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801026c0:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
801026c6:	80 e6 10             	and    $0x10,%dh
801026c9:	75 f5                	jne    801026c0 <lapicinit+0xc0>
801026cb:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
801026d2:	00 00 00 
801026d5:	8b 40 20             	mov    0x20(%eax),%eax
801026d8:	5d                   	pop    %ebp
801026d9:	c3                   	ret    
801026da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801026e0:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
801026e7:	00 01 00 
801026ea:	8b 50 20             	mov    0x20(%eax),%edx
801026ed:	e9 77 ff ff ff       	jmp    80102669 <lapicinit+0x69>
801026f2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801026f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102700 <lapicid>:
80102700:	a1 3c 30 11 80       	mov    0x8011303c,%eax
80102705:	55                   	push   %ebp
80102706:	89 e5                	mov    %esp,%ebp
80102708:	85 c0                	test   %eax,%eax
8010270a:	74 0c                	je     80102718 <lapicid+0x18>
8010270c:	8b 40 20             	mov    0x20(%eax),%eax
8010270f:	5d                   	pop    %ebp
80102710:	c1 e8 18             	shr    $0x18,%eax
80102713:	c3                   	ret    
80102714:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102718:	31 c0                	xor    %eax,%eax
8010271a:	5d                   	pop    %ebp
8010271b:	c3                   	ret    
8010271c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102720 <lapiceoi>:
80102720:	a1 3c 30 11 80       	mov    0x8011303c,%eax
80102725:	55                   	push   %ebp
80102726:	89 e5                	mov    %esp,%ebp
80102728:	85 c0                	test   %eax,%eax
8010272a:	74 0d                	je     80102739 <lapiceoi+0x19>
8010272c:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102733:	00 00 00 
80102736:	8b 40 20             	mov    0x20(%eax),%eax
80102739:	5d                   	pop    %ebp
8010273a:	c3                   	ret    
8010273b:	90                   	nop
8010273c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102740 <microdelay>:
80102740:	55                   	push   %ebp
80102741:	89 e5                	mov    %esp,%ebp
80102743:	5d                   	pop    %ebp
80102744:	c3                   	ret    
80102745:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102749:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102750 <lapicstartap>:
80102750:	55                   	push   %ebp
80102751:	ba 70 00 00 00       	mov    $0x70,%edx
80102756:	b8 0f 00 00 00       	mov    $0xf,%eax
8010275b:	89 e5                	mov    %esp,%ebp
8010275d:	53                   	push   %ebx
8010275e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102761:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102764:	ee                   	out    %al,(%dx)
80102765:	ba 71 00 00 00       	mov    $0x71,%edx
8010276a:	b8 0a 00 00 00       	mov    $0xa,%eax
8010276f:	ee                   	out    %al,(%dx)
80102770:	31 c0                	xor    %eax,%eax
80102772:	c1 e3 18             	shl    $0x18,%ebx
80102775:	66 a3 67 04 00 80    	mov    %ax,0x80000467
8010277b:	89 c8                	mov    %ecx,%eax
8010277d:	c1 e9 0c             	shr    $0xc,%ecx
80102780:	c1 e8 04             	shr    $0x4,%eax
80102783:	89 da                	mov    %ebx,%edx
80102785:	80 cd 06             	or     $0x6,%ch
80102788:	66 a3 69 04 00 80    	mov    %ax,0x80000469
8010278e:	a1 3c 30 11 80       	mov    0x8011303c,%eax
80102793:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
80102799:	8b 58 20             	mov    0x20(%eax),%ebx
8010279c:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
801027a3:	c5 00 00 
801027a6:	8b 58 20             	mov    0x20(%eax),%ebx
801027a9:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
801027b0:	85 00 00 
801027b3:	8b 58 20             	mov    0x20(%eax),%ebx
801027b6:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
801027bc:	8b 58 20             	mov    0x20(%eax),%ebx
801027bf:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
801027c5:	8b 58 20             	mov    0x20(%eax),%ebx
801027c8:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
801027ce:	8b 50 20             	mov    0x20(%eax),%edx
801027d1:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
801027d7:	8b 40 20             	mov    0x20(%eax),%eax
801027da:	5b                   	pop    %ebx
801027db:	5d                   	pop    %ebp
801027dc:	c3                   	ret    
801027dd:	8d 76 00             	lea    0x0(%esi),%esi

801027e0 <cmostime>:
801027e0:	55                   	push   %ebp
801027e1:	ba 70 00 00 00       	mov    $0x70,%edx
801027e6:	b8 0b 00 00 00       	mov    $0xb,%eax
801027eb:	89 e5                	mov    %esp,%ebp
801027ed:	57                   	push   %edi
801027ee:	56                   	push   %esi
801027ef:	53                   	push   %ebx
801027f0:	83 ec 5c             	sub    $0x5c,%esp
801027f3:	ee                   	out    %al,(%dx)
801027f4:	ba 71 00 00 00       	mov    $0x71,%edx
801027f9:	ec                   	in     (%dx),%al
801027fa:	83 e0 04             	and    $0x4,%eax
801027fd:	bb 70 00 00 00       	mov    $0x70,%ebx
80102802:	88 45 a7             	mov    %al,-0x59(%ebp)
80102805:	8d 76 00             	lea    0x0(%esi),%esi
80102808:	31 c0                	xor    %eax,%eax
8010280a:	89 da                	mov    %ebx,%edx
8010280c:	ee                   	out    %al,(%dx)
8010280d:	b9 71 00 00 00       	mov    $0x71,%ecx
80102812:	89 ca                	mov    %ecx,%edx
80102814:	ec                   	in     (%dx),%al
80102815:	0f b6 c0             	movzbl %al,%eax
80102818:	89 da                	mov    %ebx,%edx
8010281a:	89 45 b4             	mov    %eax,-0x4c(%ebp)
8010281d:	b8 02 00 00 00       	mov    $0x2,%eax
80102822:	ee                   	out    %al,(%dx)
80102823:	89 ca                	mov    %ecx,%edx
80102825:	ec                   	in     (%dx),%al
80102826:	0f b6 f0             	movzbl %al,%esi
80102829:	89 da                	mov    %ebx,%edx
8010282b:	b8 04 00 00 00       	mov    $0x4,%eax
80102830:	89 75 b0             	mov    %esi,-0x50(%ebp)
80102833:	ee                   	out    %al,(%dx)
80102834:	89 ca                	mov    %ecx,%edx
80102836:	ec                   	in     (%dx),%al
80102837:	0f b6 f8             	movzbl %al,%edi
8010283a:	89 da                	mov    %ebx,%edx
8010283c:	b8 07 00 00 00       	mov    $0x7,%eax
80102841:	89 7d ac             	mov    %edi,-0x54(%ebp)
80102844:	ee                   	out    %al,(%dx)
80102845:	89 ca                	mov    %ecx,%edx
80102847:	ec                   	in     (%dx),%al
80102848:	0f b6 d0             	movzbl %al,%edx
8010284b:	b8 08 00 00 00       	mov    $0x8,%eax
80102850:	89 55 a8             	mov    %edx,-0x58(%ebp)
80102853:	89 da                	mov    %ebx,%edx
80102855:	ee                   	out    %al,(%dx)
80102856:	89 ca                	mov    %ecx,%edx
80102858:	ec                   	in     (%dx),%al
80102859:	0f b6 f8             	movzbl %al,%edi
8010285c:	89 da                	mov    %ebx,%edx
8010285e:	b8 09 00 00 00       	mov    $0x9,%eax
80102863:	ee                   	out    %al,(%dx)
80102864:	89 ca                	mov    %ecx,%edx
80102866:	ec                   	in     (%dx),%al
80102867:	0f b6 f0             	movzbl %al,%esi
8010286a:	89 da                	mov    %ebx,%edx
8010286c:	b8 0a 00 00 00       	mov    $0xa,%eax
80102871:	ee                   	out    %al,(%dx)
80102872:	89 ca                	mov    %ecx,%edx
80102874:	ec                   	in     (%dx),%al
80102875:	84 c0                	test   %al,%al
80102877:	78 8f                	js     80102808 <cmostime+0x28>
80102879:	8b 45 b4             	mov    -0x4c(%ebp),%eax
8010287c:	8b 55 a8             	mov    -0x58(%ebp),%edx
8010287f:	89 7d c8             	mov    %edi,-0x38(%ebp)
80102882:	89 75 cc             	mov    %esi,-0x34(%ebp)
80102885:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102888:	8b 45 b0             	mov    -0x50(%ebp),%eax
8010288b:	89 55 c4             	mov    %edx,-0x3c(%ebp)
8010288e:	89 da                	mov    %ebx,%edx
80102890:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102893:	8b 45 ac             	mov    -0x54(%ebp),%eax
80102896:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102899:	31 c0                	xor    %eax,%eax
8010289b:	ee                   	out    %al,(%dx)
8010289c:	89 ca                	mov    %ecx,%edx
8010289e:	ec                   	in     (%dx),%al
8010289f:	0f b6 c0             	movzbl %al,%eax
801028a2:	89 da                	mov    %ebx,%edx
801028a4:	89 45 d0             	mov    %eax,-0x30(%ebp)
801028a7:	b8 02 00 00 00       	mov    $0x2,%eax
801028ac:	ee                   	out    %al,(%dx)
801028ad:	89 ca                	mov    %ecx,%edx
801028af:	ec                   	in     (%dx),%al
801028b0:	0f b6 c0             	movzbl %al,%eax
801028b3:	89 da                	mov    %ebx,%edx
801028b5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
801028b8:	b8 04 00 00 00       	mov    $0x4,%eax
801028bd:	ee                   	out    %al,(%dx)
801028be:	89 ca                	mov    %ecx,%edx
801028c0:	ec                   	in     (%dx),%al
801028c1:	0f b6 c0             	movzbl %al,%eax
801028c4:	89 da                	mov    %ebx,%edx
801028c6:	89 45 d8             	mov    %eax,-0x28(%ebp)
801028c9:	b8 07 00 00 00       	mov    $0x7,%eax
801028ce:	ee                   	out    %al,(%dx)
801028cf:	89 ca                	mov    %ecx,%edx
801028d1:	ec                   	in     (%dx),%al
801028d2:	0f b6 c0             	movzbl %al,%eax
801028d5:	89 da                	mov    %ebx,%edx
801028d7:	89 45 dc             	mov    %eax,-0x24(%ebp)
801028da:	b8 08 00 00 00       	mov    $0x8,%eax
801028df:	ee                   	out    %al,(%dx)
801028e0:	89 ca                	mov    %ecx,%edx
801028e2:	ec                   	in     (%dx),%al
801028e3:	0f b6 c0             	movzbl %al,%eax
801028e6:	89 da                	mov    %ebx,%edx
801028e8:	89 45 e0             	mov    %eax,-0x20(%ebp)
801028eb:	b8 09 00 00 00       	mov    $0x9,%eax
801028f0:	ee                   	out    %al,(%dx)
801028f1:	89 ca                	mov    %ecx,%edx
801028f3:	ec                   	in     (%dx),%al
801028f4:	0f b6 c0             	movzbl %al,%eax
801028f7:	83 ec 04             	sub    $0x4,%esp
801028fa:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801028fd:	8d 45 d0             	lea    -0x30(%ebp),%eax
80102900:	6a 18                	push   $0x18
80102902:	50                   	push   %eax
80102903:	8d 45 b8             	lea    -0x48(%ebp),%eax
80102906:	50                   	push   %eax
80102907:	e8 04 1c 00 00       	call   80104510 <memcmp>
8010290c:	83 c4 10             	add    $0x10,%esp
8010290f:	85 c0                	test   %eax,%eax
80102911:	0f 85 f1 fe ff ff    	jne    80102808 <cmostime+0x28>
80102917:	80 7d a7 00          	cmpb   $0x0,-0x59(%ebp)
8010291b:	75 78                	jne    80102995 <cmostime+0x1b5>
8010291d:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102920:	89 c2                	mov    %eax,%edx
80102922:	83 e0 0f             	and    $0xf,%eax
80102925:	c1 ea 04             	shr    $0x4,%edx
80102928:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010292b:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010292e:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102931:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102934:	89 c2                	mov    %eax,%edx
80102936:	83 e0 0f             	and    $0xf,%eax
80102939:	c1 ea 04             	shr    $0x4,%edx
8010293c:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010293f:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102942:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102945:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102948:	89 c2                	mov    %eax,%edx
8010294a:	83 e0 0f             	and    $0xf,%eax
8010294d:	c1 ea 04             	shr    $0x4,%edx
80102950:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102953:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102956:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102959:	8b 45 c4             	mov    -0x3c(%ebp),%eax
8010295c:	89 c2                	mov    %eax,%edx
8010295e:	83 e0 0f             	and    $0xf,%eax
80102961:	c1 ea 04             	shr    $0x4,%edx
80102964:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102967:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010296a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
8010296d:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102970:	89 c2                	mov    %eax,%edx
80102972:	83 e0 0f             	and    $0xf,%eax
80102975:	c1 ea 04             	shr    $0x4,%edx
80102978:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010297b:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010297e:	89 45 c8             	mov    %eax,-0x38(%ebp)
80102981:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102984:	89 c2                	mov    %eax,%edx
80102986:	83 e0 0f             	and    $0xf,%eax
80102989:	c1 ea 04             	shr    $0x4,%edx
8010298c:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010298f:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102992:	89 45 cc             	mov    %eax,-0x34(%ebp)
80102995:	8b 75 08             	mov    0x8(%ebp),%esi
80102998:	8b 45 b8             	mov    -0x48(%ebp),%eax
8010299b:	89 06                	mov    %eax,(%esi)
8010299d:	8b 45 bc             	mov    -0x44(%ebp),%eax
801029a0:	89 46 04             	mov    %eax,0x4(%esi)
801029a3:	8b 45 c0             	mov    -0x40(%ebp),%eax
801029a6:	89 46 08             	mov    %eax,0x8(%esi)
801029a9:	8b 45 c4             	mov    -0x3c(%ebp),%eax
801029ac:	89 46 0c             	mov    %eax,0xc(%esi)
801029af:	8b 45 c8             	mov    -0x38(%ebp),%eax
801029b2:	89 46 10             	mov    %eax,0x10(%esi)
801029b5:	8b 45 cc             	mov    -0x34(%ebp),%eax
801029b8:	89 46 14             	mov    %eax,0x14(%esi)
801029bb:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
801029c2:	8d 65 f4             	lea    -0xc(%ebp),%esp
801029c5:	5b                   	pop    %ebx
801029c6:	5e                   	pop    %esi
801029c7:	5f                   	pop    %edi
801029c8:	5d                   	pop    %ebp
801029c9:	c3                   	ret    
801029ca:	66 90                	xchg   %ax,%ax
801029cc:	66 90                	xchg   %ax,%ax
801029ce:	66 90                	xchg   %ax,%ax

801029d0 <install_trans>:
801029d0:	8b 0d 88 30 11 80    	mov    0x80113088,%ecx
801029d6:	85 c9                	test   %ecx,%ecx
801029d8:	0f 8e 85 00 00 00    	jle    80102a63 <install_trans+0x93>
801029de:	55                   	push   %ebp
801029df:	89 e5                	mov    %esp,%ebp
801029e1:	57                   	push   %edi
801029e2:	56                   	push   %esi
801029e3:	53                   	push   %ebx
801029e4:	31 db                	xor    %ebx,%ebx
801029e6:	83 ec 0c             	sub    $0xc,%esp
801029e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801029f0:	a1 74 30 11 80       	mov    0x80113074,%eax
801029f5:	83 ec 08             	sub    $0x8,%esp
801029f8:	01 d8                	add    %ebx,%eax
801029fa:	83 c0 01             	add    $0x1,%eax
801029fd:	50                   	push   %eax
801029fe:	ff 35 84 30 11 80    	pushl  0x80113084
80102a04:	e8 c7 d6 ff ff       	call   801000d0 <bread>
80102a09:	89 c7                	mov    %eax,%edi
80102a0b:	58                   	pop    %eax
80102a0c:	5a                   	pop    %edx
80102a0d:	ff 34 9d 8c 30 11 80 	pushl  -0x7feecf74(,%ebx,4)
80102a14:	ff 35 84 30 11 80    	pushl  0x80113084
80102a1a:	83 c3 01             	add    $0x1,%ebx
80102a1d:	e8 ae d6 ff ff       	call   801000d0 <bread>
80102a22:	89 c6                	mov    %eax,%esi
80102a24:	8d 47 5c             	lea    0x5c(%edi),%eax
80102a27:	83 c4 0c             	add    $0xc,%esp
80102a2a:	68 00 02 00 00       	push   $0x200
80102a2f:	50                   	push   %eax
80102a30:	8d 46 5c             	lea    0x5c(%esi),%eax
80102a33:	50                   	push   %eax
80102a34:	e8 37 1b 00 00       	call   80104570 <memmove>
80102a39:	89 34 24             	mov    %esi,(%esp)
80102a3c:	e8 5f d7 ff ff       	call   801001a0 <bwrite>
80102a41:	89 3c 24             	mov    %edi,(%esp)
80102a44:	e8 97 d7 ff ff       	call   801001e0 <brelse>
80102a49:	89 34 24             	mov    %esi,(%esp)
80102a4c:	e8 8f d7 ff ff       	call   801001e0 <brelse>
80102a51:	83 c4 10             	add    $0x10,%esp
80102a54:	39 1d 88 30 11 80    	cmp    %ebx,0x80113088
80102a5a:	7f 94                	jg     801029f0 <install_trans+0x20>
80102a5c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a5f:	5b                   	pop    %ebx
80102a60:	5e                   	pop    %esi
80102a61:	5f                   	pop    %edi
80102a62:	5d                   	pop    %ebp
80102a63:	f3 c3                	repz ret 
80102a65:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102a69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102a70 <write_head>:
80102a70:	55                   	push   %ebp
80102a71:	89 e5                	mov    %esp,%ebp
80102a73:	53                   	push   %ebx
80102a74:	83 ec 0c             	sub    $0xc,%esp
80102a77:	ff 35 74 30 11 80    	pushl  0x80113074
80102a7d:	ff 35 84 30 11 80    	pushl  0x80113084
80102a83:	e8 48 d6 ff ff       	call   801000d0 <bread>
80102a88:	8b 0d 88 30 11 80    	mov    0x80113088,%ecx
80102a8e:	83 c4 10             	add    $0x10,%esp
80102a91:	89 c3                	mov    %eax,%ebx
80102a93:	85 c9                	test   %ecx,%ecx
80102a95:	89 48 5c             	mov    %ecx,0x5c(%eax)
80102a98:	7e 1f                	jle    80102ab9 <write_head+0x49>
80102a9a:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
80102aa1:	31 d2                	xor    %edx,%edx
80102aa3:	90                   	nop
80102aa4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102aa8:	8b 8a 8c 30 11 80    	mov    -0x7feecf74(%edx),%ecx
80102aae:	89 4c 13 60          	mov    %ecx,0x60(%ebx,%edx,1)
80102ab2:	83 c2 04             	add    $0x4,%edx
80102ab5:	39 c2                	cmp    %eax,%edx
80102ab7:	75 ef                	jne    80102aa8 <write_head+0x38>
80102ab9:	83 ec 0c             	sub    $0xc,%esp
80102abc:	53                   	push   %ebx
80102abd:	e8 de d6 ff ff       	call   801001a0 <bwrite>
80102ac2:	89 1c 24             	mov    %ebx,(%esp)
80102ac5:	e8 16 d7 ff ff       	call   801001e0 <brelse>
80102aca:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102acd:	c9                   	leave  
80102ace:	c3                   	ret    
80102acf:	90                   	nop

80102ad0 <initlog>:
80102ad0:	55                   	push   %ebp
80102ad1:	89 e5                	mov    %esp,%ebp
80102ad3:	53                   	push   %ebx
80102ad4:	83 ec 2c             	sub    $0x2c,%esp
80102ad7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102ada:	68 e0 75 10 80       	push   $0x801075e0
80102adf:	68 40 30 11 80       	push   $0x80113040
80102ae4:	e8 77 17 00 00       	call   80104260 <initlock>
80102ae9:	58                   	pop    %eax
80102aea:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102aed:	5a                   	pop    %edx
80102aee:	50                   	push   %eax
80102aef:	53                   	push   %ebx
80102af0:	e8 bb e8 ff ff       	call   801013b0 <readsb>
80102af5:	8b 55 e8             	mov    -0x18(%ebp),%edx
80102af8:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102afb:	59                   	pop    %ecx
80102afc:	89 1d 84 30 11 80    	mov    %ebx,0x80113084
80102b02:	89 15 78 30 11 80    	mov    %edx,0x80113078
80102b08:	a3 74 30 11 80       	mov    %eax,0x80113074
80102b0d:	5a                   	pop    %edx
80102b0e:	50                   	push   %eax
80102b0f:	53                   	push   %ebx
80102b10:	e8 bb d5 ff ff       	call   801000d0 <bread>
80102b15:	8b 48 5c             	mov    0x5c(%eax),%ecx
80102b18:	83 c4 10             	add    $0x10,%esp
80102b1b:	85 c9                	test   %ecx,%ecx
80102b1d:	89 0d 88 30 11 80    	mov    %ecx,0x80113088
80102b23:	7e 1c                	jle    80102b41 <initlog+0x71>
80102b25:	8d 1c 8d 00 00 00 00 	lea    0x0(,%ecx,4),%ebx
80102b2c:	31 d2                	xor    %edx,%edx
80102b2e:	66 90                	xchg   %ax,%ax
80102b30:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102b34:	83 c2 04             	add    $0x4,%edx
80102b37:	89 8a 88 30 11 80    	mov    %ecx,-0x7feecf78(%edx)
80102b3d:	39 da                	cmp    %ebx,%edx
80102b3f:	75 ef                	jne    80102b30 <initlog+0x60>
80102b41:	83 ec 0c             	sub    $0xc,%esp
80102b44:	50                   	push   %eax
80102b45:	e8 96 d6 ff ff       	call   801001e0 <brelse>
80102b4a:	e8 81 fe ff ff       	call   801029d0 <install_trans>
80102b4f:	c7 05 88 30 11 80 00 	movl   $0x0,0x80113088
80102b56:	00 00 00 
80102b59:	e8 12 ff ff ff       	call   80102a70 <write_head>
80102b5e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102b61:	c9                   	leave  
80102b62:	c3                   	ret    
80102b63:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102b69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102b70 <begin_op>:
80102b70:	55                   	push   %ebp
80102b71:	89 e5                	mov    %esp,%ebp
80102b73:	83 ec 14             	sub    $0x14,%esp
80102b76:	68 40 30 11 80       	push   $0x80113040
80102b7b:	e8 40 18 00 00       	call   801043c0 <acquire>
80102b80:	83 c4 10             	add    $0x10,%esp
80102b83:	eb 18                	jmp    80102b9d <begin_op+0x2d>
80102b85:	8d 76 00             	lea    0x0(%esi),%esi
80102b88:	83 ec 08             	sub    $0x8,%esp
80102b8b:	68 40 30 11 80       	push   $0x80113040
80102b90:	68 40 30 11 80       	push   $0x80113040
80102b95:	e8 16 12 00 00       	call   80103db0 <sleep>
80102b9a:	83 c4 10             	add    $0x10,%esp
80102b9d:	a1 80 30 11 80       	mov    0x80113080,%eax
80102ba2:	85 c0                	test   %eax,%eax
80102ba4:	75 e2                	jne    80102b88 <begin_op+0x18>
80102ba6:	a1 7c 30 11 80       	mov    0x8011307c,%eax
80102bab:	8b 15 88 30 11 80    	mov    0x80113088,%edx
80102bb1:	83 c0 01             	add    $0x1,%eax
80102bb4:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102bb7:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102bba:	83 fa 1e             	cmp    $0x1e,%edx
80102bbd:	7f c9                	jg     80102b88 <begin_op+0x18>
80102bbf:	83 ec 0c             	sub    $0xc,%esp
80102bc2:	a3 7c 30 11 80       	mov    %eax,0x8011307c
80102bc7:	68 40 30 11 80       	push   $0x80113040
80102bcc:	e8 9f 18 00 00       	call   80104470 <release>
80102bd1:	83 c4 10             	add    $0x10,%esp
80102bd4:	c9                   	leave  
80102bd5:	c3                   	ret    
80102bd6:	8d 76 00             	lea    0x0(%esi),%esi
80102bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102be0 <end_op>:
80102be0:	55                   	push   %ebp
80102be1:	89 e5                	mov    %esp,%ebp
80102be3:	57                   	push   %edi
80102be4:	56                   	push   %esi
80102be5:	53                   	push   %ebx
80102be6:	83 ec 18             	sub    $0x18,%esp
80102be9:	68 40 30 11 80       	push   $0x80113040
80102bee:	e8 cd 17 00 00       	call   801043c0 <acquire>
80102bf3:	a1 7c 30 11 80       	mov    0x8011307c,%eax
80102bf8:	8b 35 80 30 11 80    	mov    0x80113080,%esi
80102bfe:	83 c4 10             	add    $0x10,%esp
80102c01:	8d 58 ff             	lea    -0x1(%eax),%ebx
80102c04:	85 f6                	test   %esi,%esi
80102c06:	89 1d 7c 30 11 80    	mov    %ebx,0x8011307c
80102c0c:	0f 85 22 01 00 00    	jne    80102d34 <end_op+0x154>
80102c12:	85 db                	test   %ebx,%ebx
80102c14:	0f 85 f6 00 00 00    	jne    80102d10 <end_op+0x130>
80102c1a:	83 ec 0c             	sub    $0xc,%esp
80102c1d:	c7 05 80 30 11 80 01 	movl   $0x1,0x80113080
80102c24:	00 00 00 
80102c27:	68 40 30 11 80       	push   $0x80113040
80102c2c:	e8 3f 18 00 00       	call   80104470 <release>
80102c31:	8b 0d 88 30 11 80    	mov    0x80113088,%ecx
80102c37:	83 c4 10             	add    $0x10,%esp
80102c3a:	85 c9                	test   %ecx,%ecx
80102c3c:	0f 8e 8b 00 00 00    	jle    80102ccd <end_op+0xed>
80102c42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102c48:	a1 74 30 11 80       	mov    0x80113074,%eax
80102c4d:	83 ec 08             	sub    $0x8,%esp
80102c50:	01 d8                	add    %ebx,%eax
80102c52:	83 c0 01             	add    $0x1,%eax
80102c55:	50                   	push   %eax
80102c56:	ff 35 84 30 11 80    	pushl  0x80113084
80102c5c:	e8 6f d4 ff ff       	call   801000d0 <bread>
80102c61:	89 c6                	mov    %eax,%esi
80102c63:	58                   	pop    %eax
80102c64:	5a                   	pop    %edx
80102c65:	ff 34 9d 8c 30 11 80 	pushl  -0x7feecf74(,%ebx,4)
80102c6c:	ff 35 84 30 11 80    	pushl  0x80113084
80102c72:	83 c3 01             	add    $0x1,%ebx
80102c75:	e8 56 d4 ff ff       	call   801000d0 <bread>
80102c7a:	89 c7                	mov    %eax,%edi
80102c7c:	8d 40 5c             	lea    0x5c(%eax),%eax
80102c7f:	83 c4 0c             	add    $0xc,%esp
80102c82:	68 00 02 00 00       	push   $0x200
80102c87:	50                   	push   %eax
80102c88:	8d 46 5c             	lea    0x5c(%esi),%eax
80102c8b:	50                   	push   %eax
80102c8c:	e8 df 18 00 00       	call   80104570 <memmove>
80102c91:	89 34 24             	mov    %esi,(%esp)
80102c94:	e8 07 d5 ff ff       	call   801001a0 <bwrite>
80102c99:	89 3c 24             	mov    %edi,(%esp)
80102c9c:	e8 3f d5 ff ff       	call   801001e0 <brelse>
80102ca1:	89 34 24             	mov    %esi,(%esp)
80102ca4:	e8 37 d5 ff ff       	call   801001e0 <brelse>
80102ca9:	83 c4 10             	add    $0x10,%esp
80102cac:	3b 1d 88 30 11 80    	cmp    0x80113088,%ebx
80102cb2:	7c 94                	jl     80102c48 <end_op+0x68>
80102cb4:	e8 b7 fd ff ff       	call   80102a70 <write_head>
80102cb9:	e8 12 fd ff ff       	call   801029d0 <install_trans>
80102cbe:	c7 05 88 30 11 80 00 	movl   $0x0,0x80113088
80102cc5:	00 00 00 
80102cc8:	e8 a3 fd ff ff       	call   80102a70 <write_head>
80102ccd:	83 ec 0c             	sub    $0xc,%esp
80102cd0:	68 40 30 11 80       	push   $0x80113040
80102cd5:	e8 e6 16 00 00       	call   801043c0 <acquire>
80102cda:	c7 04 24 40 30 11 80 	movl   $0x80113040,(%esp)
80102ce1:	c7 05 80 30 11 80 00 	movl   $0x0,0x80113080
80102ce8:	00 00 00 
80102ceb:	e8 80 12 00 00       	call   80103f70 <wakeup>
80102cf0:	c7 04 24 40 30 11 80 	movl   $0x80113040,(%esp)
80102cf7:	e8 74 17 00 00       	call   80104470 <release>
80102cfc:	83 c4 10             	add    $0x10,%esp
80102cff:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d02:	5b                   	pop    %ebx
80102d03:	5e                   	pop    %esi
80102d04:	5f                   	pop    %edi
80102d05:	5d                   	pop    %ebp
80102d06:	c3                   	ret    
80102d07:	89 f6                	mov    %esi,%esi
80102d09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102d10:	83 ec 0c             	sub    $0xc,%esp
80102d13:	68 40 30 11 80       	push   $0x80113040
80102d18:	e8 53 12 00 00       	call   80103f70 <wakeup>
80102d1d:	c7 04 24 40 30 11 80 	movl   $0x80113040,(%esp)
80102d24:	e8 47 17 00 00       	call   80104470 <release>
80102d29:	83 c4 10             	add    $0x10,%esp
80102d2c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d2f:	5b                   	pop    %ebx
80102d30:	5e                   	pop    %esi
80102d31:	5f                   	pop    %edi
80102d32:	5d                   	pop    %ebp
80102d33:	c3                   	ret    
80102d34:	83 ec 0c             	sub    $0xc,%esp
80102d37:	68 e4 75 10 80       	push   $0x801075e4
80102d3c:	e8 2f d6 ff ff       	call   80100370 <panic>
80102d41:	eb 0d                	jmp    80102d50 <log_write>
80102d43:	90                   	nop
80102d44:	90                   	nop
80102d45:	90                   	nop
80102d46:	90                   	nop
80102d47:	90                   	nop
80102d48:	90                   	nop
80102d49:	90                   	nop
80102d4a:	90                   	nop
80102d4b:	90                   	nop
80102d4c:	90                   	nop
80102d4d:	90                   	nop
80102d4e:	90                   	nop
80102d4f:	90                   	nop

80102d50 <log_write>:
80102d50:	55                   	push   %ebp
80102d51:	89 e5                	mov    %esp,%ebp
80102d53:	53                   	push   %ebx
80102d54:	83 ec 04             	sub    $0x4,%esp
80102d57:	8b 15 88 30 11 80    	mov    0x80113088,%edx
80102d5d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102d60:	83 fa 1d             	cmp    $0x1d,%edx
80102d63:	0f 8f 97 00 00 00    	jg     80102e00 <log_write+0xb0>
80102d69:	a1 78 30 11 80       	mov    0x80113078,%eax
80102d6e:	83 e8 01             	sub    $0x1,%eax
80102d71:	39 c2                	cmp    %eax,%edx
80102d73:	0f 8d 87 00 00 00    	jge    80102e00 <log_write+0xb0>
80102d79:	a1 7c 30 11 80       	mov    0x8011307c,%eax
80102d7e:	85 c0                	test   %eax,%eax
80102d80:	0f 8e 87 00 00 00    	jle    80102e0d <log_write+0xbd>
80102d86:	83 ec 0c             	sub    $0xc,%esp
80102d89:	68 40 30 11 80       	push   $0x80113040
80102d8e:	e8 2d 16 00 00       	call   801043c0 <acquire>
80102d93:	8b 0d 88 30 11 80    	mov    0x80113088,%ecx
80102d99:	83 c4 10             	add    $0x10,%esp
80102d9c:	83 f9 00             	cmp    $0x0,%ecx
80102d9f:	7e 50                	jle    80102df1 <log_write+0xa1>
80102da1:	8b 53 08             	mov    0x8(%ebx),%edx
80102da4:	31 c0                	xor    %eax,%eax
80102da6:	3b 15 8c 30 11 80    	cmp    0x8011308c,%edx
80102dac:	75 0b                	jne    80102db9 <log_write+0x69>
80102dae:	eb 38                	jmp    80102de8 <log_write+0x98>
80102db0:	39 14 85 8c 30 11 80 	cmp    %edx,-0x7feecf74(,%eax,4)
80102db7:	74 2f                	je     80102de8 <log_write+0x98>
80102db9:	83 c0 01             	add    $0x1,%eax
80102dbc:	39 c8                	cmp    %ecx,%eax
80102dbe:	75 f0                	jne    80102db0 <log_write+0x60>
80102dc0:	89 14 85 8c 30 11 80 	mov    %edx,-0x7feecf74(,%eax,4)
80102dc7:	83 c0 01             	add    $0x1,%eax
80102dca:	a3 88 30 11 80       	mov    %eax,0x80113088
80102dcf:	83 0b 04             	orl    $0x4,(%ebx)
80102dd2:	c7 45 08 40 30 11 80 	movl   $0x80113040,0x8(%ebp)
80102dd9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102ddc:	c9                   	leave  
80102ddd:	e9 8e 16 00 00       	jmp    80104470 <release>
80102de2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102de8:	89 14 85 8c 30 11 80 	mov    %edx,-0x7feecf74(,%eax,4)
80102def:	eb de                	jmp    80102dcf <log_write+0x7f>
80102df1:	8b 43 08             	mov    0x8(%ebx),%eax
80102df4:	a3 8c 30 11 80       	mov    %eax,0x8011308c
80102df9:	75 d4                	jne    80102dcf <log_write+0x7f>
80102dfb:	31 c0                	xor    %eax,%eax
80102dfd:	eb c8                	jmp    80102dc7 <log_write+0x77>
80102dff:	90                   	nop
80102e00:	83 ec 0c             	sub    $0xc,%esp
80102e03:	68 f3 75 10 80       	push   $0x801075f3
80102e08:	e8 63 d5 ff ff       	call   80100370 <panic>
80102e0d:	83 ec 0c             	sub    $0xc,%esp
80102e10:	68 09 76 10 80       	push   $0x80107609
80102e15:	e8 56 d5 ff ff       	call   80100370 <panic>
80102e1a:	66 90                	xchg   %ax,%ax
80102e1c:	66 90                	xchg   %ax,%ax
80102e1e:	66 90                	xchg   %ax,%ax

80102e20 <mpmain>:
}

// Common CPU setup code.
static void
mpmain(void)
{
80102e20:	55                   	push   %ebp
80102e21:	89 e5                	mov    %esp,%ebp
80102e23:	53                   	push   %ebx
80102e24:	83 ec 04             	sub    $0x4,%esp
  cprintf("cpu%d: starting %d\n", cpuid(), cpuid());
80102e27:	e8 54 09 00 00       	call   80103780 <cpuid>
80102e2c:	89 c3                	mov    %eax,%ebx
80102e2e:	e8 4d 09 00 00       	call   80103780 <cpuid>
80102e33:	83 ec 04             	sub    $0x4,%esp
80102e36:	53                   	push   %ebx
80102e37:	50                   	push   %eax
80102e38:	68 24 76 10 80       	push   $0x80107624
80102e3d:	e8 1e d8 ff ff       	call   80100660 <cprintf>
  idtinit();       // load idt register
80102e42:	e8 49 29 00 00       	call   80105790 <idtinit>
  xchg(&(mycpu()->started), 1); // tell startothers() we're up
80102e47:	e8 b4 08 00 00       	call   80103700 <mycpu>
80102e4c:	89 c2                	mov    %eax,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80102e4e:	b8 01 00 00 00       	mov    $0x1,%eax
80102e53:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
  scheduler();     // start running processes
80102e5a:	e8 21 0c 00 00       	call   80103a80 <scheduler>
80102e5f:	90                   	nop

80102e60 <mpenter>:
{
80102e60:	55                   	push   %ebp
80102e61:	89 e5                	mov    %esp,%ebp
80102e63:	83 ec 08             	sub    $0x8,%esp
  switchkvm();
80102e66:	e8 45 3a 00 00       	call   801068b0 <switchkvm>
  seginit();
80102e6b:	e8 40 39 00 00       	call   801067b0 <seginit>
  lapicinit();
80102e70:	e8 8b f7 ff ff       	call   80102600 <lapicinit>
  mpmain();
80102e75:	e8 a6 ff ff ff       	call   80102e20 <mpmain>
80102e7a:	66 90                	xchg   %ax,%ax
80102e7c:	66 90                	xchg   %ax,%ax
80102e7e:	66 90                	xchg   %ax,%ax

80102e80 <main>:
{
80102e80:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102e84:	83 e4 f0             	and    $0xfffffff0,%esp
80102e87:	ff 71 fc             	pushl  -0x4(%ecx)
80102e8a:	55                   	push   %ebp
80102e8b:	89 e5                	mov    %esp,%ebp
80102e8d:	53                   	push   %ebx
80102e8e:	51                   	push   %ecx
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);

  for(c = cpus; c < cpus+ncpu; c++){
80102e8f:	bb 40 31 11 80       	mov    $0x80113140,%ebx
  kinit1(end, P2V(4*1024*1024)); // phys page allocator
80102e94:	83 ec 08             	sub    $0x8,%esp
80102e97:	68 00 00 40 80       	push   $0x80400000
80102e9c:	68 68 61 11 80       	push   $0x80116168
80102ea1:	e8 1a f5 ff ff       	call   801023c0 <kinit1>
  kvmalloc();      // kernel page table
80102ea6:	e8 95 3e 00 00       	call   80106d40 <kvmalloc>
  mpinit();        // detect other processors
80102eab:	e8 60 01 00 00       	call   80103010 <mpinit>
  lapicinit();     // interrupt controller
80102eb0:	e8 4b f7 ff ff       	call   80102600 <lapicinit>
  seginit();       // segment descriptors
80102eb5:	e8 f6 38 00 00       	call   801067b0 <seginit>
  picinit();       // disable pic
80102eba:	e8 21 03 00 00       	call   801031e0 <picinit>
  ioapicinit();    // another interrupt controller
80102ebf:	e8 2c f3 ff ff       	call   801021f0 <ioapicinit>
  consoleinit();   // console hardware
80102ec4:	e8 c7 da ff ff       	call   80100990 <consoleinit>
  uartinit();      // serial port
80102ec9:	e8 b2 2b 00 00       	call   80105a80 <uartinit>
  pinit();         // process table
80102ece:	e8 fd 07 00 00       	call   801036d0 <pinit>
  tvinit();        // trap vectors
80102ed3:	e8 18 28 00 00       	call   801056f0 <tvinit>
  binit();         // buffer cache
80102ed8:	e8 63 d1 ff ff       	call   80100040 <binit>
  fileinit();      // file table
80102edd:	e8 5e de ff ff       	call   80100d40 <fileinit>
  ideinit();       // disk 
80102ee2:	e8 e9 f0 ff ff       	call   80101fd0 <ideinit>
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80102ee7:	83 c4 0c             	add    $0xc,%esp
80102eea:	68 8a 00 00 00       	push   $0x8a
80102eef:	68 90 a4 10 80       	push   $0x8010a490
80102ef4:	68 00 70 00 80       	push   $0x80007000
80102ef9:	e8 72 16 00 00       	call   80104570 <memmove>
  for(c = cpus; c < cpus+ncpu; c++){
80102efe:	69 05 c0 36 11 80 b0 	imul   $0xb0,0x801136c0,%eax
80102f05:	00 00 00 
80102f08:	83 c4 10             	add    $0x10,%esp
80102f0b:	05 40 31 11 80       	add    $0x80113140,%eax
80102f10:	39 d8                	cmp    %ebx,%eax
80102f12:	76 6f                	jbe    80102f83 <main+0x103>
80102f14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(c == mycpu())  // We've started already.
80102f18:	e8 e3 07 00 00       	call   80103700 <mycpu>
80102f1d:	39 d8                	cmp    %ebx,%eax
80102f1f:	74 49                	je     80102f6a <main+0xea>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
80102f21:	e8 6a f5 ff ff       	call   80102490 <kalloc>
    *(void**)(code-4) = stack + KSTACKSIZE;
80102f26:	05 00 10 00 00       	add    $0x1000,%eax
    *(void(**)(void))(code-8) = mpenter;
80102f2b:	c7 05 f8 6f 00 80 60 	movl   $0x80102e60,0x80006ff8
80102f32:	2e 10 80 
    *(int**)(code-12) = (void *) V2P(entrypgdir);
80102f35:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80102f3c:	90 10 00 
    *(void**)(code-4) = stack + KSTACKSIZE;
80102f3f:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc

    lapicstartap(c->apicid, V2P(code));
80102f44:	0f b6 03             	movzbl (%ebx),%eax
80102f47:	83 ec 08             	sub    $0x8,%esp
80102f4a:	68 00 70 00 00       	push   $0x7000
80102f4f:	50                   	push   %eax
80102f50:	e8 fb f7 ff ff       	call   80102750 <lapicstartap>
80102f55:	83 c4 10             	add    $0x10,%esp
80102f58:	90                   	nop
80102f59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    // wait for cpu to finish mpmain()
    while(c->started == 0)
80102f60:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80102f66:	85 c0                	test   %eax,%eax
80102f68:	74 f6                	je     80102f60 <main+0xe0>
  for(c = cpus; c < cpus+ncpu; c++){
80102f6a:	69 05 c0 36 11 80 b0 	imul   $0xb0,0x801136c0,%eax
80102f71:	00 00 00 
80102f74:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
80102f7a:	05 40 31 11 80       	add    $0x80113140,%eax
80102f7f:	39 c3                	cmp    %eax,%ebx
80102f81:	72 95                	jb     80102f18 <main+0x98>
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
80102f83:	83 ec 08             	sub    $0x8,%esp
80102f86:	68 00 00 00 8e       	push   $0x8e000000
80102f8b:	68 00 00 40 80       	push   $0x80400000
80102f90:	e8 9b f4 ff ff       	call   80102430 <kinit2>
  userinit();      // first user process
80102f95:	e8 36 08 00 00       	call   801037d0 <userinit>
  mpmain();        // finish this processor's setup
80102f9a:	e8 81 fe ff ff       	call   80102e20 <mpmain>
80102f9f:	90                   	nop

80102fa0 <mpsearch1>:
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102fa0:	55                   	push   %ebp
80102fa1:	89 e5                	mov    %esp,%ebp
80102fa3:	57                   	push   %edi
80102fa4:	56                   	push   %esi
  uchar *e, *p, *addr;

  addr = P2V(a);
80102fa5:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
{
80102fab:	53                   	push   %ebx
  e = addr+len;
80102fac:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
{
80102faf:	83 ec 0c             	sub    $0xc,%esp
  for(p = addr; p < e; p += sizeof(struct mp))
80102fb2:	39 de                	cmp    %ebx,%esi
80102fb4:	73 40                	jae    80102ff6 <mpsearch1+0x56>
80102fb6:	8d 76 00             	lea    0x0(%esi),%esi
80102fb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80102fc0:	83 ec 04             	sub    $0x4,%esp
80102fc3:	8d 7e 10             	lea    0x10(%esi),%edi
80102fc6:	6a 04                	push   $0x4
80102fc8:	68 38 76 10 80       	push   $0x80107638
80102fcd:	56                   	push   %esi
80102fce:	e8 3d 15 00 00       	call   80104510 <memcmp>
80102fd3:	83 c4 10             	add    $0x10,%esp
80102fd6:	85 c0                	test   %eax,%eax
80102fd8:	75 16                	jne    80102ff0 <mpsearch1+0x50>
80102fda:	8d 7e 10             	lea    0x10(%esi),%edi
80102fdd:	89 f2                	mov    %esi,%edx
80102fdf:	90                   	nop
    sum += addr[i];
80102fe0:	0f b6 0a             	movzbl (%edx),%ecx
80102fe3:	83 c2 01             	add    $0x1,%edx
80102fe6:	01 c8                	add    %ecx,%eax
  for(i=0; i<len; i++)
80102fe8:	39 fa                	cmp    %edi,%edx
80102fea:	75 f4                	jne    80102fe0 <mpsearch1+0x40>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80102fec:	84 c0                	test   %al,%al
80102fee:	74 10                	je     80103000 <mpsearch1+0x60>
  for(p = addr; p < e; p += sizeof(struct mp))
80102ff0:	39 fb                	cmp    %edi,%ebx
80102ff2:	89 fe                	mov    %edi,%esi
80102ff4:	77 ca                	ja     80102fc0 <mpsearch1+0x20>
      return (struct mp*)p;
  return 0;
}
80102ff6:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80102ff9:	31 c0                	xor    %eax,%eax
}
80102ffb:	5b                   	pop    %ebx
80102ffc:	5e                   	pop    %esi
80102ffd:	5f                   	pop    %edi
80102ffe:	5d                   	pop    %ebp
80102fff:	c3                   	ret    
80103000:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103003:	89 f0                	mov    %esi,%eax
80103005:	5b                   	pop    %ebx
80103006:	5e                   	pop    %esi
80103007:	5f                   	pop    %edi
80103008:	5d                   	pop    %ebp
80103009:	c3                   	ret    
8010300a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103010 <mpinit>:
  return conf;
}

void
mpinit(void)
{
80103010:	55                   	push   %ebp
80103011:	89 e5                	mov    %esp,%ebp
80103013:	57                   	push   %edi
80103014:	56                   	push   %esi
80103015:	53                   	push   %ebx
80103016:	83 ec 1c             	sub    $0x1c,%esp
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
80103019:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103020:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80103027:	c1 e0 08             	shl    $0x8,%eax
8010302a:	09 d0                	or     %edx,%eax
8010302c:	c1 e0 04             	shl    $0x4,%eax
8010302f:	85 c0                	test   %eax,%eax
80103031:	75 1b                	jne    8010304e <mpinit+0x3e>
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
80103033:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
8010303a:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80103041:	c1 e0 08             	shl    $0x8,%eax
80103044:	09 d0                	or     %edx,%eax
80103046:	c1 e0 0a             	shl    $0xa,%eax
    if((mp = mpsearch1(p-1024, 1024)))
80103049:	2d 00 04 00 00       	sub    $0x400,%eax
    if((mp = mpsearch1(p, 1024)))
8010304e:	ba 00 04 00 00       	mov    $0x400,%edx
80103053:	e8 48 ff ff ff       	call   80102fa0 <mpsearch1>
80103058:	85 c0                	test   %eax,%eax
8010305a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010305d:	0f 84 37 01 00 00    	je     8010319a <mpinit+0x18a>
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103063:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103066:	8b 58 04             	mov    0x4(%eax),%ebx
80103069:	85 db                	test   %ebx,%ebx
8010306b:	0f 84 43 01 00 00    	je     801031b4 <mpinit+0x1a4>
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
80103071:	8d b3 00 00 00 80    	lea    -0x80000000(%ebx),%esi
  if(memcmp(conf, "PCMP", 4) != 0)
80103077:	83 ec 04             	sub    $0x4,%esp
8010307a:	6a 04                	push   $0x4
8010307c:	68 55 76 10 80       	push   $0x80107655
80103081:	56                   	push   %esi
80103082:	e8 89 14 00 00       	call   80104510 <memcmp>
80103087:	83 c4 10             	add    $0x10,%esp
8010308a:	85 c0                	test   %eax,%eax
8010308c:	0f 85 22 01 00 00    	jne    801031b4 <mpinit+0x1a4>
  if(conf->version != 1 && conf->version != 4)
80103092:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
80103099:	3c 01                	cmp    $0x1,%al
8010309b:	74 08                	je     801030a5 <mpinit+0x95>
8010309d:	3c 04                	cmp    $0x4,%al
8010309f:	0f 85 0f 01 00 00    	jne    801031b4 <mpinit+0x1a4>
  if(sum((uchar*)conf, conf->length) != 0)
801030a5:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
  for(i=0; i<len; i++)
801030ac:	85 ff                	test   %edi,%edi
801030ae:	74 21                	je     801030d1 <mpinit+0xc1>
801030b0:	31 d2                	xor    %edx,%edx
801030b2:	31 c0                	xor    %eax,%eax
801030b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    sum += addr[i];
801030b8:	0f b6 8c 03 00 00 00 	movzbl -0x80000000(%ebx,%eax,1),%ecx
801030bf:	80 
  for(i=0; i<len; i++)
801030c0:	83 c0 01             	add    $0x1,%eax
    sum += addr[i];
801030c3:	01 ca                	add    %ecx,%edx
  for(i=0; i<len; i++)
801030c5:	39 c7                	cmp    %eax,%edi
801030c7:	75 ef                	jne    801030b8 <mpinit+0xa8>
  if(sum((uchar*)conf, conf->length) != 0)
801030c9:	84 d2                	test   %dl,%dl
801030cb:	0f 85 e3 00 00 00    	jne    801031b4 <mpinit+0x1a4>
  struct mp *mp;
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
801030d1:	85 f6                	test   %esi,%esi
801030d3:	0f 84 db 00 00 00    	je     801031b4 <mpinit+0x1a4>
    panic("Expect to run on an SMP");
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
801030d9:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
801030df:	a3 3c 30 11 80       	mov    %eax,0x8011303c
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801030e4:	0f b7 93 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edx
801030eb:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
  ismp = 1;
801030f1:	bb 01 00 00 00       	mov    $0x1,%ebx
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801030f6:	01 d6                	add    %edx,%esi
801030f8:	90                   	nop
801030f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103100:	39 c6                	cmp    %eax,%esi
80103102:	76 23                	jbe    80103127 <mpinit+0x117>
80103104:	0f b6 10             	movzbl (%eax),%edx
    switch(*p){
80103107:	80 fa 04             	cmp    $0x4,%dl
8010310a:	0f 87 c0 00 00 00    	ja     801031d0 <mpinit+0x1c0>
80103110:	ff 24 95 7c 76 10 80 	jmp    *-0x7fef8984(,%edx,4)
80103117:	89 f6                	mov    %esi,%esi
80103119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      p += sizeof(struct mpioapic);
      continue;
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
80103120:	83 c0 08             	add    $0x8,%eax
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
80103123:	39 c6                	cmp    %eax,%esi
80103125:	77 dd                	ja     80103104 <mpinit+0xf4>
    default:
      ismp = 0;
      break;
    }
  }
  if(!ismp)
80103127:	85 db                	test   %ebx,%ebx
80103129:	0f 84 92 00 00 00    	je     801031c1 <mpinit+0x1b1>
    panic("Didn't find a suitable machine");

  if(mp->imcrp){
8010312f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103132:	80 78 0c 00          	cmpb   $0x0,0xc(%eax)
80103136:	74 15                	je     8010314d <mpinit+0x13d>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103138:	ba 22 00 00 00       	mov    $0x22,%edx
8010313d:	b8 70 00 00 00       	mov    $0x70,%eax
80103142:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80103143:	ba 23 00 00 00       	mov    $0x23,%edx
80103148:	ec                   	in     (%dx),%al
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
80103149:	83 c8 01             	or     $0x1,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010314c:	ee                   	out    %al,(%dx)
  }
}
8010314d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103150:	5b                   	pop    %ebx
80103151:	5e                   	pop    %esi
80103152:	5f                   	pop    %edi
80103153:	5d                   	pop    %ebp
80103154:	c3                   	ret    
80103155:	8d 76 00             	lea    0x0(%esi),%esi
      if(ncpu < NCPU) {
80103158:	8b 0d c0 36 11 80    	mov    0x801136c0,%ecx
8010315e:	83 f9 07             	cmp    $0x7,%ecx
80103161:	7f 19                	jg     8010317c <mpinit+0x16c>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
80103163:	0f b6 50 01          	movzbl 0x1(%eax),%edx
80103167:	69 f9 b0 00 00 00    	imul   $0xb0,%ecx,%edi
        ncpu++;
8010316d:	83 c1 01             	add    $0x1,%ecx
80103170:	89 0d c0 36 11 80    	mov    %ecx,0x801136c0
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
80103176:	88 97 40 31 11 80    	mov    %dl,-0x7feecec0(%edi)
      p += sizeof(struct mpproc);
8010317c:	83 c0 14             	add    $0x14,%eax
      continue;
8010317f:	e9 7c ff ff ff       	jmp    80103100 <mpinit+0xf0>
80103184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      ioapicid = ioapic->apicno;
80103188:	0f b6 50 01          	movzbl 0x1(%eax),%edx
      p += sizeof(struct mpioapic);
8010318c:	83 c0 08             	add    $0x8,%eax
      ioapicid = ioapic->apicno;
8010318f:	88 15 20 31 11 80    	mov    %dl,0x80113120
      continue;
80103195:	e9 66 ff ff ff       	jmp    80103100 <mpinit+0xf0>
  return mpsearch1(0xF0000, 0x10000);
8010319a:	ba 00 00 01 00       	mov    $0x10000,%edx
8010319f:	b8 00 00 0f 00       	mov    $0xf0000,%eax
801031a4:	e8 f7 fd ff ff       	call   80102fa0 <mpsearch1>
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
801031a9:	85 c0                	test   %eax,%eax
  return mpsearch1(0xF0000, 0x10000);
801031ab:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
801031ae:	0f 85 af fe ff ff    	jne    80103063 <mpinit+0x53>
    panic("Expect to run on an SMP");
801031b4:	83 ec 0c             	sub    $0xc,%esp
801031b7:	68 3d 76 10 80       	push   $0x8010763d
801031bc:	e8 af d1 ff ff       	call   80100370 <panic>
    panic("Didn't find a suitable machine");
801031c1:	83 ec 0c             	sub    $0xc,%esp
801031c4:	68 5c 76 10 80       	push   $0x8010765c
801031c9:	e8 a2 d1 ff ff       	call   80100370 <panic>
801031ce:	66 90                	xchg   %ax,%ax
      ismp = 0;
801031d0:	31 db                	xor    %ebx,%ebx
801031d2:	e9 30 ff ff ff       	jmp    80103107 <mpinit+0xf7>
801031d7:	66 90                	xchg   %ax,%ax
801031d9:	66 90                	xchg   %ax,%ax
801031db:	66 90                	xchg   %ax,%ax
801031dd:	66 90                	xchg   %ax,%ax
801031df:	90                   	nop

801031e0 <picinit>:
801031e0:	55                   	push   %ebp
801031e1:	ba 21 00 00 00       	mov    $0x21,%edx
801031e6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801031eb:	89 e5                	mov    %esp,%ebp
801031ed:	ee                   	out    %al,(%dx)
801031ee:	ba a1 00 00 00       	mov    $0xa1,%edx
801031f3:	ee                   	out    %al,(%dx)
801031f4:	5d                   	pop    %ebp
801031f5:	c3                   	ret    
801031f6:	66 90                	xchg   %ax,%ax
801031f8:	66 90                	xchg   %ax,%ax
801031fa:	66 90                	xchg   %ax,%ax
801031fc:	66 90                	xchg   %ax,%ax
801031fe:	66 90                	xchg   %ax,%ax

80103200 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
80103200:	55                   	push   %ebp
80103201:	89 e5                	mov    %esp,%ebp
80103203:	57                   	push   %edi
80103204:	56                   	push   %esi
80103205:	53                   	push   %ebx
80103206:	83 ec 0c             	sub    $0xc,%esp
80103209:	8b 75 08             	mov    0x8(%ebp),%esi
8010320c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  struct pipe *p;

  p = 0;
  *f0 = *f1 = 0;
8010320f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103215:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
8010321b:	e8 40 db ff ff       	call   80100d60 <filealloc>
80103220:	85 c0                	test   %eax,%eax
80103222:	89 06                	mov    %eax,(%esi)
80103224:	0f 84 a8 00 00 00    	je     801032d2 <pipealloc+0xd2>
8010322a:	e8 31 db ff ff       	call   80100d60 <filealloc>
8010322f:	85 c0                	test   %eax,%eax
80103231:	89 03                	mov    %eax,(%ebx)
80103233:	0f 84 87 00 00 00    	je     801032c0 <pipealloc+0xc0>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
80103239:	e8 52 f2 ff ff       	call   80102490 <kalloc>
8010323e:	85 c0                	test   %eax,%eax
80103240:	89 c7                	mov    %eax,%edi
80103242:	0f 84 b0 00 00 00    	je     801032f8 <pipealloc+0xf8>
    goto bad;
  p->readopen = 1;
  p->writeopen = 1;
  p->nwrite = 0;
  p->nread = 0;
  initlock(&p->lock, "pipe");
80103248:	83 ec 08             	sub    $0x8,%esp
  p->readopen = 1;
8010324b:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
80103252:	00 00 00 
  p->writeopen = 1;
80103255:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
8010325c:	00 00 00 
  p->nwrite = 0;
8010325f:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80103266:	00 00 00 
  p->nread = 0;
80103269:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103270:	00 00 00 
  initlock(&p->lock, "pipe");
80103273:	68 90 76 10 80       	push   $0x80107690
80103278:	50                   	push   %eax
80103279:	e8 e2 0f 00 00       	call   80104260 <initlock>
  (*f0)->type = FD_PIPE;
8010327e:	8b 06                	mov    (%esi),%eax
  (*f0)->pipe = p;
  (*f1)->type = FD_PIPE;
  (*f1)->readable = 0;
  (*f1)->writable = 1;
  (*f1)->pipe = p;
  return 0;
80103280:	83 c4 10             	add    $0x10,%esp
  (*f0)->type = FD_PIPE;
80103283:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
80103289:	8b 06                	mov    (%esi),%eax
8010328b:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
8010328f:	8b 06                	mov    (%esi),%eax
80103291:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
80103295:	8b 06                	mov    (%esi),%eax
80103297:	89 78 0c             	mov    %edi,0xc(%eax)
  (*f1)->type = FD_PIPE;
8010329a:	8b 03                	mov    (%ebx),%eax
8010329c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
801032a2:	8b 03                	mov    (%ebx),%eax
801032a4:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
801032a8:	8b 03                	mov    (%ebx),%eax
801032aa:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
801032ae:	8b 03                	mov    (%ebx),%eax
801032b0:	89 78 0c             	mov    %edi,0xc(%eax)
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
801032b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
801032b6:	31 c0                	xor    %eax,%eax
}
801032b8:	5b                   	pop    %ebx
801032b9:	5e                   	pop    %esi
801032ba:	5f                   	pop    %edi
801032bb:	5d                   	pop    %ebp
801032bc:	c3                   	ret    
801032bd:	8d 76 00             	lea    0x0(%esi),%esi
  if(*f0)
801032c0:	8b 06                	mov    (%esi),%eax
801032c2:	85 c0                	test   %eax,%eax
801032c4:	74 1e                	je     801032e4 <pipealloc+0xe4>
    fileclose(*f0);
801032c6:	83 ec 0c             	sub    $0xc,%esp
801032c9:	50                   	push   %eax
801032ca:	e8 51 db ff ff       	call   80100e20 <fileclose>
801032cf:	83 c4 10             	add    $0x10,%esp
  if(*f1)
801032d2:	8b 03                	mov    (%ebx),%eax
801032d4:	85 c0                	test   %eax,%eax
801032d6:	74 0c                	je     801032e4 <pipealloc+0xe4>
    fileclose(*f1);
801032d8:	83 ec 0c             	sub    $0xc,%esp
801032db:	50                   	push   %eax
801032dc:	e8 3f db ff ff       	call   80100e20 <fileclose>
801032e1:	83 c4 10             	add    $0x10,%esp
}
801032e4:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return -1;
801032e7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801032ec:	5b                   	pop    %ebx
801032ed:	5e                   	pop    %esi
801032ee:	5f                   	pop    %edi
801032ef:	5d                   	pop    %ebp
801032f0:	c3                   	ret    
801032f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(*f0)
801032f8:	8b 06                	mov    (%esi),%eax
801032fa:	85 c0                	test   %eax,%eax
801032fc:	75 c8                	jne    801032c6 <pipealloc+0xc6>
801032fe:	eb d2                	jmp    801032d2 <pipealloc+0xd2>

80103300 <pipeclose>:

void
pipeclose(struct pipe *p, int writable)
{
80103300:	55                   	push   %ebp
80103301:	89 e5                	mov    %esp,%ebp
80103303:	56                   	push   %esi
80103304:	53                   	push   %ebx
80103305:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103308:	8b 75 0c             	mov    0xc(%ebp),%esi
  acquire(&p->lock);
8010330b:	83 ec 0c             	sub    $0xc,%esp
8010330e:	53                   	push   %ebx
8010330f:	e8 ac 10 00 00       	call   801043c0 <acquire>
  if(writable){
80103314:	83 c4 10             	add    $0x10,%esp
80103317:	85 f6                	test   %esi,%esi
80103319:	74 45                	je     80103360 <pipeclose+0x60>
    p->writeopen = 0;
    wakeup(&p->nread);
8010331b:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103321:	83 ec 0c             	sub    $0xc,%esp
    p->writeopen = 0;
80103324:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
8010332b:	00 00 00 
    wakeup(&p->nread);
8010332e:	50                   	push   %eax
8010332f:	e8 3c 0c 00 00       	call   80103f70 <wakeup>
80103334:	83 c4 10             	add    $0x10,%esp
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
80103337:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
8010333d:	85 d2                	test   %edx,%edx
8010333f:	75 0a                	jne    8010334b <pipeclose+0x4b>
80103341:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
80103347:	85 c0                	test   %eax,%eax
80103349:	74 35                	je     80103380 <pipeclose+0x80>
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
8010334b:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
8010334e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103351:	5b                   	pop    %ebx
80103352:	5e                   	pop    %esi
80103353:	5d                   	pop    %ebp
    release(&p->lock);
80103354:	e9 17 11 00 00       	jmp    80104470 <release>
80103359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wakeup(&p->nwrite);
80103360:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80103366:	83 ec 0c             	sub    $0xc,%esp
    p->readopen = 0;
80103369:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103370:	00 00 00 
    wakeup(&p->nwrite);
80103373:	50                   	push   %eax
80103374:	e8 f7 0b 00 00       	call   80103f70 <wakeup>
80103379:	83 c4 10             	add    $0x10,%esp
8010337c:	eb b9                	jmp    80103337 <pipeclose+0x37>
8010337e:	66 90                	xchg   %ax,%ax
    release(&p->lock);
80103380:	83 ec 0c             	sub    $0xc,%esp
80103383:	53                   	push   %ebx
80103384:	e8 e7 10 00 00       	call   80104470 <release>
    kfree((char*)p);
80103389:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010338c:	83 c4 10             	add    $0x10,%esp
}
8010338f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103392:	5b                   	pop    %ebx
80103393:	5e                   	pop    %esi
80103394:	5d                   	pop    %ebp
    kfree((char*)p);
80103395:	e9 46 ef ff ff       	jmp    801022e0 <kfree>
8010339a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801033a0 <pipewrite>:

//PAGEBREAK: 40
int
pipewrite(struct pipe *p, char *addr, int n)
{
801033a0:	55                   	push   %ebp
801033a1:	89 e5                	mov    %esp,%ebp
801033a3:	57                   	push   %edi
801033a4:	56                   	push   %esi
801033a5:	53                   	push   %ebx
801033a6:	83 ec 28             	sub    $0x28,%esp
801033a9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  acquire(&p->lock);
801033ac:	53                   	push   %ebx
801033ad:	e8 0e 10 00 00       	call   801043c0 <acquire>
  for(i = 0; i < n; i++){
801033b2:	8b 45 10             	mov    0x10(%ebp),%eax
801033b5:	83 c4 10             	add    $0x10,%esp
801033b8:	85 c0                	test   %eax,%eax
801033ba:	0f 8e ca 00 00 00    	jle    8010348a <pipewrite+0xea>
801033c0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801033c3:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
      if(p->readopen == 0 || myproc()->killed){
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
801033c9:	8d bb 34 02 00 00    	lea    0x234(%ebx),%edi
801033cf:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801033d2:	03 4d 10             	add    0x10(%ebp),%ecx
801033d5:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801033d8:	8b 8b 34 02 00 00    	mov    0x234(%ebx),%ecx
801033de:	8d 91 00 02 00 00    	lea    0x200(%ecx),%edx
801033e4:	39 d0                	cmp    %edx,%eax
801033e6:	75 71                	jne    80103459 <pipewrite+0xb9>
      if(p->readopen == 0 || myproc()->killed){
801033e8:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
801033ee:	85 c0                	test   %eax,%eax
801033f0:	74 4e                	je     80103440 <pipewrite+0xa0>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
801033f2:	8d b3 38 02 00 00    	lea    0x238(%ebx),%esi
801033f8:	eb 3a                	jmp    80103434 <pipewrite+0x94>
801033fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      wakeup(&p->nread);
80103400:	83 ec 0c             	sub    $0xc,%esp
80103403:	57                   	push   %edi
80103404:	e8 67 0b 00 00       	call   80103f70 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
80103409:	5a                   	pop    %edx
8010340a:	59                   	pop    %ecx
8010340b:	53                   	push   %ebx
8010340c:	56                   	push   %esi
8010340d:	e8 9e 09 00 00       	call   80103db0 <sleep>
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103412:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
80103418:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
8010341e:	83 c4 10             	add    $0x10,%esp
80103421:	05 00 02 00 00       	add    $0x200,%eax
80103426:	39 c2                	cmp    %eax,%edx
80103428:	75 36                	jne    80103460 <pipewrite+0xc0>
      if(p->readopen == 0 || myproc()->killed){
8010342a:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
80103430:	85 c0                	test   %eax,%eax
80103432:	74 0c                	je     80103440 <pipewrite+0xa0>
80103434:	e8 67 03 00 00       	call   801037a0 <myproc>
80103439:	8b 40 24             	mov    0x24(%eax),%eax
8010343c:	85 c0                	test   %eax,%eax
8010343e:	74 c0                	je     80103400 <pipewrite+0x60>
        release(&p->lock);
80103440:	83 ec 0c             	sub    $0xc,%esp
80103443:	53                   	push   %ebx
80103444:	e8 27 10 00 00       	call   80104470 <release>
        return -1;
80103449:	83 c4 10             	add    $0x10,%esp
8010344c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
  release(&p->lock);
  return n;
}
80103451:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103454:	5b                   	pop    %ebx
80103455:	5e                   	pop    %esi
80103456:	5f                   	pop    %edi
80103457:	5d                   	pop    %ebp
80103458:	c3                   	ret    
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103459:	89 c2                	mov    %eax,%edx
8010345b:	90                   	nop
8010345c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
80103460:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80103463:	8d 42 01             	lea    0x1(%edx),%eax
80103466:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
8010346c:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
80103472:	0f b6 0e             	movzbl (%esi),%ecx
80103475:	88 4c 13 34          	mov    %cl,0x34(%ebx,%edx,1)
80103479:	89 f1                	mov    %esi,%ecx
8010347b:	83 c1 01             	add    $0x1,%ecx
  for(i = 0; i < n; i++){
8010347e:	3b 4d e0             	cmp    -0x20(%ebp),%ecx
80103481:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80103484:	0f 85 4e ff ff ff    	jne    801033d8 <pipewrite+0x38>
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
8010348a:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103490:	83 ec 0c             	sub    $0xc,%esp
80103493:	50                   	push   %eax
80103494:	e8 d7 0a 00 00       	call   80103f70 <wakeup>
  release(&p->lock);
80103499:	89 1c 24             	mov    %ebx,(%esp)
8010349c:	e8 cf 0f 00 00       	call   80104470 <release>
  return n;
801034a1:	83 c4 10             	add    $0x10,%esp
801034a4:	8b 45 10             	mov    0x10(%ebp),%eax
801034a7:	eb a8                	jmp    80103451 <pipewrite+0xb1>
801034a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801034b0 <piperead>:

int
piperead(struct pipe *p, char *addr, int n)
{
801034b0:	55                   	push   %ebp
801034b1:	89 e5                	mov    %esp,%ebp
801034b3:	57                   	push   %edi
801034b4:	56                   	push   %esi
801034b5:	53                   	push   %ebx
801034b6:	83 ec 18             	sub    $0x18,%esp
801034b9:	8b 75 08             	mov    0x8(%ebp),%esi
801034bc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  acquire(&p->lock);
801034bf:	56                   	push   %esi
801034c0:	e8 fb 0e 00 00       	call   801043c0 <acquire>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
801034c5:	83 c4 10             	add    $0x10,%esp
801034c8:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
801034ce:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
801034d4:	75 6a                	jne    80103540 <piperead+0x90>
801034d6:	8b 9e 40 02 00 00    	mov    0x240(%esi),%ebx
801034dc:	85 db                	test   %ebx,%ebx
801034de:	0f 84 c4 00 00 00    	je     801035a8 <piperead+0xf8>
    if(myproc()->killed){
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
801034e4:	8d 9e 34 02 00 00    	lea    0x234(%esi),%ebx
801034ea:	eb 2d                	jmp    80103519 <piperead+0x69>
801034ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801034f0:	83 ec 08             	sub    $0x8,%esp
801034f3:	56                   	push   %esi
801034f4:	53                   	push   %ebx
801034f5:	e8 b6 08 00 00       	call   80103db0 <sleep>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
801034fa:	83 c4 10             	add    $0x10,%esp
801034fd:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
80103503:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
80103509:	75 35                	jne    80103540 <piperead+0x90>
8010350b:	8b 96 40 02 00 00    	mov    0x240(%esi),%edx
80103511:	85 d2                	test   %edx,%edx
80103513:	0f 84 8f 00 00 00    	je     801035a8 <piperead+0xf8>
    if(myproc()->killed){
80103519:	e8 82 02 00 00       	call   801037a0 <myproc>
8010351e:	8b 48 24             	mov    0x24(%eax),%ecx
80103521:	85 c9                	test   %ecx,%ecx
80103523:	74 cb                	je     801034f0 <piperead+0x40>
      release(&p->lock);
80103525:	83 ec 0c             	sub    $0xc,%esp
      return -1;
80103528:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
      release(&p->lock);
8010352d:	56                   	push   %esi
8010352e:	e8 3d 0f 00 00       	call   80104470 <release>
      return -1;
80103533:	83 c4 10             	add    $0x10,%esp
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
80103536:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103539:	89 d8                	mov    %ebx,%eax
8010353b:	5b                   	pop    %ebx
8010353c:	5e                   	pop    %esi
8010353d:	5f                   	pop    %edi
8010353e:	5d                   	pop    %ebp
8010353f:	c3                   	ret    
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103540:	8b 45 10             	mov    0x10(%ebp),%eax
80103543:	85 c0                	test   %eax,%eax
80103545:	7e 61                	jle    801035a8 <piperead+0xf8>
    if(p->nread == p->nwrite)
80103547:	31 db                	xor    %ebx,%ebx
80103549:	eb 13                	jmp    8010355e <piperead+0xae>
8010354b:	90                   	nop
8010354c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103550:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
80103556:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
8010355c:	74 1f                	je     8010357d <piperead+0xcd>
    addr[i] = p->data[p->nread++ % PIPESIZE];
8010355e:	8d 41 01             	lea    0x1(%ecx),%eax
80103561:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
80103567:	89 86 34 02 00 00    	mov    %eax,0x234(%esi)
8010356d:	0f b6 44 0e 34       	movzbl 0x34(%esi,%ecx,1),%eax
80103572:	88 04 1f             	mov    %al,(%edi,%ebx,1)
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103575:	83 c3 01             	add    $0x1,%ebx
80103578:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010357b:	75 d3                	jne    80103550 <piperead+0xa0>
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
8010357d:	8d 86 38 02 00 00    	lea    0x238(%esi),%eax
80103583:	83 ec 0c             	sub    $0xc,%esp
80103586:	50                   	push   %eax
80103587:	e8 e4 09 00 00       	call   80103f70 <wakeup>
  release(&p->lock);
8010358c:	89 34 24             	mov    %esi,(%esp)
8010358f:	e8 dc 0e 00 00       	call   80104470 <release>
  return i;
80103594:	83 c4 10             	add    $0x10,%esp
}
80103597:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010359a:	89 d8                	mov    %ebx,%eax
8010359c:	5b                   	pop    %ebx
8010359d:	5e                   	pop    %esi
8010359e:	5f                   	pop    %edi
8010359f:	5d                   	pop    %ebp
801035a0:	c3                   	ret    
801035a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p->nread == p->nwrite)
801035a8:	31 db                	xor    %ebx,%ebx
801035aa:	eb d1                	jmp    8010357d <piperead+0xcd>
801035ac:	66 90                	xchg   %ax,%ax
801035ae:	66 90                	xchg   %ax,%ax

801035b0 <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
801035b0:	55                   	push   %ebp
801035b1:	89 e5                	mov    %esp,%ebp
801035b3:	53                   	push   %ebx
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801035b4:	bb 14 37 11 80       	mov    $0x80113714,%ebx
{
801035b9:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);
801035bc:	68 e0 36 11 80       	push   $0x801136e0
801035c1:	e8 fa 0d 00 00       	call   801043c0 <acquire>
801035c6:	83 c4 10             	add    $0x10,%esp
801035c9:	eb 13                	jmp    801035de <allocproc+0x2e>
801035cb:	90                   	nop
801035cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801035d0:	81 c3 88 00 00 00    	add    $0x88,%ebx
801035d6:	81 fb 14 59 11 80    	cmp    $0x80115914,%ebx
801035dc:	73 7a                	jae    80103658 <allocproc+0xa8>
    if(p->state == UNUSED)
801035de:	8b 43 0c             	mov    0xc(%ebx),%eax
801035e1:	85 c0                	test   %eax,%eax
801035e3:	75 eb                	jne    801035d0 <allocproc+0x20>
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
801035e5:	a1 04 a0 10 80       	mov    0x8010a004,%eax
  // Quantidade padrão de tickets
  //p->tickets = 50;

  release(&ptable.lock);
801035ea:	83 ec 0c             	sub    $0xc,%esp
  p->state = EMBRYO;
801035ed:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->pid = nextpid++;
801035f4:	8d 50 01             	lea    0x1(%eax),%edx
801035f7:	89 43 10             	mov    %eax,0x10(%ebx)
  release(&ptable.lock);
801035fa:	68 e0 36 11 80       	push   $0x801136e0
  p->pid = nextpid++;
801035ff:	89 15 04 a0 10 80    	mov    %edx,0x8010a004
  release(&ptable.lock);
80103605:	e8 66 0e 00 00       	call   80104470 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
8010360a:	e8 81 ee ff ff       	call   80102490 <kalloc>
8010360f:	83 c4 10             	add    $0x10,%esp
80103612:	85 c0                	test   %eax,%eax
80103614:	89 43 08             	mov    %eax,0x8(%ebx)
80103617:	74 58                	je     80103671 <allocproc+0xc1>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103619:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
8010361f:	83 ec 04             	sub    $0x4,%esp
  sp -= sizeof *p->context;
80103622:	05 9c 0f 00 00       	add    $0xf9c,%eax
  sp -= sizeof *p->tf;
80103627:	89 53 18             	mov    %edx,0x18(%ebx)
  *(uint*)sp = (uint)trapret;
8010362a:	c7 40 14 e2 56 10 80 	movl   $0x801056e2,0x14(%eax)
  p->context = (struct context*)sp;
80103631:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
80103634:	6a 14                	push   $0x14
80103636:	6a 00                	push   $0x0
80103638:	50                   	push   %eax
80103639:	e8 82 0e 00 00       	call   801044c0 <memset>
  p->context->eip = (uint)forkret;
8010363e:	8b 43 1c             	mov    0x1c(%ebx),%eax

  return p;
80103641:	83 c4 10             	add    $0x10,%esp
  p->context->eip = (uint)forkret;
80103644:	c7 40 10 80 36 10 80 	movl   $0x80103680,0x10(%eax)
}
8010364b:	89 d8                	mov    %ebx,%eax
8010364d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103650:	c9                   	leave  
80103651:	c3                   	ret    
80103652:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  release(&ptable.lock);
80103658:	83 ec 0c             	sub    $0xc,%esp
  return 0;
8010365b:	31 db                	xor    %ebx,%ebx
  release(&ptable.lock);
8010365d:	68 e0 36 11 80       	push   $0x801136e0
80103662:	e8 09 0e 00 00       	call   80104470 <release>
}
80103667:	89 d8                	mov    %ebx,%eax
  return 0;
80103669:	83 c4 10             	add    $0x10,%esp
}
8010366c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010366f:	c9                   	leave  
80103670:	c3                   	ret    
    p->state = UNUSED;
80103671:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
80103678:	31 db                	xor    %ebx,%ebx
8010367a:	eb cf                	jmp    8010364b <allocproc+0x9b>
8010367c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103680 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
80103680:	55                   	push   %ebp
80103681:	89 e5                	mov    %esp,%ebp
80103683:	83 ec 14             	sub    $0x14,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
80103686:	68 e0 36 11 80       	push   $0x801136e0
8010368b:	e8 e0 0d 00 00       	call   80104470 <release>

  if (first) {
80103690:	a1 00 a0 10 80       	mov    0x8010a000,%eax
80103695:	83 c4 10             	add    $0x10,%esp
80103698:	85 c0                	test   %eax,%eax
8010369a:	75 04                	jne    801036a0 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
8010369c:	c9                   	leave  
8010369d:	c3                   	ret    
8010369e:	66 90                	xchg   %ax,%ax
    iinit(ROOTDEV);
801036a0:	83 ec 0c             	sub    $0xc,%esp
    first = 0;
801036a3:	c7 05 00 a0 10 80 00 	movl   $0x0,0x8010a000
801036aa:	00 00 00 
    iinit(ROOTDEV);
801036ad:	6a 01                	push   $0x1
801036af:	e8 bc dd ff ff       	call   80101470 <iinit>
    initlog(ROOTDEV);
801036b4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801036bb:	e8 10 f4 ff ff       	call   80102ad0 <initlog>
801036c0:	83 c4 10             	add    $0x10,%esp
}
801036c3:	c9                   	leave  
801036c4:	c3                   	ret    
801036c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801036c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801036d0 <pinit>:
{
801036d0:	55                   	push   %ebp
801036d1:	89 e5                	mov    %esp,%ebp
801036d3:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
801036d6:	68 95 76 10 80       	push   $0x80107695
801036db:	68 e0 36 11 80       	push   $0x801136e0
801036e0:	e8 7b 0b 00 00       	call   80104260 <initlock>
  sgenrand(50);
801036e5:	c7 04 24 32 00 00 00 	movl   $0x32,(%esp)
801036ec:	e8 6f 38 00 00       	call   80106f60 <sgenrand>
}
801036f1:	83 c4 10             	add    $0x10,%esp
801036f4:	c9                   	leave  
801036f5:	c3                   	ret    
801036f6:	8d 76 00             	lea    0x0(%esi),%esi
801036f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103700 <mycpu>:
{
80103700:	55                   	push   %ebp
80103701:	89 e5                	mov    %esp,%ebp
80103703:	56                   	push   %esi
80103704:	53                   	push   %ebx
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103705:	9c                   	pushf  
80103706:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80103707:	f6 c4 02             	test   $0x2,%ah
8010370a:	75 5e                	jne    8010376a <mycpu+0x6a>
  apicid = lapicid();
8010370c:	e8 ef ef ff ff       	call   80102700 <lapicid>
  for (i = 0; i < ncpu; ++i) {
80103711:	8b 35 c0 36 11 80    	mov    0x801136c0,%esi
80103717:	85 f6                	test   %esi,%esi
80103719:	7e 42                	jle    8010375d <mycpu+0x5d>
    if (cpus[i].apicid == apicid)
8010371b:	0f b6 15 40 31 11 80 	movzbl 0x80113140,%edx
80103722:	39 d0                	cmp    %edx,%eax
80103724:	74 30                	je     80103756 <mycpu+0x56>
80103726:	b9 f0 31 11 80       	mov    $0x801131f0,%ecx
8010372b:	31 d2                	xor    %edx,%edx
8010372d:	8d 76 00             	lea    0x0(%esi),%esi
  for (i = 0; i < ncpu; ++i) {
80103730:	83 c2 01             	add    $0x1,%edx
80103733:	39 f2                	cmp    %esi,%edx
80103735:	74 26                	je     8010375d <mycpu+0x5d>
    if (cpus[i].apicid == apicid)
80103737:	0f b6 19             	movzbl (%ecx),%ebx
8010373a:	81 c1 b0 00 00 00    	add    $0xb0,%ecx
80103740:	39 d8                	cmp    %ebx,%eax
80103742:	75 ec                	jne    80103730 <mycpu+0x30>
80103744:	69 c2 b0 00 00 00    	imul   $0xb0,%edx,%eax
8010374a:	05 40 31 11 80       	add    $0x80113140,%eax
}
8010374f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103752:	5b                   	pop    %ebx
80103753:	5e                   	pop    %esi
80103754:	5d                   	pop    %ebp
80103755:	c3                   	ret    
    if (cpus[i].apicid == apicid)
80103756:	b8 40 31 11 80       	mov    $0x80113140,%eax
      return &cpus[i];
8010375b:	eb f2                	jmp    8010374f <mycpu+0x4f>
  panic("unknown apicid\n");
8010375d:	83 ec 0c             	sub    $0xc,%esp
80103760:	68 9c 76 10 80       	push   $0x8010769c
80103765:	e8 06 cc ff ff       	call   80100370 <panic>
    panic("mycpu called with interrupts enabled\n");
8010376a:	83 ec 0c             	sub    $0xc,%esp
8010376d:	68 78 77 10 80       	push   $0x80107778
80103772:	e8 f9 cb ff ff       	call   80100370 <panic>
80103777:	89 f6                	mov    %esi,%esi
80103779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103780 <cpuid>:
cpuid() {
80103780:	55                   	push   %ebp
80103781:	89 e5                	mov    %esp,%ebp
80103783:	83 ec 08             	sub    $0x8,%esp
  return mycpu()-cpus;
80103786:	e8 75 ff ff ff       	call   80103700 <mycpu>
8010378b:	2d 40 31 11 80       	sub    $0x80113140,%eax
}
80103790:	c9                   	leave  
  return mycpu()-cpus;
80103791:	c1 f8 04             	sar    $0x4,%eax
80103794:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
}
8010379a:	c3                   	ret    
8010379b:	90                   	nop
8010379c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801037a0 <myproc>:
myproc(void) {
801037a0:	55                   	push   %ebp
801037a1:	89 e5                	mov    %esp,%ebp
801037a3:	53                   	push   %ebx
801037a4:	83 ec 04             	sub    $0x4,%esp
  pushcli();
801037a7:	e8 34 0b 00 00       	call   801042e0 <pushcli>
  c = mycpu();
801037ac:	e8 4f ff ff ff       	call   80103700 <mycpu>
  p = c->proc;
801037b1:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801037b7:	e8 64 0b 00 00       	call   80104320 <popcli>
}
801037bc:	83 c4 04             	add    $0x4,%esp
801037bf:	89 d8                	mov    %ebx,%eax
801037c1:	5b                   	pop    %ebx
801037c2:	5d                   	pop    %ebp
801037c3:	c3                   	ret    
801037c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801037ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801037d0 <userinit>:
{
801037d0:	55                   	push   %ebp
801037d1:	89 e5                	mov    %esp,%ebp
801037d3:	53                   	push   %ebx
801037d4:	83 ec 04             	sub    $0x4,%esp
  p = allocproc();
801037d7:	e8 d4 fd ff ff       	call   801035b0 <allocproc>
801037dc:	89 c3                	mov    %eax,%ebx
  initproc = p;
801037de:	a3 b8 a5 10 80       	mov    %eax,0x8010a5b8
  if((p->pgdir = setupkvm()) == 0)
801037e3:	e8 d8 34 00 00       	call   80106cc0 <setupkvm>
801037e8:	85 c0                	test   %eax,%eax
801037ea:	89 43 04             	mov    %eax,0x4(%ebx)
801037ed:	0f 84 bd 00 00 00    	je     801038b0 <userinit+0xe0>
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
801037f3:	83 ec 04             	sub    $0x4,%esp
801037f6:	68 2c 00 00 00       	push   $0x2c
801037fb:	68 64 a4 10 80       	push   $0x8010a464
80103800:	50                   	push   %eax
80103801:	e8 da 31 00 00       	call   801069e0 <inituvm>
  memset(p->tf, 0, sizeof(*p->tf));
80103806:	83 c4 0c             	add    $0xc,%esp
  p->sz = PGSIZE;
80103809:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
8010380f:	6a 4c                	push   $0x4c
80103811:	6a 00                	push   $0x0
80103813:	ff 73 18             	pushl  0x18(%ebx)
80103816:	e8 a5 0c 00 00       	call   801044c0 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010381b:	8b 43 18             	mov    0x18(%ebx),%eax
8010381e:	ba 1b 00 00 00       	mov    $0x1b,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103823:	b9 23 00 00 00       	mov    $0x23,%ecx
  safestrcpy(p->name, "initcode", sizeof(p->name));
80103828:	83 c4 0c             	add    $0xc,%esp
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010382b:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
8010382f:	8b 43 18             	mov    0x18(%ebx),%eax
80103832:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
80103836:	8b 43 18             	mov    0x18(%ebx),%eax
80103839:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
8010383d:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
80103841:	8b 43 18             	mov    0x18(%ebx),%eax
80103844:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103848:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
8010384c:	8b 43 18             	mov    0x18(%ebx),%eax
8010384f:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
80103856:	8b 43 18             	mov    0x18(%ebx),%eax
80103859:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
80103860:	8b 43 18             	mov    0x18(%ebx),%eax
80103863:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
  safestrcpy(p->name, "initcode", sizeof(p->name));
8010386a:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010386d:	6a 10                	push   $0x10
8010386f:	68 c5 76 10 80       	push   $0x801076c5
80103874:	50                   	push   %eax
80103875:	e8 26 0e 00 00       	call   801046a0 <safestrcpy>
  p->cwd = namei("/");
8010387a:	c7 04 24 ce 76 10 80 	movl   $0x801076ce,(%esp)
80103881:	e8 3a e6 ff ff       	call   80101ec0 <namei>
80103886:	89 43 68             	mov    %eax,0x68(%ebx)
  acquire(&ptable.lock);
80103889:	c7 04 24 e0 36 11 80 	movl   $0x801136e0,(%esp)
80103890:	e8 2b 0b 00 00       	call   801043c0 <acquire>
  p->state = RUNNABLE;
80103895:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  release(&ptable.lock);
8010389c:	c7 04 24 e0 36 11 80 	movl   $0x801136e0,(%esp)
801038a3:	e8 c8 0b 00 00       	call   80104470 <release>
}
801038a8:	83 c4 10             	add    $0x10,%esp
801038ab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801038ae:	c9                   	leave  
801038af:	c3                   	ret    
    panic("userinit: out of memory?");
801038b0:	83 ec 0c             	sub    $0xc,%esp
801038b3:	68 ac 76 10 80       	push   $0x801076ac
801038b8:	e8 b3 ca ff ff       	call   80100370 <panic>
801038bd:	8d 76 00             	lea    0x0(%esi),%esi

801038c0 <growproc>:
{
801038c0:	55                   	push   %ebp
801038c1:	89 e5                	mov    %esp,%ebp
801038c3:	56                   	push   %esi
801038c4:	53                   	push   %ebx
801038c5:	8b 75 08             	mov    0x8(%ebp),%esi
  pushcli();
801038c8:	e8 13 0a 00 00       	call   801042e0 <pushcli>
  c = mycpu();
801038cd:	e8 2e fe ff ff       	call   80103700 <mycpu>
  p = c->proc;
801038d2:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801038d8:	e8 43 0a 00 00       	call   80104320 <popcli>
  if(n > 0){
801038dd:	83 fe 00             	cmp    $0x0,%esi
  sz = curproc->sz;
801038e0:	8b 03                	mov    (%ebx),%eax
  if(n > 0){
801038e2:	7e 34                	jle    80103918 <growproc+0x58>
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
801038e4:	83 ec 04             	sub    $0x4,%esp
801038e7:	01 c6                	add    %eax,%esi
801038e9:	56                   	push   %esi
801038ea:	50                   	push   %eax
801038eb:	ff 73 04             	pushl  0x4(%ebx)
801038ee:	e8 2d 32 00 00       	call   80106b20 <allocuvm>
801038f3:	83 c4 10             	add    $0x10,%esp
801038f6:	85 c0                	test   %eax,%eax
801038f8:	74 36                	je     80103930 <growproc+0x70>
  switchuvm(curproc);
801038fa:	83 ec 0c             	sub    $0xc,%esp
  curproc->sz = sz;
801038fd:	89 03                	mov    %eax,(%ebx)
  switchuvm(curproc);
801038ff:	53                   	push   %ebx
80103900:	e8 cb 2f 00 00       	call   801068d0 <switchuvm>
  return 0;
80103905:	83 c4 10             	add    $0x10,%esp
80103908:	31 c0                	xor    %eax,%eax
}
8010390a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010390d:	5b                   	pop    %ebx
8010390e:	5e                   	pop    %esi
8010390f:	5d                   	pop    %ebp
80103910:	c3                   	ret    
80103911:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  } else if(n < 0){
80103918:	74 e0                	je     801038fa <growproc+0x3a>
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
8010391a:	83 ec 04             	sub    $0x4,%esp
8010391d:	01 c6                	add    %eax,%esi
8010391f:	56                   	push   %esi
80103920:	50                   	push   %eax
80103921:	ff 73 04             	pushl  0x4(%ebx)
80103924:	e8 e7 32 00 00       	call   80106c10 <deallocuvm>
80103929:	83 c4 10             	add    $0x10,%esp
8010392c:	85 c0                	test   %eax,%eax
8010392e:	75 ca                	jne    801038fa <growproc+0x3a>
      return -1;
80103930:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103935:	eb d3                	jmp    8010390a <growproc+0x4a>
80103937:	89 f6                	mov    %esi,%esi
80103939:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103940 <fork>:
{
80103940:	55                   	push   %ebp
80103941:	89 e5                	mov    %esp,%ebp
80103943:	57                   	push   %edi
80103944:	56                   	push   %esi
80103945:	53                   	push   %ebx
80103946:	83 ec 1c             	sub    $0x1c,%esp
  pushcli();
80103949:	e8 92 09 00 00       	call   801042e0 <pushcli>
  c = mycpu();
8010394e:	e8 ad fd ff ff       	call   80103700 <mycpu>
  p = c->proc;
80103953:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
80103959:	89 c7                	mov    %eax,%edi
8010395b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  popcli();
8010395e:	e8 bd 09 00 00       	call   80104320 <popcli>
  if((np = allocproc()) == 0){
80103963:	e8 48 fc ff ff       	call   801035b0 <allocproc>
80103968:	85 c0                	test   %eax,%eax
8010396a:	0f 84 db 00 00 00    	je     80103a4b <fork+0x10b>
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
80103970:	83 ec 08             	sub    $0x8,%esp
80103973:	ff 37                	pushl  (%edi)
80103975:	ff 77 04             	pushl  0x4(%edi)
80103978:	89 c3                	mov    %eax,%ebx
8010397a:	e8 11 34 00 00       	call   80106d90 <copyuvm>
8010397f:	83 c4 10             	add    $0x10,%esp
80103982:	85 c0                	test   %eax,%eax
80103984:	89 43 04             	mov    %eax,0x4(%ebx)
80103987:	0f 84 c5 00 00 00    	je     80103a52 <fork+0x112>
  np->sz = curproc->sz;
8010398d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  *np->tf = *curproc->tf;
80103990:	8b 7b 18             	mov    0x18(%ebx),%edi
80103993:	b9 13 00 00 00       	mov    $0x13,%ecx
  np->sz = curproc->sz;
80103998:	8b 02                	mov    (%edx),%eax
  np->parent = curproc;
8010399a:	89 53 14             	mov    %edx,0x14(%ebx)
  np->sz = curproc->sz;
8010399d:	89 03                	mov    %eax,(%ebx)
  *np->tf = *curproc->tf;
8010399f:	8b 72 18             	mov    0x18(%edx),%esi
801039a2:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  for(i = 0; i < NOFILE; i++)
801039a4:	31 f6                	xor    %esi,%esi
801039a6:	89 d7                	mov    %edx,%edi
  np->tf->eax = 0;
801039a8:	8b 43 18             	mov    0x18(%ebx),%eax
801039ab:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
801039b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(curproc->ofile[i])
801039b8:	8b 44 b7 28          	mov    0x28(%edi,%esi,4),%eax
801039bc:	85 c0                	test   %eax,%eax
801039be:	74 10                	je     801039d0 <fork+0x90>
      np->ofile[i] = filedup(curproc->ofile[i]);
801039c0:	83 ec 0c             	sub    $0xc,%esp
801039c3:	50                   	push   %eax
801039c4:	e8 07 d4 ff ff       	call   80100dd0 <filedup>
801039c9:	83 c4 10             	add    $0x10,%esp
801039cc:	89 44 b3 28          	mov    %eax,0x28(%ebx,%esi,4)
  for(i = 0; i < NOFILE; i++)
801039d0:	83 c6 01             	add    $0x1,%esi
801039d3:	83 fe 10             	cmp    $0x10,%esi
801039d6:	75 e0                	jne    801039b8 <fork+0x78>
  np->cwd = idup(curproc->cwd);
801039d8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801039db:	83 ec 0c             	sub    $0xc,%esp
801039de:	ff 77 68             	pushl  0x68(%edi)
801039e1:	e8 5a dc ff ff       	call   80101640 <idup>
801039e6:	89 43 68             	mov    %eax,0x68(%ebx)
  np->tickets = tickets;
801039e9:	8b 45 08             	mov    0x8(%ebp),%eax
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
801039ec:	83 c4 0c             	add    $0xc,%esp
  np->passada = 0;
801039ef:	c7 83 84 00 00 00 00 	movl   $0x0,0x84(%ebx)
801039f6:	00 00 00 
  np->tickets = tickets;
801039f9:	89 43 7c             	mov    %eax,0x7c(%ebx)
  np->passo = (10000/np->tickets);
801039fc:	b8 10 27 00 00       	mov    $0x2710,%eax
80103a01:	99                   	cltd   
80103a02:	f7 7d 08             	idivl  0x8(%ebp)
80103a05:	89 83 80 00 00 00    	mov    %eax,0x80(%ebx)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103a0b:	89 f8                	mov    %edi,%eax
80103a0d:	6a 10                	push   $0x10
80103a0f:	83 c0 6c             	add    $0x6c,%eax
80103a12:	50                   	push   %eax
80103a13:	8d 43 6c             	lea    0x6c(%ebx),%eax
80103a16:	50                   	push   %eax
80103a17:	e8 84 0c 00 00       	call   801046a0 <safestrcpy>
  pid = np->pid;
80103a1c:	8b 73 10             	mov    0x10(%ebx),%esi
  acquire(&ptable.lock);
80103a1f:	c7 04 24 e0 36 11 80 	movl   $0x801136e0,(%esp)
80103a26:	e8 95 09 00 00       	call   801043c0 <acquire>
  np->state = RUNNABLE;
80103a2b:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  release(&ptable.lock);
80103a32:	c7 04 24 e0 36 11 80 	movl   $0x801136e0,(%esp)
80103a39:	e8 32 0a 00 00       	call   80104470 <release>
  return pid;
80103a3e:	83 c4 10             	add    $0x10,%esp
}
80103a41:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103a44:	89 f0                	mov    %esi,%eax
80103a46:	5b                   	pop    %ebx
80103a47:	5e                   	pop    %esi
80103a48:	5f                   	pop    %edi
80103a49:	5d                   	pop    %ebp
80103a4a:	c3                   	ret    
    return -1;
80103a4b:	be ff ff ff ff       	mov    $0xffffffff,%esi
80103a50:	eb ef                	jmp    80103a41 <fork+0x101>
    kfree(np->kstack);
80103a52:	83 ec 0c             	sub    $0xc,%esp
80103a55:	ff 73 08             	pushl  0x8(%ebx)
    return -1;
80103a58:	be ff ff ff ff       	mov    $0xffffffff,%esi
    kfree(np->kstack);
80103a5d:	e8 7e e8 ff ff       	call   801022e0 <kfree>
    np->kstack = 0;
80103a62:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    np->state = UNUSED;
80103a69:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return -1;
80103a70:	83 c4 10             	add    $0x10,%esp
80103a73:	eb cc                	jmp    80103a41 <fork+0x101>
80103a75:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103a79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103a80 <scheduler>:
{
80103a80:	55                   	push   %ebp
80103a81:	89 e5                	mov    %esp,%ebp
80103a83:	57                   	push   %edi
80103a84:	56                   	push   %esi
80103a85:	53                   	push   %ebx
80103a86:	83 ec 0c             	sub    $0xc,%esp
  struct cpu *c = mycpu();
80103a89:	e8 72 fc ff ff       	call   80103700 <mycpu>
80103a8e:	8d 70 04             	lea    0x4(%eax),%esi
80103a91:	89 c3                	mov    %eax,%ebx
  c->proc = 0;
80103a93:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103a9a:	00 00 00 
80103a9d:	8d 76 00             	lea    0x0(%esi),%esi
  asm volatile("sti");
80103aa0:	fb                   	sti    
    acquire(&ptable.lock);
80103aa1:	83 ec 0c             	sub    $0xc,%esp
    vencedor = ptable.proc;
80103aa4:	bf 14 37 11 80       	mov    $0x80113714,%edi
    acquire(&ptable.lock);
80103aa9:	68 e0 36 11 80       	push   $0x801136e0
80103aae:	e8 0d 09 00 00       	call   801043c0 <acquire>
80103ab3:	83 c4 10             	add    $0x10,%esp
    menor = 1000000;
80103ab6:	b9 40 42 0f 00       	mov    $0xf4240,%ecx
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103abb:	89 f8                	mov    %edi,%eax
80103abd:	eb 0d                	jmp    80103acc <scheduler+0x4c>
80103abf:	90                   	nop
80103ac0:	05 88 00 00 00       	add    $0x88,%eax
80103ac5:	3d 14 59 11 80       	cmp    $0x80115914,%eax
80103aca:	73 24                	jae    80103af0 <scheduler+0x70>
      if(p->state != RUNNABLE)
80103acc:	83 78 0c 03          	cmpl   $0x3,0xc(%eax)
80103ad0:	75 ee                	jne    80103ac0 <scheduler+0x40>
      if(p->passada <= menor){
80103ad2:	8b 90 84 00 00 00    	mov    0x84(%eax),%edx
80103ad8:	39 ca                	cmp    %ecx,%edx
80103ada:	7f e4                	jg     80103ac0 <scheduler+0x40>
80103adc:	89 c7                	mov    %eax,%edi
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103ade:	05 88 00 00 00       	add    $0x88,%eax
      if(p->passada <= menor){
80103ae3:	89 d1                	mov    %edx,%ecx
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103ae5:	3d 14 59 11 80       	cmp    $0x80115914,%eax
80103aea:	72 e0                	jb     80103acc <scheduler+0x4c>
80103aec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->pid > 2){
80103af0:	8b 47 10             	mov    0x10(%edi),%eax
80103af3:	83 f8 02             	cmp    $0x2,%eax
80103af6:	7f 50                	jg     80103b48 <scheduler+0xc8>
    p->passada = p->passada + p->passo;
80103af8:	8b 87 80 00 00 00    	mov    0x80(%edi),%eax
80103afe:	01 87 84 00 00 00    	add    %eax,0x84(%edi)
    switchuvm(p);
80103b04:	83 ec 0c             	sub    $0xc,%esp
    c->proc = p;
80103b07:	89 bb ac 00 00 00    	mov    %edi,0xac(%ebx)
    switchuvm(p);
80103b0d:	57                   	push   %edi
80103b0e:	e8 bd 2d 00 00       	call   801068d0 <switchuvm>
    p->state = RUNNING;
80103b13:	c7 47 0c 04 00 00 00 	movl   $0x4,0xc(%edi)
    swtch(&(c->scheduler), p->context);
80103b1a:	58                   	pop    %eax
80103b1b:	5a                   	pop    %edx
80103b1c:	ff 77 1c             	pushl  0x1c(%edi)
80103b1f:	56                   	push   %esi
80103b20:	e8 d6 0b 00 00       	call   801046fb <swtch>
    switchkvm();
80103b25:	e8 86 2d 00 00       	call   801068b0 <switchkvm>
    c->proc = 0;
80103b2a:	c7 83 ac 00 00 00 00 	movl   $0x0,0xac(%ebx)
80103b31:	00 00 00 
    release(&ptable.lock);
80103b34:	c7 04 24 e0 36 11 80 	movl   $0x801136e0,(%esp)
80103b3b:	e8 30 09 00 00       	call   80104470 <release>
    sti();
80103b40:	83 c4 10             	add    $0x10,%esp
80103b43:	e9 58 ff ff ff       	jmp    80103aa0 <scheduler+0x20>
      cprintf("\nProcesso vencedor: %d passada:%d + passo:%d\n", p->pid, p->passada, p->passo);
80103b48:	ff b7 80 00 00 00    	pushl  0x80(%edi)
80103b4e:	ff b7 84 00 00 00    	pushl  0x84(%edi)
80103b54:	50                   	push   %eax
80103b55:	68 a0 77 10 80       	push   $0x801077a0
80103b5a:	e8 01 cb ff ff       	call   80100660 <cprintf>
80103b5f:	83 c4 10             	add    $0x10,%esp
80103b62:	eb 94                	jmp    80103af8 <scheduler+0x78>
80103b64:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103b6a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103b70 <sched>:
{
80103b70:	55                   	push   %ebp
80103b71:	89 e5                	mov    %esp,%ebp
80103b73:	56                   	push   %esi
80103b74:	53                   	push   %ebx
  pushcli();
80103b75:	e8 66 07 00 00       	call   801042e0 <pushcli>
  c = mycpu();
80103b7a:	e8 81 fb ff ff       	call   80103700 <mycpu>
  p = c->proc;
80103b7f:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103b85:	e8 96 07 00 00       	call   80104320 <popcli>
  if(!holding(&ptable.lock))
80103b8a:	83 ec 0c             	sub    $0xc,%esp
80103b8d:	68 e0 36 11 80       	push   $0x801136e0
80103b92:	e8 f9 07 00 00       	call   80104390 <holding>
80103b97:	83 c4 10             	add    $0x10,%esp
80103b9a:	85 c0                	test   %eax,%eax
80103b9c:	74 4f                	je     80103bed <sched+0x7d>
  if(mycpu()->ncli != 1)
80103b9e:	e8 5d fb ff ff       	call   80103700 <mycpu>
80103ba3:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103baa:	75 68                	jne    80103c14 <sched+0xa4>
  if(p->state == RUNNING)
80103bac:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80103bb0:	74 55                	je     80103c07 <sched+0x97>
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103bb2:	9c                   	pushf  
80103bb3:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80103bb4:	f6 c4 02             	test   $0x2,%ah
80103bb7:	75 41                	jne    80103bfa <sched+0x8a>
  intena = mycpu()->intena;
80103bb9:	e8 42 fb ff ff       	call   80103700 <mycpu>
  swtch(&p->context, mycpu()->scheduler);
80103bbe:	83 c3 1c             	add    $0x1c,%ebx
  intena = mycpu()->intena;
80103bc1:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
  swtch(&p->context, mycpu()->scheduler);
80103bc7:	e8 34 fb ff ff       	call   80103700 <mycpu>
80103bcc:	83 ec 08             	sub    $0x8,%esp
80103bcf:	ff 70 04             	pushl  0x4(%eax)
80103bd2:	53                   	push   %ebx
80103bd3:	e8 23 0b 00 00       	call   801046fb <swtch>
  mycpu()->intena = intena;
80103bd8:	e8 23 fb ff ff       	call   80103700 <mycpu>
}
80103bdd:	83 c4 10             	add    $0x10,%esp
  mycpu()->intena = intena;
80103be0:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
}
80103be6:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103be9:	5b                   	pop    %ebx
80103bea:	5e                   	pop    %esi
80103beb:	5d                   	pop    %ebp
80103bec:	c3                   	ret    
    panic("sched ptable.lock");
80103bed:	83 ec 0c             	sub    $0xc,%esp
80103bf0:	68 d0 76 10 80       	push   $0x801076d0
80103bf5:	e8 76 c7 ff ff       	call   80100370 <panic>
    panic("sched interruptible");
80103bfa:	83 ec 0c             	sub    $0xc,%esp
80103bfd:	68 fc 76 10 80       	push   $0x801076fc
80103c02:	e8 69 c7 ff ff       	call   80100370 <panic>
    panic("sched running");
80103c07:	83 ec 0c             	sub    $0xc,%esp
80103c0a:	68 ee 76 10 80       	push   $0x801076ee
80103c0f:	e8 5c c7 ff ff       	call   80100370 <panic>
    panic("sched locks");
80103c14:	83 ec 0c             	sub    $0xc,%esp
80103c17:	68 e2 76 10 80       	push   $0x801076e2
80103c1c:	e8 4f c7 ff ff       	call   80100370 <panic>
80103c21:	eb 0d                	jmp    80103c30 <exit>
80103c23:	90                   	nop
80103c24:	90                   	nop
80103c25:	90                   	nop
80103c26:	90                   	nop
80103c27:	90                   	nop
80103c28:	90                   	nop
80103c29:	90                   	nop
80103c2a:	90                   	nop
80103c2b:	90                   	nop
80103c2c:	90                   	nop
80103c2d:	90                   	nop
80103c2e:	90                   	nop
80103c2f:	90                   	nop

80103c30 <exit>:
{
80103c30:	55                   	push   %ebp
80103c31:	89 e5                	mov    %esp,%ebp
80103c33:	57                   	push   %edi
80103c34:	56                   	push   %esi
80103c35:	53                   	push   %ebx
80103c36:	83 ec 0c             	sub    $0xc,%esp
  pushcli();
80103c39:	e8 a2 06 00 00       	call   801042e0 <pushcli>
  c = mycpu();
80103c3e:	e8 bd fa ff ff       	call   80103700 <mycpu>
  p = c->proc;
80103c43:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103c49:	e8 d2 06 00 00       	call   80104320 <popcli>
  if(curproc == initproc)
80103c4e:	39 35 b8 a5 10 80    	cmp    %esi,0x8010a5b8
80103c54:	8d 5e 28             	lea    0x28(%esi),%ebx
80103c57:	8d 7e 68             	lea    0x68(%esi),%edi
80103c5a:	0f 84 f1 00 00 00    	je     80103d51 <exit+0x121>
    if(curproc->ofile[fd]){
80103c60:	8b 03                	mov    (%ebx),%eax
80103c62:	85 c0                	test   %eax,%eax
80103c64:	74 12                	je     80103c78 <exit+0x48>
      fileclose(curproc->ofile[fd]);
80103c66:	83 ec 0c             	sub    $0xc,%esp
80103c69:	50                   	push   %eax
80103c6a:	e8 b1 d1 ff ff       	call   80100e20 <fileclose>
      curproc->ofile[fd] = 0;
80103c6f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103c75:	83 c4 10             	add    $0x10,%esp
80103c78:	83 c3 04             	add    $0x4,%ebx
  for(fd = 0; fd < NOFILE; fd++){
80103c7b:	39 fb                	cmp    %edi,%ebx
80103c7d:	75 e1                	jne    80103c60 <exit+0x30>
  begin_op();
80103c7f:	e8 ec ee ff ff       	call   80102b70 <begin_op>
  iput(curproc->cwd);
80103c84:	83 ec 0c             	sub    $0xc,%esp
80103c87:	ff 76 68             	pushl  0x68(%esi)
80103c8a:	e8 11 db ff ff       	call   801017a0 <iput>
  end_op();
80103c8f:	e8 4c ef ff ff       	call   80102be0 <end_op>
  curproc->cwd = 0;
80103c94:	c7 46 68 00 00 00 00 	movl   $0x0,0x68(%esi)
  acquire(&ptable.lock);
80103c9b:	c7 04 24 e0 36 11 80 	movl   $0x801136e0,(%esp)
80103ca2:	e8 19 07 00 00       	call   801043c0 <acquire>
  wakeup1(curproc->parent);
80103ca7:	8b 56 14             	mov    0x14(%esi),%edx
80103caa:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103cad:	b8 14 37 11 80       	mov    $0x80113714,%eax
80103cb2:	eb 10                	jmp    80103cc4 <exit+0x94>
80103cb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103cb8:	05 88 00 00 00       	add    $0x88,%eax
80103cbd:	3d 14 59 11 80       	cmp    $0x80115914,%eax
80103cc2:	73 1e                	jae    80103ce2 <exit+0xb2>
    if(p->state == SLEEPING && p->chan == chan)
80103cc4:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103cc8:	75 ee                	jne    80103cb8 <exit+0x88>
80103cca:	3b 50 20             	cmp    0x20(%eax),%edx
80103ccd:	75 e9                	jne    80103cb8 <exit+0x88>
      p->state = RUNNABLE;
80103ccf:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103cd6:	05 88 00 00 00       	add    $0x88,%eax
80103cdb:	3d 14 59 11 80       	cmp    $0x80115914,%eax
80103ce0:	72 e2                	jb     80103cc4 <exit+0x94>
      p->parent = initproc;
80103ce2:	8b 0d b8 a5 10 80    	mov    0x8010a5b8,%ecx
80103ce8:	ba 14 37 11 80       	mov    $0x80113714,%edx
80103ced:	eb 0f                	jmp    80103cfe <exit+0xce>
80103cef:	90                   	nop
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103cf0:	81 c2 88 00 00 00    	add    $0x88,%edx
80103cf6:	81 fa 14 59 11 80    	cmp    $0x80115914,%edx
80103cfc:	73 3a                	jae    80103d38 <exit+0x108>
    if(p->parent == curproc){
80103cfe:	39 72 14             	cmp    %esi,0x14(%edx)
80103d01:	75 ed                	jne    80103cf0 <exit+0xc0>
      if(p->state == ZOMBIE)
80103d03:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
      p->parent = initproc;
80103d07:	89 4a 14             	mov    %ecx,0x14(%edx)
      if(p->state == ZOMBIE)
80103d0a:	75 e4                	jne    80103cf0 <exit+0xc0>
80103d0c:	b8 14 37 11 80       	mov    $0x80113714,%eax
80103d11:	eb 11                	jmp    80103d24 <exit+0xf4>
80103d13:	90                   	nop
80103d14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103d18:	05 88 00 00 00       	add    $0x88,%eax
80103d1d:	3d 14 59 11 80       	cmp    $0x80115914,%eax
80103d22:	73 cc                	jae    80103cf0 <exit+0xc0>
    if(p->state == SLEEPING && p->chan == chan)
80103d24:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103d28:	75 ee                	jne    80103d18 <exit+0xe8>
80103d2a:	3b 48 20             	cmp    0x20(%eax),%ecx
80103d2d:	75 e9                	jne    80103d18 <exit+0xe8>
      p->state = RUNNABLE;
80103d2f:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103d36:	eb e0                	jmp    80103d18 <exit+0xe8>
  curproc->state = ZOMBIE;
80103d38:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)
  sched();
80103d3f:	e8 2c fe ff ff       	call   80103b70 <sched>
  panic("zombie exit");
80103d44:	83 ec 0c             	sub    $0xc,%esp
80103d47:	68 1d 77 10 80       	push   $0x8010771d
80103d4c:	e8 1f c6 ff ff       	call   80100370 <panic>
    panic("init exiting");
80103d51:	83 ec 0c             	sub    $0xc,%esp
80103d54:	68 10 77 10 80       	push   $0x80107710
80103d59:	e8 12 c6 ff ff       	call   80100370 <panic>
80103d5e:	66 90                	xchg   %ax,%ax

80103d60 <yield>:
{
80103d60:	55                   	push   %ebp
80103d61:	89 e5                	mov    %esp,%ebp
80103d63:	53                   	push   %ebx
80103d64:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103d67:	68 e0 36 11 80       	push   $0x801136e0
80103d6c:	e8 4f 06 00 00       	call   801043c0 <acquire>
  pushcli();
80103d71:	e8 6a 05 00 00       	call   801042e0 <pushcli>
  c = mycpu();
80103d76:	e8 85 f9 ff ff       	call   80103700 <mycpu>
  p = c->proc;
80103d7b:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103d81:	e8 9a 05 00 00       	call   80104320 <popcli>
  myproc()->state = RUNNABLE;
80103d86:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  sched();
80103d8d:	e8 de fd ff ff       	call   80103b70 <sched>
  release(&ptable.lock);
80103d92:	c7 04 24 e0 36 11 80 	movl   $0x801136e0,(%esp)
80103d99:	e8 d2 06 00 00       	call   80104470 <release>
}
80103d9e:	83 c4 10             	add    $0x10,%esp
80103da1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103da4:	c9                   	leave  
80103da5:	c3                   	ret    
80103da6:	8d 76 00             	lea    0x0(%esi),%esi
80103da9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103db0 <sleep>:
{
80103db0:	55                   	push   %ebp
80103db1:	89 e5                	mov    %esp,%ebp
80103db3:	57                   	push   %edi
80103db4:	56                   	push   %esi
80103db5:	53                   	push   %ebx
80103db6:	83 ec 0c             	sub    $0xc,%esp
80103db9:	8b 7d 08             	mov    0x8(%ebp),%edi
80103dbc:	8b 75 0c             	mov    0xc(%ebp),%esi
  pushcli();
80103dbf:	e8 1c 05 00 00       	call   801042e0 <pushcli>
  c = mycpu();
80103dc4:	e8 37 f9 ff ff       	call   80103700 <mycpu>
  p = c->proc;
80103dc9:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103dcf:	e8 4c 05 00 00       	call   80104320 <popcli>
  if(p == 0)
80103dd4:	85 db                	test   %ebx,%ebx
80103dd6:	0f 84 87 00 00 00    	je     80103e63 <sleep+0xb3>
  if(lk == 0)
80103ddc:	85 f6                	test   %esi,%esi
80103dde:	74 76                	je     80103e56 <sleep+0xa6>
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103de0:	81 fe e0 36 11 80    	cmp    $0x801136e0,%esi
80103de6:	74 50                	je     80103e38 <sleep+0x88>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103de8:	83 ec 0c             	sub    $0xc,%esp
80103deb:	68 e0 36 11 80       	push   $0x801136e0
80103df0:	e8 cb 05 00 00       	call   801043c0 <acquire>
    release(lk);
80103df5:	89 34 24             	mov    %esi,(%esp)
80103df8:	e8 73 06 00 00       	call   80104470 <release>
  p->chan = chan;
80103dfd:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103e00:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
  sched();
80103e07:	e8 64 fd ff ff       	call   80103b70 <sched>
  p->chan = 0;
80103e0c:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
    release(&ptable.lock);
80103e13:	c7 04 24 e0 36 11 80 	movl   $0x801136e0,(%esp)
80103e1a:	e8 51 06 00 00       	call   80104470 <release>
    acquire(lk);
80103e1f:	89 75 08             	mov    %esi,0x8(%ebp)
80103e22:	83 c4 10             	add    $0x10,%esp
}
80103e25:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103e28:	5b                   	pop    %ebx
80103e29:	5e                   	pop    %esi
80103e2a:	5f                   	pop    %edi
80103e2b:	5d                   	pop    %ebp
    acquire(lk);
80103e2c:	e9 8f 05 00 00       	jmp    801043c0 <acquire>
80103e31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  p->chan = chan;
80103e38:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103e3b:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
  sched();
80103e42:	e8 29 fd ff ff       	call   80103b70 <sched>
  p->chan = 0;
80103e47:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
}
80103e4e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103e51:	5b                   	pop    %ebx
80103e52:	5e                   	pop    %esi
80103e53:	5f                   	pop    %edi
80103e54:	5d                   	pop    %ebp
80103e55:	c3                   	ret    
    panic("sleep without lk");
80103e56:	83 ec 0c             	sub    $0xc,%esp
80103e59:	68 2f 77 10 80       	push   $0x8010772f
80103e5e:	e8 0d c5 ff ff       	call   80100370 <panic>
    panic("sleep");
80103e63:	83 ec 0c             	sub    $0xc,%esp
80103e66:	68 29 77 10 80       	push   $0x80107729
80103e6b:	e8 00 c5 ff ff       	call   80100370 <panic>

80103e70 <wait>:
{
80103e70:	55                   	push   %ebp
80103e71:	89 e5                	mov    %esp,%ebp
80103e73:	56                   	push   %esi
80103e74:	53                   	push   %ebx
  pushcli();
80103e75:	e8 66 04 00 00       	call   801042e0 <pushcli>
  c = mycpu();
80103e7a:	e8 81 f8 ff ff       	call   80103700 <mycpu>
  p = c->proc;
80103e7f:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103e85:	e8 96 04 00 00       	call   80104320 <popcli>
  acquire(&ptable.lock);
80103e8a:	83 ec 0c             	sub    $0xc,%esp
80103e8d:	68 e0 36 11 80       	push   $0x801136e0
80103e92:	e8 29 05 00 00       	call   801043c0 <acquire>
80103e97:	83 c4 10             	add    $0x10,%esp
    havekids = 0;
80103e9a:	31 c0                	xor    %eax,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e9c:	bb 14 37 11 80       	mov    $0x80113714,%ebx
80103ea1:	eb 13                	jmp    80103eb6 <wait+0x46>
80103ea3:	90                   	nop
80103ea4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103ea8:	81 c3 88 00 00 00    	add    $0x88,%ebx
80103eae:	81 fb 14 59 11 80    	cmp    $0x80115914,%ebx
80103eb4:	73 22                	jae    80103ed8 <wait+0x68>
      if(p->parent != curproc)
80103eb6:	39 73 14             	cmp    %esi,0x14(%ebx)
80103eb9:	75 ed                	jne    80103ea8 <wait+0x38>
      if(p->state == ZOMBIE){
80103ebb:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103ebf:	74 35                	je     80103ef6 <wait+0x86>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103ec1:	81 c3 88 00 00 00    	add    $0x88,%ebx
      havekids = 1;
80103ec7:	b8 01 00 00 00       	mov    $0x1,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103ecc:	81 fb 14 59 11 80    	cmp    $0x80115914,%ebx
80103ed2:	72 e2                	jb     80103eb6 <wait+0x46>
80103ed4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(!havekids || curproc->killed){
80103ed8:	85 c0                	test   %eax,%eax
80103eda:	74 70                	je     80103f4c <wait+0xdc>
80103edc:	8b 46 24             	mov    0x24(%esi),%eax
80103edf:	85 c0                	test   %eax,%eax
80103ee1:	75 69                	jne    80103f4c <wait+0xdc>
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
80103ee3:	83 ec 08             	sub    $0x8,%esp
80103ee6:	68 e0 36 11 80       	push   $0x801136e0
80103eeb:	56                   	push   %esi
80103eec:	e8 bf fe ff ff       	call   80103db0 <sleep>
    havekids = 0;
80103ef1:	83 c4 10             	add    $0x10,%esp
80103ef4:	eb a4                	jmp    80103e9a <wait+0x2a>
        kfree(p->kstack);
80103ef6:	83 ec 0c             	sub    $0xc,%esp
80103ef9:	ff 73 08             	pushl  0x8(%ebx)
        pid = p->pid;
80103efc:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
80103eff:	e8 dc e3 ff ff       	call   801022e0 <kfree>
        freevm(p->pgdir);
80103f04:	5a                   	pop    %edx
80103f05:	ff 73 04             	pushl  0x4(%ebx)
        p->kstack = 0;
80103f08:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
80103f0f:	e8 2c 2d 00 00       	call   80106c40 <freevm>
        p->pid = 0;
80103f14:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
80103f1b:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
80103f22:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
80103f26:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
80103f2d:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
80103f34:	c7 04 24 e0 36 11 80 	movl   $0x801136e0,(%esp)
80103f3b:	e8 30 05 00 00       	call   80104470 <release>
        return pid;
80103f40:	83 c4 10             	add    $0x10,%esp
}
80103f43:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103f46:	89 f0                	mov    %esi,%eax
80103f48:	5b                   	pop    %ebx
80103f49:	5e                   	pop    %esi
80103f4a:	5d                   	pop    %ebp
80103f4b:	c3                   	ret    
      release(&ptable.lock);
80103f4c:	83 ec 0c             	sub    $0xc,%esp
      return -1;
80103f4f:	be ff ff ff ff       	mov    $0xffffffff,%esi
      release(&ptable.lock);
80103f54:	68 e0 36 11 80       	push   $0x801136e0
80103f59:	e8 12 05 00 00       	call   80104470 <release>
      return -1;
80103f5e:	83 c4 10             	add    $0x10,%esp
}
80103f61:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103f64:	89 f0                	mov    %esi,%eax
80103f66:	5b                   	pop    %ebx
80103f67:	5e                   	pop    %esi
80103f68:	5d                   	pop    %ebp
80103f69:	c3                   	ret    
80103f6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103f70 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
80103f70:	55                   	push   %ebp
80103f71:	89 e5                	mov    %esp,%ebp
80103f73:	53                   	push   %ebx
80103f74:	83 ec 10             	sub    $0x10,%esp
80103f77:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
80103f7a:	68 e0 36 11 80       	push   $0x801136e0
80103f7f:	e8 3c 04 00 00       	call   801043c0 <acquire>
80103f84:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103f87:	b8 14 37 11 80       	mov    $0x80113714,%eax
80103f8c:	eb 0e                	jmp    80103f9c <wakeup+0x2c>
80103f8e:	66 90                	xchg   %ax,%ax
80103f90:	05 88 00 00 00       	add    $0x88,%eax
80103f95:	3d 14 59 11 80       	cmp    $0x80115914,%eax
80103f9a:	73 1e                	jae    80103fba <wakeup+0x4a>
    if(p->state == SLEEPING && p->chan == chan)
80103f9c:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103fa0:	75 ee                	jne    80103f90 <wakeup+0x20>
80103fa2:	3b 58 20             	cmp    0x20(%eax),%ebx
80103fa5:	75 e9                	jne    80103f90 <wakeup+0x20>
      p->state = RUNNABLE;
80103fa7:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103fae:	05 88 00 00 00       	add    $0x88,%eax
80103fb3:	3d 14 59 11 80       	cmp    $0x80115914,%eax
80103fb8:	72 e2                	jb     80103f9c <wakeup+0x2c>
  wakeup1(chan);
  release(&ptable.lock);
80103fba:	c7 45 08 e0 36 11 80 	movl   $0x801136e0,0x8(%ebp)
}
80103fc1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103fc4:	c9                   	leave  
  release(&ptable.lock);
80103fc5:	e9 a6 04 00 00       	jmp    80104470 <release>
80103fca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103fd0 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
80103fd0:	55                   	push   %ebp
80103fd1:	89 e5                	mov    %esp,%ebp
80103fd3:	53                   	push   %ebx
80103fd4:	83 ec 10             	sub    $0x10,%esp
80103fd7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
80103fda:	68 e0 36 11 80       	push   $0x801136e0
80103fdf:	e8 dc 03 00 00       	call   801043c0 <acquire>
80103fe4:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103fe7:	b8 14 37 11 80       	mov    $0x80113714,%eax
80103fec:	eb 0e                	jmp    80103ffc <kill+0x2c>
80103fee:	66 90                	xchg   %ax,%ax
80103ff0:	05 88 00 00 00       	add    $0x88,%eax
80103ff5:	3d 14 59 11 80       	cmp    $0x80115914,%eax
80103ffa:	73 3c                	jae    80104038 <kill+0x68>
    if(p->pid == pid){
80103ffc:	39 58 10             	cmp    %ebx,0x10(%eax)
80103fff:	75 ef                	jne    80103ff0 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80104001:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
      p->killed = 1;
80104005:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      if(p->state == SLEEPING)
8010400c:	74 1a                	je     80104028 <kill+0x58>
        p->state = RUNNABLE;
      release(&ptable.lock);
8010400e:	83 ec 0c             	sub    $0xc,%esp
80104011:	68 e0 36 11 80       	push   $0x801136e0
80104016:	e8 55 04 00 00       	call   80104470 <release>
      return 0;
8010401b:	83 c4 10             	add    $0x10,%esp
8010401e:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
80104020:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104023:	c9                   	leave  
80104024:	c3                   	ret    
80104025:	8d 76 00             	lea    0x0(%esi),%esi
        p->state = RUNNABLE;
80104028:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
8010402f:	eb dd                	jmp    8010400e <kill+0x3e>
80104031:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  release(&ptable.lock);
80104038:	83 ec 0c             	sub    $0xc,%esp
8010403b:	68 e0 36 11 80       	push   $0x801136e0
80104040:	e8 2b 04 00 00       	call   80104470 <release>
  return -1;
80104045:	83 c4 10             	add    $0x10,%esp
80104048:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010404d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104050:	c9                   	leave  
80104051:	c3                   	ret    
80104052:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104059:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104060 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80104060:	55                   	push   %ebp
80104061:	89 e5                	mov    %esp,%ebp
80104063:	57                   	push   %edi
80104064:	56                   	push   %esi
80104065:	53                   	push   %ebx
80104066:	8d 75 e8             	lea    -0x18(%ebp),%esi
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104069:	bb 14 37 11 80       	mov    $0x80113714,%ebx
{
8010406e:	83 ec 3c             	sub    $0x3c,%esp
80104071:	eb 27                	jmp    8010409a <procdump+0x3a>
80104073:	90                   	nop
80104074:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
80104078:	83 ec 0c             	sub    $0xc,%esp
8010407b:	68 d7 7a 10 80       	push   $0x80107ad7
80104080:	e8 db c5 ff ff       	call   80100660 <cprintf>
80104085:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104088:	81 c3 88 00 00 00    	add    $0x88,%ebx
8010408e:	81 fb 14 59 11 80    	cmp    $0x80115914,%ebx
80104094:	0f 83 86 00 00 00    	jae    80104120 <procdump+0xc0>
    if(p->state == UNUSED)
8010409a:	8b 43 0c             	mov    0xc(%ebx),%eax
8010409d:	85 c0                	test   %eax,%eax
8010409f:	74 e7                	je     80104088 <procdump+0x28>
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
801040a1:	83 f8 05             	cmp    $0x5,%eax
      state = "???";
801040a4:	ba 40 77 10 80       	mov    $0x80107740,%edx
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
801040a9:	77 11                	ja     801040bc <procdump+0x5c>
801040ab:	8b 14 85 d0 77 10 80 	mov    -0x7fef8830(,%eax,4),%edx
      state = "???";
801040b2:	b8 40 77 10 80       	mov    $0x80107740,%eax
801040b7:	85 d2                	test   %edx,%edx
801040b9:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %s", p->pid, state, p->name);
801040bc:	8d 43 6c             	lea    0x6c(%ebx),%eax
801040bf:	50                   	push   %eax
801040c0:	52                   	push   %edx
801040c1:	ff 73 10             	pushl  0x10(%ebx)
801040c4:	68 44 77 10 80       	push   $0x80107744
801040c9:	e8 92 c5 ff ff       	call   80100660 <cprintf>
    if(p->state == SLEEPING){
801040ce:	83 c4 10             	add    $0x10,%esp
801040d1:	83 7b 0c 02          	cmpl   $0x2,0xc(%ebx)
801040d5:	75 a1                	jne    80104078 <procdump+0x18>
      getcallerpcs((uint*)p->context->ebp+2, pc);
801040d7:	8d 45 c0             	lea    -0x40(%ebp),%eax
801040da:	83 ec 08             	sub    $0x8,%esp
801040dd:	8d 7d c0             	lea    -0x40(%ebp),%edi
801040e0:	50                   	push   %eax
801040e1:	8b 43 1c             	mov    0x1c(%ebx),%eax
801040e4:	8b 40 0c             	mov    0xc(%eax),%eax
801040e7:	83 c0 08             	add    $0x8,%eax
801040ea:	50                   	push   %eax
801040eb:	e8 90 01 00 00       	call   80104280 <getcallerpcs>
801040f0:	83 c4 10             	add    $0x10,%esp
801040f3:	90                   	nop
801040f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      for(i=0; i<10 && pc[i] != 0; i++)
801040f8:	8b 17                	mov    (%edi),%edx
801040fa:	85 d2                	test   %edx,%edx
801040fc:	0f 84 76 ff ff ff    	je     80104078 <procdump+0x18>
        cprintf(" %p", pc[i]);
80104102:	83 ec 08             	sub    $0x8,%esp
80104105:	83 c7 04             	add    $0x4,%edi
80104108:	52                   	push   %edx
80104109:	68 81 71 10 80       	push   $0x80107181
8010410e:	e8 4d c5 ff ff       	call   80100660 <cprintf>
      for(i=0; i<10 && pc[i] != 0; i++)
80104113:	83 c4 10             	add    $0x10,%esp
80104116:	39 fe                	cmp    %edi,%esi
80104118:	75 de                	jne    801040f8 <procdump+0x98>
8010411a:	e9 59 ff ff ff       	jmp    80104078 <procdump+0x18>
8010411f:	90                   	nop
  }
}
80104120:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104123:	5b                   	pop    %ebx
80104124:	5e                   	pop    %esi
80104125:	5f                   	pop    %edi
80104126:	5d                   	pop    %ebp
80104127:	c3                   	ret    
80104128:	66 90                	xchg   %ax,%ax
8010412a:	66 90                	xchg   %ax,%ax
8010412c:	66 90                	xchg   %ax,%ax
8010412e:	66 90                	xchg   %ax,%ax

80104130 <initsleeplock>:
#include "spinlock.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
80104130:	55                   	push   %ebp
80104131:	89 e5                	mov    %esp,%ebp
80104133:	53                   	push   %ebx
80104134:	83 ec 0c             	sub    $0xc,%esp
80104137:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
8010413a:	68 e8 77 10 80       	push   $0x801077e8
8010413f:	8d 43 04             	lea    0x4(%ebx),%eax
80104142:	50                   	push   %eax
80104143:	e8 18 01 00 00       	call   80104260 <initlock>
  lk->name = name;
80104148:	8b 45 0c             	mov    0xc(%ebp),%eax
  lk->locked = 0;
8010414b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
}
80104151:	83 c4 10             	add    $0x10,%esp
  lk->pid = 0;
80104154:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  lk->name = name;
8010415b:	89 43 38             	mov    %eax,0x38(%ebx)
}
8010415e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104161:	c9                   	leave  
80104162:	c3                   	ret    
80104163:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104170 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
80104170:	55                   	push   %ebp
80104171:	89 e5                	mov    %esp,%ebp
80104173:	56                   	push   %esi
80104174:	53                   	push   %ebx
80104175:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80104178:	83 ec 0c             	sub    $0xc,%esp
8010417b:	8d 73 04             	lea    0x4(%ebx),%esi
8010417e:	56                   	push   %esi
8010417f:	e8 3c 02 00 00       	call   801043c0 <acquire>
  while (lk->locked) {
80104184:	8b 13                	mov    (%ebx),%edx
80104186:	83 c4 10             	add    $0x10,%esp
80104189:	85 d2                	test   %edx,%edx
8010418b:	74 16                	je     801041a3 <acquiresleep+0x33>
8010418d:	8d 76 00             	lea    0x0(%esi),%esi
    sleep(lk, &lk->lk);
80104190:	83 ec 08             	sub    $0x8,%esp
80104193:	56                   	push   %esi
80104194:	53                   	push   %ebx
80104195:	e8 16 fc ff ff       	call   80103db0 <sleep>
  while (lk->locked) {
8010419a:	8b 03                	mov    (%ebx),%eax
8010419c:	83 c4 10             	add    $0x10,%esp
8010419f:	85 c0                	test   %eax,%eax
801041a1:	75 ed                	jne    80104190 <acquiresleep+0x20>
  }
  lk->locked = 1;
801041a3:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = myproc()->pid;
801041a9:	e8 f2 f5 ff ff       	call   801037a0 <myproc>
801041ae:	8b 40 10             	mov    0x10(%eax),%eax
801041b1:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
801041b4:	89 75 08             	mov    %esi,0x8(%ebp)
}
801041b7:	8d 65 f8             	lea    -0x8(%ebp),%esp
801041ba:	5b                   	pop    %ebx
801041bb:	5e                   	pop    %esi
801041bc:	5d                   	pop    %ebp
  release(&lk->lk);
801041bd:	e9 ae 02 00 00       	jmp    80104470 <release>
801041c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801041c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801041d0 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
801041d0:	55                   	push   %ebp
801041d1:	89 e5                	mov    %esp,%ebp
801041d3:	56                   	push   %esi
801041d4:	53                   	push   %ebx
801041d5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
801041d8:	83 ec 0c             	sub    $0xc,%esp
801041db:	8d 73 04             	lea    0x4(%ebx),%esi
801041de:	56                   	push   %esi
801041df:	e8 dc 01 00 00       	call   801043c0 <acquire>
  lk->locked = 0;
801041e4:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
801041ea:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
801041f1:	89 1c 24             	mov    %ebx,(%esp)
801041f4:	e8 77 fd ff ff       	call   80103f70 <wakeup>
  release(&lk->lk);
801041f9:	89 75 08             	mov    %esi,0x8(%ebp)
801041fc:	83 c4 10             	add    $0x10,%esp
}
801041ff:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104202:	5b                   	pop    %ebx
80104203:	5e                   	pop    %esi
80104204:	5d                   	pop    %ebp
  release(&lk->lk);
80104205:	e9 66 02 00 00       	jmp    80104470 <release>
8010420a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104210 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
80104210:	55                   	push   %ebp
80104211:	89 e5                	mov    %esp,%ebp
80104213:	57                   	push   %edi
80104214:	56                   	push   %esi
80104215:	53                   	push   %ebx
80104216:	31 ff                	xor    %edi,%edi
80104218:	83 ec 18             	sub    $0x18,%esp
8010421b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int r;
  
  acquire(&lk->lk);
8010421e:	8d 73 04             	lea    0x4(%ebx),%esi
80104221:	56                   	push   %esi
80104222:	e8 99 01 00 00       	call   801043c0 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
80104227:	8b 03                	mov    (%ebx),%eax
80104229:	83 c4 10             	add    $0x10,%esp
8010422c:	85 c0                	test   %eax,%eax
8010422e:	74 13                	je     80104243 <holdingsleep+0x33>
80104230:	8b 5b 3c             	mov    0x3c(%ebx),%ebx
80104233:	e8 68 f5 ff ff       	call   801037a0 <myproc>
80104238:	39 58 10             	cmp    %ebx,0x10(%eax)
8010423b:	0f 94 c0             	sete   %al
8010423e:	0f b6 c0             	movzbl %al,%eax
80104241:	89 c7                	mov    %eax,%edi
  release(&lk->lk);
80104243:	83 ec 0c             	sub    $0xc,%esp
80104246:	56                   	push   %esi
80104247:	e8 24 02 00 00       	call   80104470 <release>
  return r;
}
8010424c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010424f:	89 f8                	mov    %edi,%eax
80104251:	5b                   	pop    %ebx
80104252:	5e                   	pop    %esi
80104253:	5f                   	pop    %edi
80104254:	5d                   	pop    %ebp
80104255:	c3                   	ret    
80104256:	66 90                	xchg   %ax,%ax
80104258:	66 90                	xchg   %ax,%ax
8010425a:	66 90                	xchg   %ax,%ax
8010425c:	66 90                	xchg   %ax,%ax
8010425e:	66 90                	xchg   %ax,%ax

80104260 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
80104260:	55                   	push   %ebp
80104261:	89 e5                	mov    %esp,%ebp
80104263:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
80104266:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
80104269:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lk->name = name;
8010426f:	89 50 04             	mov    %edx,0x4(%eax)
  lk->cpu = 0;
80104272:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
80104279:	5d                   	pop    %ebp
8010427a:	c3                   	ret    
8010427b:	90                   	nop
8010427c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104280 <getcallerpcs>:
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80104280:	55                   	push   %ebp
80104281:	89 e5                	mov    %esp,%ebp
80104283:	53                   	push   %ebx
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
80104284:	8b 45 08             	mov    0x8(%ebp),%eax
{
80104287:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  ebp = (uint*)v - 2;
8010428a:	8d 50 f8             	lea    -0x8(%eax),%edx
  for(i = 0; i < 10; i++){
8010428d:	31 c0                	xor    %eax,%eax
8010428f:	90                   	nop
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104290:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
80104296:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010429c:	77 1a                	ja     801042b8 <getcallerpcs+0x38>
      break;
    pcs[i] = ebp[1];     // saved %eip
8010429e:	8b 5a 04             	mov    0x4(%edx),%ebx
801042a1:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
  for(i = 0; i < 10; i++){
801042a4:	83 c0 01             	add    $0x1,%eax
    ebp = (uint*)ebp[0]; // saved %ebp
801042a7:	8b 12                	mov    (%edx),%edx
  for(i = 0; i < 10; i++){
801042a9:	83 f8 0a             	cmp    $0xa,%eax
801042ac:	75 e2                	jne    80104290 <getcallerpcs+0x10>
  }
  for(; i < 10; i++)
    pcs[i] = 0;
}
801042ae:	5b                   	pop    %ebx
801042af:	5d                   	pop    %ebp
801042b0:	c3                   	ret    
801042b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    pcs[i] = 0;
801042b8:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
  for(; i < 10; i++)
801042bf:	83 c0 01             	add    $0x1,%eax
801042c2:	83 f8 0a             	cmp    $0xa,%eax
801042c5:	74 e7                	je     801042ae <getcallerpcs+0x2e>
    pcs[i] = 0;
801042c7:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
  for(; i < 10; i++)
801042ce:	83 c0 01             	add    $0x1,%eax
801042d1:	83 f8 0a             	cmp    $0xa,%eax
801042d4:	75 e2                	jne    801042b8 <getcallerpcs+0x38>
801042d6:	eb d6                	jmp    801042ae <getcallerpcs+0x2e>
801042d8:	90                   	nop
801042d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801042e0 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
801042e0:	55                   	push   %ebp
801042e1:	89 e5                	mov    %esp,%ebp
801042e3:	53                   	push   %ebx
801042e4:	83 ec 04             	sub    $0x4,%esp
801042e7:	9c                   	pushf  
801042e8:	5b                   	pop    %ebx
  asm volatile("cli");
801042e9:	fa                   	cli    
  int eflags;

  eflags = readeflags();
  cli();
  if(mycpu()->ncli == 0)
801042ea:	e8 11 f4 ff ff       	call   80103700 <mycpu>
801042ef:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
801042f5:	85 c0                	test   %eax,%eax
801042f7:	75 11                	jne    8010430a <pushcli+0x2a>
    mycpu()->intena = eflags & FL_IF;
801042f9:	81 e3 00 02 00 00    	and    $0x200,%ebx
801042ff:	e8 fc f3 ff ff       	call   80103700 <mycpu>
80104304:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
  mycpu()->ncli += 1;
8010430a:	e8 f1 f3 ff ff       	call   80103700 <mycpu>
8010430f:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
}
80104316:	83 c4 04             	add    $0x4,%esp
80104319:	5b                   	pop    %ebx
8010431a:	5d                   	pop    %ebp
8010431b:	c3                   	ret    
8010431c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104320 <popcli>:

void
popcli(void)
{
80104320:	55                   	push   %ebp
80104321:	89 e5                	mov    %esp,%ebp
80104323:	83 ec 08             	sub    $0x8,%esp
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80104326:	9c                   	pushf  
80104327:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80104328:	f6 c4 02             	test   $0x2,%ah
8010432b:	75 52                	jne    8010437f <popcli+0x5f>
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
8010432d:	e8 ce f3 ff ff       	call   80103700 <mycpu>
80104332:	8b 88 a4 00 00 00    	mov    0xa4(%eax),%ecx
80104338:	8d 51 ff             	lea    -0x1(%ecx),%edx
8010433b:	85 d2                	test   %edx,%edx
8010433d:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
80104343:	78 2d                	js     80104372 <popcli+0x52>
    panic("popcli");
  if(mycpu()->ncli == 0 && mycpu()->intena)
80104345:	e8 b6 f3 ff ff       	call   80103700 <mycpu>
8010434a:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80104350:	85 d2                	test   %edx,%edx
80104352:	74 0c                	je     80104360 <popcli+0x40>
    sti();
}
80104354:	c9                   	leave  
80104355:	c3                   	ret    
80104356:	8d 76 00             	lea    0x0(%esi),%esi
80104359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  if(mycpu()->ncli == 0 && mycpu()->intena)
80104360:	e8 9b f3 ff ff       	call   80103700 <mycpu>
80104365:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
8010436b:	85 c0                	test   %eax,%eax
8010436d:	74 e5                	je     80104354 <popcli+0x34>
  asm volatile("sti");
8010436f:	fb                   	sti    
}
80104370:	c9                   	leave  
80104371:	c3                   	ret    
    panic("popcli");
80104372:	83 ec 0c             	sub    $0xc,%esp
80104375:	68 0a 78 10 80       	push   $0x8010780a
8010437a:	e8 f1 bf ff ff       	call   80100370 <panic>
    panic("popcli - interruptible");
8010437f:	83 ec 0c             	sub    $0xc,%esp
80104382:	68 f3 77 10 80       	push   $0x801077f3
80104387:	e8 e4 bf ff ff       	call   80100370 <panic>
8010438c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104390 <holding>:
{
80104390:	55                   	push   %ebp
80104391:	89 e5                	mov    %esp,%ebp
80104393:	56                   	push   %esi
80104394:	53                   	push   %ebx
80104395:	8b 75 08             	mov    0x8(%ebp),%esi
80104398:	31 db                	xor    %ebx,%ebx
  pushcli();
8010439a:	e8 41 ff ff ff       	call   801042e0 <pushcli>
  r = lock->locked && lock->cpu == mycpu();
8010439f:	8b 06                	mov    (%esi),%eax
801043a1:	85 c0                	test   %eax,%eax
801043a3:	74 10                	je     801043b5 <holding+0x25>
801043a5:	8b 5e 08             	mov    0x8(%esi),%ebx
801043a8:	e8 53 f3 ff ff       	call   80103700 <mycpu>
801043ad:	39 c3                	cmp    %eax,%ebx
801043af:	0f 94 c3             	sete   %bl
801043b2:	0f b6 db             	movzbl %bl,%ebx
  popcli();
801043b5:	e8 66 ff ff ff       	call   80104320 <popcli>
}
801043ba:	89 d8                	mov    %ebx,%eax
801043bc:	5b                   	pop    %ebx
801043bd:	5e                   	pop    %esi
801043be:	5d                   	pop    %ebp
801043bf:	c3                   	ret    

801043c0 <acquire>:
{
801043c0:	55                   	push   %ebp
801043c1:	89 e5                	mov    %esp,%ebp
801043c3:	56                   	push   %esi
801043c4:	53                   	push   %ebx
  pushcli(); // disable interrupts to avoid deadlock.
801043c5:	e8 16 ff ff ff       	call   801042e0 <pushcli>
  if(holding(lk))
801043ca:	8b 75 08             	mov    0x8(%ebp),%esi
801043cd:	83 ec 0c             	sub    $0xc,%esp
801043d0:	56                   	push   %esi
801043d1:	e8 ba ff ff ff       	call   80104390 <holding>
801043d6:	83 c4 10             	add    $0x10,%esp
801043d9:	85 c0                	test   %eax,%eax
801043db:	0f 85 7f 00 00 00    	jne    80104460 <acquire+0xa0>
801043e1:	89 c3                	mov    %eax,%ebx
  asm volatile("lock; xchgl %0, %1" :
801043e3:	ba 01 00 00 00       	mov    $0x1,%edx
801043e8:	eb 09                	jmp    801043f3 <acquire+0x33>
801043ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801043f0:	8b 75 08             	mov    0x8(%ebp),%esi
801043f3:	89 d0                	mov    %edx,%eax
801043f5:	f0 87 06             	lock xchg %eax,(%esi)
  while(xchg(&lk->locked, 1) != 0)
801043f8:	85 c0                	test   %eax,%eax
801043fa:	75 f4                	jne    801043f0 <acquire+0x30>
  __sync_synchronize();
801043fc:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  lk->cpu = mycpu();
80104401:	8b 75 08             	mov    0x8(%ebp),%esi
80104404:	e8 f7 f2 ff ff       	call   80103700 <mycpu>
  getcallerpcs(&lk, lk->pcs);
80104409:	8d 56 0c             	lea    0xc(%esi),%edx
  lk->cpu = mycpu();
8010440c:	89 46 08             	mov    %eax,0x8(%esi)
  ebp = (uint*)v - 2;
8010440f:	89 e8                	mov    %ebp,%eax
80104411:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104418:	8d 88 00 00 00 80    	lea    -0x80000000(%eax),%ecx
8010441e:	81 f9 fe ff ff 7f    	cmp    $0x7ffffffe,%ecx
80104424:	77 1a                	ja     80104440 <acquire+0x80>
    pcs[i] = ebp[1];     // saved %eip
80104426:	8b 48 04             	mov    0x4(%eax),%ecx
80104429:	89 0c 9a             	mov    %ecx,(%edx,%ebx,4)
  for(i = 0; i < 10; i++){
8010442c:	83 c3 01             	add    $0x1,%ebx
    ebp = (uint*)ebp[0]; // saved %ebp
8010442f:	8b 00                	mov    (%eax),%eax
  for(i = 0; i < 10; i++){
80104431:	83 fb 0a             	cmp    $0xa,%ebx
80104434:	75 e2                	jne    80104418 <acquire+0x58>
}
80104436:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104439:	5b                   	pop    %ebx
8010443a:	5e                   	pop    %esi
8010443b:	5d                   	pop    %ebp
8010443c:	c3                   	ret    
8010443d:	8d 76 00             	lea    0x0(%esi),%esi
    pcs[i] = 0;
80104440:	c7 04 9a 00 00 00 00 	movl   $0x0,(%edx,%ebx,4)
  for(; i < 10; i++)
80104447:	83 c3 01             	add    $0x1,%ebx
8010444a:	83 fb 0a             	cmp    $0xa,%ebx
8010444d:	74 e7                	je     80104436 <acquire+0x76>
    pcs[i] = 0;
8010444f:	c7 04 9a 00 00 00 00 	movl   $0x0,(%edx,%ebx,4)
  for(; i < 10; i++)
80104456:	83 c3 01             	add    $0x1,%ebx
80104459:	83 fb 0a             	cmp    $0xa,%ebx
8010445c:	75 e2                	jne    80104440 <acquire+0x80>
8010445e:	eb d6                	jmp    80104436 <acquire+0x76>
    panic("acquire");
80104460:	83 ec 0c             	sub    $0xc,%esp
80104463:	68 11 78 10 80       	push   $0x80107811
80104468:	e8 03 bf ff ff       	call   80100370 <panic>
8010446d:	8d 76 00             	lea    0x0(%esi),%esi

80104470 <release>:
{
80104470:	55                   	push   %ebp
80104471:	89 e5                	mov    %esp,%ebp
80104473:	53                   	push   %ebx
80104474:	83 ec 10             	sub    $0x10,%esp
80104477:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holding(lk))
8010447a:	53                   	push   %ebx
8010447b:	e8 10 ff ff ff       	call   80104390 <holding>
80104480:	83 c4 10             	add    $0x10,%esp
80104483:	85 c0                	test   %eax,%eax
80104485:	74 22                	je     801044a9 <release+0x39>
  lk->pcs[0] = 0;
80104487:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
  lk->cpu = 0;
8010448e:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  __sync_synchronize();
80104495:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
8010449a:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
801044a0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801044a3:	c9                   	leave  
  popcli();
801044a4:	e9 77 fe ff ff       	jmp    80104320 <popcli>
    panic("release");
801044a9:	83 ec 0c             	sub    $0xc,%esp
801044ac:	68 19 78 10 80       	push   $0x80107819
801044b1:	e8 ba be ff ff       	call   80100370 <panic>
801044b6:	66 90                	xchg   %ax,%ax
801044b8:	66 90                	xchg   %ax,%ax
801044ba:	66 90                	xchg   %ax,%ax
801044bc:	66 90                	xchg   %ax,%ax
801044be:	66 90                	xchg   %ax,%ax

801044c0 <memset>:
801044c0:	55                   	push   %ebp
801044c1:	89 e5                	mov    %esp,%ebp
801044c3:	57                   	push   %edi
801044c4:	53                   	push   %ebx
801044c5:	8b 55 08             	mov    0x8(%ebp),%edx
801044c8:	8b 4d 10             	mov    0x10(%ebp),%ecx
801044cb:	f6 c2 03             	test   $0x3,%dl
801044ce:	75 05                	jne    801044d5 <memset+0x15>
801044d0:	f6 c1 03             	test   $0x3,%cl
801044d3:	74 13                	je     801044e8 <memset+0x28>
801044d5:	89 d7                	mov    %edx,%edi
801044d7:	8b 45 0c             	mov    0xc(%ebp),%eax
801044da:	fc                   	cld    
801044db:	f3 aa                	rep stos %al,%es:(%edi)
801044dd:	5b                   	pop    %ebx
801044de:	89 d0                	mov    %edx,%eax
801044e0:	5f                   	pop    %edi
801044e1:	5d                   	pop    %ebp
801044e2:	c3                   	ret    
801044e3:	90                   	nop
801044e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801044e8:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
801044ec:	c1 e9 02             	shr    $0x2,%ecx
801044ef:	89 f8                	mov    %edi,%eax
801044f1:	89 fb                	mov    %edi,%ebx
801044f3:	c1 e0 18             	shl    $0x18,%eax
801044f6:	c1 e3 10             	shl    $0x10,%ebx
801044f9:	09 d8                	or     %ebx,%eax
801044fb:	09 f8                	or     %edi,%eax
801044fd:	c1 e7 08             	shl    $0x8,%edi
80104500:	09 f8                	or     %edi,%eax
80104502:	89 d7                	mov    %edx,%edi
80104504:	fc                   	cld    
80104505:	f3 ab                	rep stos %eax,%es:(%edi)
80104507:	5b                   	pop    %ebx
80104508:	89 d0                	mov    %edx,%eax
8010450a:	5f                   	pop    %edi
8010450b:	5d                   	pop    %ebp
8010450c:	c3                   	ret    
8010450d:	8d 76 00             	lea    0x0(%esi),%esi

80104510 <memcmp>:
80104510:	55                   	push   %ebp
80104511:	89 e5                	mov    %esp,%ebp
80104513:	57                   	push   %edi
80104514:	56                   	push   %esi
80104515:	53                   	push   %ebx
80104516:	8b 5d 10             	mov    0x10(%ebp),%ebx
80104519:	8b 75 08             	mov    0x8(%ebp),%esi
8010451c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010451f:	85 db                	test   %ebx,%ebx
80104521:	74 29                	je     8010454c <memcmp+0x3c>
80104523:	0f b6 16             	movzbl (%esi),%edx
80104526:	0f b6 0f             	movzbl (%edi),%ecx
80104529:	38 d1                	cmp    %dl,%cl
8010452b:	75 2b                	jne    80104558 <memcmp+0x48>
8010452d:	b8 01 00 00 00       	mov    $0x1,%eax
80104532:	eb 14                	jmp    80104548 <memcmp+0x38>
80104534:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104538:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
8010453c:	83 c0 01             	add    $0x1,%eax
8010453f:	0f b6 4c 07 ff       	movzbl -0x1(%edi,%eax,1),%ecx
80104544:	38 ca                	cmp    %cl,%dl
80104546:	75 10                	jne    80104558 <memcmp+0x48>
80104548:	39 d8                	cmp    %ebx,%eax
8010454a:	75 ec                	jne    80104538 <memcmp+0x28>
8010454c:	5b                   	pop    %ebx
8010454d:	31 c0                	xor    %eax,%eax
8010454f:	5e                   	pop    %esi
80104550:	5f                   	pop    %edi
80104551:	5d                   	pop    %ebp
80104552:	c3                   	ret    
80104553:	90                   	nop
80104554:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104558:	0f b6 c2             	movzbl %dl,%eax
8010455b:	5b                   	pop    %ebx
8010455c:	29 c8                	sub    %ecx,%eax
8010455e:	5e                   	pop    %esi
8010455f:	5f                   	pop    %edi
80104560:	5d                   	pop    %ebp
80104561:	c3                   	ret    
80104562:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104569:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104570 <memmove>:
80104570:	55                   	push   %ebp
80104571:	89 e5                	mov    %esp,%ebp
80104573:	56                   	push   %esi
80104574:	53                   	push   %ebx
80104575:	8b 45 08             	mov    0x8(%ebp),%eax
80104578:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010457b:	8b 75 10             	mov    0x10(%ebp),%esi
8010457e:	39 c3                	cmp    %eax,%ebx
80104580:	73 26                	jae    801045a8 <memmove+0x38>
80104582:	8d 14 33             	lea    (%ebx,%esi,1),%edx
80104585:	39 d0                	cmp    %edx,%eax
80104587:	73 1f                	jae    801045a8 <memmove+0x38>
80104589:	85 f6                	test   %esi,%esi
8010458b:	8d 56 ff             	lea    -0x1(%esi),%edx
8010458e:	74 0f                	je     8010459f <memmove+0x2f>
80104590:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
80104594:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104597:	83 ea 01             	sub    $0x1,%edx
8010459a:	83 fa ff             	cmp    $0xffffffff,%edx
8010459d:	75 f1                	jne    80104590 <memmove+0x20>
8010459f:	5b                   	pop    %ebx
801045a0:	5e                   	pop    %esi
801045a1:	5d                   	pop    %ebp
801045a2:	c3                   	ret    
801045a3:	90                   	nop
801045a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801045a8:	31 d2                	xor    %edx,%edx
801045aa:	85 f6                	test   %esi,%esi
801045ac:	74 f1                	je     8010459f <memmove+0x2f>
801045ae:	66 90                	xchg   %ax,%ax
801045b0:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
801045b4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
801045b7:	83 c2 01             	add    $0x1,%edx
801045ba:	39 f2                	cmp    %esi,%edx
801045bc:	75 f2                	jne    801045b0 <memmove+0x40>
801045be:	5b                   	pop    %ebx
801045bf:	5e                   	pop    %esi
801045c0:	5d                   	pop    %ebp
801045c1:	c3                   	ret    
801045c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801045c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801045d0 <memcpy>:
801045d0:	55                   	push   %ebp
801045d1:	89 e5                	mov    %esp,%ebp
801045d3:	5d                   	pop    %ebp
801045d4:	eb 9a                	jmp    80104570 <memmove>
801045d6:	8d 76 00             	lea    0x0(%esi),%esi
801045d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801045e0 <strncmp>:
801045e0:	55                   	push   %ebp
801045e1:	89 e5                	mov    %esp,%ebp
801045e3:	57                   	push   %edi
801045e4:	56                   	push   %esi
801045e5:	8b 7d 10             	mov    0x10(%ebp),%edi
801045e8:	53                   	push   %ebx
801045e9:	8b 4d 08             	mov    0x8(%ebp),%ecx
801045ec:	8b 75 0c             	mov    0xc(%ebp),%esi
801045ef:	85 ff                	test   %edi,%edi
801045f1:	74 2f                	je     80104622 <strncmp+0x42>
801045f3:	0f b6 11             	movzbl (%ecx),%edx
801045f6:	0f b6 1e             	movzbl (%esi),%ebx
801045f9:	84 d2                	test   %dl,%dl
801045fb:	74 37                	je     80104634 <strncmp+0x54>
801045fd:	38 d3                	cmp    %dl,%bl
801045ff:	75 33                	jne    80104634 <strncmp+0x54>
80104601:	01 f7                	add    %esi,%edi
80104603:	eb 13                	jmp    80104618 <strncmp+0x38>
80104605:	8d 76 00             	lea    0x0(%esi),%esi
80104608:	0f b6 11             	movzbl (%ecx),%edx
8010460b:	84 d2                	test   %dl,%dl
8010460d:	74 21                	je     80104630 <strncmp+0x50>
8010460f:	0f b6 18             	movzbl (%eax),%ebx
80104612:	89 c6                	mov    %eax,%esi
80104614:	38 da                	cmp    %bl,%dl
80104616:	75 1c                	jne    80104634 <strncmp+0x54>
80104618:	8d 46 01             	lea    0x1(%esi),%eax
8010461b:	83 c1 01             	add    $0x1,%ecx
8010461e:	39 f8                	cmp    %edi,%eax
80104620:	75 e6                	jne    80104608 <strncmp+0x28>
80104622:	5b                   	pop    %ebx
80104623:	31 c0                	xor    %eax,%eax
80104625:	5e                   	pop    %esi
80104626:	5f                   	pop    %edi
80104627:	5d                   	pop    %ebp
80104628:	c3                   	ret    
80104629:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104630:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
80104634:	0f b6 c2             	movzbl %dl,%eax
80104637:	29 d8                	sub    %ebx,%eax
80104639:	5b                   	pop    %ebx
8010463a:	5e                   	pop    %esi
8010463b:	5f                   	pop    %edi
8010463c:	5d                   	pop    %ebp
8010463d:	c3                   	ret    
8010463e:	66 90                	xchg   %ax,%ax

80104640 <strncpy>:
80104640:	55                   	push   %ebp
80104641:	89 e5                	mov    %esp,%ebp
80104643:	56                   	push   %esi
80104644:	53                   	push   %ebx
80104645:	8b 45 08             	mov    0x8(%ebp),%eax
80104648:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010464b:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010464e:	89 c2                	mov    %eax,%edx
80104650:	eb 19                	jmp    8010466b <strncpy+0x2b>
80104652:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104658:	83 c3 01             	add    $0x1,%ebx
8010465b:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
8010465f:	83 c2 01             	add    $0x1,%edx
80104662:	84 c9                	test   %cl,%cl
80104664:	88 4a ff             	mov    %cl,-0x1(%edx)
80104667:	74 09                	je     80104672 <strncpy+0x32>
80104669:	89 f1                	mov    %esi,%ecx
8010466b:	85 c9                	test   %ecx,%ecx
8010466d:	8d 71 ff             	lea    -0x1(%ecx),%esi
80104670:	7f e6                	jg     80104658 <strncpy+0x18>
80104672:	31 c9                	xor    %ecx,%ecx
80104674:	85 f6                	test   %esi,%esi
80104676:	7e 17                	jle    8010468f <strncpy+0x4f>
80104678:	90                   	nop
80104679:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104680:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
80104684:	89 f3                	mov    %esi,%ebx
80104686:	83 c1 01             	add    $0x1,%ecx
80104689:	29 cb                	sub    %ecx,%ebx
8010468b:	85 db                	test   %ebx,%ebx
8010468d:	7f f1                	jg     80104680 <strncpy+0x40>
8010468f:	5b                   	pop    %ebx
80104690:	5e                   	pop    %esi
80104691:	5d                   	pop    %ebp
80104692:	c3                   	ret    
80104693:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801046a0 <safestrcpy>:
801046a0:	55                   	push   %ebp
801046a1:	89 e5                	mov    %esp,%ebp
801046a3:	56                   	push   %esi
801046a4:	53                   	push   %ebx
801046a5:	8b 4d 10             	mov    0x10(%ebp),%ecx
801046a8:	8b 45 08             	mov    0x8(%ebp),%eax
801046ab:	8b 55 0c             	mov    0xc(%ebp),%edx
801046ae:	85 c9                	test   %ecx,%ecx
801046b0:	7e 26                	jle    801046d8 <safestrcpy+0x38>
801046b2:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
801046b6:	89 c1                	mov    %eax,%ecx
801046b8:	eb 17                	jmp    801046d1 <safestrcpy+0x31>
801046ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801046c0:	83 c2 01             	add    $0x1,%edx
801046c3:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
801046c7:	83 c1 01             	add    $0x1,%ecx
801046ca:	84 db                	test   %bl,%bl
801046cc:	88 59 ff             	mov    %bl,-0x1(%ecx)
801046cf:	74 04                	je     801046d5 <safestrcpy+0x35>
801046d1:	39 f2                	cmp    %esi,%edx
801046d3:	75 eb                	jne    801046c0 <safestrcpy+0x20>
801046d5:	c6 01 00             	movb   $0x0,(%ecx)
801046d8:	5b                   	pop    %ebx
801046d9:	5e                   	pop    %esi
801046da:	5d                   	pop    %ebp
801046db:	c3                   	ret    
801046dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801046e0 <strlen>:
801046e0:	55                   	push   %ebp
801046e1:	31 c0                	xor    %eax,%eax
801046e3:	89 e5                	mov    %esp,%ebp
801046e5:	8b 55 08             	mov    0x8(%ebp),%edx
801046e8:	80 3a 00             	cmpb   $0x0,(%edx)
801046eb:	74 0c                	je     801046f9 <strlen+0x19>
801046ed:	8d 76 00             	lea    0x0(%esi),%esi
801046f0:	83 c0 01             	add    $0x1,%eax
801046f3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
801046f7:	75 f7                	jne    801046f0 <strlen+0x10>
801046f9:	5d                   	pop    %ebp
801046fa:	c3                   	ret    

801046fb <swtch>:
801046fb:	8b 44 24 04          	mov    0x4(%esp),%eax
801046ff:	8b 54 24 08          	mov    0x8(%esp),%edx
80104703:	55                   	push   %ebp
80104704:	53                   	push   %ebx
80104705:	56                   	push   %esi
80104706:	57                   	push   %edi
80104707:	89 20                	mov    %esp,(%eax)
80104709:	89 d4                	mov    %edx,%esp
8010470b:	5f                   	pop    %edi
8010470c:	5e                   	pop    %esi
8010470d:	5b                   	pop    %ebx
8010470e:	5d                   	pop    %ebp
8010470f:	c3                   	ret    

80104710 <fetchint>:
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
80104710:	55                   	push   %ebp
80104711:	89 e5                	mov    %esp,%ebp
80104713:	53                   	push   %ebx
80104714:	83 ec 04             	sub    $0x4,%esp
80104717:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *curproc = myproc();
8010471a:	e8 81 f0 ff ff       	call   801037a0 <myproc>

  if(addr >= curproc->sz || addr+4 > curproc->sz)
8010471f:	8b 00                	mov    (%eax),%eax
80104721:	39 d8                	cmp    %ebx,%eax
80104723:	76 1b                	jbe    80104740 <fetchint+0x30>
80104725:	8d 53 04             	lea    0x4(%ebx),%edx
80104728:	39 d0                	cmp    %edx,%eax
8010472a:	72 14                	jb     80104740 <fetchint+0x30>
    return -1;
  *ip = *(int*)(addr);
8010472c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010472f:	8b 13                	mov    (%ebx),%edx
80104731:	89 10                	mov    %edx,(%eax)
  return 0;
80104733:	31 c0                	xor    %eax,%eax
}
80104735:	83 c4 04             	add    $0x4,%esp
80104738:	5b                   	pop    %ebx
80104739:	5d                   	pop    %ebp
8010473a:	c3                   	ret    
8010473b:	90                   	nop
8010473c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104740:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104745:	eb ee                	jmp    80104735 <fetchint+0x25>
80104747:	89 f6                	mov    %esi,%esi
80104749:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104750 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
80104750:	55                   	push   %ebp
80104751:	89 e5                	mov    %esp,%ebp
80104753:	53                   	push   %ebx
80104754:	83 ec 04             	sub    $0x4,%esp
80104757:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char *s, *ep;
  struct proc *curproc = myproc();
8010475a:	e8 41 f0 ff ff       	call   801037a0 <myproc>

  if(addr >= curproc->sz)
8010475f:	39 18                	cmp    %ebx,(%eax)
80104761:	76 29                	jbe    8010478c <fetchstr+0x3c>
    return -1;
  *pp = (char*)addr;
80104763:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80104766:	89 da                	mov    %ebx,%edx
80104768:	89 19                	mov    %ebx,(%ecx)
  ep = (char*)curproc->sz;
8010476a:	8b 00                	mov    (%eax),%eax
  for(s = *pp; s < ep; s++){
8010476c:	39 c3                	cmp    %eax,%ebx
8010476e:	73 1c                	jae    8010478c <fetchstr+0x3c>
    if(*s == 0)
80104770:	80 3b 00             	cmpb   $0x0,(%ebx)
80104773:	75 10                	jne    80104785 <fetchstr+0x35>
80104775:	eb 29                	jmp    801047a0 <fetchstr+0x50>
80104777:	89 f6                	mov    %esi,%esi
80104779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104780:	80 3a 00             	cmpb   $0x0,(%edx)
80104783:	74 1b                	je     801047a0 <fetchstr+0x50>
  for(s = *pp; s < ep; s++){
80104785:	83 c2 01             	add    $0x1,%edx
80104788:	39 d0                	cmp    %edx,%eax
8010478a:	77 f4                	ja     80104780 <fetchstr+0x30>
      return s - *pp;
  }
  return -1;
}
8010478c:	83 c4 04             	add    $0x4,%esp
    return -1;
8010478f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104794:	5b                   	pop    %ebx
80104795:	5d                   	pop    %ebp
80104796:	c3                   	ret    
80104797:	89 f6                	mov    %esi,%esi
80104799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801047a0:	83 c4 04             	add    $0x4,%esp
      return s - *pp;
801047a3:	89 d0                	mov    %edx,%eax
801047a5:	29 d8                	sub    %ebx,%eax
}
801047a7:	5b                   	pop    %ebx
801047a8:	5d                   	pop    %ebp
801047a9:	c3                   	ret    
801047aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801047b0 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
801047b0:	55                   	push   %ebp
801047b1:	89 e5                	mov    %esp,%ebp
801047b3:	56                   	push   %esi
801047b4:	53                   	push   %ebx
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
801047b5:	e8 e6 ef ff ff       	call   801037a0 <myproc>
801047ba:	8b 40 18             	mov    0x18(%eax),%eax
801047bd:	8b 55 08             	mov    0x8(%ebp),%edx
801047c0:	8b 40 44             	mov    0x44(%eax),%eax
801047c3:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
  struct proc *curproc = myproc();
801047c6:	e8 d5 ef ff ff       	call   801037a0 <myproc>
  if(addr >= curproc->sz || addr+4 > curproc->sz)
801047cb:	8b 00                	mov    (%eax),%eax
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
801047cd:	8d 73 04             	lea    0x4(%ebx),%esi
  if(addr >= curproc->sz || addr+4 > curproc->sz)
801047d0:	39 c6                	cmp    %eax,%esi
801047d2:	73 1c                	jae    801047f0 <argint+0x40>
801047d4:	8d 53 08             	lea    0x8(%ebx),%edx
801047d7:	39 d0                	cmp    %edx,%eax
801047d9:	72 15                	jb     801047f0 <argint+0x40>
  *ip = *(int*)(addr);
801047db:	8b 45 0c             	mov    0xc(%ebp),%eax
801047de:	8b 53 04             	mov    0x4(%ebx),%edx
801047e1:	89 10                	mov    %edx,(%eax)
  return 0;
801047e3:	31 c0                	xor    %eax,%eax
}
801047e5:	5b                   	pop    %ebx
801047e6:	5e                   	pop    %esi
801047e7:	5d                   	pop    %ebp
801047e8:	c3                   	ret    
801047e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
801047f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
801047f5:	eb ee                	jmp    801047e5 <argint+0x35>
801047f7:	89 f6                	mov    %esi,%esi
801047f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104800 <argptr>:
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
80104800:	55                   	push   %ebp
80104801:	89 e5                	mov    %esp,%ebp
80104803:	56                   	push   %esi
80104804:	53                   	push   %ebx
80104805:	83 ec 10             	sub    $0x10,%esp
80104808:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int i;
  struct proc *curproc = myproc();
8010480b:	e8 90 ef ff ff       	call   801037a0 <myproc>
80104810:	89 c6                	mov    %eax,%esi
 
  if(argint(n, &i) < 0)
80104812:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104815:	83 ec 08             	sub    $0x8,%esp
80104818:	50                   	push   %eax
80104819:	ff 75 08             	pushl  0x8(%ebp)
8010481c:	e8 8f ff ff ff       	call   801047b0 <argint>
80104821:	c1 e8 1f             	shr    $0x1f,%eax
    return -1;
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
80104824:	83 c4 10             	add    $0x10,%esp
80104827:	84 c0                	test   %al,%al
80104829:	75 2d                	jne    80104858 <argptr+0x58>
8010482b:	89 d8                	mov    %ebx,%eax
8010482d:	c1 e8 1f             	shr    $0x1f,%eax
80104830:	84 c0                	test   %al,%al
80104832:	75 24                	jne    80104858 <argptr+0x58>
80104834:	8b 16                	mov    (%esi),%edx
80104836:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104839:	39 c2                	cmp    %eax,%edx
8010483b:	76 1b                	jbe    80104858 <argptr+0x58>
8010483d:	01 c3                	add    %eax,%ebx
8010483f:	39 da                	cmp    %ebx,%edx
80104841:	72 15                	jb     80104858 <argptr+0x58>
    return -1;
  *pp = (char*)i;
80104843:	8b 55 0c             	mov    0xc(%ebp),%edx
80104846:	89 02                	mov    %eax,(%edx)
  return 0;
80104848:	31 c0                	xor    %eax,%eax
}
8010484a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010484d:	5b                   	pop    %ebx
8010484e:	5e                   	pop    %esi
8010484f:	5d                   	pop    %ebp
80104850:	c3                   	ret    
80104851:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104858:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010485d:	eb eb                	jmp    8010484a <argptr+0x4a>
8010485f:	90                   	nop

80104860 <argstr>:
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
80104860:	55                   	push   %ebp
80104861:	89 e5                	mov    %esp,%ebp
80104863:	83 ec 20             	sub    $0x20,%esp
  int addr;
  if(argint(n, &addr) < 0)
80104866:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104869:	50                   	push   %eax
8010486a:	ff 75 08             	pushl  0x8(%ebp)
8010486d:	e8 3e ff ff ff       	call   801047b0 <argint>
80104872:	83 c4 10             	add    $0x10,%esp
80104875:	85 c0                	test   %eax,%eax
80104877:	78 17                	js     80104890 <argstr+0x30>
    return -1;
  return fetchstr(addr, pp);
80104879:	83 ec 08             	sub    $0x8,%esp
8010487c:	ff 75 0c             	pushl  0xc(%ebp)
8010487f:	ff 75 f4             	pushl  -0xc(%ebp)
80104882:	e8 c9 fe ff ff       	call   80104750 <fetchstr>
80104887:	83 c4 10             	add    $0x10,%esp
}
8010488a:	c9                   	leave  
8010488b:	c3                   	ret    
8010488c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104890:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104895:	c9                   	leave  
80104896:	c3                   	ret    
80104897:	89 f6                	mov    %esi,%esi
80104899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801048a0 <syscall>:
[SYS_close]   sys_close,
};

void
syscall(void)
{
801048a0:	55                   	push   %ebp
801048a1:	89 e5                	mov    %esp,%ebp
801048a3:	56                   	push   %esi
801048a4:	53                   	push   %ebx
  int num;
  struct proc *curproc = myproc();
801048a5:	e8 f6 ee ff ff       	call   801037a0 <myproc>

  num = curproc->tf->eax;
801048aa:	8b 70 18             	mov    0x18(%eax),%esi
  struct proc *curproc = myproc();
801048ad:	89 c3                	mov    %eax,%ebx
  num = curproc->tf->eax;
801048af:	8b 46 1c             	mov    0x1c(%esi),%eax
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
801048b2:	8d 50 ff             	lea    -0x1(%eax),%edx
801048b5:	83 fa 14             	cmp    $0x14,%edx
801048b8:	77 1e                	ja     801048d8 <syscall+0x38>
801048ba:	8b 14 85 40 78 10 80 	mov    -0x7fef87c0(,%eax,4),%edx
801048c1:	85 d2                	test   %edx,%edx
801048c3:	74 13                	je     801048d8 <syscall+0x38>
    curproc->tf->eax = syscalls[num]();
801048c5:	ff d2                	call   *%edx
801048c7:	89 46 1c             	mov    %eax,0x1c(%esi)
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
  }
}
801048ca:	8d 65 f8             	lea    -0x8(%ebp),%esp
801048cd:	5b                   	pop    %ebx
801048ce:	5e                   	pop    %esi
801048cf:	5d                   	pop    %ebp
801048d0:	c3                   	ret    
801048d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    cprintf("%d %s: unknown sys call %d\n",
801048d8:	50                   	push   %eax
            curproc->pid, curproc->name, num);
801048d9:	8d 43 6c             	lea    0x6c(%ebx),%eax
    cprintf("%d %s: unknown sys call %d\n",
801048dc:	50                   	push   %eax
801048dd:	ff 73 10             	pushl  0x10(%ebx)
801048e0:	68 21 78 10 80       	push   $0x80107821
801048e5:	e8 76 bd ff ff       	call   80100660 <cprintf>
    curproc->tf->eax = -1;
801048ea:	8b 43 18             	mov    0x18(%ebx),%eax
801048ed:	83 c4 10             	add    $0x10,%esp
801048f0:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
}
801048f7:	8d 65 f8             	lea    -0x8(%ebp),%esp
801048fa:	5b                   	pop    %ebx
801048fb:	5e                   	pop    %esi
801048fc:	5d                   	pop    %ebp
801048fd:	c3                   	ret    
801048fe:	66 90                	xchg   %ax,%ax

80104900 <create>:
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104900:	55                   	push   %ebp
80104901:	89 e5                	mov    %esp,%ebp
80104903:	57                   	push   %edi
80104904:	56                   	push   %esi
80104905:	53                   	push   %ebx
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104906:	8d 5d da             	lea    -0x26(%ebp),%ebx
{
80104909:	83 ec 44             	sub    $0x44,%esp
8010490c:	89 4d c0             	mov    %ecx,-0x40(%ebp)
8010490f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  if((dp = nameiparent(path, name)) == 0)
80104912:	53                   	push   %ebx
80104913:	50                   	push   %eax
{
80104914:	89 55 c4             	mov    %edx,-0x3c(%ebp)
80104917:	89 4d bc             	mov    %ecx,-0x44(%ebp)
  if((dp = nameiparent(path, name)) == 0)
8010491a:	e8 c1 d5 ff ff       	call   80101ee0 <nameiparent>
8010491f:	83 c4 10             	add    $0x10,%esp
80104922:	85 c0                	test   %eax,%eax
80104924:	0f 84 f6 00 00 00    	je     80104a20 <create+0x120>
    return 0;
  ilock(dp);
8010492a:	83 ec 0c             	sub    $0xc,%esp
8010492d:	89 c6                	mov    %eax,%esi
8010492f:	50                   	push   %eax
80104930:	e8 3b cd ff ff       	call   80101670 <ilock>

  if((ip = dirlookup(dp, name, &off)) != 0){
80104935:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104938:	83 c4 0c             	add    $0xc,%esp
8010493b:	50                   	push   %eax
8010493c:	53                   	push   %ebx
8010493d:	56                   	push   %esi
8010493e:	e8 5d d2 ff ff       	call   80101ba0 <dirlookup>
80104943:	83 c4 10             	add    $0x10,%esp
80104946:	85 c0                	test   %eax,%eax
80104948:	89 c7                	mov    %eax,%edi
8010494a:	74 54                	je     801049a0 <create+0xa0>
    iunlockput(dp);
8010494c:	83 ec 0c             	sub    $0xc,%esp
8010494f:	56                   	push   %esi
80104950:	e8 ab cf ff ff       	call   80101900 <iunlockput>
    ilock(ip);
80104955:	89 3c 24             	mov    %edi,(%esp)
80104958:	e8 13 cd ff ff       	call   80101670 <ilock>
    if(type == T_FILE && ip->type == T_FILE)
8010495d:	83 c4 10             	add    $0x10,%esp
80104960:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
80104965:	75 19                	jne    80104980 <create+0x80>
80104967:	66 83 7f 50 02       	cmpw   $0x2,0x50(%edi)
8010496c:	75 12                	jne    80104980 <create+0x80>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
8010496e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104971:	89 f8                	mov    %edi,%eax
80104973:	5b                   	pop    %ebx
80104974:	5e                   	pop    %esi
80104975:	5f                   	pop    %edi
80104976:	5d                   	pop    %ebp
80104977:	c3                   	ret    
80104978:	90                   	nop
80104979:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    iunlockput(ip);
80104980:	83 ec 0c             	sub    $0xc,%esp
80104983:	57                   	push   %edi
    return 0;
80104984:	31 ff                	xor    %edi,%edi
    iunlockput(ip);
80104986:	e8 75 cf ff ff       	call   80101900 <iunlockput>
    return 0;
8010498b:	83 c4 10             	add    $0x10,%esp
}
8010498e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104991:	89 f8                	mov    %edi,%eax
80104993:	5b                   	pop    %ebx
80104994:	5e                   	pop    %esi
80104995:	5f                   	pop    %edi
80104996:	5d                   	pop    %ebp
80104997:	c3                   	ret    
80104998:	90                   	nop
80104999:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if((ip = ialloc(dp->dev, type)) == 0)
801049a0:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
801049a4:	83 ec 08             	sub    $0x8,%esp
801049a7:	50                   	push   %eax
801049a8:	ff 36                	pushl  (%esi)
801049aa:	e8 51 cb ff ff       	call   80101500 <ialloc>
801049af:	83 c4 10             	add    $0x10,%esp
801049b2:	85 c0                	test   %eax,%eax
801049b4:	89 c7                	mov    %eax,%edi
801049b6:	0f 84 cc 00 00 00    	je     80104a88 <create+0x188>
  ilock(ip);
801049bc:	83 ec 0c             	sub    $0xc,%esp
801049bf:	50                   	push   %eax
801049c0:	e8 ab cc ff ff       	call   80101670 <ilock>
  ip->major = major;
801049c5:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
801049c9:	66 89 47 52          	mov    %ax,0x52(%edi)
  ip->minor = minor;
801049cd:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
801049d1:	66 89 47 54          	mov    %ax,0x54(%edi)
  ip->nlink = 1;
801049d5:	b8 01 00 00 00       	mov    $0x1,%eax
801049da:	66 89 47 56          	mov    %ax,0x56(%edi)
  iupdate(ip);
801049de:	89 3c 24             	mov    %edi,(%esp)
801049e1:	e8 da cb ff ff       	call   801015c0 <iupdate>
  if(type == T_DIR){  // Create . and .. entries.
801049e6:	83 c4 10             	add    $0x10,%esp
801049e9:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
801049ee:	74 40                	je     80104a30 <create+0x130>
  if(dirlink(dp, name, ip->inum) < 0)
801049f0:	83 ec 04             	sub    $0x4,%esp
801049f3:	ff 77 04             	pushl  0x4(%edi)
801049f6:	53                   	push   %ebx
801049f7:	56                   	push   %esi
801049f8:	e8 03 d4 ff ff       	call   80101e00 <dirlink>
801049fd:	83 c4 10             	add    $0x10,%esp
80104a00:	85 c0                	test   %eax,%eax
80104a02:	78 77                	js     80104a7b <create+0x17b>
  iunlockput(dp);
80104a04:	83 ec 0c             	sub    $0xc,%esp
80104a07:	56                   	push   %esi
80104a08:	e8 f3 ce ff ff       	call   80101900 <iunlockput>
  return ip;
80104a0d:	83 c4 10             	add    $0x10,%esp
}
80104a10:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104a13:	89 f8                	mov    %edi,%eax
80104a15:	5b                   	pop    %ebx
80104a16:	5e                   	pop    %esi
80104a17:	5f                   	pop    %edi
80104a18:	5d                   	pop    %ebp
80104a19:	c3                   	ret    
80104a1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return 0;
80104a20:	31 ff                	xor    %edi,%edi
80104a22:	e9 47 ff ff ff       	jmp    8010496e <create+0x6e>
80104a27:	89 f6                	mov    %esi,%esi
80104a29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    dp->nlink++;  // for ".."
80104a30:	66 83 46 56 01       	addw   $0x1,0x56(%esi)
    iupdate(dp);
80104a35:	83 ec 0c             	sub    $0xc,%esp
80104a38:	56                   	push   %esi
80104a39:	e8 82 cb ff ff       	call   801015c0 <iupdate>
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
80104a3e:	83 c4 0c             	add    $0xc,%esp
80104a41:	ff 77 04             	pushl  0x4(%edi)
80104a44:	68 b4 78 10 80       	push   $0x801078b4
80104a49:	57                   	push   %edi
80104a4a:	e8 b1 d3 ff ff       	call   80101e00 <dirlink>
80104a4f:	83 c4 10             	add    $0x10,%esp
80104a52:	85 c0                	test   %eax,%eax
80104a54:	78 18                	js     80104a6e <create+0x16e>
80104a56:	83 ec 04             	sub    $0x4,%esp
80104a59:	ff 76 04             	pushl  0x4(%esi)
80104a5c:	68 b3 78 10 80       	push   $0x801078b3
80104a61:	57                   	push   %edi
80104a62:	e8 99 d3 ff ff       	call   80101e00 <dirlink>
80104a67:	83 c4 10             	add    $0x10,%esp
80104a6a:	85 c0                	test   %eax,%eax
80104a6c:	79 82                	jns    801049f0 <create+0xf0>
      panic("create dots");
80104a6e:	83 ec 0c             	sub    $0xc,%esp
80104a71:	68 a7 78 10 80       	push   $0x801078a7
80104a76:	e8 f5 b8 ff ff       	call   80100370 <panic>
    panic("create: dirlink");
80104a7b:	83 ec 0c             	sub    $0xc,%esp
80104a7e:	68 b6 78 10 80       	push   $0x801078b6
80104a83:	e8 e8 b8 ff ff       	call   80100370 <panic>
    panic("create: ialloc");
80104a88:	83 ec 0c             	sub    $0xc,%esp
80104a8b:	68 98 78 10 80       	push   $0x80107898
80104a90:	e8 db b8 ff ff       	call   80100370 <panic>
80104a95:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104a99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104aa0 <argfd.constprop.0>:
argfd(int n, int *pfd, struct file **pf)
80104aa0:	55                   	push   %ebp
80104aa1:	89 e5                	mov    %esp,%ebp
80104aa3:	56                   	push   %esi
80104aa4:	53                   	push   %ebx
80104aa5:	89 c6                	mov    %eax,%esi
  if(argint(n, &fd) < 0)
80104aa7:	8d 45 f4             	lea    -0xc(%ebp),%eax
argfd(int n, int *pfd, struct file **pf)
80104aaa:	89 d3                	mov    %edx,%ebx
80104aac:	83 ec 18             	sub    $0x18,%esp
  if(argint(n, &fd) < 0)
80104aaf:	50                   	push   %eax
80104ab0:	6a 00                	push   $0x0
80104ab2:	e8 f9 fc ff ff       	call   801047b0 <argint>
80104ab7:	83 c4 10             	add    $0x10,%esp
80104aba:	85 c0                	test   %eax,%eax
80104abc:	78 32                	js     80104af0 <argfd.constprop.0+0x50>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
80104abe:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104ac2:	77 2c                	ja     80104af0 <argfd.constprop.0+0x50>
80104ac4:	e8 d7 ec ff ff       	call   801037a0 <myproc>
80104ac9:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104acc:	8b 44 90 28          	mov    0x28(%eax,%edx,4),%eax
80104ad0:	85 c0                	test   %eax,%eax
80104ad2:	74 1c                	je     80104af0 <argfd.constprop.0+0x50>
  if(pfd)
80104ad4:	85 f6                	test   %esi,%esi
80104ad6:	74 02                	je     80104ada <argfd.constprop.0+0x3a>
    *pfd = fd;
80104ad8:	89 16                	mov    %edx,(%esi)
  if(pf)
80104ada:	85 db                	test   %ebx,%ebx
80104adc:	74 22                	je     80104b00 <argfd.constprop.0+0x60>
    *pf = f;
80104ade:	89 03                	mov    %eax,(%ebx)
  return 0;
80104ae0:	31 c0                	xor    %eax,%eax
}
80104ae2:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104ae5:	5b                   	pop    %ebx
80104ae6:	5e                   	pop    %esi
80104ae7:	5d                   	pop    %ebp
80104ae8:	c3                   	ret    
80104ae9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104af0:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return -1;
80104af3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104af8:	5b                   	pop    %ebx
80104af9:	5e                   	pop    %esi
80104afa:	5d                   	pop    %ebp
80104afb:	c3                   	ret    
80104afc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return 0;
80104b00:	31 c0                	xor    %eax,%eax
80104b02:	eb de                	jmp    80104ae2 <argfd.constprop.0+0x42>
80104b04:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104b0a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104b10 <sys_dup>:
{
80104b10:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0)
80104b11:	31 c0                	xor    %eax,%eax
{
80104b13:	89 e5                	mov    %esp,%ebp
80104b15:	56                   	push   %esi
80104b16:	53                   	push   %ebx
  if(argfd(0, 0, &f) < 0)
80104b17:	8d 55 f4             	lea    -0xc(%ebp),%edx
{
80104b1a:	83 ec 10             	sub    $0x10,%esp
  if(argfd(0, 0, &f) < 0)
80104b1d:	e8 7e ff ff ff       	call   80104aa0 <argfd.constprop.0>
80104b22:	85 c0                	test   %eax,%eax
80104b24:	78 1a                	js     80104b40 <sys_dup+0x30>
  for(fd = 0; fd < NOFILE; fd++){
80104b26:	31 db                	xor    %ebx,%ebx
  if((fd=fdalloc(f)) < 0)
80104b28:	8b 75 f4             	mov    -0xc(%ebp),%esi
  struct proc *curproc = myproc();
80104b2b:	e8 70 ec ff ff       	call   801037a0 <myproc>
    if(curproc->ofile[fd] == 0){
80104b30:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80104b34:	85 d2                	test   %edx,%edx
80104b36:	74 18                	je     80104b50 <sys_dup+0x40>
  for(fd = 0; fd < NOFILE; fd++){
80104b38:	83 c3 01             	add    $0x1,%ebx
80104b3b:	83 fb 10             	cmp    $0x10,%ebx
80104b3e:	75 f0                	jne    80104b30 <sys_dup+0x20>
}
80104b40:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return -1;
80104b43:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
}
80104b48:	89 d8                	mov    %ebx,%eax
80104b4a:	5b                   	pop    %ebx
80104b4b:	5e                   	pop    %esi
80104b4c:	5d                   	pop    %ebp
80104b4d:	c3                   	ret    
80104b4e:	66 90                	xchg   %ax,%ax
      curproc->ofile[fd] = f;
80104b50:	89 74 98 28          	mov    %esi,0x28(%eax,%ebx,4)
  filedup(f);
80104b54:	83 ec 0c             	sub    $0xc,%esp
80104b57:	ff 75 f4             	pushl  -0xc(%ebp)
80104b5a:	e8 71 c2 ff ff       	call   80100dd0 <filedup>
  return fd;
80104b5f:	83 c4 10             	add    $0x10,%esp
}
80104b62:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104b65:	89 d8                	mov    %ebx,%eax
80104b67:	5b                   	pop    %ebx
80104b68:	5e                   	pop    %esi
80104b69:	5d                   	pop    %ebp
80104b6a:	c3                   	ret    
80104b6b:	90                   	nop
80104b6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104b70 <sys_read>:
{
80104b70:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104b71:	31 c0                	xor    %eax,%eax
{
80104b73:	89 e5                	mov    %esp,%ebp
80104b75:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104b78:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104b7b:	e8 20 ff ff ff       	call   80104aa0 <argfd.constprop.0>
80104b80:	85 c0                	test   %eax,%eax
80104b82:	78 4c                	js     80104bd0 <sys_read+0x60>
80104b84:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104b87:	83 ec 08             	sub    $0x8,%esp
80104b8a:	50                   	push   %eax
80104b8b:	6a 02                	push   $0x2
80104b8d:	e8 1e fc ff ff       	call   801047b0 <argint>
80104b92:	83 c4 10             	add    $0x10,%esp
80104b95:	85 c0                	test   %eax,%eax
80104b97:	78 37                	js     80104bd0 <sys_read+0x60>
80104b99:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104b9c:	83 ec 04             	sub    $0x4,%esp
80104b9f:	ff 75 f0             	pushl  -0x10(%ebp)
80104ba2:	50                   	push   %eax
80104ba3:	6a 01                	push   $0x1
80104ba5:	e8 56 fc ff ff       	call   80104800 <argptr>
80104baa:	83 c4 10             	add    $0x10,%esp
80104bad:	85 c0                	test   %eax,%eax
80104baf:	78 1f                	js     80104bd0 <sys_read+0x60>
  return fileread(f, p, n);
80104bb1:	83 ec 04             	sub    $0x4,%esp
80104bb4:	ff 75 f0             	pushl  -0x10(%ebp)
80104bb7:	ff 75 f4             	pushl  -0xc(%ebp)
80104bba:	ff 75 ec             	pushl  -0x14(%ebp)
80104bbd:	e8 7e c3 ff ff       	call   80100f40 <fileread>
80104bc2:	83 c4 10             	add    $0x10,%esp
}
80104bc5:	c9                   	leave  
80104bc6:	c3                   	ret    
80104bc7:	89 f6                	mov    %esi,%esi
80104bc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
80104bd0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104bd5:	c9                   	leave  
80104bd6:	c3                   	ret    
80104bd7:	89 f6                	mov    %esi,%esi
80104bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104be0 <sys_write>:
{
80104be0:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104be1:	31 c0                	xor    %eax,%eax
{
80104be3:	89 e5                	mov    %esp,%ebp
80104be5:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104be8:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104beb:	e8 b0 fe ff ff       	call   80104aa0 <argfd.constprop.0>
80104bf0:	85 c0                	test   %eax,%eax
80104bf2:	78 4c                	js     80104c40 <sys_write+0x60>
80104bf4:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104bf7:	83 ec 08             	sub    $0x8,%esp
80104bfa:	50                   	push   %eax
80104bfb:	6a 02                	push   $0x2
80104bfd:	e8 ae fb ff ff       	call   801047b0 <argint>
80104c02:	83 c4 10             	add    $0x10,%esp
80104c05:	85 c0                	test   %eax,%eax
80104c07:	78 37                	js     80104c40 <sys_write+0x60>
80104c09:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c0c:	83 ec 04             	sub    $0x4,%esp
80104c0f:	ff 75 f0             	pushl  -0x10(%ebp)
80104c12:	50                   	push   %eax
80104c13:	6a 01                	push   $0x1
80104c15:	e8 e6 fb ff ff       	call   80104800 <argptr>
80104c1a:	83 c4 10             	add    $0x10,%esp
80104c1d:	85 c0                	test   %eax,%eax
80104c1f:	78 1f                	js     80104c40 <sys_write+0x60>
  return filewrite(f, p, n);
80104c21:	83 ec 04             	sub    $0x4,%esp
80104c24:	ff 75 f0             	pushl  -0x10(%ebp)
80104c27:	ff 75 f4             	pushl  -0xc(%ebp)
80104c2a:	ff 75 ec             	pushl  -0x14(%ebp)
80104c2d:	e8 9e c3 ff ff       	call   80100fd0 <filewrite>
80104c32:	83 c4 10             	add    $0x10,%esp
}
80104c35:	c9                   	leave  
80104c36:	c3                   	ret    
80104c37:	89 f6                	mov    %esi,%esi
80104c39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
80104c40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104c45:	c9                   	leave  
80104c46:	c3                   	ret    
80104c47:	89 f6                	mov    %esi,%esi
80104c49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104c50 <sys_close>:
{
80104c50:	55                   	push   %ebp
80104c51:	89 e5                	mov    %esp,%ebp
80104c53:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, &fd, &f) < 0)
80104c56:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104c59:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104c5c:	e8 3f fe ff ff       	call   80104aa0 <argfd.constprop.0>
80104c61:	85 c0                	test   %eax,%eax
80104c63:	78 2b                	js     80104c90 <sys_close+0x40>
  myproc()->ofile[fd] = 0;
80104c65:	e8 36 eb ff ff       	call   801037a0 <myproc>
80104c6a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  fileclose(f);
80104c6d:	83 ec 0c             	sub    $0xc,%esp
  myproc()->ofile[fd] = 0;
80104c70:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104c77:	00 
  fileclose(f);
80104c78:	ff 75 f4             	pushl  -0xc(%ebp)
80104c7b:	e8 a0 c1 ff ff       	call   80100e20 <fileclose>
  return 0;
80104c80:	83 c4 10             	add    $0x10,%esp
80104c83:	31 c0                	xor    %eax,%eax
}
80104c85:	c9                   	leave  
80104c86:	c3                   	ret    
80104c87:	89 f6                	mov    %esi,%esi
80104c89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
80104c90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104c95:	c9                   	leave  
80104c96:	c3                   	ret    
80104c97:	89 f6                	mov    %esi,%esi
80104c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104ca0 <sys_fstat>:
{
80104ca0:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104ca1:	31 c0                	xor    %eax,%eax
{
80104ca3:	89 e5                	mov    %esp,%ebp
80104ca5:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104ca8:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104cab:	e8 f0 fd ff ff       	call   80104aa0 <argfd.constprop.0>
80104cb0:	85 c0                	test   %eax,%eax
80104cb2:	78 2c                	js     80104ce0 <sys_fstat+0x40>
80104cb4:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104cb7:	83 ec 04             	sub    $0x4,%esp
80104cba:	6a 14                	push   $0x14
80104cbc:	50                   	push   %eax
80104cbd:	6a 01                	push   $0x1
80104cbf:	e8 3c fb ff ff       	call   80104800 <argptr>
80104cc4:	83 c4 10             	add    $0x10,%esp
80104cc7:	85 c0                	test   %eax,%eax
80104cc9:	78 15                	js     80104ce0 <sys_fstat+0x40>
  return filestat(f, st);
80104ccb:	83 ec 08             	sub    $0x8,%esp
80104cce:	ff 75 f4             	pushl  -0xc(%ebp)
80104cd1:	ff 75 f0             	pushl  -0x10(%ebp)
80104cd4:	e8 17 c2 ff ff       	call   80100ef0 <filestat>
80104cd9:	83 c4 10             	add    $0x10,%esp
}
80104cdc:	c9                   	leave  
80104cdd:	c3                   	ret    
80104cde:	66 90                	xchg   %ax,%ax
    return -1;
80104ce0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104ce5:	c9                   	leave  
80104ce6:	c3                   	ret    
80104ce7:	89 f6                	mov    %esi,%esi
80104ce9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104cf0 <sys_link>:
{
80104cf0:	55                   	push   %ebp
80104cf1:	89 e5                	mov    %esp,%ebp
80104cf3:	57                   	push   %edi
80104cf4:	56                   	push   %esi
80104cf5:	53                   	push   %ebx
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104cf6:	8d 45 d4             	lea    -0x2c(%ebp),%eax
{
80104cf9:	83 ec 34             	sub    $0x34,%esp
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104cfc:	50                   	push   %eax
80104cfd:	6a 00                	push   $0x0
80104cff:	e8 5c fb ff ff       	call   80104860 <argstr>
80104d04:	83 c4 10             	add    $0x10,%esp
80104d07:	85 c0                	test   %eax,%eax
80104d09:	0f 88 fb 00 00 00    	js     80104e0a <sys_link+0x11a>
80104d0f:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104d12:	83 ec 08             	sub    $0x8,%esp
80104d15:	50                   	push   %eax
80104d16:	6a 01                	push   $0x1
80104d18:	e8 43 fb ff ff       	call   80104860 <argstr>
80104d1d:	83 c4 10             	add    $0x10,%esp
80104d20:	85 c0                	test   %eax,%eax
80104d22:	0f 88 e2 00 00 00    	js     80104e0a <sys_link+0x11a>
  begin_op();
80104d28:	e8 43 de ff ff       	call   80102b70 <begin_op>
  if((ip = namei(old)) == 0){
80104d2d:	83 ec 0c             	sub    $0xc,%esp
80104d30:	ff 75 d4             	pushl  -0x2c(%ebp)
80104d33:	e8 88 d1 ff ff       	call   80101ec0 <namei>
80104d38:	83 c4 10             	add    $0x10,%esp
80104d3b:	85 c0                	test   %eax,%eax
80104d3d:	89 c3                	mov    %eax,%ebx
80104d3f:	0f 84 f3 00 00 00    	je     80104e38 <sys_link+0x148>
  ilock(ip);
80104d45:	83 ec 0c             	sub    $0xc,%esp
80104d48:	50                   	push   %eax
80104d49:	e8 22 c9 ff ff       	call   80101670 <ilock>
  if(ip->type == T_DIR){
80104d4e:	83 c4 10             	add    $0x10,%esp
80104d51:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104d56:	0f 84 c4 00 00 00    	je     80104e20 <sys_link+0x130>
  ip->nlink++;
80104d5c:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
  iupdate(ip);
80104d61:	83 ec 0c             	sub    $0xc,%esp
  if((dp = nameiparent(new, name)) == 0)
80104d64:	8d 7d da             	lea    -0x26(%ebp),%edi
  iupdate(ip);
80104d67:	53                   	push   %ebx
80104d68:	e8 53 c8 ff ff       	call   801015c0 <iupdate>
  iunlock(ip);
80104d6d:	89 1c 24             	mov    %ebx,(%esp)
80104d70:	e8 db c9 ff ff       	call   80101750 <iunlock>
  if((dp = nameiparent(new, name)) == 0)
80104d75:	58                   	pop    %eax
80104d76:	5a                   	pop    %edx
80104d77:	57                   	push   %edi
80104d78:	ff 75 d0             	pushl  -0x30(%ebp)
80104d7b:	e8 60 d1 ff ff       	call   80101ee0 <nameiparent>
80104d80:	83 c4 10             	add    $0x10,%esp
80104d83:	85 c0                	test   %eax,%eax
80104d85:	89 c6                	mov    %eax,%esi
80104d87:	74 5b                	je     80104de4 <sys_link+0xf4>
  ilock(dp);
80104d89:	83 ec 0c             	sub    $0xc,%esp
80104d8c:	50                   	push   %eax
80104d8d:	e8 de c8 ff ff       	call   80101670 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
80104d92:	83 c4 10             	add    $0x10,%esp
80104d95:	8b 03                	mov    (%ebx),%eax
80104d97:	39 06                	cmp    %eax,(%esi)
80104d99:	75 3d                	jne    80104dd8 <sys_link+0xe8>
80104d9b:	83 ec 04             	sub    $0x4,%esp
80104d9e:	ff 73 04             	pushl  0x4(%ebx)
80104da1:	57                   	push   %edi
80104da2:	56                   	push   %esi
80104da3:	e8 58 d0 ff ff       	call   80101e00 <dirlink>
80104da8:	83 c4 10             	add    $0x10,%esp
80104dab:	85 c0                	test   %eax,%eax
80104dad:	78 29                	js     80104dd8 <sys_link+0xe8>
  iunlockput(dp);
80104daf:	83 ec 0c             	sub    $0xc,%esp
80104db2:	56                   	push   %esi
80104db3:	e8 48 cb ff ff       	call   80101900 <iunlockput>
  iput(ip);
80104db8:	89 1c 24             	mov    %ebx,(%esp)
80104dbb:	e8 e0 c9 ff ff       	call   801017a0 <iput>
  end_op();
80104dc0:	e8 1b de ff ff       	call   80102be0 <end_op>
  return 0;
80104dc5:	83 c4 10             	add    $0x10,%esp
80104dc8:	31 c0                	xor    %eax,%eax
}
80104dca:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104dcd:	5b                   	pop    %ebx
80104dce:	5e                   	pop    %esi
80104dcf:	5f                   	pop    %edi
80104dd0:	5d                   	pop    %ebp
80104dd1:	c3                   	ret    
80104dd2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    iunlockput(dp);
80104dd8:	83 ec 0c             	sub    $0xc,%esp
80104ddb:	56                   	push   %esi
80104ddc:	e8 1f cb ff ff       	call   80101900 <iunlockput>
    goto bad;
80104de1:	83 c4 10             	add    $0x10,%esp
  ilock(ip);
80104de4:	83 ec 0c             	sub    $0xc,%esp
80104de7:	53                   	push   %ebx
80104de8:	e8 83 c8 ff ff       	call   80101670 <ilock>
  ip->nlink--;
80104ded:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80104df2:	89 1c 24             	mov    %ebx,(%esp)
80104df5:	e8 c6 c7 ff ff       	call   801015c0 <iupdate>
  iunlockput(ip);
80104dfa:	89 1c 24             	mov    %ebx,(%esp)
80104dfd:	e8 fe ca ff ff       	call   80101900 <iunlockput>
  end_op();
80104e02:	e8 d9 dd ff ff       	call   80102be0 <end_op>
  return -1;
80104e07:	83 c4 10             	add    $0x10,%esp
}
80104e0a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return -1;
80104e0d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104e12:	5b                   	pop    %ebx
80104e13:	5e                   	pop    %esi
80104e14:	5f                   	pop    %edi
80104e15:	5d                   	pop    %ebp
80104e16:	c3                   	ret    
80104e17:	89 f6                	mov    %esi,%esi
80104e19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    iunlockput(ip);
80104e20:	83 ec 0c             	sub    $0xc,%esp
80104e23:	53                   	push   %ebx
80104e24:	e8 d7 ca ff ff       	call   80101900 <iunlockput>
    end_op();
80104e29:	e8 b2 dd ff ff       	call   80102be0 <end_op>
    return -1;
80104e2e:	83 c4 10             	add    $0x10,%esp
80104e31:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e36:	eb 92                	jmp    80104dca <sys_link+0xda>
    end_op();
80104e38:	e8 a3 dd ff ff       	call   80102be0 <end_op>
    return -1;
80104e3d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e42:	eb 86                	jmp    80104dca <sys_link+0xda>
80104e44:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104e4a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104e50 <sys_unlink>:
{
80104e50:	55                   	push   %ebp
80104e51:	89 e5                	mov    %esp,%ebp
80104e53:	57                   	push   %edi
80104e54:	56                   	push   %esi
80104e55:	53                   	push   %ebx
  if(argstr(0, &path) < 0)
80104e56:	8d 45 c0             	lea    -0x40(%ebp),%eax
{
80104e59:	83 ec 54             	sub    $0x54,%esp
  if(argstr(0, &path) < 0)
80104e5c:	50                   	push   %eax
80104e5d:	6a 00                	push   $0x0
80104e5f:	e8 fc f9 ff ff       	call   80104860 <argstr>
80104e64:	83 c4 10             	add    $0x10,%esp
80104e67:	85 c0                	test   %eax,%eax
80104e69:	0f 88 82 01 00 00    	js     80104ff1 <sys_unlink+0x1a1>
  if((dp = nameiparent(path, name)) == 0){
80104e6f:	8d 5d ca             	lea    -0x36(%ebp),%ebx
  begin_op();
80104e72:	e8 f9 dc ff ff       	call   80102b70 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
80104e77:	83 ec 08             	sub    $0x8,%esp
80104e7a:	53                   	push   %ebx
80104e7b:	ff 75 c0             	pushl  -0x40(%ebp)
80104e7e:	e8 5d d0 ff ff       	call   80101ee0 <nameiparent>
80104e83:	83 c4 10             	add    $0x10,%esp
80104e86:	85 c0                	test   %eax,%eax
80104e88:	89 45 b4             	mov    %eax,-0x4c(%ebp)
80104e8b:	0f 84 6a 01 00 00    	je     80104ffb <sys_unlink+0x1ab>
  ilock(dp);
80104e91:	8b 75 b4             	mov    -0x4c(%ebp),%esi
80104e94:	83 ec 0c             	sub    $0xc,%esp
80104e97:	56                   	push   %esi
80104e98:	e8 d3 c7 ff ff       	call   80101670 <ilock>
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
80104e9d:	58                   	pop    %eax
80104e9e:	5a                   	pop    %edx
80104e9f:	68 b4 78 10 80       	push   $0x801078b4
80104ea4:	53                   	push   %ebx
80104ea5:	e8 d6 cc ff ff       	call   80101b80 <namecmp>
80104eaa:	83 c4 10             	add    $0x10,%esp
80104ead:	85 c0                	test   %eax,%eax
80104eaf:	0f 84 fc 00 00 00    	je     80104fb1 <sys_unlink+0x161>
80104eb5:	83 ec 08             	sub    $0x8,%esp
80104eb8:	68 b3 78 10 80       	push   $0x801078b3
80104ebd:	53                   	push   %ebx
80104ebe:	e8 bd cc ff ff       	call   80101b80 <namecmp>
80104ec3:	83 c4 10             	add    $0x10,%esp
80104ec6:	85 c0                	test   %eax,%eax
80104ec8:	0f 84 e3 00 00 00    	je     80104fb1 <sys_unlink+0x161>
  if((ip = dirlookup(dp, name, &off)) == 0)
80104ece:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80104ed1:	83 ec 04             	sub    $0x4,%esp
80104ed4:	50                   	push   %eax
80104ed5:	53                   	push   %ebx
80104ed6:	56                   	push   %esi
80104ed7:	e8 c4 cc ff ff       	call   80101ba0 <dirlookup>
80104edc:	83 c4 10             	add    $0x10,%esp
80104edf:	85 c0                	test   %eax,%eax
80104ee1:	89 c3                	mov    %eax,%ebx
80104ee3:	0f 84 c8 00 00 00    	je     80104fb1 <sys_unlink+0x161>
  ilock(ip);
80104ee9:	83 ec 0c             	sub    $0xc,%esp
80104eec:	50                   	push   %eax
80104eed:	e8 7e c7 ff ff       	call   80101670 <ilock>
  if(ip->nlink < 1)
80104ef2:	83 c4 10             	add    $0x10,%esp
80104ef5:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80104efa:	0f 8e 24 01 00 00    	jle    80105024 <sys_unlink+0x1d4>
  if(ip->type == T_DIR && !isdirempty(ip)){
80104f00:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104f05:	8d 75 d8             	lea    -0x28(%ebp),%esi
80104f08:	74 66                	je     80104f70 <sys_unlink+0x120>
  memset(&de, 0, sizeof(de));
80104f0a:	83 ec 04             	sub    $0x4,%esp
80104f0d:	6a 10                	push   $0x10
80104f0f:	6a 00                	push   $0x0
80104f11:	56                   	push   %esi
80104f12:	e8 a9 f5 ff ff       	call   801044c0 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80104f17:	6a 10                	push   $0x10
80104f19:	ff 75 c4             	pushl  -0x3c(%ebp)
80104f1c:	56                   	push   %esi
80104f1d:	ff 75 b4             	pushl  -0x4c(%ebp)
80104f20:	e8 2b cb ff ff       	call   80101a50 <writei>
80104f25:	83 c4 20             	add    $0x20,%esp
80104f28:	83 f8 10             	cmp    $0x10,%eax
80104f2b:	0f 85 e6 00 00 00    	jne    80105017 <sys_unlink+0x1c7>
  if(ip->type == T_DIR){
80104f31:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104f36:	0f 84 9c 00 00 00    	je     80104fd8 <sys_unlink+0x188>
  iunlockput(dp);
80104f3c:	83 ec 0c             	sub    $0xc,%esp
80104f3f:	ff 75 b4             	pushl  -0x4c(%ebp)
80104f42:	e8 b9 c9 ff ff       	call   80101900 <iunlockput>
  ip->nlink--;
80104f47:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80104f4c:	89 1c 24             	mov    %ebx,(%esp)
80104f4f:	e8 6c c6 ff ff       	call   801015c0 <iupdate>
  iunlockput(ip);
80104f54:	89 1c 24             	mov    %ebx,(%esp)
80104f57:	e8 a4 c9 ff ff       	call   80101900 <iunlockput>
  end_op();
80104f5c:	e8 7f dc ff ff       	call   80102be0 <end_op>
  return 0;
80104f61:	83 c4 10             	add    $0x10,%esp
80104f64:	31 c0                	xor    %eax,%eax
}
80104f66:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104f69:	5b                   	pop    %ebx
80104f6a:	5e                   	pop    %esi
80104f6b:	5f                   	pop    %edi
80104f6c:	5d                   	pop    %ebp
80104f6d:	c3                   	ret    
80104f6e:	66 90                	xchg   %ax,%ax
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
80104f70:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80104f74:	76 94                	jbe    80104f0a <sys_unlink+0xba>
80104f76:	bf 20 00 00 00       	mov    $0x20,%edi
80104f7b:	eb 0f                	jmp    80104f8c <sys_unlink+0x13c>
80104f7d:	8d 76 00             	lea    0x0(%esi),%esi
80104f80:	83 c7 10             	add    $0x10,%edi
80104f83:	3b 7b 58             	cmp    0x58(%ebx),%edi
80104f86:	0f 83 7e ff ff ff    	jae    80104f0a <sys_unlink+0xba>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80104f8c:	6a 10                	push   $0x10
80104f8e:	57                   	push   %edi
80104f8f:	56                   	push   %esi
80104f90:	53                   	push   %ebx
80104f91:	e8 ba c9 ff ff       	call   80101950 <readi>
80104f96:	83 c4 10             	add    $0x10,%esp
80104f99:	83 f8 10             	cmp    $0x10,%eax
80104f9c:	75 6c                	jne    8010500a <sys_unlink+0x1ba>
    if(de.inum != 0)
80104f9e:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80104fa3:	74 db                	je     80104f80 <sys_unlink+0x130>
    iunlockput(ip);
80104fa5:	83 ec 0c             	sub    $0xc,%esp
80104fa8:	53                   	push   %ebx
80104fa9:	e8 52 c9 ff ff       	call   80101900 <iunlockput>
    goto bad;
80104fae:	83 c4 10             	add    $0x10,%esp
  iunlockput(dp);
80104fb1:	83 ec 0c             	sub    $0xc,%esp
80104fb4:	ff 75 b4             	pushl  -0x4c(%ebp)
80104fb7:	e8 44 c9 ff ff       	call   80101900 <iunlockput>
  end_op();
80104fbc:	e8 1f dc ff ff       	call   80102be0 <end_op>
  return -1;
80104fc1:	83 c4 10             	add    $0x10,%esp
}
80104fc4:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return -1;
80104fc7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104fcc:	5b                   	pop    %ebx
80104fcd:	5e                   	pop    %esi
80104fce:	5f                   	pop    %edi
80104fcf:	5d                   	pop    %ebp
80104fd0:	c3                   	ret    
80104fd1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    dp->nlink--;
80104fd8:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    iupdate(dp);
80104fdb:	83 ec 0c             	sub    $0xc,%esp
    dp->nlink--;
80104fde:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
    iupdate(dp);
80104fe3:	50                   	push   %eax
80104fe4:	e8 d7 c5 ff ff       	call   801015c0 <iupdate>
80104fe9:	83 c4 10             	add    $0x10,%esp
80104fec:	e9 4b ff ff ff       	jmp    80104f3c <sys_unlink+0xec>
    return -1;
80104ff1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ff6:	e9 6b ff ff ff       	jmp    80104f66 <sys_unlink+0x116>
    end_op();
80104ffb:	e8 e0 db ff ff       	call   80102be0 <end_op>
    return -1;
80105000:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105005:	e9 5c ff ff ff       	jmp    80104f66 <sys_unlink+0x116>
      panic("isdirempty: readi");
8010500a:	83 ec 0c             	sub    $0xc,%esp
8010500d:	68 d8 78 10 80       	push   $0x801078d8
80105012:	e8 59 b3 ff ff       	call   80100370 <panic>
    panic("unlink: writei");
80105017:	83 ec 0c             	sub    $0xc,%esp
8010501a:	68 ea 78 10 80       	push   $0x801078ea
8010501f:	e8 4c b3 ff ff       	call   80100370 <panic>
    panic("unlink: nlink < 1");
80105024:	83 ec 0c             	sub    $0xc,%esp
80105027:	68 c6 78 10 80       	push   $0x801078c6
8010502c:	e8 3f b3 ff ff       	call   80100370 <panic>
80105031:	eb 0d                	jmp    80105040 <sys_open>
80105033:	90                   	nop
80105034:	90                   	nop
80105035:	90                   	nop
80105036:	90                   	nop
80105037:	90                   	nop
80105038:	90                   	nop
80105039:	90                   	nop
8010503a:	90                   	nop
8010503b:	90                   	nop
8010503c:	90                   	nop
8010503d:	90                   	nop
8010503e:	90                   	nop
8010503f:	90                   	nop

80105040 <sys_open>:

int
sys_open(void)
{
80105040:	55                   	push   %ebp
80105041:	89 e5                	mov    %esp,%ebp
80105043:	57                   	push   %edi
80105044:	56                   	push   %esi
80105045:	53                   	push   %ebx
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80105046:	8d 45 e0             	lea    -0x20(%ebp),%eax
{
80105049:	83 ec 24             	sub    $0x24,%esp
  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
8010504c:	50                   	push   %eax
8010504d:	6a 00                	push   $0x0
8010504f:	e8 0c f8 ff ff       	call   80104860 <argstr>
80105054:	83 c4 10             	add    $0x10,%esp
80105057:	85 c0                	test   %eax,%eax
80105059:	0f 88 9e 00 00 00    	js     801050fd <sys_open+0xbd>
8010505f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105062:	83 ec 08             	sub    $0x8,%esp
80105065:	50                   	push   %eax
80105066:	6a 01                	push   $0x1
80105068:	e8 43 f7 ff ff       	call   801047b0 <argint>
8010506d:	83 c4 10             	add    $0x10,%esp
80105070:	85 c0                	test   %eax,%eax
80105072:	0f 88 85 00 00 00    	js     801050fd <sys_open+0xbd>
    return -1;

  begin_op();
80105078:	e8 f3 da ff ff       	call   80102b70 <begin_op>

  if(omode & O_CREATE){
8010507d:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80105081:	0f 85 89 00 00 00    	jne    80105110 <sys_open+0xd0>
    if(ip == 0){
      end_op();
      return -1;
    }
  } else {
    if((ip = namei(path)) == 0){
80105087:	83 ec 0c             	sub    $0xc,%esp
8010508a:	ff 75 e0             	pushl  -0x20(%ebp)
8010508d:	e8 2e ce ff ff       	call   80101ec0 <namei>
80105092:	83 c4 10             	add    $0x10,%esp
80105095:	85 c0                	test   %eax,%eax
80105097:	89 c6                	mov    %eax,%esi
80105099:	0f 84 8e 00 00 00    	je     8010512d <sys_open+0xed>
      end_op();
      return -1;
    }
    ilock(ip);
8010509f:	83 ec 0c             	sub    $0xc,%esp
801050a2:	50                   	push   %eax
801050a3:	e8 c8 c5 ff ff       	call   80101670 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
801050a8:	83 c4 10             	add    $0x10,%esp
801050ab:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
801050b0:	0f 84 d2 00 00 00    	je     80105188 <sys_open+0x148>
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
801050b6:	e8 a5 bc ff ff       	call   80100d60 <filealloc>
801050bb:	85 c0                	test   %eax,%eax
801050bd:	89 c7                	mov    %eax,%edi
801050bf:	74 2b                	je     801050ec <sys_open+0xac>
  for(fd = 0; fd < NOFILE; fd++){
801050c1:	31 db                	xor    %ebx,%ebx
  struct proc *curproc = myproc();
801050c3:	e8 d8 e6 ff ff       	call   801037a0 <myproc>
801050c8:	90                   	nop
801050c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(curproc->ofile[fd] == 0){
801050d0:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
801050d4:	85 d2                	test   %edx,%edx
801050d6:	74 68                	je     80105140 <sys_open+0x100>
  for(fd = 0; fd < NOFILE; fd++){
801050d8:	83 c3 01             	add    $0x1,%ebx
801050db:	83 fb 10             	cmp    $0x10,%ebx
801050de:	75 f0                	jne    801050d0 <sys_open+0x90>
    if(f)
      fileclose(f);
801050e0:	83 ec 0c             	sub    $0xc,%esp
801050e3:	57                   	push   %edi
801050e4:	e8 37 bd ff ff       	call   80100e20 <fileclose>
801050e9:	83 c4 10             	add    $0x10,%esp
    iunlockput(ip);
801050ec:	83 ec 0c             	sub    $0xc,%esp
801050ef:	56                   	push   %esi
801050f0:	e8 0b c8 ff ff       	call   80101900 <iunlockput>
    end_op();
801050f5:	e8 e6 da ff ff       	call   80102be0 <end_op>
    return -1;
801050fa:	83 c4 10             	add    $0x10,%esp
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
801050fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return -1;
80105100:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
}
80105105:	89 d8                	mov    %ebx,%eax
80105107:	5b                   	pop    %ebx
80105108:	5e                   	pop    %esi
80105109:	5f                   	pop    %edi
8010510a:	5d                   	pop    %ebp
8010510b:	c3                   	ret    
8010510c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    ip = create(path, T_FILE, 0, 0);
80105110:	83 ec 0c             	sub    $0xc,%esp
80105113:	8b 45 e0             	mov    -0x20(%ebp),%eax
80105116:	31 c9                	xor    %ecx,%ecx
80105118:	6a 00                	push   $0x0
8010511a:	ba 02 00 00 00       	mov    $0x2,%edx
8010511f:	e8 dc f7 ff ff       	call   80104900 <create>
    if(ip == 0){
80105124:	83 c4 10             	add    $0x10,%esp
80105127:	85 c0                	test   %eax,%eax
    ip = create(path, T_FILE, 0, 0);
80105129:	89 c6                	mov    %eax,%esi
    if(ip == 0){
8010512b:	75 89                	jne    801050b6 <sys_open+0x76>
      end_op();
8010512d:	e8 ae da ff ff       	call   80102be0 <end_op>
      return -1;
80105132:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105137:	eb 40                	jmp    80105179 <sys_open+0x139>
80105139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  iunlock(ip);
80105140:	83 ec 0c             	sub    $0xc,%esp
      curproc->ofile[fd] = f;
80105143:	89 7c 98 28          	mov    %edi,0x28(%eax,%ebx,4)
  iunlock(ip);
80105147:	56                   	push   %esi
80105148:	e8 03 c6 ff ff       	call   80101750 <iunlock>
  end_op();
8010514d:	e8 8e da ff ff       	call   80102be0 <end_op>
  f->type = FD_INODE;
80105152:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  f->readable = !(omode & O_WRONLY);
80105158:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
8010515b:	83 c4 10             	add    $0x10,%esp
  f->ip = ip;
8010515e:	89 77 10             	mov    %esi,0x10(%edi)
  f->off = 0;
80105161:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
  f->readable = !(omode & O_WRONLY);
80105168:	89 c2                	mov    %eax,%edx
8010516a:	f7 d2                	not    %edx
8010516c:	88 57 08             	mov    %dl,0x8(%edi)
8010516f:	80 67 08 01          	andb   $0x1,0x8(%edi)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105173:	a8 03                	test   $0x3,%al
80105175:	0f 95 47 09          	setne  0x9(%edi)
}
80105179:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010517c:	89 d8                	mov    %ebx,%eax
8010517e:	5b                   	pop    %ebx
8010517f:	5e                   	pop    %esi
80105180:	5f                   	pop    %edi
80105181:	5d                   	pop    %ebp
80105182:	c3                   	ret    
80105183:	90                   	nop
80105184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ip->type == T_DIR && omode != O_RDONLY){
80105188:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
8010518b:	85 c9                	test   %ecx,%ecx
8010518d:	0f 84 23 ff ff ff    	je     801050b6 <sys_open+0x76>
80105193:	e9 54 ff ff ff       	jmp    801050ec <sys_open+0xac>
80105198:	90                   	nop
80105199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801051a0 <sys_mkdir>:

int
sys_mkdir(void)
{
801051a0:	55                   	push   %ebp
801051a1:	89 e5                	mov    %esp,%ebp
801051a3:	83 ec 18             	sub    $0x18,%esp
  char *path;
  struct inode *ip;

  begin_op();
801051a6:	e8 c5 d9 ff ff       	call   80102b70 <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
801051ab:	8d 45 f4             	lea    -0xc(%ebp),%eax
801051ae:	83 ec 08             	sub    $0x8,%esp
801051b1:	50                   	push   %eax
801051b2:	6a 00                	push   $0x0
801051b4:	e8 a7 f6 ff ff       	call   80104860 <argstr>
801051b9:	83 c4 10             	add    $0x10,%esp
801051bc:	85 c0                	test   %eax,%eax
801051be:	78 30                	js     801051f0 <sys_mkdir+0x50>
801051c0:	83 ec 0c             	sub    $0xc,%esp
801051c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801051c6:	31 c9                	xor    %ecx,%ecx
801051c8:	6a 00                	push   $0x0
801051ca:	ba 01 00 00 00       	mov    $0x1,%edx
801051cf:	e8 2c f7 ff ff       	call   80104900 <create>
801051d4:	83 c4 10             	add    $0x10,%esp
801051d7:	85 c0                	test   %eax,%eax
801051d9:	74 15                	je     801051f0 <sys_mkdir+0x50>
    end_op();
    return -1;
  }
  iunlockput(ip);
801051db:	83 ec 0c             	sub    $0xc,%esp
801051de:	50                   	push   %eax
801051df:	e8 1c c7 ff ff       	call   80101900 <iunlockput>
  end_op();
801051e4:	e8 f7 d9 ff ff       	call   80102be0 <end_op>
  return 0;
801051e9:	83 c4 10             	add    $0x10,%esp
801051ec:	31 c0                	xor    %eax,%eax
}
801051ee:	c9                   	leave  
801051ef:	c3                   	ret    
    end_op();
801051f0:	e8 eb d9 ff ff       	call   80102be0 <end_op>
    return -1;
801051f5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801051fa:	c9                   	leave  
801051fb:	c3                   	ret    
801051fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105200 <sys_mknod>:

int
sys_mknod(void)
{
80105200:	55                   	push   %ebp
80105201:	89 e5                	mov    %esp,%ebp
80105203:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
80105206:	e8 65 d9 ff ff       	call   80102b70 <begin_op>
  if((argstr(0, &path)) < 0 ||
8010520b:	8d 45 ec             	lea    -0x14(%ebp),%eax
8010520e:	83 ec 08             	sub    $0x8,%esp
80105211:	50                   	push   %eax
80105212:	6a 00                	push   $0x0
80105214:	e8 47 f6 ff ff       	call   80104860 <argstr>
80105219:	83 c4 10             	add    $0x10,%esp
8010521c:	85 c0                	test   %eax,%eax
8010521e:	78 60                	js     80105280 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
80105220:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105223:	83 ec 08             	sub    $0x8,%esp
80105226:	50                   	push   %eax
80105227:	6a 01                	push   $0x1
80105229:	e8 82 f5 ff ff       	call   801047b0 <argint>
  if((argstr(0, &path)) < 0 ||
8010522e:	83 c4 10             	add    $0x10,%esp
80105231:	85 c0                	test   %eax,%eax
80105233:	78 4b                	js     80105280 <sys_mknod+0x80>
     argint(2, &minor) < 0 ||
80105235:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105238:	83 ec 08             	sub    $0x8,%esp
8010523b:	50                   	push   %eax
8010523c:	6a 02                	push   $0x2
8010523e:	e8 6d f5 ff ff       	call   801047b0 <argint>
     argint(1, &major) < 0 ||
80105243:	83 c4 10             	add    $0x10,%esp
80105246:	85 c0                	test   %eax,%eax
80105248:	78 36                	js     80105280 <sys_mknod+0x80>
     (ip = create(path, T_DEV, major, minor)) == 0){
8010524a:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
     argint(2, &minor) < 0 ||
8010524e:	83 ec 0c             	sub    $0xc,%esp
     (ip = create(path, T_DEV, major, minor)) == 0){
80105251:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
     argint(2, &minor) < 0 ||
80105255:	ba 03 00 00 00       	mov    $0x3,%edx
8010525a:	50                   	push   %eax
8010525b:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010525e:	e8 9d f6 ff ff       	call   80104900 <create>
80105263:	83 c4 10             	add    $0x10,%esp
80105266:	85 c0                	test   %eax,%eax
80105268:	74 16                	je     80105280 <sys_mknod+0x80>
    end_op();
    return -1;
  }
  iunlockput(ip);
8010526a:	83 ec 0c             	sub    $0xc,%esp
8010526d:	50                   	push   %eax
8010526e:	e8 8d c6 ff ff       	call   80101900 <iunlockput>
  end_op();
80105273:	e8 68 d9 ff ff       	call   80102be0 <end_op>
  return 0;
80105278:	83 c4 10             	add    $0x10,%esp
8010527b:	31 c0                	xor    %eax,%eax
}
8010527d:	c9                   	leave  
8010527e:	c3                   	ret    
8010527f:	90                   	nop
    end_op();
80105280:	e8 5b d9 ff ff       	call   80102be0 <end_op>
    return -1;
80105285:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010528a:	c9                   	leave  
8010528b:	c3                   	ret    
8010528c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105290 <sys_chdir>:

int
sys_chdir(void)
{
80105290:	55                   	push   %ebp
80105291:	89 e5                	mov    %esp,%ebp
80105293:	56                   	push   %esi
80105294:	53                   	push   %ebx
80105295:	83 ec 10             	sub    $0x10,%esp
  char *path;
  struct inode *ip;
  struct proc *curproc = myproc();
80105298:	e8 03 e5 ff ff       	call   801037a0 <myproc>
8010529d:	89 c6                	mov    %eax,%esi
  
  begin_op();
8010529f:	e8 cc d8 ff ff       	call   80102b70 <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
801052a4:	8d 45 f4             	lea    -0xc(%ebp),%eax
801052a7:	83 ec 08             	sub    $0x8,%esp
801052aa:	50                   	push   %eax
801052ab:	6a 00                	push   $0x0
801052ad:	e8 ae f5 ff ff       	call   80104860 <argstr>
801052b2:	83 c4 10             	add    $0x10,%esp
801052b5:	85 c0                	test   %eax,%eax
801052b7:	78 77                	js     80105330 <sys_chdir+0xa0>
801052b9:	83 ec 0c             	sub    $0xc,%esp
801052bc:	ff 75 f4             	pushl  -0xc(%ebp)
801052bf:	e8 fc cb ff ff       	call   80101ec0 <namei>
801052c4:	83 c4 10             	add    $0x10,%esp
801052c7:	85 c0                	test   %eax,%eax
801052c9:	89 c3                	mov    %eax,%ebx
801052cb:	74 63                	je     80105330 <sys_chdir+0xa0>
    end_op();
    return -1;
  }
  ilock(ip);
801052cd:	83 ec 0c             	sub    $0xc,%esp
801052d0:	50                   	push   %eax
801052d1:	e8 9a c3 ff ff       	call   80101670 <ilock>
  if(ip->type != T_DIR){
801052d6:	83 c4 10             	add    $0x10,%esp
801052d9:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801052de:	75 30                	jne    80105310 <sys_chdir+0x80>
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
801052e0:	83 ec 0c             	sub    $0xc,%esp
801052e3:	53                   	push   %ebx
801052e4:	e8 67 c4 ff ff       	call   80101750 <iunlock>
  iput(curproc->cwd);
801052e9:	58                   	pop    %eax
801052ea:	ff 76 68             	pushl  0x68(%esi)
801052ed:	e8 ae c4 ff ff       	call   801017a0 <iput>
  end_op();
801052f2:	e8 e9 d8 ff ff       	call   80102be0 <end_op>
  curproc->cwd = ip;
801052f7:	89 5e 68             	mov    %ebx,0x68(%esi)
  return 0;
801052fa:	83 c4 10             	add    $0x10,%esp
801052fd:	31 c0                	xor    %eax,%eax
}
801052ff:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105302:	5b                   	pop    %ebx
80105303:	5e                   	pop    %esi
80105304:	5d                   	pop    %ebp
80105305:	c3                   	ret    
80105306:	8d 76 00             	lea    0x0(%esi),%esi
80105309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    iunlockput(ip);
80105310:	83 ec 0c             	sub    $0xc,%esp
80105313:	53                   	push   %ebx
80105314:	e8 e7 c5 ff ff       	call   80101900 <iunlockput>
    end_op();
80105319:	e8 c2 d8 ff ff       	call   80102be0 <end_op>
    return -1;
8010531e:	83 c4 10             	add    $0x10,%esp
80105321:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105326:	eb d7                	jmp    801052ff <sys_chdir+0x6f>
80105328:	90                   	nop
80105329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    end_op();
80105330:	e8 ab d8 ff ff       	call   80102be0 <end_op>
    return -1;
80105335:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010533a:	eb c3                	jmp    801052ff <sys_chdir+0x6f>
8010533c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105340 <sys_exec>:

int
sys_exec(void)
{
80105340:	55                   	push   %ebp
80105341:	89 e5                	mov    %esp,%ebp
80105343:	57                   	push   %edi
80105344:	56                   	push   %esi
80105345:	53                   	push   %ebx
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80105346:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
{
8010534c:	81 ec a4 00 00 00    	sub    $0xa4,%esp
  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80105352:	50                   	push   %eax
80105353:	6a 00                	push   $0x0
80105355:	e8 06 f5 ff ff       	call   80104860 <argstr>
8010535a:	83 c4 10             	add    $0x10,%esp
8010535d:	85 c0                	test   %eax,%eax
8010535f:	78 7f                	js     801053e0 <sys_exec+0xa0>
80105361:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
80105367:	83 ec 08             	sub    $0x8,%esp
8010536a:	50                   	push   %eax
8010536b:	6a 01                	push   $0x1
8010536d:	e8 3e f4 ff ff       	call   801047b0 <argint>
80105372:	83 c4 10             	add    $0x10,%esp
80105375:	85 c0                	test   %eax,%eax
80105377:	78 67                	js     801053e0 <sys_exec+0xa0>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
80105379:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
8010537f:	83 ec 04             	sub    $0x4,%esp
80105382:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
80105388:	68 80 00 00 00       	push   $0x80
8010538d:	6a 00                	push   $0x0
8010538f:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80105395:	50                   	push   %eax
80105396:	31 db                	xor    %ebx,%ebx
80105398:	e8 23 f1 ff ff       	call   801044c0 <memset>
8010539d:	83 c4 10             	add    $0x10,%esp
  for(i=0;; i++){
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
801053a0:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
801053a6:	83 ec 08             	sub    $0x8,%esp
801053a9:	57                   	push   %edi
801053aa:	8d 04 98             	lea    (%eax,%ebx,4),%eax
801053ad:	50                   	push   %eax
801053ae:	e8 5d f3 ff ff       	call   80104710 <fetchint>
801053b3:	83 c4 10             	add    $0x10,%esp
801053b6:	85 c0                	test   %eax,%eax
801053b8:	78 26                	js     801053e0 <sys_exec+0xa0>
      return -1;
    if(uarg == 0){
801053ba:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
801053c0:	85 c0                	test   %eax,%eax
801053c2:	74 2c                	je     801053f0 <sys_exec+0xb0>
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
801053c4:	83 ec 08             	sub    $0x8,%esp
801053c7:	56                   	push   %esi
801053c8:	50                   	push   %eax
801053c9:	e8 82 f3 ff ff       	call   80104750 <fetchstr>
801053ce:	83 c4 10             	add    $0x10,%esp
801053d1:	85 c0                	test   %eax,%eax
801053d3:	78 0b                	js     801053e0 <sys_exec+0xa0>
  for(i=0;; i++){
801053d5:	83 c3 01             	add    $0x1,%ebx
801053d8:	83 c6 04             	add    $0x4,%esi
    if(i >= NELEM(argv))
801053db:	83 fb 20             	cmp    $0x20,%ebx
801053de:	75 c0                	jne    801053a0 <sys_exec+0x60>
      return -1;
  }
  return exec(path, argv);
}
801053e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return -1;
801053e3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801053e8:	5b                   	pop    %ebx
801053e9:	5e                   	pop    %esi
801053ea:	5f                   	pop    %edi
801053eb:	5d                   	pop    %ebp
801053ec:	c3                   	ret    
801053ed:	8d 76 00             	lea    0x0(%esi),%esi
  return exec(path, argv);
801053f0:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801053f6:	83 ec 08             	sub    $0x8,%esp
      argv[i] = 0;
801053f9:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
80105400:	00 00 00 00 
  return exec(path, argv);
80105404:	50                   	push   %eax
80105405:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
8010540b:	e8 d0 b5 ff ff       	call   801009e0 <exec>
80105410:	83 c4 10             	add    $0x10,%esp
}
80105413:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105416:	5b                   	pop    %ebx
80105417:	5e                   	pop    %esi
80105418:	5f                   	pop    %edi
80105419:	5d                   	pop    %ebp
8010541a:	c3                   	ret    
8010541b:	90                   	nop
8010541c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105420 <sys_pipe>:

int
sys_pipe(void)
{
80105420:	55                   	push   %ebp
80105421:	89 e5                	mov    %esp,%ebp
80105423:	57                   	push   %edi
80105424:	56                   	push   %esi
80105425:	53                   	push   %ebx
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
80105426:	8d 45 dc             	lea    -0x24(%ebp),%eax
{
80105429:	83 ec 20             	sub    $0x20,%esp
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
8010542c:	6a 08                	push   $0x8
8010542e:	50                   	push   %eax
8010542f:	6a 00                	push   $0x0
80105431:	e8 ca f3 ff ff       	call   80104800 <argptr>
80105436:	83 c4 10             	add    $0x10,%esp
80105439:	85 c0                	test   %eax,%eax
8010543b:	78 4a                	js     80105487 <sys_pipe+0x67>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
8010543d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105440:	83 ec 08             	sub    $0x8,%esp
80105443:	50                   	push   %eax
80105444:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105447:	50                   	push   %eax
80105448:	e8 b3 dd ff ff       	call   80103200 <pipealloc>
8010544d:	83 c4 10             	add    $0x10,%esp
80105450:	85 c0                	test   %eax,%eax
80105452:	78 33                	js     80105487 <sys_pipe+0x67>
  for(fd = 0; fd < NOFILE; fd++){
80105454:	31 db                	xor    %ebx,%ebx
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
80105456:	8b 7d e0             	mov    -0x20(%ebp),%edi
  struct proc *curproc = myproc();
80105459:	e8 42 e3 ff ff       	call   801037a0 <myproc>
8010545e:	66 90                	xchg   %ax,%ax
    if(curproc->ofile[fd] == 0){
80105460:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
80105464:	85 f6                	test   %esi,%esi
80105466:	74 30                	je     80105498 <sys_pipe+0x78>
  for(fd = 0; fd < NOFILE; fd++){
80105468:	83 c3 01             	add    $0x1,%ebx
8010546b:	83 fb 10             	cmp    $0x10,%ebx
8010546e:	75 f0                	jne    80105460 <sys_pipe+0x40>
    if(fd0 >= 0)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
80105470:	83 ec 0c             	sub    $0xc,%esp
80105473:	ff 75 e0             	pushl  -0x20(%ebp)
80105476:	e8 a5 b9 ff ff       	call   80100e20 <fileclose>
    fileclose(wf);
8010547b:	58                   	pop    %eax
8010547c:	ff 75 e4             	pushl  -0x1c(%ebp)
8010547f:	e8 9c b9 ff ff       	call   80100e20 <fileclose>
    return -1;
80105484:	83 c4 10             	add    $0x10,%esp
  }
  fd[0] = fd0;
  fd[1] = fd1;
  return 0;
}
80105487:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return -1;
8010548a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010548f:	5b                   	pop    %ebx
80105490:	5e                   	pop    %esi
80105491:	5f                   	pop    %edi
80105492:	5d                   	pop    %ebp
80105493:	c3                   	ret    
80105494:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      curproc->ofile[fd] = f;
80105498:	8d 73 08             	lea    0x8(%ebx),%esi
8010549b:	89 7c b0 08          	mov    %edi,0x8(%eax,%esi,4)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
8010549f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  struct proc *curproc = myproc();
801054a2:	e8 f9 e2 ff ff       	call   801037a0 <myproc>
  for(fd = 0; fd < NOFILE; fd++){
801054a7:	31 d2                	xor    %edx,%edx
801054a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(curproc->ofile[fd] == 0){
801054b0:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
801054b4:	85 c9                	test   %ecx,%ecx
801054b6:	74 18                	je     801054d0 <sys_pipe+0xb0>
  for(fd = 0; fd < NOFILE; fd++){
801054b8:	83 c2 01             	add    $0x1,%edx
801054bb:	83 fa 10             	cmp    $0x10,%edx
801054be:	75 f0                	jne    801054b0 <sys_pipe+0x90>
      myproc()->ofile[fd0] = 0;
801054c0:	e8 db e2 ff ff       	call   801037a0 <myproc>
801054c5:	c7 44 b0 08 00 00 00 	movl   $0x0,0x8(%eax,%esi,4)
801054cc:	00 
801054cd:	eb a1                	jmp    80105470 <sys_pipe+0x50>
801054cf:	90                   	nop
      curproc->ofile[fd] = f;
801054d0:	89 7c 90 28          	mov    %edi,0x28(%eax,%edx,4)
  fd[0] = fd0;
801054d4:	8b 45 dc             	mov    -0x24(%ebp),%eax
801054d7:	89 18                	mov    %ebx,(%eax)
  fd[1] = fd1;
801054d9:	8b 45 dc             	mov    -0x24(%ebp),%eax
801054dc:	89 50 04             	mov    %edx,0x4(%eax)
}
801054df:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
801054e2:	31 c0                	xor    %eax,%eax
}
801054e4:	5b                   	pop    %ebx
801054e5:	5e                   	pop    %esi
801054e6:	5f                   	pop    %edi
801054e7:	5d                   	pop    %ebp
801054e8:	c3                   	ret    
801054e9:	66 90                	xchg   %ax,%ax
801054eb:	66 90                	xchg   %ax,%ax
801054ed:	66 90                	xchg   %ax,%ax
801054ef:	90                   	nop

801054f0 <sys_fork>:
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
801054f0:	55                   	push   %ebp
801054f1:	89 e5                	mov    %esp,%ebp
801054f3:	83 ec 20             	sub    $0x20,%esp
  int tickets;
  if(argint(0, &tickets) < 0)
801054f6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801054f9:	50                   	push   %eax
801054fa:	6a 00                	push   $0x0
801054fc:	e8 af f2 ff ff       	call   801047b0 <argint>
80105501:	83 c4 10             	add    $0x10,%esp
80105504:	85 c0                	test   %eax,%eax
80105506:	78 18                	js     80105520 <sys_fork+0x30>
    return -1;
  return fork(tickets);
80105508:	83 ec 0c             	sub    $0xc,%esp
8010550b:	ff 75 f4             	pushl  -0xc(%ebp)
8010550e:	e8 2d e4 ff ff       	call   80103940 <fork>
80105513:	83 c4 10             	add    $0x10,%esp
}
80105516:	c9                   	leave  
80105517:	c3                   	ret    
80105518:	90                   	nop
80105519:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80105520:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105525:	c9                   	leave  
80105526:	c3                   	ret    
80105527:	89 f6                	mov    %esi,%esi
80105529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105530 <sys_exit>:

int
sys_exit(void)
{
80105530:	55                   	push   %ebp
80105531:	89 e5                	mov    %esp,%ebp
80105533:	83 ec 08             	sub    $0x8,%esp
  exit();
80105536:	e8 f5 e6 ff ff       	call   80103c30 <exit>
  return 0;  // not reached
}
8010553b:	31 c0                	xor    %eax,%eax
8010553d:	c9                   	leave  
8010553e:	c3                   	ret    
8010553f:	90                   	nop

80105540 <sys_wait>:

int
sys_wait(void)
{
80105540:	55                   	push   %ebp
80105541:	89 e5                	mov    %esp,%ebp
  return wait();
}
80105543:	5d                   	pop    %ebp
  return wait();
80105544:	e9 27 e9 ff ff       	jmp    80103e70 <wait>
80105549:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105550 <sys_kill>:

int
sys_kill(void)
{
80105550:	55                   	push   %ebp
80105551:	89 e5                	mov    %esp,%ebp
80105553:	83 ec 20             	sub    $0x20,%esp
  int pid;

  if(argint(0, &pid) < 0)
80105556:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105559:	50                   	push   %eax
8010555a:	6a 00                	push   $0x0
8010555c:	e8 4f f2 ff ff       	call   801047b0 <argint>
80105561:	83 c4 10             	add    $0x10,%esp
80105564:	85 c0                	test   %eax,%eax
80105566:	78 18                	js     80105580 <sys_kill+0x30>
    return -1;
  return kill(pid);
80105568:	83 ec 0c             	sub    $0xc,%esp
8010556b:	ff 75 f4             	pushl  -0xc(%ebp)
8010556e:	e8 5d ea ff ff       	call   80103fd0 <kill>
80105573:	83 c4 10             	add    $0x10,%esp
}
80105576:	c9                   	leave  
80105577:	c3                   	ret    
80105578:	90                   	nop
80105579:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80105580:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105585:	c9                   	leave  
80105586:	c3                   	ret    
80105587:	89 f6                	mov    %esi,%esi
80105589:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105590 <sys_getpid>:

int
sys_getpid(void)
{
80105590:	55                   	push   %ebp
80105591:	89 e5                	mov    %esp,%ebp
80105593:	83 ec 08             	sub    $0x8,%esp
  return myproc()->pid;
80105596:	e8 05 e2 ff ff       	call   801037a0 <myproc>
8010559b:	8b 40 10             	mov    0x10(%eax),%eax
}
8010559e:	c9                   	leave  
8010559f:	c3                   	ret    

801055a0 <sys_sbrk>:

int
sys_sbrk(void)
{
801055a0:	55                   	push   %ebp
801055a1:	89 e5                	mov    %esp,%ebp
801055a3:	53                   	push   %ebx
  int addr;
  int n;

  if(argint(0, &n) < 0)
801055a4:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
801055a7:	83 ec 1c             	sub    $0x1c,%esp
  if(argint(0, &n) < 0)
801055aa:	50                   	push   %eax
801055ab:	6a 00                	push   $0x0
801055ad:	e8 fe f1 ff ff       	call   801047b0 <argint>
801055b2:	83 c4 10             	add    $0x10,%esp
801055b5:	85 c0                	test   %eax,%eax
801055b7:	78 27                	js     801055e0 <sys_sbrk+0x40>
    return -1;
  addr = myproc()->sz;
801055b9:	e8 e2 e1 ff ff       	call   801037a0 <myproc>
  if(growproc(n) < 0)
801055be:	83 ec 0c             	sub    $0xc,%esp
  addr = myproc()->sz;
801055c1:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
801055c3:	ff 75 f4             	pushl  -0xc(%ebp)
801055c6:	e8 f5 e2 ff ff       	call   801038c0 <growproc>
801055cb:	83 c4 10             	add    $0x10,%esp
801055ce:	85 c0                	test   %eax,%eax
801055d0:	78 0e                	js     801055e0 <sys_sbrk+0x40>
    return -1;
  return addr;
}
801055d2:	89 d8                	mov    %ebx,%eax
801055d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801055d7:	c9                   	leave  
801055d8:	c3                   	ret    
801055d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
801055e0:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801055e5:	eb eb                	jmp    801055d2 <sys_sbrk+0x32>
801055e7:	89 f6                	mov    %esi,%esi
801055e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801055f0 <sys_sleep>:

int
sys_sleep(void)
{
801055f0:	55                   	push   %ebp
801055f1:	89 e5                	mov    %esp,%ebp
801055f3:	53                   	push   %ebx
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
801055f4:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
801055f7:	83 ec 1c             	sub    $0x1c,%esp
  if(argint(0, &n) < 0)
801055fa:	50                   	push   %eax
801055fb:	6a 00                	push   $0x0
801055fd:	e8 ae f1 ff ff       	call   801047b0 <argint>
80105602:	83 c4 10             	add    $0x10,%esp
80105605:	85 c0                	test   %eax,%eax
80105607:	0f 88 8a 00 00 00    	js     80105697 <sys_sleep+0xa7>
    return -1;
  acquire(&tickslock);
8010560d:	83 ec 0c             	sub    $0xc,%esp
80105610:	68 20 59 11 80       	push   $0x80115920
80105615:	e8 a6 ed ff ff       	call   801043c0 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
8010561a:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010561d:	83 c4 10             	add    $0x10,%esp
  ticks0 = ticks;
80105620:	8b 1d 60 61 11 80    	mov    0x80116160,%ebx
  while(ticks - ticks0 < n){
80105626:	85 d2                	test   %edx,%edx
80105628:	75 27                	jne    80105651 <sys_sleep+0x61>
8010562a:	eb 54                	jmp    80105680 <sys_sleep+0x90>
8010562c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
80105630:	83 ec 08             	sub    $0x8,%esp
80105633:	68 20 59 11 80       	push   $0x80115920
80105638:	68 60 61 11 80       	push   $0x80116160
8010563d:	e8 6e e7 ff ff       	call   80103db0 <sleep>
  while(ticks - ticks0 < n){
80105642:	a1 60 61 11 80       	mov    0x80116160,%eax
80105647:	83 c4 10             	add    $0x10,%esp
8010564a:	29 d8                	sub    %ebx,%eax
8010564c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
8010564f:	73 2f                	jae    80105680 <sys_sleep+0x90>
    if(myproc()->killed){
80105651:	e8 4a e1 ff ff       	call   801037a0 <myproc>
80105656:	8b 40 24             	mov    0x24(%eax),%eax
80105659:	85 c0                	test   %eax,%eax
8010565b:	74 d3                	je     80105630 <sys_sleep+0x40>
      release(&tickslock);
8010565d:	83 ec 0c             	sub    $0xc,%esp
80105660:	68 20 59 11 80       	push   $0x80115920
80105665:	e8 06 ee ff ff       	call   80104470 <release>
      return -1;
8010566a:	83 c4 10             	add    $0x10,%esp
8010566d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  release(&tickslock);
  return 0;
}
80105672:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105675:	c9                   	leave  
80105676:	c3                   	ret    
80105677:	89 f6                	mov    %esi,%esi
80105679:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  release(&tickslock);
80105680:	83 ec 0c             	sub    $0xc,%esp
80105683:	68 20 59 11 80       	push   $0x80115920
80105688:	e8 e3 ed ff ff       	call   80104470 <release>
  return 0;
8010568d:	83 c4 10             	add    $0x10,%esp
80105690:	31 c0                	xor    %eax,%eax
}
80105692:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105695:	c9                   	leave  
80105696:	c3                   	ret    
    return -1;
80105697:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010569c:	eb d4                	jmp    80105672 <sys_sleep+0x82>
8010569e:	66 90                	xchg   %ax,%ax

801056a0 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
801056a0:	55                   	push   %ebp
801056a1:	89 e5                	mov    %esp,%ebp
801056a3:	53                   	push   %ebx
801056a4:	83 ec 10             	sub    $0x10,%esp
  uint xticks;

  acquire(&tickslock);
801056a7:	68 20 59 11 80       	push   $0x80115920
801056ac:	e8 0f ed ff ff       	call   801043c0 <acquire>
  xticks = ticks;
801056b1:	8b 1d 60 61 11 80    	mov    0x80116160,%ebx
  release(&tickslock);
801056b7:	c7 04 24 20 59 11 80 	movl   $0x80115920,(%esp)
801056be:	e8 ad ed ff ff       	call   80104470 <release>
  return xticks;
}
801056c3:	89 d8                	mov    %ebx,%eax
801056c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801056c8:	c9                   	leave  
801056c9:	c3                   	ret    

801056ca <alltraps>:
801056ca:	1e                   	push   %ds
801056cb:	06                   	push   %es
801056cc:	0f a0                	push   %fs
801056ce:	0f a8                	push   %gs
801056d0:	60                   	pusha  
801056d1:	66 b8 10 00          	mov    $0x10,%ax
801056d5:	8e d8                	mov    %eax,%ds
801056d7:	8e c0                	mov    %eax,%es
801056d9:	54                   	push   %esp
801056da:	e8 e1 00 00 00       	call   801057c0 <trap>
801056df:	83 c4 04             	add    $0x4,%esp

801056e2 <trapret>:
801056e2:	61                   	popa   
801056e3:	0f a9                	pop    %gs
801056e5:	0f a1                	pop    %fs
801056e7:	07                   	pop    %es
801056e8:	1f                   	pop    %ds
801056e9:	83 c4 08             	add    $0x8,%esp
801056ec:	cf                   	iret   
801056ed:	66 90                	xchg   %ax,%ax
801056ef:	90                   	nop

801056f0 <tvinit>:
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
801056f0:	55                   	push   %ebp
  int i;

  for(i = 0; i < 256; i++)
801056f1:	31 c0                	xor    %eax,%eax
{
801056f3:	89 e5                	mov    %esp,%ebp
801056f5:	83 ec 08             	sub    $0x8,%esp
801056f8:	90                   	nop
801056f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
80105700:	8b 14 85 08 a0 10 80 	mov    -0x7fef5ff8(,%eax,4),%edx
80105707:	b9 08 00 00 00       	mov    $0x8,%ecx
8010570c:	c6 04 c5 64 59 11 80 	movb   $0x0,-0x7feea69c(,%eax,8)
80105713:	00 
80105714:	66 89 0c c5 62 59 11 	mov    %cx,-0x7feea69e(,%eax,8)
8010571b:	80 
8010571c:	c6 04 c5 65 59 11 80 	movb   $0x8e,-0x7feea69b(,%eax,8)
80105723:	8e 
80105724:	66 89 14 c5 60 59 11 	mov    %dx,-0x7feea6a0(,%eax,8)
8010572b:	80 
8010572c:	c1 ea 10             	shr    $0x10,%edx
8010572f:	66 89 14 c5 66 59 11 	mov    %dx,-0x7feea69a(,%eax,8)
80105736:	80 
  for(i = 0; i < 256; i++)
80105737:	83 c0 01             	add    $0x1,%eax
8010573a:	3d 00 01 00 00       	cmp    $0x100,%eax
8010573f:	75 bf                	jne    80105700 <tvinit+0x10>
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105741:	a1 08 a1 10 80       	mov    0x8010a108,%eax

  initlock(&tickslock, "time");
80105746:	83 ec 08             	sub    $0x8,%esp
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105749:	ba 08 00 00 00       	mov    $0x8,%edx
  initlock(&tickslock, "time");
8010574e:	68 f9 78 10 80       	push   $0x801078f9
80105753:	68 20 59 11 80       	push   $0x80115920
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105758:	66 89 15 62 5b 11 80 	mov    %dx,0x80115b62
8010575f:	c6 05 64 5b 11 80 00 	movb   $0x0,0x80115b64
80105766:	66 a3 60 5b 11 80    	mov    %ax,0x80115b60
8010576c:	c1 e8 10             	shr    $0x10,%eax
8010576f:	c6 05 65 5b 11 80 ef 	movb   $0xef,0x80115b65
80105776:	66 a3 66 5b 11 80    	mov    %ax,0x80115b66
  initlock(&tickslock, "time");
8010577c:	e8 df ea ff ff       	call   80104260 <initlock>
}
80105781:	83 c4 10             	add    $0x10,%esp
80105784:	c9                   	leave  
80105785:	c3                   	ret    
80105786:	8d 76 00             	lea    0x0(%esi),%esi
80105789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105790 <idtinit>:

void
idtinit(void)
{
80105790:	55                   	push   %ebp
  pd[0] = size-1;
80105791:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105796:	89 e5                	mov    %esp,%ebp
80105798:	83 ec 10             	sub    $0x10,%esp
8010579b:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
8010579f:	b8 60 59 11 80       	mov    $0x80115960,%eax
801057a4:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
801057a8:	c1 e8 10             	shr    $0x10,%eax
801057ab:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
  asm volatile("lidt (%0)" : : "r" (pd));
801057af:	8d 45 fa             	lea    -0x6(%ebp),%eax
801057b2:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
801057b5:	c9                   	leave  
801057b6:	c3                   	ret    
801057b7:	89 f6                	mov    %esi,%esi
801057b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801057c0 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
801057c0:	55                   	push   %ebp
801057c1:	89 e5                	mov    %esp,%ebp
801057c3:	57                   	push   %edi
801057c4:	56                   	push   %esi
801057c5:	53                   	push   %ebx
801057c6:	83 ec 1c             	sub    $0x1c,%esp
801057c9:	8b 7d 08             	mov    0x8(%ebp),%edi
  if(tf->trapno == T_SYSCALL){
801057cc:	8b 47 30             	mov    0x30(%edi),%eax
801057cf:	83 f8 40             	cmp    $0x40,%eax
801057d2:	0f 84 88 01 00 00    	je     80105960 <trap+0x1a0>
    if(myproc()->killed)
      exit();
    return;
  }

  switch(tf->trapno){
801057d8:	83 e8 20             	sub    $0x20,%eax
801057db:	83 f8 1f             	cmp    $0x1f,%eax
801057de:	77 10                	ja     801057f0 <trap+0x30>
801057e0:	ff 24 85 a0 79 10 80 	jmp    *-0x7fef8660(,%eax,4)
801057e7:	89 f6                	mov    %esi,%esi
801057e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    lapiceoi();
    break;

  //PAGEBREAK: 13
  default:
    if(myproc() == 0 || (tf->cs&3) == 0){
801057f0:	e8 ab df ff ff       	call   801037a0 <myproc>
801057f5:	85 c0                	test   %eax,%eax
801057f7:	0f 84 d7 01 00 00    	je     801059d4 <trap+0x214>
801057fd:	f6 47 3c 03          	testb  $0x3,0x3c(%edi)
80105801:	0f 84 cd 01 00 00    	je     801059d4 <trap+0x214>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
80105807:	0f 20 d1             	mov    %cr2,%ecx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
8010580a:	8b 57 38             	mov    0x38(%edi),%edx
8010580d:	89 4d d8             	mov    %ecx,-0x28(%ebp)
80105810:	89 55 dc             	mov    %edx,-0x24(%ebp)
80105813:	e8 68 df ff ff       	call   80103780 <cpuid>
80105818:	8b 77 34             	mov    0x34(%edi),%esi
8010581b:	8b 5f 30             	mov    0x30(%edi),%ebx
8010581e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
80105821:	e8 7a df ff ff       	call   801037a0 <myproc>
80105826:	89 45 e0             	mov    %eax,-0x20(%ebp)
80105829:	e8 72 df ff ff       	call   801037a0 <myproc>
    cprintf("pid %d %s: trap %d err %d on cpu %d "
8010582e:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80105831:	8b 55 dc             	mov    -0x24(%ebp),%edx
80105834:	51                   	push   %ecx
80105835:	52                   	push   %edx
            myproc()->pid, myproc()->name, tf->trapno,
80105836:	8b 55 e0             	mov    -0x20(%ebp),%edx
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105839:	ff 75 e4             	pushl  -0x1c(%ebp)
8010583c:	56                   	push   %esi
8010583d:	53                   	push   %ebx
            myproc()->pid, myproc()->name, tf->trapno,
8010583e:	83 c2 6c             	add    $0x6c,%edx
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105841:	52                   	push   %edx
80105842:	ff 70 10             	pushl  0x10(%eax)
80105845:	68 5c 79 10 80       	push   $0x8010795c
8010584a:	e8 11 ae ff ff       	call   80100660 <cprintf>
            tf->err, cpuid(), tf->eip, rcr2());
    myproc()->killed = 1;
8010584f:	83 c4 20             	add    $0x20,%esp
80105852:	e8 49 df ff ff       	call   801037a0 <myproc>
80105857:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
8010585e:	66 90                	xchg   %ax,%ax
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105860:	e8 3b df ff ff       	call   801037a0 <myproc>
80105865:	85 c0                	test   %eax,%eax
80105867:	74 0c                	je     80105875 <trap+0xb5>
80105869:	e8 32 df ff ff       	call   801037a0 <myproc>
8010586e:	8b 50 24             	mov    0x24(%eax),%edx
80105871:	85 d2                	test   %edx,%edx
80105873:	75 4b                	jne    801058c0 <trap+0x100>
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
80105875:	e8 26 df ff ff       	call   801037a0 <myproc>
8010587a:	85 c0                	test   %eax,%eax
8010587c:	74 0b                	je     80105889 <trap+0xc9>
8010587e:	e8 1d df ff ff       	call   801037a0 <myproc>
80105883:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105887:	74 4f                	je     801058d8 <trap+0x118>
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105889:	e8 12 df ff ff       	call   801037a0 <myproc>
8010588e:	85 c0                	test   %eax,%eax
80105890:	74 1d                	je     801058af <trap+0xef>
80105892:	e8 09 df ff ff       	call   801037a0 <myproc>
80105897:	8b 40 24             	mov    0x24(%eax),%eax
8010589a:	85 c0                	test   %eax,%eax
8010589c:	74 11                	je     801058af <trap+0xef>
8010589e:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
801058a2:	83 e0 03             	and    $0x3,%eax
801058a5:	66 83 f8 03          	cmp    $0x3,%ax
801058a9:	0f 84 da 00 00 00    	je     80105989 <trap+0x1c9>
    exit();
}
801058af:	8d 65 f4             	lea    -0xc(%ebp),%esp
801058b2:	5b                   	pop    %ebx
801058b3:	5e                   	pop    %esi
801058b4:	5f                   	pop    %edi
801058b5:	5d                   	pop    %ebp
801058b6:	c3                   	ret    
801058b7:	89 f6                	mov    %esi,%esi
801058b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
801058c0:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
801058c4:	83 e0 03             	and    $0x3,%eax
801058c7:	66 83 f8 03          	cmp    $0x3,%ax
801058cb:	75 a8                	jne    80105875 <trap+0xb5>
    exit();
801058cd:	e8 5e e3 ff ff       	call   80103c30 <exit>
801058d2:	eb a1                	jmp    80105875 <trap+0xb5>
801058d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(myproc() && myproc()->state == RUNNING &&
801058d8:	83 7f 30 20          	cmpl   $0x20,0x30(%edi)
801058dc:	75 ab                	jne    80105889 <trap+0xc9>
    yield();
801058de:	e8 7d e4 ff ff       	call   80103d60 <yield>
801058e3:	eb a4                	jmp    80105889 <trap+0xc9>
801058e5:	8d 76 00             	lea    0x0(%esi),%esi
    if(cpuid() == 0){
801058e8:	e8 93 de ff ff       	call   80103780 <cpuid>
801058ed:	85 c0                	test   %eax,%eax
801058ef:	0f 84 ab 00 00 00    	je     801059a0 <trap+0x1e0>
    lapiceoi();
801058f5:	e8 26 ce ff ff       	call   80102720 <lapiceoi>
    break;
801058fa:	e9 61 ff ff ff       	jmp    80105860 <trap+0xa0>
801058ff:	90                   	nop
    kbdintr();
80105900:	e8 db cc ff ff       	call   801025e0 <kbdintr>
    lapiceoi();
80105905:	e8 16 ce ff ff       	call   80102720 <lapiceoi>
    break;
8010590a:	e9 51 ff ff ff       	jmp    80105860 <trap+0xa0>
8010590f:	90                   	nop
    uartintr();
80105910:	e8 5b 02 00 00       	call   80105b70 <uartintr>
    lapiceoi();
80105915:	e8 06 ce ff ff       	call   80102720 <lapiceoi>
    break;
8010591a:	e9 41 ff ff ff       	jmp    80105860 <trap+0xa0>
8010591f:	90                   	nop
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80105920:	0f b7 5f 3c          	movzwl 0x3c(%edi),%ebx
80105924:	8b 77 38             	mov    0x38(%edi),%esi
80105927:	e8 54 de ff ff       	call   80103780 <cpuid>
8010592c:	56                   	push   %esi
8010592d:	53                   	push   %ebx
8010592e:	50                   	push   %eax
8010592f:	68 04 79 10 80       	push   $0x80107904
80105934:	e8 27 ad ff ff       	call   80100660 <cprintf>
    lapiceoi();
80105939:	e8 e2 cd ff ff       	call   80102720 <lapiceoi>
    break;
8010593e:	83 c4 10             	add    $0x10,%esp
80105941:	e9 1a ff ff ff       	jmp    80105860 <trap+0xa0>
80105946:	8d 76 00             	lea    0x0(%esi),%esi
80105949:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    ideintr();
80105950:	e8 fb c6 ff ff       	call   80102050 <ideintr>
80105955:	eb 9e                	jmp    801058f5 <trap+0x135>
80105957:	89 f6                	mov    %esi,%esi
80105959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(myproc()->killed)
80105960:	e8 3b de ff ff       	call   801037a0 <myproc>
80105965:	8b 58 24             	mov    0x24(%eax),%ebx
80105968:	85 db                	test   %ebx,%ebx
8010596a:	75 2c                	jne    80105998 <trap+0x1d8>
    myproc()->tf = tf;
8010596c:	e8 2f de ff ff       	call   801037a0 <myproc>
80105971:	89 78 18             	mov    %edi,0x18(%eax)
    syscall();
80105974:	e8 27 ef ff ff       	call   801048a0 <syscall>
    if(myproc()->killed)
80105979:	e8 22 de ff ff       	call   801037a0 <myproc>
8010597e:	8b 48 24             	mov    0x24(%eax),%ecx
80105981:	85 c9                	test   %ecx,%ecx
80105983:	0f 84 26 ff ff ff    	je     801058af <trap+0xef>
}
80105989:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010598c:	5b                   	pop    %ebx
8010598d:	5e                   	pop    %esi
8010598e:	5f                   	pop    %edi
8010598f:	5d                   	pop    %ebp
      exit();
80105990:	e9 9b e2 ff ff       	jmp    80103c30 <exit>
80105995:	8d 76 00             	lea    0x0(%esi),%esi
      exit();
80105998:	e8 93 e2 ff ff       	call   80103c30 <exit>
8010599d:	eb cd                	jmp    8010596c <trap+0x1ac>
8010599f:	90                   	nop
      acquire(&tickslock);
801059a0:	83 ec 0c             	sub    $0xc,%esp
801059a3:	68 20 59 11 80       	push   $0x80115920
801059a8:	e8 13 ea ff ff       	call   801043c0 <acquire>
      wakeup(&ticks);
801059ad:	c7 04 24 60 61 11 80 	movl   $0x80116160,(%esp)
      ticks++;
801059b4:	83 05 60 61 11 80 01 	addl   $0x1,0x80116160
      wakeup(&ticks);
801059bb:	e8 b0 e5 ff ff       	call   80103f70 <wakeup>
      release(&tickslock);
801059c0:	c7 04 24 20 59 11 80 	movl   $0x80115920,(%esp)
801059c7:	e8 a4 ea ff ff       	call   80104470 <release>
801059cc:	83 c4 10             	add    $0x10,%esp
801059cf:	e9 21 ff ff ff       	jmp    801058f5 <trap+0x135>
801059d4:	0f 20 d6             	mov    %cr2,%esi
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
801059d7:	8b 5f 38             	mov    0x38(%edi),%ebx
801059da:	e8 a1 dd ff ff       	call   80103780 <cpuid>
801059df:	83 ec 0c             	sub    $0xc,%esp
801059e2:	56                   	push   %esi
801059e3:	53                   	push   %ebx
801059e4:	50                   	push   %eax
801059e5:	ff 77 30             	pushl  0x30(%edi)
801059e8:	68 28 79 10 80       	push   $0x80107928
801059ed:	e8 6e ac ff ff       	call   80100660 <cprintf>
      panic("trap");
801059f2:	83 c4 14             	add    $0x14,%esp
801059f5:	68 fe 78 10 80       	push   $0x801078fe
801059fa:	e8 71 a9 ff ff       	call   80100370 <panic>
801059ff:	90                   	nop

80105a00 <uartgetc>:
}

static int
uartgetc(void)
{
  if(!uart)
80105a00:	a1 bc a5 10 80       	mov    0x8010a5bc,%eax
{
80105a05:	55                   	push   %ebp
80105a06:	89 e5                	mov    %esp,%ebp
  if(!uart)
80105a08:	85 c0                	test   %eax,%eax
80105a0a:	74 1c                	je     80105a28 <uartgetc+0x28>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105a0c:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105a11:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
80105a12:	a8 01                	test   $0x1,%al
80105a14:	74 12                	je     80105a28 <uartgetc+0x28>
80105a16:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105a1b:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
80105a1c:	0f b6 c0             	movzbl %al,%eax
}
80105a1f:	5d                   	pop    %ebp
80105a20:	c3                   	ret    
80105a21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80105a28:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105a2d:	5d                   	pop    %ebp
80105a2e:	c3                   	ret    
80105a2f:	90                   	nop

80105a30 <uartputc.part.0>:
uartputc(int c)
80105a30:	55                   	push   %ebp
80105a31:	89 e5                	mov    %esp,%ebp
80105a33:	57                   	push   %edi
80105a34:	56                   	push   %esi
80105a35:	53                   	push   %ebx
80105a36:	89 c7                	mov    %eax,%edi
80105a38:	bb 80 00 00 00       	mov    $0x80,%ebx
80105a3d:	be fd 03 00 00       	mov    $0x3fd,%esi
80105a42:	83 ec 0c             	sub    $0xc,%esp
80105a45:	eb 1b                	jmp    80105a62 <uartputc.part.0+0x32>
80105a47:	89 f6                	mov    %esi,%esi
80105a49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    microdelay(10);
80105a50:	83 ec 0c             	sub    $0xc,%esp
80105a53:	6a 0a                	push   $0xa
80105a55:	e8 e6 cc ff ff       	call   80102740 <microdelay>
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80105a5a:	83 c4 10             	add    $0x10,%esp
80105a5d:	83 eb 01             	sub    $0x1,%ebx
80105a60:	74 07                	je     80105a69 <uartputc.part.0+0x39>
80105a62:	89 f2                	mov    %esi,%edx
80105a64:	ec                   	in     (%dx),%al
80105a65:	a8 20                	test   $0x20,%al
80105a67:	74 e7                	je     80105a50 <uartputc.part.0+0x20>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80105a69:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105a6e:	89 f8                	mov    %edi,%eax
80105a70:	ee                   	out    %al,(%dx)
}
80105a71:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105a74:	5b                   	pop    %ebx
80105a75:	5e                   	pop    %esi
80105a76:	5f                   	pop    %edi
80105a77:	5d                   	pop    %ebp
80105a78:	c3                   	ret    
80105a79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105a80 <uartinit>:
{
80105a80:	55                   	push   %ebp
80105a81:	31 c9                	xor    %ecx,%ecx
80105a83:	89 c8                	mov    %ecx,%eax
80105a85:	89 e5                	mov    %esp,%ebp
80105a87:	57                   	push   %edi
80105a88:	56                   	push   %esi
80105a89:	53                   	push   %ebx
80105a8a:	bb fa 03 00 00       	mov    $0x3fa,%ebx
80105a8f:	89 da                	mov    %ebx,%edx
80105a91:	83 ec 0c             	sub    $0xc,%esp
80105a94:	ee                   	out    %al,(%dx)
80105a95:	bf fb 03 00 00       	mov    $0x3fb,%edi
80105a9a:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105a9f:	89 fa                	mov    %edi,%edx
80105aa1:	ee                   	out    %al,(%dx)
80105aa2:	b8 0c 00 00 00       	mov    $0xc,%eax
80105aa7:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105aac:	ee                   	out    %al,(%dx)
80105aad:	be f9 03 00 00       	mov    $0x3f9,%esi
80105ab2:	89 c8                	mov    %ecx,%eax
80105ab4:	89 f2                	mov    %esi,%edx
80105ab6:	ee                   	out    %al,(%dx)
80105ab7:	b8 03 00 00 00       	mov    $0x3,%eax
80105abc:	89 fa                	mov    %edi,%edx
80105abe:	ee                   	out    %al,(%dx)
80105abf:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105ac4:	89 c8                	mov    %ecx,%eax
80105ac6:	ee                   	out    %al,(%dx)
80105ac7:	b8 01 00 00 00       	mov    $0x1,%eax
80105acc:	89 f2                	mov    %esi,%edx
80105ace:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105acf:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105ad4:	ec                   	in     (%dx),%al
  if(inb(COM1+5) == 0xFF)
80105ad5:	3c ff                	cmp    $0xff,%al
80105ad7:	74 5a                	je     80105b33 <uartinit+0xb3>
  uart = 1;
80105ad9:	c7 05 bc a5 10 80 01 	movl   $0x1,0x8010a5bc
80105ae0:	00 00 00 
80105ae3:	89 da                	mov    %ebx,%edx
80105ae5:	ec                   	in     (%dx),%al
80105ae6:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105aeb:	ec                   	in     (%dx),%al
  ioapicenable(IRQ_COM1, 0);
80105aec:	83 ec 08             	sub    $0x8,%esp
80105aef:	bb 20 7a 10 80       	mov    $0x80107a20,%ebx
80105af4:	6a 00                	push   $0x0
80105af6:	6a 04                	push   $0x4
80105af8:	e8 a3 c7 ff ff       	call   801022a0 <ioapicenable>
80105afd:	83 c4 10             	add    $0x10,%esp
80105b00:	b8 78 00 00 00       	mov    $0x78,%eax
80105b05:	eb 13                	jmp    80105b1a <uartinit+0x9a>
80105b07:	89 f6                	mov    %esi,%esi
80105b09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  for(p="xv6...\n"; *p; p++)
80105b10:	83 c3 01             	add    $0x1,%ebx
80105b13:	0f be 03             	movsbl (%ebx),%eax
80105b16:	84 c0                	test   %al,%al
80105b18:	74 19                	je     80105b33 <uartinit+0xb3>
  if(!uart)
80105b1a:	8b 15 bc a5 10 80    	mov    0x8010a5bc,%edx
80105b20:	85 d2                	test   %edx,%edx
80105b22:	74 ec                	je     80105b10 <uartinit+0x90>
  for(p="xv6...\n"; *p; p++)
80105b24:	83 c3 01             	add    $0x1,%ebx
80105b27:	e8 04 ff ff ff       	call   80105a30 <uartputc.part.0>
80105b2c:	0f be 03             	movsbl (%ebx),%eax
80105b2f:	84 c0                	test   %al,%al
80105b31:	75 e7                	jne    80105b1a <uartinit+0x9a>
}
80105b33:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105b36:	5b                   	pop    %ebx
80105b37:	5e                   	pop    %esi
80105b38:	5f                   	pop    %edi
80105b39:	5d                   	pop    %ebp
80105b3a:	c3                   	ret    
80105b3b:	90                   	nop
80105b3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105b40 <uartputc>:
  if(!uart)
80105b40:	8b 15 bc a5 10 80    	mov    0x8010a5bc,%edx
{
80105b46:	55                   	push   %ebp
80105b47:	89 e5                	mov    %esp,%ebp
  if(!uart)
80105b49:	85 d2                	test   %edx,%edx
{
80105b4b:	8b 45 08             	mov    0x8(%ebp),%eax
  if(!uart)
80105b4e:	74 10                	je     80105b60 <uartputc+0x20>
}
80105b50:	5d                   	pop    %ebp
80105b51:	e9 da fe ff ff       	jmp    80105a30 <uartputc.part.0>
80105b56:	8d 76 00             	lea    0x0(%esi),%esi
80105b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105b60:	5d                   	pop    %ebp
80105b61:	c3                   	ret    
80105b62:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105b69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105b70 <uartintr>:

void
uartintr(void)
{
80105b70:	55                   	push   %ebp
80105b71:	89 e5                	mov    %esp,%ebp
80105b73:	83 ec 14             	sub    $0x14,%esp
  consoleintr(uartgetc);
80105b76:	68 00 5a 10 80       	push   $0x80105a00
80105b7b:	e8 60 ac ff ff       	call   801007e0 <consoleintr>
}
80105b80:	83 c4 10             	add    $0x10,%esp
80105b83:	c9                   	leave  
80105b84:	c3                   	ret    

80105b85 <vector0>:
80105b85:	6a 00                	push   $0x0
80105b87:	6a 00                	push   $0x0
80105b89:	e9 3c fb ff ff       	jmp    801056ca <alltraps>

80105b8e <vector1>:
80105b8e:	6a 00                	push   $0x0
80105b90:	6a 01                	push   $0x1
80105b92:	e9 33 fb ff ff       	jmp    801056ca <alltraps>

80105b97 <vector2>:
80105b97:	6a 00                	push   $0x0
80105b99:	6a 02                	push   $0x2
80105b9b:	e9 2a fb ff ff       	jmp    801056ca <alltraps>

80105ba0 <vector3>:
80105ba0:	6a 00                	push   $0x0
80105ba2:	6a 03                	push   $0x3
80105ba4:	e9 21 fb ff ff       	jmp    801056ca <alltraps>

80105ba9 <vector4>:
80105ba9:	6a 00                	push   $0x0
80105bab:	6a 04                	push   $0x4
80105bad:	e9 18 fb ff ff       	jmp    801056ca <alltraps>

80105bb2 <vector5>:
80105bb2:	6a 00                	push   $0x0
80105bb4:	6a 05                	push   $0x5
80105bb6:	e9 0f fb ff ff       	jmp    801056ca <alltraps>

80105bbb <vector6>:
80105bbb:	6a 00                	push   $0x0
80105bbd:	6a 06                	push   $0x6
80105bbf:	e9 06 fb ff ff       	jmp    801056ca <alltraps>

80105bc4 <vector7>:
80105bc4:	6a 00                	push   $0x0
80105bc6:	6a 07                	push   $0x7
80105bc8:	e9 fd fa ff ff       	jmp    801056ca <alltraps>

80105bcd <vector8>:
80105bcd:	6a 08                	push   $0x8
80105bcf:	e9 f6 fa ff ff       	jmp    801056ca <alltraps>

80105bd4 <vector9>:
80105bd4:	6a 00                	push   $0x0
80105bd6:	6a 09                	push   $0x9
80105bd8:	e9 ed fa ff ff       	jmp    801056ca <alltraps>

80105bdd <vector10>:
80105bdd:	6a 0a                	push   $0xa
80105bdf:	e9 e6 fa ff ff       	jmp    801056ca <alltraps>

80105be4 <vector11>:
80105be4:	6a 0b                	push   $0xb
80105be6:	e9 df fa ff ff       	jmp    801056ca <alltraps>

80105beb <vector12>:
80105beb:	6a 0c                	push   $0xc
80105bed:	e9 d8 fa ff ff       	jmp    801056ca <alltraps>

80105bf2 <vector13>:
80105bf2:	6a 0d                	push   $0xd
80105bf4:	e9 d1 fa ff ff       	jmp    801056ca <alltraps>

80105bf9 <vector14>:
80105bf9:	6a 0e                	push   $0xe
80105bfb:	e9 ca fa ff ff       	jmp    801056ca <alltraps>

80105c00 <vector15>:
80105c00:	6a 00                	push   $0x0
80105c02:	6a 0f                	push   $0xf
80105c04:	e9 c1 fa ff ff       	jmp    801056ca <alltraps>

80105c09 <vector16>:
80105c09:	6a 00                	push   $0x0
80105c0b:	6a 10                	push   $0x10
80105c0d:	e9 b8 fa ff ff       	jmp    801056ca <alltraps>

80105c12 <vector17>:
80105c12:	6a 11                	push   $0x11
80105c14:	e9 b1 fa ff ff       	jmp    801056ca <alltraps>

80105c19 <vector18>:
80105c19:	6a 00                	push   $0x0
80105c1b:	6a 12                	push   $0x12
80105c1d:	e9 a8 fa ff ff       	jmp    801056ca <alltraps>

80105c22 <vector19>:
80105c22:	6a 00                	push   $0x0
80105c24:	6a 13                	push   $0x13
80105c26:	e9 9f fa ff ff       	jmp    801056ca <alltraps>

80105c2b <vector20>:
80105c2b:	6a 00                	push   $0x0
80105c2d:	6a 14                	push   $0x14
80105c2f:	e9 96 fa ff ff       	jmp    801056ca <alltraps>

80105c34 <vector21>:
80105c34:	6a 00                	push   $0x0
80105c36:	6a 15                	push   $0x15
80105c38:	e9 8d fa ff ff       	jmp    801056ca <alltraps>

80105c3d <vector22>:
80105c3d:	6a 00                	push   $0x0
80105c3f:	6a 16                	push   $0x16
80105c41:	e9 84 fa ff ff       	jmp    801056ca <alltraps>

80105c46 <vector23>:
80105c46:	6a 00                	push   $0x0
80105c48:	6a 17                	push   $0x17
80105c4a:	e9 7b fa ff ff       	jmp    801056ca <alltraps>

80105c4f <vector24>:
80105c4f:	6a 00                	push   $0x0
80105c51:	6a 18                	push   $0x18
80105c53:	e9 72 fa ff ff       	jmp    801056ca <alltraps>

80105c58 <vector25>:
80105c58:	6a 00                	push   $0x0
80105c5a:	6a 19                	push   $0x19
80105c5c:	e9 69 fa ff ff       	jmp    801056ca <alltraps>

80105c61 <vector26>:
80105c61:	6a 00                	push   $0x0
80105c63:	6a 1a                	push   $0x1a
80105c65:	e9 60 fa ff ff       	jmp    801056ca <alltraps>

80105c6a <vector27>:
80105c6a:	6a 00                	push   $0x0
80105c6c:	6a 1b                	push   $0x1b
80105c6e:	e9 57 fa ff ff       	jmp    801056ca <alltraps>

80105c73 <vector28>:
80105c73:	6a 00                	push   $0x0
80105c75:	6a 1c                	push   $0x1c
80105c77:	e9 4e fa ff ff       	jmp    801056ca <alltraps>

80105c7c <vector29>:
80105c7c:	6a 00                	push   $0x0
80105c7e:	6a 1d                	push   $0x1d
80105c80:	e9 45 fa ff ff       	jmp    801056ca <alltraps>

80105c85 <vector30>:
80105c85:	6a 00                	push   $0x0
80105c87:	6a 1e                	push   $0x1e
80105c89:	e9 3c fa ff ff       	jmp    801056ca <alltraps>

80105c8e <vector31>:
80105c8e:	6a 00                	push   $0x0
80105c90:	6a 1f                	push   $0x1f
80105c92:	e9 33 fa ff ff       	jmp    801056ca <alltraps>

80105c97 <vector32>:
80105c97:	6a 00                	push   $0x0
80105c99:	6a 20                	push   $0x20
80105c9b:	e9 2a fa ff ff       	jmp    801056ca <alltraps>

80105ca0 <vector33>:
80105ca0:	6a 00                	push   $0x0
80105ca2:	6a 21                	push   $0x21
80105ca4:	e9 21 fa ff ff       	jmp    801056ca <alltraps>

80105ca9 <vector34>:
80105ca9:	6a 00                	push   $0x0
80105cab:	6a 22                	push   $0x22
80105cad:	e9 18 fa ff ff       	jmp    801056ca <alltraps>

80105cb2 <vector35>:
80105cb2:	6a 00                	push   $0x0
80105cb4:	6a 23                	push   $0x23
80105cb6:	e9 0f fa ff ff       	jmp    801056ca <alltraps>

80105cbb <vector36>:
80105cbb:	6a 00                	push   $0x0
80105cbd:	6a 24                	push   $0x24
80105cbf:	e9 06 fa ff ff       	jmp    801056ca <alltraps>

80105cc4 <vector37>:
80105cc4:	6a 00                	push   $0x0
80105cc6:	6a 25                	push   $0x25
80105cc8:	e9 fd f9 ff ff       	jmp    801056ca <alltraps>

80105ccd <vector38>:
80105ccd:	6a 00                	push   $0x0
80105ccf:	6a 26                	push   $0x26
80105cd1:	e9 f4 f9 ff ff       	jmp    801056ca <alltraps>

80105cd6 <vector39>:
80105cd6:	6a 00                	push   $0x0
80105cd8:	6a 27                	push   $0x27
80105cda:	e9 eb f9 ff ff       	jmp    801056ca <alltraps>

80105cdf <vector40>:
80105cdf:	6a 00                	push   $0x0
80105ce1:	6a 28                	push   $0x28
80105ce3:	e9 e2 f9 ff ff       	jmp    801056ca <alltraps>

80105ce8 <vector41>:
80105ce8:	6a 00                	push   $0x0
80105cea:	6a 29                	push   $0x29
80105cec:	e9 d9 f9 ff ff       	jmp    801056ca <alltraps>

80105cf1 <vector42>:
80105cf1:	6a 00                	push   $0x0
80105cf3:	6a 2a                	push   $0x2a
80105cf5:	e9 d0 f9 ff ff       	jmp    801056ca <alltraps>

80105cfa <vector43>:
80105cfa:	6a 00                	push   $0x0
80105cfc:	6a 2b                	push   $0x2b
80105cfe:	e9 c7 f9 ff ff       	jmp    801056ca <alltraps>

80105d03 <vector44>:
80105d03:	6a 00                	push   $0x0
80105d05:	6a 2c                	push   $0x2c
80105d07:	e9 be f9 ff ff       	jmp    801056ca <alltraps>

80105d0c <vector45>:
80105d0c:	6a 00                	push   $0x0
80105d0e:	6a 2d                	push   $0x2d
80105d10:	e9 b5 f9 ff ff       	jmp    801056ca <alltraps>

80105d15 <vector46>:
80105d15:	6a 00                	push   $0x0
80105d17:	6a 2e                	push   $0x2e
80105d19:	e9 ac f9 ff ff       	jmp    801056ca <alltraps>

80105d1e <vector47>:
80105d1e:	6a 00                	push   $0x0
80105d20:	6a 2f                	push   $0x2f
80105d22:	e9 a3 f9 ff ff       	jmp    801056ca <alltraps>

80105d27 <vector48>:
80105d27:	6a 00                	push   $0x0
80105d29:	6a 30                	push   $0x30
80105d2b:	e9 9a f9 ff ff       	jmp    801056ca <alltraps>

80105d30 <vector49>:
80105d30:	6a 00                	push   $0x0
80105d32:	6a 31                	push   $0x31
80105d34:	e9 91 f9 ff ff       	jmp    801056ca <alltraps>

80105d39 <vector50>:
80105d39:	6a 00                	push   $0x0
80105d3b:	6a 32                	push   $0x32
80105d3d:	e9 88 f9 ff ff       	jmp    801056ca <alltraps>

80105d42 <vector51>:
80105d42:	6a 00                	push   $0x0
80105d44:	6a 33                	push   $0x33
80105d46:	e9 7f f9 ff ff       	jmp    801056ca <alltraps>

80105d4b <vector52>:
80105d4b:	6a 00                	push   $0x0
80105d4d:	6a 34                	push   $0x34
80105d4f:	e9 76 f9 ff ff       	jmp    801056ca <alltraps>

80105d54 <vector53>:
80105d54:	6a 00                	push   $0x0
80105d56:	6a 35                	push   $0x35
80105d58:	e9 6d f9 ff ff       	jmp    801056ca <alltraps>

80105d5d <vector54>:
80105d5d:	6a 00                	push   $0x0
80105d5f:	6a 36                	push   $0x36
80105d61:	e9 64 f9 ff ff       	jmp    801056ca <alltraps>

80105d66 <vector55>:
80105d66:	6a 00                	push   $0x0
80105d68:	6a 37                	push   $0x37
80105d6a:	e9 5b f9 ff ff       	jmp    801056ca <alltraps>

80105d6f <vector56>:
80105d6f:	6a 00                	push   $0x0
80105d71:	6a 38                	push   $0x38
80105d73:	e9 52 f9 ff ff       	jmp    801056ca <alltraps>

80105d78 <vector57>:
80105d78:	6a 00                	push   $0x0
80105d7a:	6a 39                	push   $0x39
80105d7c:	e9 49 f9 ff ff       	jmp    801056ca <alltraps>

80105d81 <vector58>:
80105d81:	6a 00                	push   $0x0
80105d83:	6a 3a                	push   $0x3a
80105d85:	e9 40 f9 ff ff       	jmp    801056ca <alltraps>

80105d8a <vector59>:
80105d8a:	6a 00                	push   $0x0
80105d8c:	6a 3b                	push   $0x3b
80105d8e:	e9 37 f9 ff ff       	jmp    801056ca <alltraps>

80105d93 <vector60>:
80105d93:	6a 00                	push   $0x0
80105d95:	6a 3c                	push   $0x3c
80105d97:	e9 2e f9 ff ff       	jmp    801056ca <alltraps>

80105d9c <vector61>:
80105d9c:	6a 00                	push   $0x0
80105d9e:	6a 3d                	push   $0x3d
80105da0:	e9 25 f9 ff ff       	jmp    801056ca <alltraps>

80105da5 <vector62>:
80105da5:	6a 00                	push   $0x0
80105da7:	6a 3e                	push   $0x3e
80105da9:	e9 1c f9 ff ff       	jmp    801056ca <alltraps>

80105dae <vector63>:
80105dae:	6a 00                	push   $0x0
80105db0:	6a 3f                	push   $0x3f
80105db2:	e9 13 f9 ff ff       	jmp    801056ca <alltraps>

80105db7 <vector64>:
80105db7:	6a 00                	push   $0x0
80105db9:	6a 40                	push   $0x40
80105dbb:	e9 0a f9 ff ff       	jmp    801056ca <alltraps>

80105dc0 <vector65>:
80105dc0:	6a 00                	push   $0x0
80105dc2:	6a 41                	push   $0x41
80105dc4:	e9 01 f9 ff ff       	jmp    801056ca <alltraps>

80105dc9 <vector66>:
80105dc9:	6a 00                	push   $0x0
80105dcb:	6a 42                	push   $0x42
80105dcd:	e9 f8 f8 ff ff       	jmp    801056ca <alltraps>

80105dd2 <vector67>:
80105dd2:	6a 00                	push   $0x0
80105dd4:	6a 43                	push   $0x43
80105dd6:	e9 ef f8 ff ff       	jmp    801056ca <alltraps>

80105ddb <vector68>:
80105ddb:	6a 00                	push   $0x0
80105ddd:	6a 44                	push   $0x44
80105ddf:	e9 e6 f8 ff ff       	jmp    801056ca <alltraps>

80105de4 <vector69>:
80105de4:	6a 00                	push   $0x0
80105de6:	6a 45                	push   $0x45
80105de8:	e9 dd f8 ff ff       	jmp    801056ca <alltraps>

80105ded <vector70>:
80105ded:	6a 00                	push   $0x0
80105def:	6a 46                	push   $0x46
80105df1:	e9 d4 f8 ff ff       	jmp    801056ca <alltraps>

80105df6 <vector71>:
80105df6:	6a 00                	push   $0x0
80105df8:	6a 47                	push   $0x47
80105dfa:	e9 cb f8 ff ff       	jmp    801056ca <alltraps>

80105dff <vector72>:
80105dff:	6a 00                	push   $0x0
80105e01:	6a 48                	push   $0x48
80105e03:	e9 c2 f8 ff ff       	jmp    801056ca <alltraps>

80105e08 <vector73>:
80105e08:	6a 00                	push   $0x0
80105e0a:	6a 49                	push   $0x49
80105e0c:	e9 b9 f8 ff ff       	jmp    801056ca <alltraps>

80105e11 <vector74>:
80105e11:	6a 00                	push   $0x0
80105e13:	6a 4a                	push   $0x4a
80105e15:	e9 b0 f8 ff ff       	jmp    801056ca <alltraps>

80105e1a <vector75>:
80105e1a:	6a 00                	push   $0x0
80105e1c:	6a 4b                	push   $0x4b
80105e1e:	e9 a7 f8 ff ff       	jmp    801056ca <alltraps>

80105e23 <vector76>:
80105e23:	6a 00                	push   $0x0
80105e25:	6a 4c                	push   $0x4c
80105e27:	e9 9e f8 ff ff       	jmp    801056ca <alltraps>

80105e2c <vector77>:
80105e2c:	6a 00                	push   $0x0
80105e2e:	6a 4d                	push   $0x4d
80105e30:	e9 95 f8 ff ff       	jmp    801056ca <alltraps>

80105e35 <vector78>:
80105e35:	6a 00                	push   $0x0
80105e37:	6a 4e                	push   $0x4e
80105e39:	e9 8c f8 ff ff       	jmp    801056ca <alltraps>

80105e3e <vector79>:
80105e3e:	6a 00                	push   $0x0
80105e40:	6a 4f                	push   $0x4f
80105e42:	e9 83 f8 ff ff       	jmp    801056ca <alltraps>

80105e47 <vector80>:
80105e47:	6a 00                	push   $0x0
80105e49:	6a 50                	push   $0x50
80105e4b:	e9 7a f8 ff ff       	jmp    801056ca <alltraps>

80105e50 <vector81>:
80105e50:	6a 00                	push   $0x0
80105e52:	6a 51                	push   $0x51
80105e54:	e9 71 f8 ff ff       	jmp    801056ca <alltraps>

80105e59 <vector82>:
80105e59:	6a 00                	push   $0x0
80105e5b:	6a 52                	push   $0x52
80105e5d:	e9 68 f8 ff ff       	jmp    801056ca <alltraps>

80105e62 <vector83>:
80105e62:	6a 00                	push   $0x0
80105e64:	6a 53                	push   $0x53
80105e66:	e9 5f f8 ff ff       	jmp    801056ca <alltraps>

80105e6b <vector84>:
80105e6b:	6a 00                	push   $0x0
80105e6d:	6a 54                	push   $0x54
80105e6f:	e9 56 f8 ff ff       	jmp    801056ca <alltraps>

80105e74 <vector85>:
80105e74:	6a 00                	push   $0x0
80105e76:	6a 55                	push   $0x55
80105e78:	e9 4d f8 ff ff       	jmp    801056ca <alltraps>

80105e7d <vector86>:
80105e7d:	6a 00                	push   $0x0
80105e7f:	6a 56                	push   $0x56
80105e81:	e9 44 f8 ff ff       	jmp    801056ca <alltraps>

80105e86 <vector87>:
80105e86:	6a 00                	push   $0x0
80105e88:	6a 57                	push   $0x57
80105e8a:	e9 3b f8 ff ff       	jmp    801056ca <alltraps>

80105e8f <vector88>:
80105e8f:	6a 00                	push   $0x0
80105e91:	6a 58                	push   $0x58
80105e93:	e9 32 f8 ff ff       	jmp    801056ca <alltraps>

80105e98 <vector89>:
80105e98:	6a 00                	push   $0x0
80105e9a:	6a 59                	push   $0x59
80105e9c:	e9 29 f8 ff ff       	jmp    801056ca <alltraps>

80105ea1 <vector90>:
80105ea1:	6a 00                	push   $0x0
80105ea3:	6a 5a                	push   $0x5a
80105ea5:	e9 20 f8 ff ff       	jmp    801056ca <alltraps>

80105eaa <vector91>:
80105eaa:	6a 00                	push   $0x0
80105eac:	6a 5b                	push   $0x5b
80105eae:	e9 17 f8 ff ff       	jmp    801056ca <alltraps>

80105eb3 <vector92>:
80105eb3:	6a 00                	push   $0x0
80105eb5:	6a 5c                	push   $0x5c
80105eb7:	e9 0e f8 ff ff       	jmp    801056ca <alltraps>

80105ebc <vector93>:
80105ebc:	6a 00                	push   $0x0
80105ebe:	6a 5d                	push   $0x5d
80105ec0:	e9 05 f8 ff ff       	jmp    801056ca <alltraps>

80105ec5 <vector94>:
80105ec5:	6a 00                	push   $0x0
80105ec7:	6a 5e                	push   $0x5e
80105ec9:	e9 fc f7 ff ff       	jmp    801056ca <alltraps>

80105ece <vector95>:
80105ece:	6a 00                	push   $0x0
80105ed0:	6a 5f                	push   $0x5f
80105ed2:	e9 f3 f7 ff ff       	jmp    801056ca <alltraps>

80105ed7 <vector96>:
80105ed7:	6a 00                	push   $0x0
80105ed9:	6a 60                	push   $0x60
80105edb:	e9 ea f7 ff ff       	jmp    801056ca <alltraps>

80105ee0 <vector97>:
80105ee0:	6a 00                	push   $0x0
80105ee2:	6a 61                	push   $0x61
80105ee4:	e9 e1 f7 ff ff       	jmp    801056ca <alltraps>

80105ee9 <vector98>:
80105ee9:	6a 00                	push   $0x0
80105eeb:	6a 62                	push   $0x62
80105eed:	e9 d8 f7 ff ff       	jmp    801056ca <alltraps>

80105ef2 <vector99>:
80105ef2:	6a 00                	push   $0x0
80105ef4:	6a 63                	push   $0x63
80105ef6:	e9 cf f7 ff ff       	jmp    801056ca <alltraps>

80105efb <vector100>:
80105efb:	6a 00                	push   $0x0
80105efd:	6a 64                	push   $0x64
80105eff:	e9 c6 f7 ff ff       	jmp    801056ca <alltraps>

80105f04 <vector101>:
80105f04:	6a 00                	push   $0x0
80105f06:	6a 65                	push   $0x65
80105f08:	e9 bd f7 ff ff       	jmp    801056ca <alltraps>

80105f0d <vector102>:
80105f0d:	6a 00                	push   $0x0
80105f0f:	6a 66                	push   $0x66
80105f11:	e9 b4 f7 ff ff       	jmp    801056ca <alltraps>

80105f16 <vector103>:
80105f16:	6a 00                	push   $0x0
80105f18:	6a 67                	push   $0x67
80105f1a:	e9 ab f7 ff ff       	jmp    801056ca <alltraps>

80105f1f <vector104>:
80105f1f:	6a 00                	push   $0x0
80105f21:	6a 68                	push   $0x68
80105f23:	e9 a2 f7 ff ff       	jmp    801056ca <alltraps>

80105f28 <vector105>:
80105f28:	6a 00                	push   $0x0
80105f2a:	6a 69                	push   $0x69
80105f2c:	e9 99 f7 ff ff       	jmp    801056ca <alltraps>

80105f31 <vector106>:
80105f31:	6a 00                	push   $0x0
80105f33:	6a 6a                	push   $0x6a
80105f35:	e9 90 f7 ff ff       	jmp    801056ca <alltraps>

80105f3a <vector107>:
80105f3a:	6a 00                	push   $0x0
80105f3c:	6a 6b                	push   $0x6b
80105f3e:	e9 87 f7 ff ff       	jmp    801056ca <alltraps>

80105f43 <vector108>:
80105f43:	6a 00                	push   $0x0
80105f45:	6a 6c                	push   $0x6c
80105f47:	e9 7e f7 ff ff       	jmp    801056ca <alltraps>

80105f4c <vector109>:
80105f4c:	6a 00                	push   $0x0
80105f4e:	6a 6d                	push   $0x6d
80105f50:	e9 75 f7 ff ff       	jmp    801056ca <alltraps>

80105f55 <vector110>:
80105f55:	6a 00                	push   $0x0
80105f57:	6a 6e                	push   $0x6e
80105f59:	e9 6c f7 ff ff       	jmp    801056ca <alltraps>

80105f5e <vector111>:
80105f5e:	6a 00                	push   $0x0
80105f60:	6a 6f                	push   $0x6f
80105f62:	e9 63 f7 ff ff       	jmp    801056ca <alltraps>

80105f67 <vector112>:
80105f67:	6a 00                	push   $0x0
80105f69:	6a 70                	push   $0x70
80105f6b:	e9 5a f7 ff ff       	jmp    801056ca <alltraps>

80105f70 <vector113>:
80105f70:	6a 00                	push   $0x0
80105f72:	6a 71                	push   $0x71
80105f74:	e9 51 f7 ff ff       	jmp    801056ca <alltraps>

80105f79 <vector114>:
80105f79:	6a 00                	push   $0x0
80105f7b:	6a 72                	push   $0x72
80105f7d:	e9 48 f7 ff ff       	jmp    801056ca <alltraps>

80105f82 <vector115>:
80105f82:	6a 00                	push   $0x0
80105f84:	6a 73                	push   $0x73
80105f86:	e9 3f f7 ff ff       	jmp    801056ca <alltraps>

80105f8b <vector116>:
80105f8b:	6a 00                	push   $0x0
80105f8d:	6a 74                	push   $0x74
80105f8f:	e9 36 f7 ff ff       	jmp    801056ca <alltraps>

80105f94 <vector117>:
80105f94:	6a 00                	push   $0x0
80105f96:	6a 75                	push   $0x75
80105f98:	e9 2d f7 ff ff       	jmp    801056ca <alltraps>

80105f9d <vector118>:
80105f9d:	6a 00                	push   $0x0
80105f9f:	6a 76                	push   $0x76
80105fa1:	e9 24 f7 ff ff       	jmp    801056ca <alltraps>

80105fa6 <vector119>:
80105fa6:	6a 00                	push   $0x0
80105fa8:	6a 77                	push   $0x77
80105faa:	e9 1b f7 ff ff       	jmp    801056ca <alltraps>

80105faf <vector120>:
80105faf:	6a 00                	push   $0x0
80105fb1:	6a 78                	push   $0x78
80105fb3:	e9 12 f7 ff ff       	jmp    801056ca <alltraps>

80105fb8 <vector121>:
80105fb8:	6a 00                	push   $0x0
80105fba:	6a 79                	push   $0x79
80105fbc:	e9 09 f7 ff ff       	jmp    801056ca <alltraps>

80105fc1 <vector122>:
80105fc1:	6a 00                	push   $0x0
80105fc3:	6a 7a                	push   $0x7a
80105fc5:	e9 00 f7 ff ff       	jmp    801056ca <alltraps>

80105fca <vector123>:
80105fca:	6a 00                	push   $0x0
80105fcc:	6a 7b                	push   $0x7b
80105fce:	e9 f7 f6 ff ff       	jmp    801056ca <alltraps>

80105fd3 <vector124>:
80105fd3:	6a 00                	push   $0x0
80105fd5:	6a 7c                	push   $0x7c
80105fd7:	e9 ee f6 ff ff       	jmp    801056ca <alltraps>

80105fdc <vector125>:
80105fdc:	6a 00                	push   $0x0
80105fde:	6a 7d                	push   $0x7d
80105fe0:	e9 e5 f6 ff ff       	jmp    801056ca <alltraps>

80105fe5 <vector126>:
80105fe5:	6a 00                	push   $0x0
80105fe7:	6a 7e                	push   $0x7e
80105fe9:	e9 dc f6 ff ff       	jmp    801056ca <alltraps>

80105fee <vector127>:
80105fee:	6a 00                	push   $0x0
80105ff0:	6a 7f                	push   $0x7f
80105ff2:	e9 d3 f6 ff ff       	jmp    801056ca <alltraps>

80105ff7 <vector128>:
80105ff7:	6a 00                	push   $0x0
80105ff9:	68 80 00 00 00       	push   $0x80
80105ffe:	e9 c7 f6 ff ff       	jmp    801056ca <alltraps>

80106003 <vector129>:
80106003:	6a 00                	push   $0x0
80106005:	68 81 00 00 00       	push   $0x81
8010600a:	e9 bb f6 ff ff       	jmp    801056ca <alltraps>

8010600f <vector130>:
8010600f:	6a 00                	push   $0x0
80106011:	68 82 00 00 00       	push   $0x82
80106016:	e9 af f6 ff ff       	jmp    801056ca <alltraps>

8010601b <vector131>:
8010601b:	6a 00                	push   $0x0
8010601d:	68 83 00 00 00       	push   $0x83
80106022:	e9 a3 f6 ff ff       	jmp    801056ca <alltraps>

80106027 <vector132>:
80106027:	6a 00                	push   $0x0
80106029:	68 84 00 00 00       	push   $0x84
8010602e:	e9 97 f6 ff ff       	jmp    801056ca <alltraps>

80106033 <vector133>:
80106033:	6a 00                	push   $0x0
80106035:	68 85 00 00 00       	push   $0x85
8010603a:	e9 8b f6 ff ff       	jmp    801056ca <alltraps>

8010603f <vector134>:
8010603f:	6a 00                	push   $0x0
80106041:	68 86 00 00 00       	push   $0x86
80106046:	e9 7f f6 ff ff       	jmp    801056ca <alltraps>

8010604b <vector135>:
8010604b:	6a 00                	push   $0x0
8010604d:	68 87 00 00 00       	push   $0x87
80106052:	e9 73 f6 ff ff       	jmp    801056ca <alltraps>

80106057 <vector136>:
80106057:	6a 00                	push   $0x0
80106059:	68 88 00 00 00       	push   $0x88
8010605e:	e9 67 f6 ff ff       	jmp    801056ca <alltraps>

80106063 <vector137>:
80106063:	6a 00                	push   $0x0
80106065:	68 89 00 00 00       	push   $0x89
8010606a:	e9 5b f6 ff ff       	jmp    801056ca <alltraps>

8010606f <vector138>:
8010606f:	6a 00                	push   $0x0
80106071:	68 8a 00 00 00       	push   $0x8a
80106076:	e9 4f f6 ff ff       	jmp    801056ca <alltraps>

8010607b <vector139>:
8010607b:	6a 00                	push   $0x0
8010607d:	68 8b 00 00 00       	push   $0x8b
80106082:	e9 43 f6 ff ff       	jmp    801056ca <alltraps>

80106087 <vector140>:
80106087:	6a 00                	push   $0x0
80106089:	68 8c 00 00 00       	push   $0x8c
8010608e:	e9 37 f6 ff ff       	jmp    801056ca <alltraps>

80106093 <vector141>:
80106093:	6a 00                	push   $0x0
80106095:	68 8d 00 00 00       	push   $0x8d
8010609a:	e9 2b f6 ff ff       	jmp    801056ca <alltraps>

8010609f <vector142>:
8010609f:	6a 00                	push   $0x0
801060a1:	68 8e 00 00 00       	push   $0x8e
801060a6:	e9 1f f6 ff ff       	jmp    801056ca <alltraps>

801060ab <vector143>:
801060ab:	6a 00                	push   $0x0
801060ad:	68 8f 00 00 00       	push   $0x8f
801060b2:	e9 13 f6 ff ff       	jmp    801056ca <alltraps>

801060b7 <vector144>:
801060b7:	6a 00                	push   $0x0
801060b9:	68 90 00 00 00       	push   $0x90
801060be:	e9 07 f6 ff ff       	jmp    801056ca <alltraps>

801060c3 <vector145>:
801060c3:	6a 00                	push   $0x0
801060c5:	68 91 00 00 00       	push   $0x91
801060ca:	e9 fb f5 ff ff       	jmp    801056ca <alltraps>

801060cf <vector146>:
801060cf:	6a 00                	push   $0x0
801060d1:	68 92 00 00 00       	push   $0x92
801060d6:	e9 ef f5 ff ff       	jmp    801056ca <alltraps>

801060db <vector147>:
801060db:	6a 00                	push   $0x0
801060dd:	68 93 00 00 00       	push   $0x93
801060e2:	e9 e3 f5 ff ff       	jmp    801056ca <alltraps>

801060e7 <vector148>:
801060e7:	6a 00                	push   $0x0
801060e9:	68 94 00 00 00       	push   $0x94
801060ee:	e9 d7 f5 ff ff       	jmp    801056ca <alltraps>

801060f3 <vector149>:
801060f3:	6a 00                	push   $0x0
801060f5:	68 95 00 00 00       	push   $0x95
801060fa:	e9 cb f5 ff ff       	jmp    801056ca <alltraps>

801060ff <vector150>:
801060ff:	6a 00                	push   $0x0
80106101:	68 96 00 00 00       	push   $0x96
80106106:	e9 bf f5 ff ff       	jmp    801056ca <alltraps>

8010610b <vector151>:
8010610b:	6a 00                	push   $0x0
8010610d:	68 97 00 00 00       	push   $0x97
80106112:	e9 b3 f5 ff ff       	jmp    801056ca <alltraps>

80106117 <vector152>:
80106117:	6a 00                	push   $0x0
80106119:	68 98 00 00 00       	push   $0x98
8010611e:	e9 a7 f5 ff ff       	jmp    801056ca <alltraps>

80106123 <vector153>:
80106123:	6a 00                	push   $0x0
80106125:	68 99 00 00 00       	push   $0x99
8010612a:	e9 9b f5 ff ff       	jmp    801056ca <alltraps>

8010612f <vector154>:
8010612f:	6a 00                	push   $0x0
80106131:	68 9a 00 00 00       	push   $0x9a
80106136:	e9 8f f5 ff ff       	jmp    801056ca <alltraps>

8010613b <vector155>:
8010613b:	6a 00                	push   $0x0
8010613d:	68 9b 00 00 00       	push   $0x9b
80106142:	e9 83 f5 ff ff       	jmp    801056ca <alltraps>

80106147 <vector156>:
80106147:	6a 00                	push   $0x0
80106149:	68 9c 00 00 00       	push   $0x9c
8010614e:	e9 77 f5 ff ff       	jmp    801056ca <alltraps>

80106153 <vector157>:
80106153:	6a 00                	push   $0x0
80106155:	68 9d 00 00 00       	push   $0x9d
8010615a:	e9 6b f5 ff ff       	jmp    801056ca <alltraps>

8010615f <vector158>:
8010615f:	6a 00                	push   $0x0
80106161:	68 9e 00 00 00       	push   $0x9e
80106166:	e9 5f f5 ff ff       	jmp    801056ca <alltraps>

8010616b <vector159>:
8010616b:	6a 00                	push   $0x0
8010616d:	68 9f 00 00 00       	push   $0x9f
80106172:	e9 53 f5 ff ff       	jmp    801056ca <alltraps>

80106177 <vector160>:
80106177:	6a 00                	push   $0x0
80106179:	68 a0 00 00 00       	push   $0xa0
8010617e:	e9 47 f5 ff ff       	jmp    801056ca <alltraps>

80106183 <vector161>:
80106183:	6a 00                	push   $0x0
80106185:	68 a1 00 00 00       	push   $0xa1
8010618a:	e9 3b f5 ff ff       	jmp    801056ca <alltraps>

8010618f <vector162>:
8010618f:	6a 00                	push   $0x0
80106191:	68 a2 00 00 00       	push   $0xa2
80106196:	e9 2f f5 ff ff       	jmp    801056ca <alltraps>

8010619b <vector163>:
8010619b:	6a 00                	push   $0x0
8010619d:	68 a3 00 00 00       	push   $0xa3
801061a2:	e9 23 f5 ff ff       	jmp    801056ca <alltraps>

801061a7 <vector164>:
801061a7:	6a 00                	push   $0x0
801061a9:	68 a4 00 00 00       	push   $0xa4
801061ae:	e9 17 f5 ff ff       	jmp    801056ca <alltraps>

801061b3 <vector165>:
801061b3:	6a 00                	push   $0x0
801061b5:	68 a5 00 00 00       	push   $0xa5
801061ba:	e9 0b f5 ff ff       	jmp    801056ca <alltraps>

801061bf <vector166>:
801061bf:	6a 00                	push   $0x0
801061c1:	68 a6 00 00 00       	push   $0xa6
801061c6:	e9 ff f4 ff ff       	jmp    801056ca <alltraps>

801061cb <vector167>:
801061cb:	6a 00                	push   $0x0
801061cd:	68 a7 00 00 00       	push   $0xa7
801061d2:	e9 f3 f4 ff ff       	jmp    801056ca <alltraps>

801061d7 <vector168>:
801061d7:	6a 00                	push   $0x0
801061d9:	68 a8 00 00 00       	push   $0xa8
801061de:	e9 e7 f4 ff ff       	jmp    801056ca <alltraps>

801061e3 <vector169>:
801061e3:	6a 00                	push   $0x0
801061e5:	68 a9 00 00 00       	push   $0xa9
801061ea:	e9 db f4 ff ff       	jmp    801056ca <alltraps>

801061ef <vector170>:
801061ef:	6a 00                	push   $0x0
801061f1:	68 aa 00 00 00       	push   $0xaa
801061f6:	e9 cf f4 ff ff       	jmp    801056ca <alltraps>

801061fb <vector171>:
801061fb:	6a 00                	push   $0x0
801061fd:	68 ab 00 00 00       	push   $0xab
80106202:	e9 c3 f4 ff ff       	jmp    801056ca <alltraps>

80106207 <vector172>:
80106207:	6a 00                	push   $0x0
80106209:	68 ac 00 00 00       	push   $0xac
8010620e:	e9 b7 f4 ff ff       	jmp    801056ca <alltraps>

80106213 <vector173>:
80106213:	6a 00                	push   $0x0
80106215:	68 ad 00 00 00       	push   $0xad
8010621a:	e9 ab f4 ff ff       	jmp    801056ca <alltraps>

8010621f <vector174>:
8010621f:	6a 00                	push   $0x0
80106221:	68 ae 00 00 00       	push   $0xae
80106226:	e9 9f f4 ff ff       	jmp    801056ca <alltraps>

8010622b <vector175>:
8010622b:	6a 00                	push   $0x0
8010622d:	68 af 00 00 00       	push   $0xaf
80106232:	e9 93 f4 ff ff       	jmp    801056ca <alltraps>

80106237 <vector176>:
80106237:	6a 00                	push   $0x0
80106239:	68 b0 00 00 00       	push   $0xb0
8010623e:	e9 87 f4 ff ff       	jmp    801056ca <alltraps>

80106243 <vector177>:
80106243:	6a 00                	push   $0x0
80106245:	68 b1 00 00 00       	push   $0xb1
8010624a:	e9 7b f4 ff ff       	jmp    801056ca <alltraps>

8010624f <vector178>:
8010624f:	6a 00                	push   $0x0
80106251:	68 b2 00 00 00       	push   $0xb2
80106256:	e9 6f f4 ff ff       	jmp    801056ca <alltraps>

8010625b <vector179>:
8010625b:	6a 00                	push   $0x0
8010625d:	68 b3 00 00 00       	push   $0xb3
80106262:	e9 63 f4 ff ff       	jmp    801056ca <alltraps>

80106267 <vector180>:
80106267:	6a 00                	push   $0x0
80106269:	68 b4 00 00 00       	push   $0xb4
8010626e:	e9 57 f4 ff ff       	jmp    801056ca <alltraps>

80106273 <vector181>:
80106273:	6a 00                	push   $0x0
80106275:	68 b5 00 00 00       	push   $0xb5
8010627a:	e9 4b f4 ff ff       	jmp    801056ca <alltraps>

8010627f <vector182>:
8010627f:	6a 00                	push   $0x0
80106281:	68 b6 00 00 00       	push   $0xb6
80106286:	e9 3f f4 ff ff       	jmp    801056ca <alltraps>

8010628b <vector183>:
8010628b:	6a 00                	push   $0x0
8010628d:	68 b7 00 00 00       	push   $0xb7
80106292:	e9 33 f4 ff ff       	jmp    801056ca <alltraps>

80106297 <vector184>:
80106297:	6a 00                	push   $0x0
80106299:	68 b8 00 00 00       	push   $0xb8
8010629e:	e9 27 f4 ff ff       	jmp    801056ca <alltraps>

801062a3 <vector185>:
801062a3:	6a 00                	push   $0x0
801062a5:	68 b9 00 00 00       	push   $0xb9
801062aa:	e9 1b f4 ff ff       	jmp    801056ca <alltraps>

801062af <vector186>:
801062af:	6a 00                	push   $0x0
801062b1:	68 ba 00 00 00       	push   $0xba
801062b6:	e9 0f f4 ff ff       	jmp    801056ca <alltraps>

801062bb <vector187>:
801062bb:	6a 00                	push   $0x0
801062bd:	68 bb 00 00 00       	push   $0xbb
801062c2:	e9 03 f4 ff ff       	jmp    801056ca <alltraps>

801062c7 <vector188>:
801062c7:	6a 00                	push   $0x0
801062c9:	68 bc 00 00 00       	push   $0xbc
801062ce:	e9 f7 f3 ff ff       	jmp    801056ca <alltraps>

801062d3 <vector189>:
801062d3:	6a 00                	push   $0x0
801062d5:	68 bd 00 00 00       	push   $0xbd
801062da:	e9 eb f3 ff ff       	jmp    801056ca <alltraps>

801062df <vector190>:
801062df:	6a 00                	push   $0x0
801062e1:	68 be 00 00 00       	push   $0xbe
801062e6:	e9 df f3 ff ff       	jmp    801056ca <alltraps>

801062eb <vector191>:
801062eb:	6a 00                	push   $0x0
801062ed:	68 bf 00 00 00       	push   $0xbf
801062f2:	e9 d3 f3 ff ff       	jmp    801056ca <alltraps>

801062f7 <vector192>:
801062f7:	6a 00                	push   $0x0
801062f9:	68 c0 00 00 00       	push   $0xc0
801062fe:	e9 c7 f3 ff ff       	jmp    801056ca <alltraps>

80106303 <vector193>:
80106303:	6a 00                	push   $0x0
80106305:	68 c1 00 00 00       	push   $0xc1
8010630a:	e9 bb f3 ff ff       	jmp    801056ca <alltraps>

8010630f <vector194>:
8010630f:	6a 00                	push   $0x0
80106311:	68 c2 00 00 00       	push   $0xc2
80106316:	e9 af f3 ff ff       	jmp    801056ca <alltraps>

8010631b <vector195>:
8010631b:	6a 00                	push   $0x0
8010631d:	68 c3 00 00 00       	push   $0xc3
80106322:	e9 a3 f3 ff ff       	jmp    801056ca <alltraps>

80106327 <vector196>:
80106327:	6a 00                	push   $0x0
80106329:	68 c4 00 00 00       	push   $0xc4
8010632e:	e9 97 f3 ff ff       	jmp    801056ca <alltraps>

80106333 <vector197>:
80106333:	6a 00                	push   $0x0
80106335:	68 c5 00 00 00       	push   $0xc5
8010633a:	e9 8b f3 ff ff       	jmp    801056ca <alltraps>

8010633f <vector198>:
8010633f:	6a 00                	push   $0x0
80106341:	68 c6 00 00 00       	push   $0xc6
80106346:	e9 7f f3 ff ff       	jmp    801056ca <alltraps>

8010634b <vector199>:
8010634b:	6a 00                	push   $0x0
8010634d:	68 c7 00 00 00       	push   $0xc7
80106352:	e9 73 f3 ff ff       	jmp    801056ca <alltraps>

80106357 <vector200>:
80106357:	6a 00                	push   $0x0
80106359:	68 c8 00 00 00       	push   $0xc8
8010635e:	e9 67 f3 ff ff       	jmp    801056ca <alltraps>

80106363 <vector201>:
80106363:	6a 00                	push   $0x0
80106365:	68 c9 00 00 00       	push   $0xc9
8010636a:	e9 5b f3 ff ff       	jmp    801056ca <alltraps>

8010636f <vector202>:
8010636f:	6a 00                	push   $0x0
80106371:	68 ca 00 00 00       	push   $0xca
80106376:	e9 4f f3 ff ff       	jmp    801056ca <alltraps>

8010637b <vector203>:
8010637b:	6a 00                	push   $0x0
8010637d:	68 cb 00 00 00       	push   $0xcb
80106382:	e9 43 f3 ff ff       	jmp    801056ca <alltraps>

80106387 <vector204>:
80106387:	6a 00                	push   $0x0
80106389:	68 cc 00 00 00       	push   $0xcc
8010638e:	e9 37 f3 ff ff       	jmp    801056ca <alltraps>

80106393 <vector205>:
80106393:	6a 00                	push   $0x0
80106395:	68 cd 00 00 00       	push   $0xcd
8010639a:	e9 2b f3 ff ff       	jmp    801056ca <alltraps>

8010639f <vector206>:
8010639f:	6a 00                	push   $0x0
801063a1:	68 ce 00 00 00       	push   $0xce
801063a6:	e9 1f f3 ff ff       	jmp    801056ca <alltraps>

801063ab <vector207>:
801063ab:	6a 00                	push   $0x0
801063ad:	68 cf 00 00 00       	push   $0xcf
801063b2:	e9 13 f3 ff ff       	jmp    801056ca <alltraps>

801063b7 <vector208>:
801063b7:	6a 00                	push   $0x0
801063b9:	68 d0 00 00 00       	push   $0xd0
801063be:	e9 07 f3 ff ff       	jmp    801056ca <alltraps>

801063c3 <vector209>:
801063c3:	6a 00                	push   $0x0
801063c5:	68 d1 00 00 00       	push   $0xd1
801063ca:	e9 fb f2 ff ff       	jmp    801056ca <alltraps>

801063cf <vector210>:
801063cf:	6a 00                	push   $0x0
801063d1:	68 d2 00 00 00       	push   $0xd2
801063d6:	e9 ef f2 ff ff       	jmp    801056ca <alltraps>

801063db <vector211>:
801063db:	6a 00                	push   $0x0
801063dd:	68 d3 00 00 00       	push   $0xd3
801063e2:	e9 e3 f2 ff ff       	jmp    801056ca <alltraps>

801063e7 <vector212>:
801063e7:	6a 00                	push   $0x0
801063e9:	68 d4 00 00 00       	push   $0xd4
801063ee:	e9 d7 f2 ff ff       	jmp    801056ca <alltraps>

801063f3 <vector213>:
801063f3:	6a 00                	push   $0x0
801063f5:	68 d5 00 00 00       	push   $0xd5
801063fa:	e9 cb f2 ff ff       	jmp    801056ca <alltraps>

801063ff <vector214>:
801063ff:	6a 00                	push   $0x0
80106401:	68 d6 00 00 00       	push   $0xd6
80106406:	e9 bf f2 ff ff       	jmp    801056ca <alltraps>

8010640b <vector215>:
8010640b:	6a 00                	push   $0x0
8010640d:	68 d7 00 00 00       	push   $0xd7
80106412:	e9 b3 f2 ff ff       	jmp    801056ca <alltraps>

80106417 <vector216>:
80106417:	6a 00                	push   $0x0
80106419:	68 d8 00 00 00       	push   $0xd8
8010641e:	e9 a7 f2 ff ff       	jmp    801056ca <alltraps>

80106423 <vector217>:
80106423:	6a 00                	push   $0x0
80106425:	68 d9 00 00 00       	push   $0xd9
8010642a:	e9 9b f2 ff ff       	jmp    801056ca <alltraps>

8010642f <vector218>:
8010642f:	6a 00                	push   $0x0
80106431:	68 da 00 00 00       	push   $0xda
80106436:	e9 8f f2 ff ff       	jmp    801056ca <alltraps>

8010643b <vector219>:
8010643b:	6a 00                	push   $0x0
8010643d:	68 db 00 00 00       	push   $0xdb
80106442:	e9 83 f2 ff ff       	jmp    801056ca <alltraps>

80106447 <vector220>:
80106447:	6a 00                	push   $0x0
80106449:	68 dc 00 00 00       	push   $0xdc
8010644e:	e9 77 f2 ff ff       	jmp    801056ca <alltraps>

80106453 <vector221>:
80106453:	6a 00                	push   $0x0
80106455:	68 dd 00 00 00       	push   $0xdd
8010645a:	e9 6b f2 ff ff       	jmp    801056ca <alltraps>

8010645f <vector222>:
8010645f:	6a 00                	push   $0x0
80106461:	68 de 00 00 00       	push   $0xde
80106466:	e9 5f f2 ff ff       	jmp    801056ca <alltraps>

8010646b <vector223>:
8010646b:	6a 00                	push   $0x0
8010646d:	68 df 00 00 00       	push   $0xdf
80106472:	e9 53 f2 ff ff       	jmp    801056ca <alltraps>

80106477 <vector224>:
80106477:	6a 00                	push   $0x0
80106479:	68 e0 00 00 00       	push   $0xe0
8010647e:	e9 47 f2 ff ff       	jmp    801056ca <alltraps>

80106483 <vector225>:
80106483:	6a 00                	push   $0x0
80106485:	68 e1 00 00 00       	push   $0xe1
8010648a:	e9 3b f2 ff ff       	jmp    801056ca <alltraps>

8010648f <vector226>:
8010648f:	6a 00                	push   $0x0
80106491:	68 e2 00 00 00       	push   $0xe2
80106496:	e9 2f f2 ff ff       	jmp    801056ca <alltraps>

8010649b <vector227>:
8010649b:	6a 00                	push   $0x0
8010649d:	68 e3 00 00 00       	push   $0xe3
801064a2:	e9 23 f2 ff ff       	jmp    801056ca <alltraps>

801064a7 <vector228>:
801064a7:	6a 00                	push   $0x0
801064a9:	68 e4 00 00 00       	push   $0xe4
801064ae:	e9 17 f2 ff ff       	jmp    801056ca <alltraps>

801064b3 <vector229>:
801064b3:	6a 00                	push   $0x0
801064b5:	68 e5 00 00 00       	push   $0xe5
801064ba:	e9 0b f2 ff ff       	jmp    801056ca <alltraps>

801064bf <vector230>:
801064bf:	6a 00                	push   $0x0
801064c1:	68 e6 00 00 00       	push   $0xe6
801064c6:	e9 ff f1 ff ff       	jmp    801056ca <alltraps>

801064cb <vector231>:
801064cb:	6a 00                	push   $0x0
801064cd:	68 e7 00 00 00       	push   $0xe7
801064d2:	e9 f3 f1 ff ff       	jmp    801056ca <alltraps>

801064d7 <vector232>:
801064d7:	6a 00                	push   $0x0
801064d9:	68 e8 00 00 00       	push   $0xe8
801064de:	e9 e7 f1 ff ff       	jmp    801056ca <alltraps>

801064e3 <vector233>:
801064e3:	6a 00                	push   $0x0
801064e5:	68 e9 00 00 00       	push   $0xe9
801064ea:	e9 db f1 ff ff       	jmp    801056ca <alltraps>

801064ef <vector234>:
801064ef:	6a 00                	push   $0x0
801064f1:	68 ea 00 00 00       	push   $0xea
801064f6:	e9 cf f1 ff ff       	jmp    801056ca <alltraps>

801064fb <vector235>:
801064fb:	6a 00                	push   $0x0
801064fd:	68 eb 00 00 00       	push   $0xeb
80106502:	e9 c3 f1 ff ff       	jmp    801056ca <alltraps>

80106507 <vector236>:
80106507:	6a 00                	push   $0x0
80106509:	68 ec 00 00 00       	push   $0xec
8010650e:	e9 b7 f1 ff ff       	jmp    801056ca <alltraps>

80106513 <vector237>:
80106513:	6a 00                	push   $0x0
80106515:	68 ed 00 00 00       	push   $0xed
8010651a:	e9 ab f1 ff ff       	jmp    801056ca <alltraps>

8010651f <vector238>:
8010651f:	6a 00                	push   $0x0
80106521:	68 ee 00 00 00       	push   $0xee
80106526:	e9 9f f1 ff ff       	jmp    801056ca <alltraps>

8010652b <vector239>:
8010652b:	6a 00                	push   $0x0
8010652d:	68 ef 00 00 00       	push   $0xef
80106532:	e9 93 f1 ff ff       	jmp    801056ca <alltraps>

80106537 <vector240>:
80106537:	6a 00                	push   $0x0
80106539:	68 f0 00 00 00       	push   $0xf0
8010653e:	e9 87 f1 ff ff       	jmp    801056ca <alltraps>

80106543 <vector241>:
80106543:	6a 00                	push   $0x0
80106545:	68 f1 00 00 00       	push   $0xf1
8010654a:	e9 7b f1 ff ff       	jmp    801056ca <alltraps>

8010654f <vector242>:
8010654f:	6a 00                	push   $0x0
80106551:	68 f2 00 00 00       	push   $0xf2
80106556:	e9 6f f1 ff ff       	jmp    801056ca <alltraps>

8010655b <vector243>:
8010655b:	6a 00                	push   $0x0
8010655d:	68 f3 00 00 00       	push   $0xf3
80106562:	e9 63 f1 ff ff       	jmp    801056ca <alltraps>

80106567 <vector244>:
80106567:	6a 00                	push   $0x0
80106569:	68 f4 00 00 00       	push   $0xf4
8010656e:	e9 57 f1 ff ff       	jmp    801056ca <alltraps>

80106573 <vector245>:
80106573:	6a 00                	push   $0x0
80106575:	68 f5 00 00 00       	push   $0xf5
8010657a:	e9 4b f1 ff ff       	jmp    801056ca <alltraps>

8010657f <vector246>:
8010657f:	6a 00                	push   $0x0
80106581:	68 f6 00 00 00       	push   $0xf6
80106586:	e9 3f f1 ff ff       	jmp    801056ca <alltraps>

8010658b <vector247>:
8010658b:	6a 00                	push   $0x0
8010658d:	68 f7 00 00 00       	push   $0xf7
80106592:	e9 33 f1 ff ff       	jmp    801056ca <alltraps>

80106597 <vector248>:
80106597:	6a 00                	push   $0x0
80106599:	68 f8 00 00 00       	push   $0xf8
8010659e:	e9 27 f1 ff ff       	jmp    801056ca <alltraps>

801065a3 <vector249>:
801065a3:	6a 00                	push   $0x0
801065a5:	68 f9 00 00 00       	push   $0xf9
801065aa:	e9 1b f1 ff ff       	jmp    801056ca <alltraps>

801065af <vector250>:
801065af:	6a 00                	push   $0x0
801065b1:	68 fa 00 00 00       	push   $0xfa
801065b6:	e9 0f f1 ff ff       	jmp    801056ca <alltraps>

801065bb <vector251>:
801065bb:	6a 00                	push   $0x0
801065bd:	68 fb 00 00 00       	push   $0xfb
801065c2:	e9 03 f1 ff ff       	jmp    801056ca <alltraps>

801065c7 <vector252>:
801065c7:	6a 00                	push   $0x0
801065c9:	68 fc 00 00 00       	push   $0xfc
801065ce:	e9 f7 f0 ff ff       	jmp    801056ca <alltraps>

801065d3 <vector253>:
801065d3:	6a 00                	push   $0x0
801065d5:	68 fd 00 00 00       	push   $0xfd
801065da:	e9 eb f0 ff ff       	jmp    801056ca <alltraps>

801065df <vector254>:
801065df:	6a 00                	push   $0x0
801065e1:	68 fe 00 00 00       	push   $0xfe
801065e6:	e9 df f0 ff ff       	jmp    801056ca <alltraps>

801065eb <vector255>:
801065eb:	6a 00                	push   $0x0
801065ed:	68 ff 00 00 00       	push   $0xff
801065f2:	e9 d3 f0 ff ff       	jmp    801056ca <alltraps>
801065f7:	66 90                	xchg   %ax,%ax
801065f9:	66 90                	xchg   %ax,%ax
801065fb:	66 90                	xchg   %ax,%ax
801065fd:	66 90                	xchg   %ax,%ax
801065ff:	90                   	nop

80106600 <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
80106600:	55                   	push   %ebp
80106601:	89 e5                	mov    %esp,%ebp
80106603:	57                   	push   %edi
80106604:	56                   	push   %esi
80106605:	53                   	push   %ebx
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
80106606:	89 d3                	mov    %edx,%ebx
{
80106608:	89 d7                	mov    %edx,%edi
  pde = &pgdir[PDX(va)];
8010660a:	c1 eb 16             	shr    $0x16,%ebx
8010660d:	8d 34 98             	lea    (%eax,%ebx,4),%esi
{
80106610:	83 ec 0c             	sub    $0xc,%esp
  if(*pde & PTE_P){
80106613:	8b 06                	mov    (%esi),%eax
80106615:	a8 01                	test   $0x1,%al
80106617:	74 27                	je     80106640 <walkpgdir+0x40>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80106619:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010661e:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
80106624:	c1 ef 0a             	shr    $0xa,%edi
}
80106627:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return &pgtab[PTX(va)];
8010662a:	89 fa                	mov    %edi,%edx
8010662c:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
80106632:	8d 04 13             	lea    (%ebx,%edx,1),%eax
}
80106635:	5b                   	pop    %ebx
80106636:	5e                   	pop    %esi
80106637:	5f                   	pop    %edi
80106638:	5d                   	pop    %ebp
80106639:	c3                   	ret    
8010663a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80106640:	85 c9                	test   %ecx,%ecx
80106642:	74 2c                	je     80106670 <walkpgdir+0x70>
80106644:	e8 47 be ff ff       	call   80102490 <kalloc>
80106649:	85 c0                	test   %eax,%eax
8010664b:	89 c3                	mov    %eax,%ebx
8010664d:	74 21                	je     80106670 <walkpgdir+0x70>
    memset(pgtab, 0, PGSIZE);
8010664f:	83 ec 04             	sub    $0x4,%esp
80106652:	68 00 10 00 00       	push   $0x1000
80106657:	6a 00                	push   $0x0
80106659:	50                   	push   %eax
8010665a:	e8 61 de ff ff       	call   801044c0 <memset>
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
8010665f:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106665:	83 c4 10             	add    $0x10,%esp
80106668:	83 c8 07             	or     $0x7,%eax
8010666b:	89 06                	mov    %eax,(%esi)
8010666d:	eb b5                	jmp    80106624 <walkpgdir+0x24>
8010666f:	90                   	nop
}
80106670:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 0;
80106673:	31 c0                	xor    %eax,%eax
}
80106675:	5b                   	pop    %ebx
80106676:	5e                   	pop    %esi
80106677:	5f                   	pop    %edi
80106678:	5d                   	pop    %ebp
80106679:	c3                   	ret    
8010667a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106680 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80106680:	55                   	push   %ebp
80106681:	89 e5                	mov    %esp,%ebp
80106683:	57                   	push   %edi
80106684:	56                   	push   %esi
80106685:	53                   	push   %ebx
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
80106686:	89 d3                	mov    %edx,%ebx
80106688:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
{
8010668e:	83 ec 1c             	sub    $0x1c,%esp
80106691:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106694:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
80106698:	8b 7d 08             	mov    0x8(%ebp),%edi
8010669b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801066a0:	89 45 e0             	mov    %eax,-0x20(%ebp)
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
801066a3:	8b 45 0c             	mov    0xc(%ebp),%eax
801066a6:	29 df                	sub    %ebx,%edi
801066a8:	83 c8 01             	or     $0x1,%eax
801066ab:	89 45 dc             	mov    %eax,-0x24(%ebp)
801066ae:	eb 15                	jmp    801066c5 <mappages+0x45>
    if(*pte & PTE_P)
801066b0:	f6 00 01             	testb  $0x1,(%eax)
801066b3:	75 45                	jne    801066fa <mappages+0x7a>
    *pte = pa | perm | PTE_P;
801066b5:	0b 75 dc             	or     -0x24(%ebp),%esi
    if(a == last)
801066b8:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
    *pte = pa | perm | PTE_P;
801066bb:	89 30                	mov    %esi,(%eax)
    if(a == last)
801066bd:	74 31                	je     801066f0 <mappages+0x70>
      break;
    a += PGSIZE;
801066bf:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
801066c5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801066c8:	b9 01 00 00 00       	mov    $0x1,%ecx
801066cd:	89 da                	mov    %ebx,%edx
801066cf:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
801066d2:	e8 29 ff ff ff       	call   80106600 <walkpgdir>
801066d7:	85 c0                	test   %eax,%eax
801066d9:	75 d5                	jne    801066b0 <mappages+0x30>
    pa += PGSIZE;
  }
  return 0;
}
801066db:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
801066de:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801066e3:	5b                   	pop    %ebx
801066e4:	5e                   	pop    %esi
801066e5:	5f                   	pop    %edi
801066e6:	5d                   	pop    %ebp
801066e7:	c3                   	ret    
801066e8:	90                   	nop
801066e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801066f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
801066f3:	31 c0                	xor    %eax,%eax
}
801066f5:	5b                   	pop    %ebx
801066f6:	5e                   	pop    %esi
801066f7:	5f                   	pop    %edi
801066f8:	5d                   	pop    %ebp
801066f9:	c3                   	ret    
      panic("remap");
801066fa:	83 ec 0c             	sub    $0xc,%esp
801066fd:	68 28 7a 10 80       	push   $0x80107a28
80106702:	e8 69 9c ff ff       	call   80100370 <panic>
80106707:	89 f6                	mov    %esi,%esi
80106709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106710 <deallocuvm.part.0>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106710:	55                   	push   %ebp
80106711:	89 e5                	mov    %esp,%ebp
80106713:	57                   	push   %edi
80106714:	56                   	push   %esi
80106715:	53                   	push   %ebx
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
80106716:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
8010671c:	89 c7                	mov    %eax,%edi
  a = PGROUNDUP(newsz);
8010671e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106724:	83 ec 1c             	sub    $0x1c,%esp
80106727:	89 4d e0             	mov    %ecx,-0x20(%ebp)
  for(; a  < oldsz; a += PGSIZE){
8010672a:	39 d3                	cmp    %edx,%ebx
8010672c:	73 66                	jae    80106794 <deallocuvm.part.0+0x84>
8010672e:	89 d6                	mov    %edx,%esi
80106730:	eb 3d                	jmp    8010676f <deallocuvm.part.0+0x5f>
80106732:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
80106738:	8b 10                	mov    (%eax),%edx
8010673a:	f6 c2 01             	test   $0x1,%dl
8010673d:	74 26                	je     80106765 <deallocuvm.part.0+0x55>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
8010673f:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106745:	74 58                	je     8010679f <deallocuvm.part.0+0x8f>
        panic("kfree");
      char *v = P2V(pa);
      kfree(v);
80106747:	83 ec 0c             	sub    $0xc,%esp
      char *v = P2V(pa);
8010674a:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106750:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      kfree(v);
80106753:	52                   	push   %edx
80106754:	e8 87 bb ff ff       	call   801022e0 <kfree>
      *pte = 0;
80106759:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010675c:	83 c4 10             	add    $0x10,%esp
8010675f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for(; a  < oldsz; a += PGSIZE){
80106765:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010676b:	39 f3                	cmp    %esi,%ebx
8010676d:	73 25                	jae    80106794 <deallocuvm.part.0+0x84>
    pte = walkpgdir(pgdir, (char*)a, 0);
8010676f:	31 c9                	xor    %ecx,%ecx
80106771:	89 da                	mov    %ebx,%edx
80106773:	89 f8                	mov    %edi,%eax
80106775:	e8 86 fe ff ff       	call   80106600 <walkpgdir>
    if(!pte)
8010677a:	85 c0                	test   %eax,%eax
8010677c:	75 ba                	jne    80106738 <deallocuvm.part.0+0x28>
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
8010677e:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
80106784:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx
  for(; a  < oldsz; a += PGSIZE){
8010678a:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106790:	39 f3                	cmp    %esi,%ebx
80106792:	72 db                	jb     8010676f <deallocuvm.part.0+0x5f>
    }
  }
  return newsz;
}
80106794:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106797:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010679a:	5b                   	pop    %ebx
8010679b:	5e                   	pop    %esi
8010679c:	5f                   	pop    %edi
8010679d:	5d                   	pop    %ebp
8010679e:	c3                   	ret    
        panic("kfree");
8010679f:	83 ec 0c             	sub    $0xc,%esp
801067a2:	68 a6 73 10 80       	push   $0x801073a6
801067a7:	e8 c4 9b ff ff       	call   80100370 <panic>
801067ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801067b0 <seginit>:
{
801067b0:	55                   	push   %ebp
801067b1:	89 e5                	mov    %esp,%ebp
801067b3:	83 ec 18             	sub    $0x18,%esp
  c = &cpus[cpuid()];
801067b6:	e8 c5 cf ff ff       	call   80103780 <cpuid>
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
801067bb:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
801067c1:	31 c9                	xor    %ecx,%ecx
801067c3:	ba ff ff ff ff       	mov    $0xffffffff,%edx
801067c8:	66 89 90 b8 31 11 80 	mov    %dx,-0x7feece48(%eax)
801067cf:	66 89 88 ba 31 11 80 	mov    %cx,-0x7feece46(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
801067d6:	ba ff ff ff ff       	mov    $0xffffffff,%edx
801067db:	31 c9                	xor    %ecx,%ecx
801067dd:	66 89 90 c0 31 11 80 	mov    %dx,-0x7feece40(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
801067e4:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
801067e9:	66 89 88 c2 31 11 80 	mov    %cx,-0x7feece3e(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
801067f0:	31 c9                	xor    %ecx,%ecx
801067f2:	66 89 90 c8 31 11 80 	mov    %dx,-0x7feece38(%eax)
801067f9:	66 89 88 ca 31 11 80 	mov    %cx,-0x7feece36(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106800:	ba ff ff ff ff       	mov    $0xffffffff,%edx
80106805:	31 c9                	xor    %ecx,%ecx
80106807:	66 89 90 d0 31 11 80 	mov    %dx,-0x7feece30(%eax)
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
8010680e:	c6 80 bc 31 11 80 00 	movb   $0x0,-0x7feece44(%eax)
  pd[0] = size-1;
80106815:	ba 2f 00 00 00       	mov    $0x2f,%edx
8010681a:	c6 80 bd 31 11 80 9a 	movb   $0x9a,-0x7feece43(%eax)
80106821:	c6 80 be 31 11 80 cf 	movb   $0xcf,-0x7feece42(%eax)
80106828:	c6 80 bf 31 11 80 00 	movb   $0x0,-0x7feece41(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
8010682f:	c6 80 c4 31 11 80 00 	movb   $0x0,-0x7feece3c(%eax)
80106836:	c6 80 c5 31 11 80 92 	movb   $0x92,-0x7feece3b(%eax)
8010683d:	c6 80 c6 31 11 80 cf 	movb   $0xcf,-0x7feece3a(%eax)
80106844:	c6 80 c7 31 11 80 00 	movb   $0x0,-0x7feece39(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
8010684b:	c6 80 cc 31 11 80 00 	movb   $0x0,-0x7feece34(%eax)
80106852:	c6 80 cd 31 11 80 fa 	movb   $0xfa,-0x7feece33(%eax)
80106859:	c6 80 ce 31 11 80 cf 	movb   $0xcf,-0x7feece32(%eax)
80106860:	c6 80 cf 31 11 80 00 	movb   $0x0,-0x7feece31(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106867:	66 89 88 d2 31 11 80 	mov    %cx,-0x7feece2e(%eax)
8010686e:	c6 80 d4 31 11 80 00 	movb   $0x0,-0x7feece2c(%eax)
80106875:	c6 80 d5 31 11 80 f2 	movb   $0xf2,-0x7feece2b(%eax)
8010687c:	c6 80 d6 31 11 80 cf 	movb   $0xcf,-0x7feece2a(%eax)
80106883:	c6 80 d7 31 11 80 00 	movb   $0x0,-0x7feece29(%eax)
  lgdt(c->gdt, sizeof(c->gdt));
8010688a:	05 b0 31 11 80       	add    $0x801131b0,%eax
8010688f:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  pd[1] = (uint)p;
80106893:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
80106897:	c1 e8 10             	shr    $0x10,%eax
8010689a:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
  asm volatile("lgdt (%0)" : : "r" (pd));
8010689e:	8d 45 f2             	lea    -0xe(%ebp),%eax
801068a1:	0f 01 10             	lgdtl  (%eax)
}
801068a4:	c9                   	leave  
801068a5:	c3                   	ret    
801068a6:	8d 76 00             	lea    0x0(%esi),%esi
801068a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801068b0 <switchkvm>:
  lcr3(V2P(kpgdir));   // switch to the kernel page table
801068b0:	a1 64 61 11 80       	mov    0x80116164,%eax
{
801068b5:	55                   	push   %ebp
801068b6:	89 e5                	mov    %esp,%ebp
  lcr3(V2P(kpgdir));   // switch to the kernel page table
801068b8:	05 00 00 00 80       	add    $0x80000000,%eax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
801068bd:	0f 22 d8             	mov    %eax,%cr3
}
801068c0:	5d                   	pop    %ebp
801068c1:	c3                   	ret    
801068c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801068c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801068d0 <switchuvm>:
{
801068d0:	55                   	push   %ebp
801068d1:	89 e5                	mov    %esp,%ebp
801068d3:	57                   	push   %edi
801068d4:	56                   	push   %esi
801068d5:	53                   	push   %ebx
801068d6:	83 ec 1c             	sub    $0x1c,%esp
801068d9:	8b 75 08             	mov    0x8(%ebp),%esi
  if(p == 0)
801068dc:	85 f6                	test   %esi,%esi
801068de:	0f 84 cd 00 00 00    	je     801069b1 <switchuvm+0xe1>
  if(p->kstack == 0)
801068e4:	8b 46 08             	mov    0x8(%esi),%eax
801068e7:	85 c0                	test   %eax,%eax
801068e9:	0f 84 dc 00 00 00    	je     801069cb <switchuvm+0xfb>
  if(p->pgdir == 0)
801068ef:	8b 7e 04             	mov    0x4(%esi),%edi
801068f2:	85 ff                	test   %edi,%edi
801068f4:	0f 84 c4 00 00 00    	je     801069be <switchuvm+0xee>
  pushcli();
801068fa:	e8 e1 d9 ff ff       	call   801042e0 <pushcli>
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
801068ff:	e8 fc cd ff ff       	call   80103700 <mycpu>
80106904:	89 c3                	mov    %eax,%ebx
80106906:	e8 f5 cd ff ff       	call   80103700 <mycpu>
8010690b:	89 c7                	mov    %eax,%edi
8010690d:	e8 ee cd ff ff       	call   80103700 <mycpu>
80106912:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106915:	83 c7 08             	add    $0x8,%edi
80106918:	e8 e3 cd ff ff       	call   80103700 <mycpu>
8010691d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106920:	83 c0 08             	add    $0x8,%eax
80106923:	ba 67 00 00 00       	mov    $0x67,%edx
80106928:	c1 e8 18             	shr    $0x18,%eax
8010692b:	66 89 93 98 00 00 00 	mov    %dx,0x98(%ebx)
80106932:	66 89 bb 9a 00 00 00 	mov    %di,0x9a(%ebx)
80106939:	c6 83 9d 00 00 00 99 	movb   $0x99,0x9d(%ebx)
80106940:	c6 83 9e 00 00 00 40 	movb   $0x40,0x9e(%ebx)
80106947:	83 c1 08             	add    $0x8,%ecx
8010694a:	88 83 9f 00 00 00    	mov    %al,0x9f(%ebx)
80106950:	c1 e9 10             	shr    $0x10,%ecx
80106953:	88 8b 9c 00 00 00    	mov    %cl,0x9c(%ebx)
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106959:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  mycpu()->gdt[SEG_TSS].s = 0;
8010695e:	e8 9d cd ff ff       	call   80103700 <mycpu>
80106963:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
8010696a:	e8 91 cd ff ff       	call   80103700 <mycpu>
8010696f:	b9 10 00 00 00       	mov    $0x10,%ecx
80106974:	66 89 48 10          	mov    %cx,0x10(%eax)
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
80106978:	e8 83 cd ff ff       	call   80103700 <mycpu>
8010697d:	8b 56 08             	mov    0x8(%esi),%edx
80106980:	8d 8a 00 10 00 00    	lea    0x1000(%edx),%ecx
80106986:	89 48 0c             	mov    %ecx,0xc(%eax)
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106989:	e8 72 cd ff ff       	call   80103700 <mycpu>
8010698e:	66 89 58 6e          	mov    %bx,0x6e(%eax)
  asm volatile("ltr %0" : : "r" (sel));
80106992:	b8 28 00 00 00       	mov    $0x28,%eax
80106997:	0f 00 d8             	ltr    %ax
  lcr3(V2P(p->pgdir));  // switch to process's address space
8010699a:	8b 46 04             	mov    0x4(%esi),%eax
8010699d:	05 00 00 00 80       	add    $0x80000000,%eax
  asm volatile("movl %0,%%cr3" : : "r" (val));
801069a2:	0f 22 d8             	mov    %eax,%cr3
}
801069a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801069a8:	5b                   	pop    %ebx
801069a9:	5e                   	pop    %esi
801069aa:	5f                   	pop    %edi
801069ab:	5d                   	pop    %ebp
  popcli();
801069ac:	e9 6f d9 ff ff       	jmp    80104320 <popcli>
    panic("switchuvm: no process");
801069b1:	83 ec 0c             	sub    $0xc,%esp
801069b4:	68 2e 7a 10 80       	push   $0x80107a2e
801069b9:	e8 b2 99 ff ff       	call   80100370 <panic>
    panic("switchuvm: no pgdir");
801069be:	83 ec 0c             	sub    $0xc,%esp
801069c1:	68 59 7a 10 80       	push   $0x80107a59
801069c6:	e8 a5 99 ff ff       	call   80100370 <panic>
    panic("switchuvm: no kstack");
801069cb:	83 ec 0c             	sub    $0xc,%esp
801069ce:	68 44 7a 10 80       	push   $0x80107a44
801069d3:	e8 98 99 ff ff       	call   80100370 <panic>
801069d8:	90                   	nop
801069d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801069e0 <inituvm>:
{
801069e0:	55                   	push   %ebp
801069e1:	89 e5                	mov    %esp,%ebp
801069e3:	57                   	push   %edi
801069e4:	56                   	push   %esi
801069e5:	53                   	push   %ebx
801069e6:	83 ec 1c             	sub    $0x1c,%esp
801069e9:	8b 75 10             	mov    0x10(%ebp),%esi
801069ec:	8b 45 08             	mov    0x8(%ebp),%eax
801069ef:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(sz >= PGSIZE)
801069f2:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
{
801069f8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(sz >= PGSIZE)
801069fb:	77 49                	ja     80106a46 <inituvm+0x66>
  mem = kalloc();
801069fd:	e8 8e ba ff ff       	call   80102490 <kalloc>
  memset(mem, 0, PGSIZE);
80106a02:	83 ec 04             	sub    $0x4,%esp
  mem = kalloc();
80106a05:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
80106a07:	68 00 10 00 00       	push   $0x1000
80106a0c:	6a 00                	push   $0x0
80106a0e:	50                   	push   %eax
80106a0f:	e8 ac da ff ff       	call   801044c0 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
80106a14:	58                   	pop    %eax
80106a15:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106a1b:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106a20:	5a                   	pop    %edx
80106a21:	6a 06                	push   $0x6
80106a23:	50                   	push   %eax
80106a24:	31 d2                	xor    %edx,%edx
80106a26:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106a29:	e8 52 fc ff ff       	call   80106680 <mappages>
  memmove(mem, init, sz);
80106a2e:	89 75 10             	mov    %esi,0x10(%ebp)
80106a31:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106a34:	83 c4 10             	add    $0x10,%esp
80106a37:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80106a3a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106a3d:	5b                   	pop    %ebx
80106a3e:	5e                   	pop    %esi
80106a3f:	5f                   	pop    %edi
80106a40:	5d                   	pop    %ebp
  memmove(mem, init, sz);
80106a41:	e9 2a db ff ff       	jmp    80104570 <memmove>
    panic("inituvm: more than a page");
80106a46:	83 ec 0c             	sub    $0xc,%esp
80106a49:	68 6d 7a 10 80       	push   $0x80107a6d
80106a4e:	e8 1d 99 ff ff       	call   80100370 <panic>
80106a53:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106a59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106a60 <loaduvm>:
{
80106a60:	55                   	push   %ebp
80106a61:	89 e5                	mov    %esp,%ebp
80106a63:	57                   	push   %edi
80106a64:	56                   	push   %esi
80106a65:	53                   	push   %ebx
80106a66:	83 ec 0c             	sub    $0xc,%esp
  if((uint) addr % PGSIZE != 0)
80106a69:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80106a70:	0f 85 91 00 00 00    	jne    80106b07 <loaduvm+0xa7>
  for(i = 0; i < sz; i += PGSIZE){
80106a76:	8b 75 18             	mov    0x18(%ebp),%esi
80106a79:	31 db                	xor    %ebx,%ebx
80106a7b:	85 f6                	test   %esi,%esi
80106a7d:	75 1a                	jne    80106a99 <loaduvm+0x39>
80106a7f:	eb 6f                	jmp    80106af0 <loaduvm+0x90>
80106a81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106a88:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106a8e:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106a94:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106a97:	76 57                	jbe    80106af0 <loaduvm+0x90>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
80106a99:	8b 55 0c             	mov    0xc(%ebp),%edx
80106a9c:	8b 45 08             	mov    0x8(%ebp),%eax
80106a9f:	31 c9                	xor    %ecx,%ecx
80106aa1:	01 da                	add    %ebx,%edx
80106aa3:	e8 58 fb ff ff       	call   80106600 <walkpgdir>
80106aa8:	85 c0                	test   %eax,%eax
80106aaa:	74 4e                	je     80106afa <loaduvm+0x9a>
    pa = PTE_ADDR(*pte);
80106aac:	8b 00                	mov    (%eax),%eax
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106aae:	8b 4d 14             	mov    0x14(%ebp),%ecx
    if(sz - i < PGSIZE)
80106ab1:	bf 00 10 00 00       	mov    $0x1000,%edi
    pa = PTE_ADDR(*pte);
80106ab6:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
80106abb:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106ac1:	0f 46 fe             	cmovbe %esi,%edi
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106ac4:	01 d9                	add    %ebx,%ecx
80106ac6:	05 00 00 00 80       	add    $0x80000000,%eax
80106acb:	57                   	push   %edi
80106acc:	51                   	push   %ecx
80106acd:	50                   	push   %eax
80106ace:	ff 75 10             	pushl  0x10(%ebp)
80106ad1:	e8 7a ae ff ff       	call   80101950 <readi>
80106ad6:	83 c4 10             	add    $0x10,%esp
80106ad9:	39 c7                	cmp    %eax,%edi
80106adb:	74 ab                	je     80106a88 <loaduvm+0x28>
}
80106add:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
80106ae0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80106ae5:	5b                   	pop    %ebx
80106ae6:	5e                   	pop    %esi
80106ae7:	5f                   	pop    %edi
80106ae8:	5d                   	pop    %ebp
80106ae9:	c3                   	ret    
80106aea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106af0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80106af3:	31 c0                	xor    %eax,%eax
}
80106af5:	5b                   	pop    %ebx
80106af6:	5e                   	pop    %esi
80106af7:	5f                   	pop    %edi
80106af8:	5d                   	pop    %ebp
80106af9:	c3                   	ret    
      panic("loaduvm: address should exist");
80106afa:	83 ec 0c             	sub    $0xc,%esp
80106afd:	68 87 7a 10 80       	push   $0x80107a87
80106b02:	e8 69 98 ff ff       	call   80100370 <panic>
    panic("loaduvm: addr must be page aligned");
80106b07:	83 ec 0c             	sub    $0xc,%esp
80106b0a:	68 28 7b 10 80       	push   $0x80107b28
80106b0f:	e8 5c 98 ff ff       	call   80100370 <panic>
80106b14:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106b1a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106b20 <allocuvm>:
{
80106b20:	55                   	push   %ebp
80106b21:	89 e5                	mov    %esp,%ebp
80106b23:	57                   	push   %edi
80106b24:	56                   	push   %esi
80106b25:	53                   	push   %ebx
80106b26:	83 ec 0c             	sub    $0xc,%esp
80106b29:	8b 7d 10             	mov    0x10(%ebp),%edi
  if(newsz >= KERNBASE)
80106b2c:	85 ff                	test   %edi,%edi
80106b2e:	78 7b                	js     80106bab <allocuvm+0x8b>
  if(newsz < oldsz)
80106b30:	3b 7d 0c             	cmp    0xc(%ebp),%edi
    return oldsz;
80106b33:	8b 45 0c             	mov    0xc(%ebp),%eax
  if(newsz < oldsz)
80106b36:	72 75                	jb     80106bad <allocuvm+0x8d>
  a = PGROUNDUP(oldsz);
80106b38:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80106b3e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a < newsz; a += PGSIZE){
80106b44:	39 df                	cmp    %ebx,%edi
80106b46:	77 43                	ja     80106b8b <allocuvm+0x6b>
80106b48:	eb 6e                	jmp    80106bb8 <allocuvm+0x98>
80106b4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    memset(mem, 0, PGSIZE);
80106b50:	83 ec 04             	sub    $0x4,%esp
80106b53:	68 00 10 00 00       	push   $0x1000
80106b58:	6a 00                	push   $0x0
80106b5a:	50                   	push   %eax
80106b5b:	e8 60 d9 ff ff       	call   801044c0 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80106b60:	58                   	pop    %eax
80106b61:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106b67:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106b6c:	5a                   	pop    %edx
80106b6d:	6a 06                	push   $0x6
80106b6f:	50                   	push   %eax
80106b70:	89 da                	mov    %ebx,%edx
80106b72:	8b 45 08             	mov    0x8(%ebp),%eax
80106b75:	e8 06 fb ff ff       	call   80106680 <mappages>
80106b7a:	83 c4 10             	add    $0x10,%esp
80106b7d:	85 c0                	test   %eax,%eax
80106b7f:	78 47                	js     80106bc8 <allocuvm+0xa8>
  for(; a < newsz; a += PGSIZE){
80106b81:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106b87:	39 df                	cmp    %ebx,%edi
80106b89:	76 2d                	jbe    80106bb8 <allocuvm+0x98>
    mem = kalloc();
80106b8b:	e8 00 b9 ff ff       	call   80102490 <kalloc>
    if(mem == 0){
80106b90:	85 c0                	test   %eax,%eax
    mem = kalloc();
80106b92:	89 c6                	mov    %eax,%esi
    if(mem == 0){
80106b94:	75 ba                	jne    80106b50 <allocuvm+0x30>
      cprintf("allocuvm out of memory\n");
80106b96:	83 ec 0c             	sub    $0xc,%esp
80106b99:	68 a5 7a 10 80       	push   $0x80107aa5
80106b9e:	e8 bd 9a ff ff       	call   80100660 <cprintf>
  if(newsz >= oldsz)
80106ba3:	83 c4 10             	add    $0x10,%esp
80106ba6:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106ba9:	77 4f                	ja     80106bfa <allocuvm+0xda>
      return 0;
80106bab:	31 c0                	xor    %eax,%eax
}
80106bad:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106bb0:	5b                   	pop    %ebx
80106bb1:	5e                   	pop    %esi
80106bb2:	5f                   	pop    %edi
80106bb3:	5d                   	pop    %ebp
80106bb4:	c3                   	ret    
80106bb5:	8d 76 00             	lea    0x0(%esi),%esi
80106bb8:	8d 65 f4             	lea    -0xc(%ebp),%esp
  for(; a < newsz; a += PGSIZE){
80106bbb:	89 f8                	mov    %edi,%eax
}
80106bbd:	5b                   	pop    %ebx
80106bbe:	5e                   	pop    %esi
80106bbf:	5f                   	pop    %edi
80106bc0:	5d                   	pop    %ebp
80106bc1:	c3                   	ret    
80106bc2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      cprintf("allocuvm out of memory (2)\n");
80106bc8:	83 ec 0c             	sub    $0xc,%esp
80106bcb:	68 bd 7a 10 80       	push   $0x80107abd
80106bd0:	e8 8b 9a ff ff       	call   80100660 <cprintf>
  if(newsz >= oldsz)
80106bd5:	83 c4 10             	add    $0x10,%esp
80106bd8:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106bdb:	76 0d                	jbe    80106bea <allocuvm+0xca>
80106bdd:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106be0:	8b 45 08             	mov    0x8(%ebp),%eax
80106be3:	89 fa                	mov    %edi,%edx
80106be5:	e8 26 fb ff ff       	call   80106710 <deallocuvm.part.0>
      kfree(mem);
80106bea:	83 ec 0c             	sub    $0xc,%esp
80106bed:	56                   	push   %esi
80106bee:	e8 ed b6 ff ff       	call   801022e0 <kfree>
      return 0;
80106bf3:	83 c4 10             	add    $0x10,%esp
80106bf6:	31 c0                	xor    %eax,%eax
80106bf8:	eb b3                	jmp    80106bad <allocuvm+0x8d>
80106bfa:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106bfd:	8b 45 08             	mov    0x8(%ebp),%eax
80106c00:	89 fa                	mov    %edi,%edx
80106c02:	e8 09 fb ff ff       	call   80106710 <deallocuvm.part.0>
      return 0;
80106c07:	31 c0                	xor    %eax,%eax
80106c09:	eb a2                	jmp    80106bad <allocuvm+0x8d>
80106c0b:	90                   	nop
80106c0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106c10 <deallocuvm>:
{
80106c10:	55                   	push   %ebp
80106c11:	89 e5                	mov    %esp,%ebp
80106c13:	8b 55 0c             	mov    0xc(%ebp),%edx
80106c16:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106c19:	8b 45 08             	mov    0x8(%ebp),%eax
  if(newsz >= oldsz)
80106c1c:	39 d1                	cmp    %edx,%ecx
80106c1e:	73 10                	jae    80106c30 <deallocuvm+0x20>
}
80106c20:	5d                   	pop    %ebp
80106c21:	e9 ea fa ff ff       	jmp    80106710 <deallocuvm.part.0>
80106c26:	8d 76 00             	lea    0x0(%esi),%esi
80106c29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106c30:	89 d0                	mov    %edx,%eax
80106c32:	5d                   	pop    %ebp
80106c33:	c3                   	ret    
80106c34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106c3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106c40 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
80106c40:	55                   	push   %ebp
80106c41:	89 e5                	mov    %esp,%ebp
80106c43:	57                   	push   %edi
80106c44:	56                   	push   %esi
80106c45:	53                   	push   %ebx
80106c46:	83 ec 0c             	sub    $0xc,%esp
80106c49:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
80106c4c:	85 f6                	test   %esi,%esi
80106c4e:	74 59                	je     80106ca9 <freevm+0x69>
80106c50:	31 c9                	xor    %ecx,%ecx
80106c52:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106c57:	89 f0                	mov    %esi,%eax
80106c59:	e8 b2 fa ff ff       	call   80106710 <deallocuvm.part.0>
80106c5e:	89 f3                	mov    %esi,%ebx
80106c60:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80106c66:	eb 0f                	jmp    80106c77 <freevm+0x37>
80106c68:	90                   	nop
80106c69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106c70:	83 c3 04             	add    $0x4,%ebx
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106c73:	39 fb                	cmp    %edi,%ebx
80106c75:	74 23                	je     80106c9a <freevm+0x5a>
    if(pgdir[i] & PTE_P){
80106c77:	8b 03                	mov    (%ebx),%eax
80106c79:	a8 01                	test   $0x1,%al
80106c7b:	74 f3                	je     80106c70 <freevm+0x30>
      char * v = P2V(PTE_ADDR(pgdir[i]));
80106c7d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
      kfree(v);
80106c82:	83 ec 0c             	sub    $0xc,%esp
80106c85:	83 c3 04             	add    $0x4,%ebx
      char * v = P2V(PTE_ADDR(pgdir[i]));
80106c88:	05 00 00 00 80       	add    $0x80000000,%eax
      kfree(v);
80106c8d:	50                   	push   %eax
80106c8e:	e8 4d b6 ff ff       	call   801022e0 <kfree>
80106c93:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < NPDENTRIES; i++){
80106c96:	39 fb                	cmp    %edi,%ebx
80106c98:	75 dd                	jne    80106c77 <freevm+0x37>
    }
  }
  kfree((char*)pgdir);
80106c9a:	89 75 08             	mov    %esi,0x8(%ebp)
}
80106c9d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106ca0:	5b                   	pop    %ebx
80106ca1:	5e                   	pop    %esi
80106ca2:	5f                   	pop    %edi
80106ca3:	5d                   	pop    %ebp
  kfree((char*)pgdir);
80106ca4:	e9 37 b6 ff ff       	jmp    801022e0 <kfree>
    panic("freevm: no pgdir");
80106ca9:	83 ec 0c             	sub    $0xc,%esp
80106cac:	68 d9 7a 10 80       	push   $0x80107ad9
80106cb1:	e8 ba 96 ff ff       	call   80100370 <panic>
80106cb6:	8d 76 00             	lea    0x0(%esi),%esi
80106cb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106cc0 <setupkvm>:
{
80106cc0:	55                   	push   %ebp
80106cc1:	89 e5                	mov    %esp,%ebp
80106cc3:	56                   	push   %esi
80106cc4:	53                   	push   %ebx
  if((pgdir = (pde_t*)kalloc()) == 0)
80106cc5:	e8 c6 b7 ff ff       	call   80102490 <kalloc>
80106cca:	85 c0                	test   %eax,%eax
80106ccc:	89 c6                	mov    %eax,%esi
80106cce:	74 42                	je     80106d12 <setupkvm+0x52>
  memset(pgdir, 0, PGSIZE);
80106cd0:	83 ec 04             	sub    $0x4,%esp
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106cd3:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
  memset(pgdir, 0, PGSIZE);
80106cd8:	68 00 10 00 00       	push   $0x1000
80106cdd:	6a 00                	push   $0x0
80106cdf:	50                   	push   %eax
80106ce0:	e8 db d7 ff ff       	call   801044c0 <memset>
80106ce5:	83 c4 10             	add    $0x10,%esp
                (uint)k->phys_start, k->perm) < 0) {
80106ce8:	8b 43 04             	mov    0x4(%ebx),%eax
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
80106ceb:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106cee:	83 ec 08             	sub    $0x8,%esp
80106cf1:	8b 13                	mov    (%ebx),%edx
80106cf3:	ff 73 0c             	pushl  0xc(%ebx)
80106cf6:	50                   	push   %eax
80106cf7:	29 c1                	sub    %eax,%ecx
80106cf9:	89 f0                	mov    %esi,%eax
80106cfb:	e8 80 f9 ff ff       	call   80106680 <mappages>
80106d00:	83 c4 10             	add    $0x10,%esp
80106d03:	85 c0                	test   %eax,%eax
80106d05:	78 19                	js     80106d20 <setupkvm+0x60>
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106d07:	83 c3 10             	add    $0x10,%ebx
80106d0a:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
80106d10:	75 d6                	jne    80106ce8 <setupkvm+0x28>
}
80106d12:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106d15:	89 f0                	mov    %esi,%eax
80106d17:	5b                   	pop    %ebx
80106d18:	5e                   	pop    %esi
80106d19:	5d                   	pop    %ebp
80106d1a:	c3                   	ret    
80106d1b:	90                   	nop
80106d1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      freevm(pgdir);
80106d20:	83 ec 0c             	sub    $0xc,%esp
80106d23:	56                   	push   %esi
      return 0;
80106d24:	31 f6                	xor    %esi,%esi
      freevm(pgdir);
80106d26:	e8 15 ff ff ff       	call   80106c40 <freevm>
      return 0;
80106d2b:	83 c4 10             	add    $0x10,%esp
}
80106d2e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106d31:	89 f0                	mov    %esi,%eax
80106d33:	5b                   	pop    %ebx
80106d34:	5e                   	pop    %esi
80106d35:	5d                   	pop    %ebp
80106d36:	c3                   	ret    
80106d37:	89 f6                	mov    %esi,%esi
80106d39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106d40 <kvmalloc>:
{
80106d40:	55                   	push   %ebp
80106d41:	89 e5                	mov    %esp,%ebp
80106d43:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80106d46:	e8 75 ff ff ff       	call   80106cc0 <setupkvm>
80106d4b:	a3 64 61 11 80       	mov    %eax,0x80116164
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106d50:	05 00 00 00 80       	add    $0x80000000,%eax
80106d55:	0f 22 d8             	mov    %eax,%cr3
}
80106d58:	c9                   	leave  
80106d59:	c3                   	ret    
80106d5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106d60 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80106d60:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106d61:	31 c9                	xor    %ecx,%ecx
{
80106d63:	89 e5                	mov    %esp,%ebp
80106d65:	83 ec 08             	sub    $0x8,%esp
  pte = walkpgdir(pgdir, uva, 0);
80106d68:	8b 55 0c             	mov    0xc(%ebp),%edx
80106d6b:	8b 45 08             	mov    0x8(%ebp),%eax
80106d6e:	e8 8d f8 ff ff       	call   80106600 <walkpgdir>
  if(pte == 0)
80106d73:	85 c0                	test   %eax,%eax
80106d75:	74 05                	je     80106d7c <clearpteu+0x1c>
    panic("clearpteu");
  *pte &= ~PTE_U;
80106d77:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
80106d7a:	c9                   	leave  
80106d7b:	c3                   	ret    
    panic("clearpteu");
80106d7c:	83 ec 0c             	sub    $0xc,%esp
80106d7f:	68 ea 7a 10 80       	push   $0x80107aea
80106d84:	e8 e7 95 ff ff       	call   80100370 <panic>
80106d89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106d90 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
80106d90:	55                   	push   %ebp
80106d91:	89 e5                	mov    %esp,%ebp
80106d93:	57                   	push   %edi
80106d94:	56                   	push   %esi
80106d95:	53                   	push   %ebx
80106d96:	83 ec 1c             	sub    $0x1c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
80106d99:	e8 22 ff ff ff       	call   80106cc0 <setupkvm>
80106d9e:	85 c0                	test   %eax,%eax
80106da0:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106da3:	0f 84 9f 00 00 00    	je     80106e48 <copyuvm+0xb8>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80106da9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106dac:	85 c9                	test   %ecx,%ecx
80106dae:	0f 84 94 00 00 00    	je     80106e48 <copyuvm+0xb8>
80106db4:	31 ff                	xor    %edi,%edi
80106db6:	eb 4a                	jmp    80106e02 <copyuvm+0x72>
80106db8:	90                   	nop
80106db9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
80106dc0:	83 ec 04             	sub    $0x4,%esp
80106dc3:	81 c3 00 00 00 80    	add    $0x80000000,%ebx
80106dc9:	68 00 10 00 00       	push   $0x1000
80106dce:	53                   	push   %ebx
80106dcf:	50                   	push   %eax
80106dd0:	e8 9b d7 ff ff       	call   80104570 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0) {
80106dd5:	58                   	pop    %eax
80106dd6:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106ddc:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106de1:	5a                   	pop    %edx
80106de2:	ff 75 e4             	pushl  -0x1c(%ebp)
80106de5:	50                   	push   %eax
80106de6:	89 fa                	mov    %edi,%edx
80106de8:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106deb:	e8 90 f8 ff ff       	call   80106680 <mappages>
80106df0:	83 c4 10             	add    $0x10,%esp
80106df3:	85 c0                	test   %eax,%eax
80106df5:	78 61                	js     80106e58 <copyuvm+0xc8>
  for(i = 0; i < sz; i += PGSIZE){
80106df7:	81 c7 00 10 00 00    	add    $0x1000,%edi
80106dfd:	39 7d 0c             	cmp    %edi,0xc(%ebp)
80106e00:	76 46                	jbe    80106e48 <copyuvm+0xb8>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80106e02:	8b 45 08             	mov    0x8(%ebp),%eax
80106e05:	31 c9                	xor    %ecx,%ecx
80106e07:	89 fa                	mov    %edi,%edx
80106e09:	e8 f2 f7 ff ff       	call   80106600 <walkpgdir>
80106e0e:	85 c0                	test   %eax,%eax
80106e10:	74 61                	je     80106e73 <copyuvm+0xe3>
    if(!(*pte & PTE_P))
80106e12:	8b 00                	mov    (%eax),%eax
80106e14:	a8 01                	test   $0x1,%al
80106e16:	74 4e                	je     80106e66 <copyuvm+0xd6>
    pa = PTE_ADDR(*pte);
80106e18:	89 c3                	mov    %eax,%ebx
    flags = PTE_FLAGS(*pte);
80106e1a:	25 ff 0f 00 00       	and    $0xfff,%eax
    pa = PTE_ADDR(*pte);
80106e1f:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
    flags = PTE_FLAGS(*pte);
80106e25:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if((mem = kalloc()) == 0)
80106e28:	e8 63 b6 ff ff       	call   80102490 <kalloc>
80106e2d:	85 c0                	test   %eax,%eax
80106e2f:	89 c6                	mov    %eax,%esi
80106e31:	75 8d                	jne    80106dc0 <copyuvm+0x30>
    }
  }
  return d;

bad:
  freevm(d);
80106e33:	83 ec 0c             	sub    $0xc,%esp
80106e36:	ff 75 e0             	pushl  -0x20(%ebp)
80106e39:	e8 02 fe ff ff       	call   80106c40 <freevm>
  return 0;
80106e3e:	83 c4 10             	add    $0x10,%esp
80106e41:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
}
80106e48:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106e4b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e4e:	5b                   	pop    %ebx
80106e4f:	5e                   	pop    %esi
80106e50:	5f                   	pop    %edi
80106e51:	5d                   	pop    %ebp
80106e52:	c3                   	ret    
80106e53:	90                   	nop
80106e54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      kfree(mem);
80106e58:	83 ec 0c             	sub    $0xc,%esp
80106e5b:	56                   	push   %esi
80106e5c:	e8 7f b4 ff ff       	call   801022e0 <kfree>
      goto bad;
80106e61:	83 c4 10             	add    $0x10,%esp
80106e64:	eb cd                	jmp    80106e33 <copyuvm+0xa3>
      panic("copyuvm: page not present");
80106e66:	83 ec 0c             	sub    $0xc,%esp
80106e69:	68 0e 7b 10 80       	push   $0x80107b0e
80106e6e:	e8 fd 94 ff ff       	call   80100370 <panic>
      panic("copyuvm: pte should exist");
80106e73:	83 ec 0c             	sub    $0xc,%esp
80106e76:	68 f4 7a 10 80       	push   $0x80107af4
80106e7b:	e8 f0 94 ff ff       	call   80100370 <panic>

80106e80 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80106e80:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106e81:	31 c9                	xor    %ecx,%ecx
{
80106e83:	89 e5                	mov    %esp,%ebp
80106e85:	83 ec 08             	sub    $0x8,%esp
  pte = walkpgdir(pgdir, uva, 0);
80106e88:	8b 55 0c             	mov    0xc(%ebp),%edx
80106e8b:	8b 45 08             	mov    0x8(%ebp),%eax
80106e8e:	e8 6d f7 ff ff       	call   80106600 <walkpgdir>
  if((*pte & PTE_P) == 0)
80106e93:	8b 00                	mov    (%eax),%eax
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
}
80106e95:	c9                   	leave  
  if((*pte & PTE_U) == 0)
80106e96:	89 c2                	mov    %eax,%edx
  return (char*)P2V(PTE_ADDR(*pte));
80106e98:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  if((*pte & PTE_U) == 0)
80106e9d:	83 e2 05             	and    $0x5,%edx
  return (char*)P2V(PTE_ADDR(*pte));
80106ea0:	05 00 00 00 80       	add    $0x80000000,%eax
80106ea5:	83 fa 05             	cmp    $0x5,%edx
80106ea8:	ba 00 00 00 00       	mov    $0x0,%edx
80106ead:	0f 45 c2             	cmovne %edx,%eax
}
80106eb0:	c3                   	ret    
80106eb1:	eb 0d                	jmp    80106ec0 <copyout>
80106eb3:	90                   	nop
80106eb4:	90                   	nop
80106eb5:	90                   	nop
80106eb6:	90                   	nop
80106eb7:	90                   	nop
80106eb8:	90                   	nop
80106eb9:	90                   	nop
80106eba:	90                   	nop
80106ebb:	90                   	nop
80106ebc:	90                   	nop
80106ebd:	90                   	nop
80106ebe:	90                   	nop
80106ebf:	90                   	nop

80106ec0 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
80106ec0:	55                   	push   %ebp
80106ec1:	89 e5                	mov    %esp,%ebp
80106ec3:	57                   	push   %edi
80106ec4:	56                   	push   %esi
80106ec5:	53                   	push   %ebx
80106ec6:	83 ec 1c             	sub    $0x1c,%esp
80106ec9:	8b 5d 14             	mov    0x14(%ebp),%ebx
80106ecc:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80106ecf:	8b 7d 10             	mov    0x10(%ebp),%edi
80106ed2:	85 db                	test   %ebx,%ebx
80106ed4:	75 40                	jne    80106f16 <copyout+0x56>
80106ed6:	eb 70                	jmp    80106f48 <copyout+0x88>
80106ed8:	90                   	nop
80106ed9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
80106ee0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106ee3:	89 f1                	mov    %esi,%ecx
80106ee5:	29 d1                	sub    %edx,%ecx
80106ee7:	81 c1 00 10 00 00    	add    $0x1000,%ecx
80106eed:	39 d9                	cmp    %ebx,%ecx
80106eef:	0f 47 cb             	cmova  %ebx,%ecx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
80106ef2:	29 f2                	sub    %esi,%edx
80106ef4:	83 ec 04             	sub    $0x4,%esp
80106ef7:	01 d0                	add    %edx,%eax
80106ef9:	51                   	push   %ecx
80106efa:	57                   	push   %edi
80106efb:	50                   	push   %eax
80106efc:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80106eff:	e8 6c d6 ff ff       	call   80104570 <memmove>
    len -= n;
    buf += n;
80106f04:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  while(len > 0){
80106f07:	83 c4 10             	add    $0x10,%esp
    va = va0 + PGSIZE;
80106f0a:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
    buf += n;
80106f10:	01 cf                	add    %ecx,%edi
  while(len > 0){
80106f12:	29 cb                	sub    %ecx,%ebx
80106f14:	74 32                	je     80106f48 <copyout+0x88>
    va0 = (uint)PGROUNDDOWN(va);
80106f16:	89 d6                	mov    %edx,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80106f18:	83 ec 08             	sub    $0x8,%esp
    va0 = (uint)PGROUNDDOWN(va);
80106f1b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80106f1e:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80106f24:	56                   	push   %esi
80106f25:	ff 75 08             	pushl  0x8(%ebp)
80106f28:	e8 53 ff ff ff       	call   80106e80 <uva2ka>
    if(pa0 == 0)
80106f2d:	83 c4 10             	add    $0x10,%esp
80106f30:	85 c0                	test   %eax,%eax
80106f32:	75 ac                	jne    80106ee0 <copyout+0x20>
  }
  return 0;
}
80106f34:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
80106f37:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80106f3c:	5b                   	pop    %ebx
80106f3d:	5e                   	pop    %esi
80106f3e:	5f                   	pop    %edi
80106f3f:	5d                   	pop    %ebp
80106f40:	c3                   	ret    
80106f41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106f48:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80106f4b:	31 c0                	xor    %eax,%eax
}
80106f4d:	5b                   	pop    %ebx
80106f4e:	5e                   	pop    %esi
80106f4f:	5f                   	pop    %edi
80106f50:	5d                   	pop    %ebp
80106f51:	c3                   	ret    
80106f52:	66 90                	xchg   %ax,%ax
80106f54:	66 90                	xchg   %ax,%ax
80106f56:	66 90                	xchg   %ax,%ax
80106f58:	66 90                	xchg   %ax,%ax
80106f5a:	66 90                	xchg   %ax,%ax
80106f5c:	66 90                	xchg   %ax,%ax
80106f5e:	66 90                	xchg   %ax,%ax

80106f60 <sgenrand>:
80106f60:	55                   	push   %ebp
80106f61:	b8 c4 a5 10 80       	mov    $0x8010a5c4,%eax
80106f66:	89 e5                	mov    %esp,%ebp
80106f68:	8b 55 08             	mov    0x8(%ebp),%edx
80106f6b:	89 15 c0 a5 10 80    	mov    %edx,0x8010a5c0
80106f71:	eb 08                	jmp    80106f7b <sgenrand+0x1b>
80106f73:	90                   	nop
80106f74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106f78:	83 c0 04             	add    $0x4,%eax
80106f7b:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
80106f81:	3d 7c af 10 80       	cmp    $0x8010af7c,%eax
80106f86:	89 10                	mov    %edx,(%eax)
80106f88:	75 ee                	jne    80106f78 <sgenrand+0x18>
80106f8a:	c7 05 60 a4 10 80 70 	movl   $0x270,0x8010a460
80106f91:	02 00 00 
80106f94:	5d                   	pop    %ebp
80106f95:	c3                   	ret    
80106f96:	8d 76 00             	lea    0x0(%esi),%esi
80106f99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106fa0 <genrand>:
80106fa0:	a1 60 a4 10 80       	mov    0x8010a460,%eax
80106fa5:	55                   	push   %ebp
80106fa6:	89 e5                	mov    %esp,%ebp
80106fa8:	56                   	push   %esi
80106fa9:	53                   	push   %ebx
80106faa:	3d 6f 02 00 00       	cmp    $0x26f,%eax
80106faf:	0f 8e fa 00 00 00    	jle    801070af <genrand+0x10f>
80106fb5:	3d 71 02 00 00       	cmp    $0x271,%eax
80106fba:	0f 84 fb 00 00 00    	je     801070bb <genrand+0x11b>
80106fc0:	ba c0 a5 10 80       	mov    $0x8010a5c0,%edx
80106fc5:	bb 4c a9 10 80       	mov    $0x8010a94c,%ebx
80106fca:	89 d1                	mov    %edx,%ecx
80106fcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106fd0:	8b 01                	mov    (%ecx),%eax
80106fd2:	8b 71 04             	mov    0x4(%ecx),%esi
80106fd5:	83 c1 04             	add    $0x4,%ecx
80106fd8:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
80106fde:	25 00 00 00 80       	and    $0x80000000,%eax
80106fe3:	09 f0                	or     %esi,%eax
80106fe5:	89 c6                	mov    %eax,%esi
80106fe7:	83 e0 01             	and    $0x1,%eax
80106fea:	d1 ee                	shr    %esi
80106fec:	33 b1 30 06 00 00    	xor    0x630(%ecx),%esi
80106ff2:	33 34 85 4c 7b 10 80 	xor    -0x7fef84b4(,%eax,4),%esi
80106ff9:	89 71 fc             	mov    %esi,-0x4(%ecx)
80106ffc:	39 cb                	cmp    %ecx,%ebx
80106ffe:	75 d0                	jne    80106fd0 <genrand+0x30>
80107000:	b9 f0 ab 10 80       	mov    $0x8010abf0,%ecx
80107005:	8d 76 00             	lea    0x0(%esi),%esi
80107008:	8b 82 8c 03 00 00    	mov    0x38c(%edx),%eax
8010700e:	8b 9a 90 03 00 00    	mov    0x390(%edx),%ebx
80107014:	83 c2 04             	add    $0x4,%edx
80107017:	81 e3 ff ff ff 7f    	and    $0x7fffffff,%ebx
8010701d:	25 00 00 00 80       	and    $0x80000000,%eax
80107022:	09 d8                	or     %ebx,%eax
80107024:	89 c3                	mov    %eax,%ebx
80107026:	83 e0 01             	and    $0x1,%eax
80107029:	d1 eb                	shr    %ebx
8010702b:	33 5a fc             	xor    -0x4(%edx),%ebx
8010702e:	33 1c 85 4c 7b 10 80 	xor    -0x7fef84b4(,%eax,4),%ebx
80107035:	89 9a 88 03 00 00    	mov    %ebx,0x388(%edx)
8010703b:	39 d1                	cmp    %edx,%ecx
8010703d:	75 c9                	jne    80107008 <genrand+0x68>
8010703f:	8b 0d c0 a5 10 80    	mov    0x8010a5c0,%ecx
80107045:	8b 15 7c af 10 80    	mov    0x8010af7c,%edx
8010704b:	89 c8                	mov    %ecx,%eax
8010704d:	81 e2 00 00 00 80    	and    $0x80000000,%edx
80107053:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
80107058:	09 c2                	or     %eax,%edx
8010705a:	89 d0                	mov    %edx,%eax
8010705c:	83 e2 01             	and    $0x1,%edx
8010705f:	d1 e8                	shr    %eax
80107061:	33 05 f0 ab 10 80    	xor    0x8010abf0,%eax
80107067:	33 04 95 4c 7b 10 80 	xor    -0x7fef84b4(,%edx,4),%eax
8010706e:	ba 01 00 00 00       	mov    $0x1,%edx
80107073:	a3 7c af 10 80       	mov    %eax,0x8010af7c
80107078:	89 c8                	mov    %ecx,%eax
8010707a:	89 15 60 a4 10 80    	mov    %edx,0x8010a460
80107080:	c1 e8 0b             	shr    $0xb,%eax
80107083:	31 c8                	xor    %ecx,%eax
80107085:	89 c2                	mov    %eax,%edx
80107087:	c1 e2 07             	shl    $0x7,%edx
8010708a:	81 e2 80 56 2c 9d    	and    $0x9d2c5680,%edx
80107090:	31 d0                	xor    %edx,%eax
80107092:	89 c2                	mov    %eax,%edx
80107094:	c1 e2 0f             	shl    $0xf,%edx
80107097:	81 e2 00 00 c6 ef    	and    $0xefc60000,%edx
8010709d:	31 d0                	xor    %edx,%eax
8010709f:	89 c2                	mov    %eax,%edx
801070a1:	c1 ea 12             	shr    $0x12,%edx
801070a4:	31 d0                	xor    %edx,%eax
801070a6:	5b                   	pop    %ebx
801070a7:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
801070ac:	5e                   	pop    %esi
801070ad:	5d                   	pop    %ebp
801070ae:	c3                   	ret    
801070af:	8d 50 01             	lea    0x1(%eax),%edx
801070b2:	8b 0c 85 c0 a5 10 80 	mov    -0x7fef5a40(,%eax,4),%ecx
801070b9:	eb bd                	jmp    80107078 <genrand+0xd8>
801070bb:	c7 05 c0 a5 10 80 05 	movl   $0x1105,0x8010a5c0
801070c2:	11 00 00 
801070c5:	b8 c4 a5 10 80       	mov    $0x8010a5c4,%eax
801070ca:	b9 7c af 10 80       	mov    $0x8010af7c,%ecx
801070cf:	ba 05 11 00 00       	mov    $0x1105,%edx
801070d4:	eb 0d                	jmp    801070e3 <genrand+0x143>
801070d6:	8d 76 00             	lea    0x0(%esi),%esi
801070d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801070e0:	83 c0 04             	add    $0x4,%eax
801070e3:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
801070e9:	39 c1                	cmp    %eax,%ecx
801070eb:	89 10                	mov    %edx,(%eax)
801070ed:	75 f1                	jne    801070e0 <genrand+0x140>
801070ef:	e9 cc fe ff ff       	jmp    80106fc0 <genrand+0x20>
801070f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801070fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80107100 <random_at_most>:
80107100:	55                   	push   %ebp
80107101:	31 d2                	xor    %edx,%edx
80107103:	89 e5                	mov    %esp,%ebp
80107105:	56                   	push   %esi
80107106:	53                   	push   %ebx
80107107:	8b 45 08             	mov    0x8(%ebp),%eax
8010710a:	bb 00 00 00 80       	mov    $0x80000000,%ebx
8010710f:	8d 48 01             	lea    0x1(%eax),%ecx
80107112:	89 d8                	mov    %ebx,%eax
80107114:	f7 f1                	div    %ecx
80107116:	89 c6                	mov    %eax,%esi
80107118:	29 d3                	sub    %edx,%ebx
8010711a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80107120:	e8 7b fe ff ff       	call   80106fa0 <genrand>
80107125:	39 d8                	cmp    %ebx,%eax
80107127:	73 f7                	jae    80107120 <random_at_most+0x20>
80107129:	31 d2                	xor    %edx,%edx
8010712b:	f7 f6                	div    %esi
8010712d:	5b                   	pop    %ebx
8010712e:	5e                   	pop    %esi
8010712f:	5d                   	pop    %ebp
80107130:	c3                   	ret    
