"".main STEXT size=677 args=0x0 locals=0x78 funcid=0x0
	0x0000 00000 (xiaochen.go:5)	TEXT	"".main(SB), ABIInternal, $120-0
	0x0000 00000 (xiaochen.go:5)	MOVQ	(TLS), CX
	0x0009 00009 (xiaochen.go:5)	CMPQ	SP, 16(CX)
	0x000d 00013 (xiaochen.go:5)	PCDATA	$0, $-2
	0x000d 00013 (xiaochen.go:5)	JLS	664
	0x0013 00019 (xiaochen.go:5)	PCDATA	$0, $-1
	0x0013 00019 (xiaochen.go:5)	SUBQ	$120, SP
	0x0017 00023 (xiaochen.go:5)	MOVQ	BP, 112(SP)
	0x001c 00028 (xiaochen.go:5)	LEAQ	112(SP), BP
	0x0021 00033 (xiaochen.go:5)	FUNCDATA	$0, gclocals·3e27b3aa6b89137cce48b3379a2a6610(SB)
	0x0021 00033 (xiaochen.go:5)	FUNCDATA	$1, gclocals·33b8ebcfd207d68e0bd1318670f654e5(SB)
	0x0021 00033 (<unknown line number>)	NOP
	0x0021 00033 (xiaochen.go:6)	LEAQ	type.interface {}(SB), AX
	0x0028 00040 (xiaochen.go:60)	MOVQ	AX, (SP)
	0x002c 00044 (xiaochen.go:60)	MOVQ	$42, 8(SP)
	0x0035 00053 (xiaochen.go:60)	MOVQ	$42, 16(SP)
	0x003e 00062 (xiaochen.go:60)	PCDATA	$1, $0
	0x003e 00062 (xiaochen.go:60)	NOP
	0x0040 00064 (xiaochen.go:60)	CALL	runtime.makeslice(SB)
	0x0045 00069 (xiaochen.go:60)	MOVQ	24(SP), AX
	0x004a 00074 (xiaochen.go:60)	MOVQ	AX, ""..autotmp_26+104(SP)
	0x004f 00079 (xiaochen.go:55)	LEAQ	type."".RingBuffer(SB), CX
	0x0056 00086 (xiaochen.go:55)	MOVQ	CX, (SP)
	0x005a 00090 (xiaochen.go:55)	PCDATA	$1, $1
	0x005a 00090 (xiaochen.go:55)	CALL	runtime.newobject(SB)
	0x005f 00095 (xiaochen.go:55)	MOVQ	8(SP), AX
	0x0064 00100 (xiaochen.go:55)	MOVQ	AX, "".buffer+96(SP)
	0x0069 00105 (xiaochen.go:56)	MOVQ	$42, (AX)
	0x0070 00112 (xiaochen.go:57)	MOVQ	$0, 8(AX)
	0x0078 00120 (xiaochen.go:58)	MOVQ	$100000000, 16(AX)
	0x0080 00128 (xiaochen.go:59)	MOVB	$0, 24(AX)
	0x0084 00132 (xiaochen.go:60)	MOVQ	$42, 40(AX)
	0x008c 00140 (xiaochen.go:60)	MOVQ	$42, 48(AX)
	0x0094 00148 (xiaochen.go:60)	PCDATA	$0, $-2
	0x0094 00148 (xiaochen.go:60)	CMPL	runtime.writeBarrier(SB), $0
	0x009b 00155 (xiaochen.go:60)	NOP
	0x00a0 00160 (xiaochen.go:60)	JNE	618
	0x00a6 00166 (xiaochen.go:60)	MOVQ	""..autotmp_26+104(SP), CX
	0x00ab 00171 (xiaochen.go:60)	MOVQ	CX, 32(AX)
	0x00af 00175 (xiaochen.go:8)	PCDATA	$0, $-1
	0x00af 00175 (xiaochen.go:8)	LEAQ	type.int(SB), AX
	0x00b6 00182 (xiaochen.go:8)	MOVQ	AX, (SP)
	0x00ba 00186 (xiaochen.go:8)	MOVQ	$1000000, 8(SP)
	0x00c3 00195 (xiaochen.go:8)	MOVQ	$1000000, 16(SP)
	0x00cc 00204 (xiaochen.go:8)	PCDATA	$1, $2
	0x00cc 00204 (xiaochen.go:8)	CALL	runtime.makeslice(SB)
	0x00d1 00209 (xiaochen.go:8)	MOVQ	24(SP), AX
	0x00d6 00214 (xiaochen.go:8)	XORL	CX, CX
	0x00d8 00216 (xiaochen.go:9)	JMP	225
	0x00da 00218 (xiaochen.go:10)	MOVQ	CX, (AX)(CX*8)
	0x00de 00222 (xiaochen.go:9)	INCQ	CX
	0x00e1 00225 (xiaochen.go:9)	CMPQ	CX, $1000000
	0x00e8 00232 (xiaochen.go:9)	JLT	218
	0x00ea 00234 (xiaochen.go:8)	MOVQ	AX, ""..autotmp_26+104(SP)
	0x00ef 00239 (xiaochen.go:14)	LEAQ	type.noalg.struct { F uintptr; "".count int; "".buffer *"".RingBuffer; "".putList []int }(SB), AX
	0x00f6 00246 (xiaochen.go:14)	MOVQ	AX, (SP)
	0x00fa 00250 (xiaochen.go:14)	PCDATA	$1, $3
	0x00fa 00250 (xiaochen.go:14)	CALL	runtime.newobject(SB)
	0x00ff 00255 (xiaochen.go:14)	MOVQ	8(SP), AX
	0x0104 00260 (xiaochen.go:14)	LEAQ	"".main.func1(SB), CX
	0x010b 00267 (xiaochen.go:14)	MOVQ	CX, (AX)
	0x010e 00270 (xiaochen.go:14)	MOVQ	$1000000, 8(AX)
	0x0116 00278 (xiaochen.go:14)	PCDATA	$0, $-2
	0x0116 00278 (xiaochen.go:14)	CMPL	runtime.writeBarrier(SB), $0
	0x011d 00285 (xiaochen.go:14)	NOP
	0x0120 00288 (xiaochen.go:14)	JNE	596
	0x0126 00294 (xiaochen.go:14)	MOVQ	"".buffer+96(SP), CX
	0x012b 00299 (xiaochen.go:14)	MOVQ	CX, 16(AX)
	0x012f 00303 (xiaochen.go:14)	PCDATA	$0, $-1
	0x012f 00303 (xiaochen.go:14)	MOVQ	$1000000, 32(AX)
	0x0137 00311 (xiaochen.go:14)	MOVQ	$1000000, 40(AX)
	0x013f 00319 (xiaochen.go:14)	PCDATA	$0, $-2
	0x013f 00319 (xiaochen.go:14)	CMPL	runtime.writeBarrier(SB), $0
	0x0146 00326 (xiaochen.go:14)	JNE	577
	0x014c 00332 (xiaochen.go:14)	MOVQ	""..autotmp_26+104(SP), DX
	0x0151 00337 (xiaochen.go:14)	MOVQ	DX, 24(AX)
	0x0155 00341 (xiaochen.go:23)	PCDATA	$0, $-1
	0x0155 00341 (xiaochen.go:23)	MOVL	$0, (SP)
	0x015c 00348 (xiaochen.go:23)	MOVQ	AX, 8(SP)
	0x0161 00353 (xiaochen.go:23)	PCDATA	$1, $2
	0x0161 00353 (xiaochen.go:23)	CALL	runtime.newproc(SB)
	0x0166 00358 (xiaochen.go:23)	XORL	AX, AX
	0x0168 00360 (xiaochen.go:23)	XORL	CX, CX
	0x016a 00362 (xiaochen.go:12)	LEAQ	""..autotmp_13+64(SP), DX
	0x016f 00367 (xiaochen.go:25)	JMP	382
	0x0171 00369 (xiaochen.go:30)	MOVQ	CX, (DI)(AX*8)
	0x0175 00373 (xiaochen.go:30)	MOVQ	SI, AX
	0x0178 00376 (xiaochen.go:30)	MOVQ	BX, CX
	0x017b 00379 (xiaochen.go:30)	MOVQ	DI, DX
	0x017e 00382 (xiaochen.go:30)	MOVQ	AX, "".getList.cap+72(SP)
	0x0183 00387 (xiaochen.go:30)	MOVQ	CX, "".getList.len+64(SP)
	0x0188 00392 (xiaochen.go:30)	MOVQ	DX, "".getList.ptr+88(SP)
	0x018d 00397 (xiaochen.go:26)	MOVQ	"".buffer+96(SP), BX
	0x0192 00402 (xiaochen.go:26)	MOVQ	BX, (SP)
	0x0196 00406 (xiaochen.go:26)	PCDATA	$1, $4
	0x0196 00406 (xiaochen.go:26)	CALL	"".(*RingBuffer).Get(SB)
	0x019b 00411 (xiaochen.go:30)	MOVQ	8(SP), AX
	0x01a0 00416 (xiaochen.go:30)	MOVQ	16(SP), CX
	0x01a5 00421 (xiaochen.go:27)	CMPQ	8(SP), $0
	0x01ab 00427 (xiaochen.go:27)	JEQ	566
	0x01b1 00433 (xiaochen.go:30)	LEAQ	type.int(SB), DX
	0x01b8 00440 (xiaochen.go:30)	NOP
	0x01c0 00448 (xiaochen.go:30)	CMPQ	DX, AX
	0x01c3 00451 (xiaochen.go:30)	JNE	637
	0x01c9 00457 (xiaochen.go:30)	MOVQ	"".getList.len+64(SP), AX
	0x01ce 00462 (xiaochen.go:30)	LEAQ	1(AX), BX
	0x01d2 00466 (xiaochen.go:30)	MOVQ	(CX), CX
	0x01d5 00469 (xiaochen.go:30)	MOVQ	"".getList.cap+72(SP), SI
	0x01da 00474 (xiaochen.go:30)	CMPQ	SI, BX
	0x01dd 00477 (xiaochen.go:30)	JCS	486
	0x01df 00479 (xiaochen.go:30)	MOVQ	"".getList.ptr+88(SP), DI
	0x01e4 00484 (xiaochen.go:30)	JMP	369
	0x01e6 00486 (xiaochen.go:30)	MOVQ	CX, ""..autotmp_27+80(SP)
	0x01eb 00491 (xiaochen.go:30)	MOVQ	DX, (SP)
	0x01ef 00495 (xiaochen.go:30)	MOVQ	"".getList.ptr+88(SP), CX
	0x01f4 00500 (xiaochen.go:30)	MOVQ	CX, 8(SP)
	0x01f9 00505 (xiaochen.go:30)	MOVQ	AX, 16(SP)
	0x01fe 00510 (xiaochen.go:30)	MOVQ	SI, 24(SP)
	0x0203 00515 (xiaochen.go:30)	MOVQ	BX, 32(SP)
	0x0208 00520 (xiaochen.go:30)	PCDATA	$1, $2
	0x0208 00520 (xiaochen.go:30)	CALL	runtime.growslice(SB)
	0x020d 00525 (xiaochen.go:30)	MOVQ	40(SP), DI
	0x0212 00530 (xiaochen.go:30)	MOVQ	48(SP), AX
	0x0217 00535 (xiaochen.go:30)	MOVQ	56(SP), SI
	0x021c 00540 (xiaochen.go:30)	LEAQ	1(AX), BX
	0x0220 00544 (xiaochen.go:30)	MOVQ	"".getList.len+64(SP), AX
	0x0225 00549 (xiaochen.go:30)	MOVQ	""..autotmp_27+80(SP), CX
	0x022a 00554 (xiaochen.go:30)	LEAQ	type.int(SB), DX
	0x0231 00561 (xiaochen.go:30)	JMP	369
	0x0236 00566 (xiaochen.go:28)	PCDATA	$1, $-1
	0x0236 00566 (xiaochen.go:28)	MOVQ	112(SP), BP
	0x023b 00571 (xiaochen.go:28)	ADDQ	$120, SP
	0x023f 00575 (xiaochen.go:28)	NOP
	0x0240 00576 (xiaochen.go:28)	RET
	0x0241 00577 (xiaochen.go:14)	PCDATA	$0, $-2
	0x0241 00577 (xiaochen.go:14)	LEAQ	24(AX), DI
	0x0245 00581 (xiaochen.go:14)	MOVQ	""..autotmp_26+104(SP), DX
	0x024a 00586 (xiaochen.go:14)	CALL	runtime.gcWriteBarrierDX(SB)
	0x024f 00591 (xiaochen.go:14)	JMP	341
	0x0254 00596 (xiaochen.go:14)	LEAQ	16(AX), DI
	0x0258 00600 (xiaochen.go:14)	MOVQ	"".buffer+96(SP), CX
	0x025d 00605 (xiaochen.go:14)	NOP
	0x0260 00608 (xiaochen.go:14)	CALL	runtime.gcWriteBarrierCX(SB)
	0x0265 00613 (xiaochen.go:14)	JMP	303
	0x026a 00618 (xiaochen.go:60)	LEAQ	32(AX), DI
	0x026e 00622 (xiaochen.go:60)	MOVQ	""..autotmp_26+104(SP), CX
	0x0273 00627 (xiaochen.go:60)	CALL	runtime.gcWriteBarrierCX(SB)
	0x0278 00632 (xiaochen.go:60)	JMP	175
	0x027d 00637 (xiaochen.go:30)	PCDATA	$0, $-1
	0x027d 00637 (xiaochen.go:30)	MOVQ	AX, (SP)
	0x0281 00641 (xiaochen.go:30)	MOVQ	DX, 8(SP)
	0x0286 00646 (xiaochen.go:30)	LEAQ	type.interface {}(SB), AX
	0x028d 00653 (xiaochen.go:30)	MOVQ	AX, 16(SP)
	0x0292 00658 (xiaochen.go:30)	PCDATA	$1, $0
	0x0292 00658 (xiaochen.go:30)	CALL	runtime.panicdottypeE(SB)
	0x0297 00663 (xiaochen.go:30)	XCHGL	AX, AX
	0x0298 00664 (xiaochen.go:30)	NOP
	0x0298 00664 (xiaochen.go:5)	PCDATA	$1, $-1
	0x0298 00664 (xiaochen.go:5)	PCDATA	$0, $-2
	0x0298 00664 (xiaochen.go:5)	CALL	runtime.morestack_noctxt(SB)
	0x029d 00669 (xiaochen.go:5)	PCDATA	$0, $-1
	0x029d 00669 (xiaochen.go:5)	NOP
	0x02a0 00672 (xiaochen.go:5)	JMP	0
	0x0000 64 48 8b 0c 25 00 00 00 00 48 3b 61 10 0f 86 85  dH..%....H;a....
	0x0010 02 00 00 48 83 ec 78 48 89 6c 24 70 48 8d 6c 24  ...H..xH.l$pH.l$
	0x0020 70 48 8d 05 00 00 00 00 48 89 04 24 48 c7 44 24  pH......H..$H.D$
	0x0030 08 2a 00 00 00 48 c7 44 24 10 2a 00 00 00 66 90  .*...H.D$.*...f.
	0x0040 e8 00 00 00 00 48 8b 44 24 18 48 89 44 24 68 48  .....H.D$.H.D$hH
	0x0050 8d 0d 00 00 00 00 48 89 0c 24 e8 00 00 00 00 48  ......H..$.....H
	0x0060 8b 44 24 08 48 89 44 24 60 48 c7 00 2a 00 00 00  .D$.H.D$`H..*...
	0x0070 48 c7 40 08 00 00 00 00 48 c7 40 10 00 e1 f5 05  H.@.....H.@.....
	0x0080 c6 40 18 00 48 c7 40 28 2a 00 00 00 48 c7 40 30  .@..H.@(*...H.@0
	0x0090 2a 00 00 00 83 3d 00 00 00 00 00 0f 1f 44 00 00  *....=.......D..
	0x00a0 0f 85 c4 01 00 00 48 8b 4c 24 68 48 89 48 20 48  ......H.L$hH.H H
	0x00b0 8d 05 00 00 00 00 48 89 04 24 48 c7 44 24 08 40  ......H..$H.D$.@
	0x00c0 42 0f 00 48 c7 44 24 10 40 42 0f 00 e8 00 00 00  B..H.D$.@B......
	0x00d0 00 48 8b 44 24 18 31 c9 eb 07 48 89 0c c8 48 ff  .H.D$.1...H...H.
	0x00e0 c1 48 81 f9 40 42 0f 00 7c f0 48 89 44 24 68 48  .H..@B..|.H.D$hH
	0x00f0 8d 05 00 00 00 00 48 89 04 24 e8 00 00 00 00 48  ......H..$.....H
	0x0100 8b 44 24 08 48 8d 0d 00 00 00 00 48 89 08 48 c7  .D$.H......H..H.
	0x0110 40 08 40 42 0f 00 83 3d 00 00 00 00 00 0f 1f 00  @.@B...=........
	0x0120 0f 85 2e 01 00 00 48 8b 4c 24 60 48 89 48 10 48  ......H.L$`H.H.H
	0x0130 c7 40 20 40 42 0f 00 48 c7 40 28 40 42 0f 00 83  .@ @B..H.@(@B...
	0x0140 3d 00 00 00 00 00 0f 85 f5 00 00 00 48 8b 54 24  =...........H.T$
	0x0150 68 48 89 50 18 c7 04 24 00 00 00 00 48 89 44 24  hH.P...$....H.D$
	0x0160 08 e8 00 00 00 00 31 c0 31 c9 48 8d 54 24 40 eb  ......1.1.H.T$@.
	0x0170 0d 48 89 0c c7 48 89 f0 48 89 d9 48 89 fa 48 89  .H...H..H..H..H.
	0x0180 44 24 48 48 89 4c 24 40 48 89 54 24 58 48 8b 5c  D$HH.L$@H.T$XH.\
	0x0190 24 60 48 89 1c 24 e8 00 00 00 00 48 8b 44 24 08  $`H..$.....H.D$.
	0x01a0 48 8b 4c 24 10 48 83 7c 24 08 00 0f 84 85 00 00  H.L$.H.|$.......
	0x01b0 00 48 8d 15 00 00 00 00 0f 1f 84 00 00 00 00 00  .H..............
	0x01c0 48 39 c2 0f 85 b4 00 00 00 48 8b 44 24 40 48 8d  H9.......H.D$@H.
	0x01d0 58 01 48 8b 09 48 8b 74 24 48 48 39 de 72 07 48  X.H..H.t$HH9.r.H
	0x01e0 8b 7c 24 58 eb 8b 48 89 4c 24 50 48 89 14 24 48  .|$X..H.L$PH..$H
	0x01f0 8b 4c 24 58 48 89 4c 24 08 48 89 44 24 10 48 89  .L$XH.L$.H.D$.H.
	0x0200 74 24 18 48 89 5c 24 20 e8 00 00 00 00 48 8b 7c  t$.H.\$ .....H.|
	0x0210 24 28 48 8b 44 24 30 48 8b 74 24 38 48 8d 58 01  $(H.D$0H.t$8H.X.
	0x0220 48 8b 44 24 40 48 8b 4c 24 50 48 8d 15 00 00 00  H.D$@H.L$PH.....
	0x0230 00 e9 3b ff ff ff 48 8b 6c 24 70 48 83 c4 78 90  ..;...H.l$pH..x.
	0x0240 c3 48 8d 78 18 48 8b 54 24 68 e8 00 00 00 00 e9  .H.x.H.T$h......
	0x0250 01 ff ff ff 48 8d 78 10 48 8b 4c 24 60 0f 1f 00  ....H.x.H.L$`...
	0x0260 e8 00 00 00 00 e9 c5 fe ff ff 48 8d 78 20 48 8b  ..........H.x H.
	0x0270 4c 24 68 e8 00 00 00 00 e9 32 fe ff ff 48 89 04  L$h......2...H..
	0x0280 24 48 89 54 24 08 48 8d 05 00 00 00 00 48 89 44  $H.T$.H......H.D
	0x0290 24 10 e8 00 00 00 00 90 e8 00 00 00 00 0f 1f 00  $...............
	0x02a0 e9 5b fd ff ff                                   .[...
	rel 5+4 t=17 TLS+0
	rel 36+4 t=16 type.interface {}+0
	rel 65+4 t=8 runtime.makeslice+0
	rel 82+4 t=16 type."".RingBuffer+0
	rel 91+4 t=8 runtime.newobject+0
	rel 150+4 t=16 runtime.writeBarrier+-1
	rel 178+4 t=16 type.int+0
	rel 205+4 t=8 runtime.makeslice+0
	rel 242+4 t=16 type.noalg.struct { F uintptr; "".count int; "".buffer *"".RingBuffer; "".putList []int }+0
	rel 251+4 t=8 runtime.newobject+0
	rel 263+4 t=16 "".main.func1+0
	rel 280+4 t=16 runtime.writeBarrier+-1
	rel 321+4 t=16 runtime.writeBarrier+-1
	rel 354+4 t=8 runtime.newproc+0
	rel 407+4 t=8 "".(*RingBuffer).Get+0
	rel 436+4 t=16 type.int+0
	rel 521+4 t=8 runtime.growslice+0
	rel 557+4 t=16 type.int+0
	rel 587+4 t=8 runtime.gcWriteBarrierDX+0
	rel 609+4 t=8 runtime.gcWriteBarrierCX+0
	rel 628+4 t=8 runtime.gcWriteBarrierCX+0
	rel 649+4 t=16 type.interface {}+0
	rel 659+4 t=8 runtime.panicdottypeE+0
	rel 665+4 t=8 runtime.morestack_noctxt+0
"".NewRingBuffer STEXT size=197 args=0x10 locals=0x30 funcid=0x0
	0x0000 00000 (xiaochen.go:54)	TEXT	"".NewRingBuffer(SB), ABIInternal, $48-16
	0x0000 00000 (xiaochen.go:54)	MOVQ	(TLS), CX
	0x0009 00009 (xiaochen.go:54)	CMPQ	SP, 16(CX)
	0x000d 00013 (xiaochen.go:54)	PCDATA	$0, $-2
	0x000d 00013 (xiaochen.go:54)	JLS	185
	0x0013 00019 (xiaochen.go:54)	PCDATA	$0, $-1
	0x0013 00019 (xiaochen.go:54)	SUBQ	$48, SP
	0x0017 00023 (xiaochen.go:54)	MOVQ	BP, 40(SP)
	0x001c 00028 (xiaochen.go:54)	LEAQ	40(SP), BP
	0x0021 00033 (xiaochen.go:54)	FUNCDATA	$0, gclocals·2589ca35330fc0fce83503f4569854a0(SB)
	0x0021 00033 (xiaochen.go:54)	FUNCDATA	$1, gclocals·9fb7f0986f647f17cb53dda1484e0f7a(SB)
	0x0021 00033 (xiaochen.go:60)	LEAQ	type.interface {}(SB), AX
	0x0028 00040 (xiaochen.go:60)	MOVQ	AX, (SP)
	0x002c 00044 (xiaochen.go:60)	MOVQ	"".size+56(SP), AX
	0x0031 00049 (xiaochen.go:60)	MOVQ	AX, 8(SP)
	0x0036 00054 (xiaochen.go:60)	MOVQ	AX, 16(SP)
	0x003b 00059 (xiaochen.go:60)	PCDATA	$1, $0
	0x003b 00059 (xiaochen.go:60)	NOP
	0x0040 00064 (xiaochen.go:60)	CALL	runtime.makeslice(SB)
	0x0045 00069 (xiaochen.go:60)	MOVQ	24(SP), AX
	0x004a 00074 (xiaochen.go:60)	MOVQ	AX, ""..autotmp_4+32(SP)
	0x004f 00079 (xiaochen.go:55)	LEAQ	type."".RingBuffer(SB), CX
	0x0056 00086 (xiaochen.go:55)	MOVQ	CX, (SP)
	0x005a 00090 (xiaochen.go:55)	PCDATA	$1, $1
	0x005a 00090 (xiaochen.go:55)	CALL	runtime.newobject(SB)
	0x005f 00095 (xiaochen.go:55)	MOVQ	8(SP), AX
	0x0064 00100 (xiaochen.go:56)	MOVQ	"".size+56(SP), CX
	0x0069 00105 (xiaochen.go:56)	MOVQ	CX, (AX)
	0x006c 00108 (xiaochen.go:57)	MOVQ	$0, 8(AX)
	0x0074 00116 (xiaochen.go:58)	MOVQ	$100000000, 16(AX)
	0x007c 00124 (xiaochen.go:59)	MOVB	$0, 24(AX)
	0x0080 00128 (xiaochen.go:60)	MOVQ	CX, 40(AX)
	0x0084 00132 (xiaochen.go:60)	MOVQ	CX, 48(AX)
	0x0088 00136 (xiaochen.go:60)	PCDATA	$0, $-2
	0x0088 00136 (xiaochen.go:60)	CMPL	runtime.writeBarrier(SB), $0
	0x008f 00143 (xiaochen.go:60)	JNE	169
	0x0091 00145 (xiaochen.go:60)	MOVQ	""..autotmp_4+32(SP), CX
	0x0096 00150 (xiaochen.go:60)	MOVQ	CX, 32(AX)
	0x009a 00154 (xiaochen.go:55)	PCDATA	$0, $-1
	0x009a 00154 (xiaochen.go:55)	MOVQ	AX, "".~r1+64(SP)
	0x009f 00159 (xiaochen.go:55)	MOVQ	40(SP), BP
	0x00a4 00164 (xiaochen.go:55)	ADDQ	$48, SP
	0x00a8 00168 (xiaochen.go:55)	RET
	0x00a9 00169 (xiaochen.go:60)	PCDATA	$0, $-2
	0x00a9 00169 (xiaochen.go:60)	LEAQ	32(AX), DI
	0x00ad 00173 (xiaochen.go:60)	MOVQ	""..autotmp_4+32(SP), CX
	0x00b2 00178 (xiaochen.go:60)	CALL	runtime.gcWriteBarrierCX(SB)
	0x00b7 00183 (xiaochen.go:60)	JMP	154
	0x00b9 00185 (xiaochen.go:60)	NOP
	0x00b9 00185 (xiaochen.go:54)	PCDATA	$1, $-1
	0x00b9 00185 (xiaochen.go:54)	PCDATA	$0, $-2
	0x00b9 00185 (xiaochen.go:54)	CALL	runtime.morestack_noctxt(SB)
	0x00be 00190 (xiaochen.go:54)	PCDATA	$0, $-1
	0x00be 00190 (xiaochen.go:54)	NOP
	0x00c0 00192 (xiaochen.go:54)	JMP	0
	0x0000 64 48 8b 0c 25 00 00 00 00 48 3b 61 10 0f 86 a6  dH..%....H;a....
	0x0010 00 00 00 48 83 ec 30 48 89 6c 24 28 48 8d 6c 24  ...H..0H.l$(H.l$
	0x0020 28 48 8d 05 00 00 00 00 48 89 04 24 48 8b 44 24  (H......H..$H.D$
	0x0030 38 48 89 44 24 08 48 89 44 24 10 0f 1f 44 00 00  8H.D$.H.D$...D..
	0x0040 e8 00 00 00 00 48 8b 44 24 18 48 89 44 24 20 48  .....H.D$.H.D$ H
	0x0050 8d 0d 00 00 00 00 48 89 0c 24 e8 00 00 00 00 48  ......H..$.....H
	0x0060 8b 44 24 08 48 8b 4c 24 38 48 89 08 48 c7 40 08  .D$.H.L$8H..H.@.
	0x0070 00 00 00 00 48 c7 40 10 00 e1 f5 05 c6 40 18 00  ....H.@......@..
	0x0080 48 89 48 28 48 89 48 30 83 3d 00 00 00 00 00 75  H.H(H.H0.=.....u
	0x0090 18 48 8b 4c 24 20 48 89 48 20 48 89 44 24 40 48  .H.L$ H.H H.D$@H
	0x00a0 8b 6c 24 28 48 83 c4 30 c3 48 8d 78 20 48 8b 4c  .l$(H..0.H.x H.L
	0x00b0 24 20 e8 00 00 00 00 eb e1 e8 00 00 00 00 66 90  $ ............f.
	0x00c0 e9 3b ff ff ff                                   .;...
	rel 5+4 t=17 TLS+0
	rel 36+4 t=16 type.interface {}+0
	rel 65+4 t=8 runtime.makeslice+0
	rel 82+4 t=16 type."".RingBuffer+0
	rel 91+4 t=8 runtime.newobject+0
	rel 138+4 t=16 runtime.writeBarrier+-1
	rel 179+4 t=8 runtime.gcWriteBarrierCX+0
	rel 186+4 t=8 runtime.morestack_noctxt+0
"".(*RingBuffer).SetEnd STEXT nosplit size=19 args=0x10 locals=0x0 funcid=0x0
	0x0000 00000 (xiaochen.go:64)	TEXT	"".(*RingBuffer).SetEnd(SB), NOSPLIT|ABIInternal, $0-16
	0x0000 00000 (xiaochen.go:64)	FUNCDATA	$0, gclocals·1a65e721a2ccc325b382662e7ffee780(SB)
	0x0000 00000 (xiaochen.go:64)	FUNCDATA	$1, gclocals·69c1753bd5f81501d95132d08af04464(SB)
	0x0000 00000 (xiaochen.go:65)	MOVQ	"".b+8(SP), AX
	0x0005 00005 (xiaochen.go:65)	MOVB	$1, 24(AX)
	0x0009 00009 (xiaochen.go:66)	MOVQ	"".id+16(SP), CX
	0x000e 00014 (xiaochen.go:66)	MOVQ	CX, 16(AX)
	0x0012 00018 (xiaochen.go:67)	RET
	0x0000 48 8b 44 24 08 c6 40 18 01 48 8b 4c 24 10 48 89  H.D$..@..H.L$.H.
	0x0010 48 10 c3                                         H..
"".(*RingBuffer).Put STEXT size=202 args=0x20 locals=0x18 funcid=0x0
	0x0000 00000 (xiaochen.go:69)	TEXT	"".(*RingBuffer).Put(SB), ABIInternal, $24-32
	0x0000 00000 (xiaochen.go:69)	MOVQ	(TLS), CX
	0x0009 00009 (xiaochen.go:69)	CMPQ	SP, 16(CX)
	0x000d 00013 (xiaochen.go:69)	PCDATA	$0, $-2
	0x000d 00013 (xiaochen.go:69)	JLS	192
	0x0013 00019 (xiaochen.go:69)	PCDATA	$0, $-1
	0x0013 00019 (xiaochen.go:69)	SUBQ	$24, SP
	0x0017 00023 (xiaochen.go:69)	MOVQ	BP, 16(SP)
	0x001c 00028 (xiaochen.go:69)	LEAQ	16(SP), BP
	0x0021 00033 (xiaochen.go:69)	FUNCDATA	$0, gclocals·385b9fcf304627fb2d5e79f269b14707(SB)
	0x0021 00033 (xiaochen.go:69)	FUNCDATA	$1, gclocals·69c1753bd5f81501d95132d08af04464(SB)
	0x0021 00033 (xiaochen.go:70)	JMP	51
	0x0023 00035 (xiaochen.go:71)	MOVQ	"".sleepDuration(SB), AX
	0x002a 00042 (xiaochen.go:71)	MOVQ	AX, (SP)
	0x002e 00046 (xiaochen.go:71)	PCDATA	$1, $0
	0x002e 00046 (xiaochen.go:71)	CALL	time.Sleep(SB)
	0x0033 00051 (xiaochen.go:70)	MOVQ	"".b+32(SP), DX
	0x0038 00056 (xiaochen.go:70)	MOVQ	8(DX), BX
	0x003c 00060 (xiaochen.go:70)	MOVQ	(DX), SI
	0x003f 00063 (xiaochen.go:70)	ADDQ	SI, BX
	0x0042 00066 (xiaochen.go:70)	MOVQ	"".e+40(SP), AX
	0x0047 00071 (xiaochen.go:70)	CMPQ	BX, AX
	0x004a 00074 (xiaochen.go:70)	JLE	35
	0x004c 00076 (xiaochen.go:73)	TESTQ	SI, SI
	0x004f 00079 (xiaochen.go:73)	JEQ	186
	0x0051 00081 (xiaochen.go:69)	MOVQ	DX, CX
	0x0054 00084 (xiaochen.go:73)	CMPQ	SI, $-1
	0x0058 00088 (xiaochen.go:73)	JEQ	98
	0x005a 00090 (xiaochen.go:73)	CQO
	0x005c 00092 (xiaochen.go:73)	IDIVQ	SI
	0x005f 00095 (xiaochen.go:73)	NOP
	0x0060 00096 (xiaochen.go:73)	JMP	103
	0x0062 00098 (xiaochen.go:73)	NEGQ	AX
	0x0065 00101 (xiaochen.go:73)	XORL	DX, DX
	0x0067 00103 (xiaochen.go:73)	MOVQ	32(CX), BX
	0x006b 00107 (xiaochen.go:73)	MOVQ	40(CX), CX
	0x006f 00111 (xiaochen.go:73)	CMPQ	CX, DX
	0x0072 00114 (xiaochen.go:73)	JLS	178
	0x0074 00116 (xiaochen.go:73)	SHLQ	$4, DX
	0x0078 00120 (xiaochen.go:73)	MOVQ	"".e+48(SP), AX
	0x007d 00125 (xiaochen.go:73)	MOVQ	AX, (BX)(DX*1)
	0x0081 00129 (xiaochen.go:73)	LEAQ	(BX)(DX*1), DI
	0x0085 00133 (xiaochen.go:73)	LEAQ	8(DI), DI
	0x0089 00137 (xiaochen.go:73)	PCDATA	$0, $-2
	0x0089 00137 (xiaochen.go:73)	CMPL	runtime.writeBarrier(SB), $0
	0x0090 00144 (xiaochen.go:73)	JNE	166
	0x0092 00146 (xiaochen.go:73)	MOVQ	"".e+56(SP), AX
	0x0097 00151 (xiaochen.go:73)	MOVQ	AX, 8(BX)(DX*1)
	0x009c 00156 (xiaochen.go:74)	PCDATA	$0, $-1
	0x009c 00156 (xiaochen.go:74)	PCDATA	$1, $-1
	0x009c 00156 (xiaochen.go:74)	MOVQ	16(SP), BP
	0x00a1 00161 (xiaochen.go:74)	ADDQ	$24, SP
	0x00a5 00165 (xiaochen.go:74)	RET
	0x00a6 00166 (xiaochen.go:73)	PCDATA	$0, $-2
	0x00a6 00166 (xiaochen.go:73)	MOVQ	"".e+56(SP), AX
	0x00ab 00171 (xiaochen.go:73)	CALL	runtime.gcWriteBarrier(SB)
	0x00b0 00176 (xiaochen.go:73)	JMP	156
	0x00b2 00178 (xiaochen.go:73)	PCDATA	$0, $-1
	0x00b2 00178 (xiaochen.go:73)	MOVQ	DX, AX
	0x00b5 00181 (xiaochen.go:73)	PCDATA	$1, $1
	0x00b5 00181 (xiaochen.go:73)	CALL	runtime.panicIndex(SB)
	0x00ba 00186 (xiaochen.go:73)	CALL	runtime.panicdivide(SB)
	0x00bf 00191 (xiaochen.go:73)	XCHGL	AX, AX
	0x00c0 00192 (xiaochen.go:73)	NOP
	0x00c0 00192 (xiaochen.go:69)	PCDATA	$1, $-1
	0x00c0 00192 (xiaochen.go:69)	PCDATA	$0, $-2
	0x00c0 00192 (xiaochen.go:69)	CALL	runtime.morestack_noctxt(SB)
	0x00c5 00197 (xiaochen.go:69)	PCDATA	$0, $-1
	0x00c5 00197 (xiaochen.go:69)	JMP	0
	0x0000 64 48 8b 0c 25 00 00 00 00 48 3b 61 10 0f 86 ad  dH..%....H;a....
	0x0010 00 00 00 48 83 ec 18 48 89 6c 24 10 48 8d 6c 24  ...H...H.l$.H.l$
	0x0020 10 eb 10 48 8b 05 00 00 00 00 48 89 04 24 e8 00  ...H......H..$..
	0x0030 00 00 00 48 8b 54 24 20 48 8b 5a 08 48 8b 32 48  ...H.T$ H.Z.H.2H
	0x0040 01 f3 48 8b 44 24 28 48 39 c3 7e d7 48 85 f6 74  ..H.D$(H9.~.H..t
	0x0050 69 48 89 d1 48 83 fe ff 74 08 48 99 48 f7 fe 90  iH..H...t.H.H...
	0x0060 eb 05 48 f7 d8 31 d2 48 8b 59 20 48 8b 49 28 48  ..H..1.H.Y H.I(H
	0x0070 39 d1 76 3e 48 c1 e2 04 48 8b 44 24 30 48 89 04  9.v>H...H.D$0H..
	0x0080 13 48 8d 3c 13 48 8d 7f 08 83 3d 00 00 00 00 00  .H.<.H....=.....
	0x0090 75 14 48 8b 44 24 38 48 89 44 13 08 48 8b 6c 24  u.H.D$8H.D..H.l$
	0x00a0 10 48 83 c4 18 c3 48 8b 44 24 38 e8 00 00 00 00  .H....H.D$8.....
	0x00b0 eb ea 48 89 d0 e8 00 00 00 00 e8 00 00 00 00 90  ..H.............
	0x00c0 e8 00 00 00 00 e9 36 ff ff ff                    ......6...
	rel 5+4 t=17 TLS+0
	rel 38+4 t=16 "".sleepDuration+0
	rel 47+4 t=8 time.Sleep+0
	rel 139+4 t=16 runtime.writeBarrier+-1
	rel 172+4 t=8 runtime.gcWriteBarrier+0
	rel 182+4 t=8 runtime.panicIndex+0
	rel 187+4 t=8 runtime.panicdivide+0
	rel 193+4 t=8 runtime.morestack_noctxt+0
"".(*RingBuffer).Get STEXT size=368 args=0x18 locals=0x28 funcid=0x0
	0x0000 00000 (xiaochen.go:77)	TEXT	"".(*RingBuffer).Get(SB), ABIInternal, $40-24
	0x0000 00000 (xiaochen.go:77)	MOVQ	(TLS), CX
	0x0009 00009 (xiaochen.go:77)	CMPQ	SP, 16(CX)
	0x000d 00013 (xiaochen.go:77)	PCDATA	$0, $-2
	0x000d 00013 (xiaochen.go:77)	JLS	358
	0x0013 00019 (xiaochen.go:77)	PCDATA	$0, $-1
	0x0013 00019 (xiaochen.go:77)	SUBQ	$40, SP
	0x0017 00023 (xiaochen.go:77)	MOVQ	BP, 32(SP)
	0x001c 00028 (xiaochen.go:77)	LEAQ	32(SP), BP
	0x0021 00033 (xiaochen.go:77)	FUNCDATA	$0, gclocals·e6397a44f8e1b6e77d0f200b4fba5269(SB)
	0x0021 00033 (xiaochen.go:77)	FUNCDATA	$1, gclocals·69c1753bd5f81501d95132d08af04464(SB)
	0x0021 00033 (xiaochen.go:78)	MOVQ	"".b+48(SP), DX
	0x0026 00038 (xiaochen.go:78)	CMPB	24(DX), $0  // 24: RingBuffer.end
	0x002a 00042 (xiaochen.go:78)	JEQ	58
	0x002c 00044 (xiaochen.go:78)	MOVQ	16(DX), BX  // 16 - 24: RingBuffer.endOffset
	0x0030 00048 (xiaochen.go:78)	CMPQ	8(DX), BX	// 8 - 16: RingBuffer.readOffset
	0x0034 00052 (xiaochen.go:78)	JEQ	296

	// 82: index := b.readOffset % b.mask
	0x003a 00058 (xiaochen.go:82)	MOVQ	8(DX), AX	// 8 - 16: RingBuffer.readOffset
	0x003e 00062 (xiaochen.go:82)	MOVQ	(DX), BX	// 0 - 8: RingBuffer.mask
	0x0041 00065 (xiaochen.go:82)	TESTQ	BX, BX		// 判断是否除0
	0x0044 00068 (xiaochen.go:82)	JEQ	352
	0x004a 00074 (xiaochen.go:77)	MOVQ	DX, CX
	0x004d 00077 (xiaochen.go:82)	CMPQ	BX, $-1
	0x0051 00081 (xiaochen.go:82)	JEQ	90
	0x0053 00083 (xiaochen.go:82)	CQO
	0x0055 00085 (xiaochen.go:82)	IDIVQ	BX
	0x0058 00088 (xiaochen.go:82)	JMP	95
	0x005a 00090 (xiaochen.go:82)	NEGQ	AX
	0x005d 00093 (xiaochen.go:82)	XORL	DX, DX

	// 83: v := b.list[index]
	0x005f 00095 (xiaochen.go:83)	MOVQ	32(CX), BX
	0x0063 00099 (xiaochen.go:83)	MOVQ	40(CX), SI	// SI: len(b.list)
	0x0067 00103 (xiaochen.go:83)	CMPQ	DX, SI	// DX: index
	0x006a 00106 (xiaochen.go:83)	JCC	336 		// 判断 index error
	0x0070 00112 (xiaochen.go:82)	MOVQ	DX, "".index+16(SP)
	0x0075 00117 (xiaochen.go:83)	MOVQ	DX, AX
	0x0078 00120 (xiaochen.go:83)	SHLQ	$4, DX
	0x007c 00124 (xiaochen.go:83)	MOVQ	DX, ""..autotmp_7+24(SP)
	0x0081 00129 (xiaochen.go:83)	MOVQ	(DX)(BX*1), SI
	0x0085 00133 (xiaochen.go:83)	MOVQ	8(DX)(BX*1), BX

	// 84: for v == nil {
	0x008a 00138 (xiaochen.go:84)	JMP	165

	// 86: v = b.list[index]
	0x008c 00140 (xiaochen.go:86)	MOVQ	""..autotmp_7+24(SP), DX
	0x0091 00145 (xiaochen.go:86)	MOVQ	(DX)(CX*1), SI
	0x0095 00149 (xiaochen.go:86)	MOVQ	8(DX)(CX*1), R8

	// 88: b.list[index] = nil
	0x009a 00154 (xiaochen.go:88)	MOVQ	BX, AX
	0x009d 00157 (xiaochen.go:88)	MOVQ	"".b+48(SP), CX

	// 84: for v == nil {
	0x00a2 00162 (xiaochen.go:84)	MOVQ	R8, BX
	0x00a5 00165 (xiaochen.go:84)	TESTQ	SI, SI
	0x00a8 00168 (xiaochen.go:84)	JNE	211

	0x00aa 00170 (xiaochen.go:85)	MOVQ	"".sleepDuration(SB), AX
	0x00b1 00177 (xiaochen.go:85)	MOVQ	AX, (SP)
	0x00b5 00181 (xiaochen.go:85)	PCDATA	$1, $0
	0x00b5 00181 (xiaochen.go:85)	CALL	time.Sleep(SB)

	// 86: v = b.list[index]
	0x00ba 00186 (xiaochen.go:86)	MOVQ	"".b+48(SP), AX
	0x00bf 00191 (xiaochen.go:86)	MOVQ	32(AX), CX
	0x00c3 00195 (xiaochen.go:86)	MOVQ	40(AX), DX
	0x00c7 00199 (xiaochen.go:86)	MOVQ	"".index+16(SP), BX
	0x00cc 00204 (xiaochen.go:86)	CMPQ	BX, DX
	0x00cf 00207 (xiaochen.go:86)	JCS	140
	0x00d1 00209 (xiaochen.go:86)	JMP	325

	0x00d3 00211 (xiaochen.go:88)	MOVQ	32(CX), R8
	0x00d7 00215 (xiaochen.go:88)	MOVQ	40(CX), R9
	0x00db 00219 (xiaochen.go:88)	NOP
	0x00e0 00224 (xiaochen.go:88)	CMPQ	AX, R9
	0x00e3 00227 (xiaochen.go:88)	JCC	314
	0x00e5 00229 (xiaochen.go:88)	MOVQ	$0, (R8)(DX*1)
	0x00ed 00237 (xiaochen.go:88)	LEAQ	(R8)(DX*1), DI
	0x00f1 00241 (xiaochen.go:88)	LEAQ	8(DI), DI
	0x00f5 00245 (xiaochen.go:88)	PCDATA	$0, $-2
	0x00f5 00245 (xiaochen.go:88)	CMPL	runtime.writeBarrier(SB), $0
	0x00fc 00252 (xiaochen.go:88)	JNE	287
	0x00fe 00254 (xiaochen.go:88)	MOVQ	$0, 8(R8)(DX*1)
	0x0107 00263 (xiaochen.go:89)	PCDATA	$0, $-1
	0x0107 00263 (xiaochen.go:89)	INCQ	8(CX)
	0x010b 00267 (xiaochen.go:90)	MOVQ	SI, "".~r0+56(SP)
	0x0110 00272 (xiaochen.go:90)	MOVQ	BX, "".~r0+64(SP)
	0x0115 00277 (xiaochen.go:90)	MOVQ	32(SP), BP
	0x011a 00282 (xiaochen.go:90)	ADDQ	$40, SP
	0x011e 00286 (xiaochen.go:90)	RET
	0x011f 00287 (xiaochen.go:88)	PCDATA	$0, $-2
	0x011f 00287 (xiaochen.go:88)	XORL	AX, AX
	0x0121 00289 (xiaochen.go:88)	CALL	runtime.gcWriteBarrier(SB)
	0x0126 00294 (xiaochen.go:88)	JMP	263
	0x0128 00296 (xiaochen.go:79)	PCDATA	$0, $-1
	0x0128 00296 (xiaochen.go:79)	XORPS	X0, X0
	0x012b 00299 (xiaochen.go:79)	MOVUPS	X0, "".~r0+56(SP)
	0x0130 00304 (xiaochen.go:79)	MOVQ	32(SP), BP
	0x0135 00309 (xiaochen.go:79)	ADDQ	$40, SP
	0x0139 00313 (xiaochen.go:79)	RET
	0x013a 00314 (xiaochen.go:88)	MOVQ	R9, CX
	0x013d 00317 (xiaochen.go:88)	PCDATA	$1, $1
	0x013d 00317 (xiaochen.go:88)	NOP
	0x0140 00320 (xiaochen.go:88)	CALL	runtime.panicIndex(SB)

	// 86: v = b.list[index]
	0x0145 00325 (xiaochen.go:86)	MOVQ	BX, AX
	0x0148 00328 (xiaochen.go:86)	MOVQ	DX, CX
	0x014b 00331 (xiaochen.go:86)	CALL	runtime.panicIndex(SB)

	// 83: v := b.list[index]
	0x0150 00336 (xiaochen.go:83)	MOVQ	DX, AX
	0x0153 00339 (xiaochen.go:83)	MOVQ	SI, CX
	0x0156 00342 (xiaochen.go:83)	CALL	runtime.panicIndex(SB)
	0x015b 00347 (xiaochen.go:83)	NOP

	0x0160 00352 (xiaochen.go:82)	CALL	runtime.panicdivide(SB)
	0x0165 00357 (xiaochen.go:82)	XCHGL	AX, AX
	0x0166 00358 (xiaochen.go:82)	NOP
	0x0166 00358 (xiaochen.go:77)	PCDATA	$1, $-1
	0x0166 00358 (xiaochen.go:77)	PCDATA	$0, $-2
	0x0166 00358 (xiaochen.go:77)	CALL	runtime.morestack_noctxt(SB)
	0x016b 00363 (xiaochen.go:77)	PCDATA	$0, $-1
	0x016b 00363 (xiaochen.go:77)	JMP	0
	0x0000 64 48 8b 0c 25 00 00 00 00 48 3b 61 10 0f 86 53  dH..%....H;a...S
	0x0010 01 00 00 48 83 ec 28 48 89 6c 24 20 48 8d 6c 24  ...H..(H.l$ H.l$
	0x0020 20 48 8b 54 24 30 80 7a 18 00 74 0e 48 8b 5a 10   H.T$0.z..t.H.Z.
	0x0030 48 39 5a 08 0f 84 ee 00 00 00 48 8b 42 08 48 8b  H9Z.......H.B.H.
	0x0040 1a 48 85 db 0f 84 16 01 00 00 48 89 d1 48 83 fb  .H........H..H..
	0x0050 ff 74 07 48 99 48 f7 fb eb 05 48 f7 d8 31 d2 48  .t.H.H....H..1.H
	0x0060 8b 59 20 48 8b 71 28 48 39 f2 0f 83 e0 00 00 00  .Y H.q(H9.......
	0x0070 48 89 54 24 10 48 89 d0 48 c1 e2 04 48 89 54 24  H.T$.H..H...H.T$
	0x0080 18 48 8b 34 1a 48 8b 5c 1a 08 eb 19 48 8b 54 24  .H.4.H.\....H.T$
	0x0090 18 48 8b 34 0a 4c 8b 44 0a 08 48 89 d8 48 8b 4c  .H.4.L.D..H..H.L
	0x00a0 24 30 4c 89 c3 48 85 f6 75 29 48 8b 05 00 00 00  $0L..H..u)H.....
	0x00b0 00 48 89 04 24 e8 00 00 00 00 48 8b 44 24 30 48  .H..$.....H.D$0H
	0x00c0 8b 48 20 48 8b 50 28 48 8b 5c 24 10 48 39 d3 72  .H H.P(H.\$.H9.r
	0x00d0 bb eb 72 4c 8b 41 20 4c 8b 49 28 0f 1f 44 00 00  ..rL.A L.I(..D..
	0x00e0 4c 39 c8 73 55 49 c7 04 10 00 00 00 00 49 8d 3c  L9.sUI.......I.<
	0x00f0 10 48 8d 7f 08 83 3d 00 00 00 00 00 75 21 49 c7  .H....=.....u!I.
	0x0100 44 10 08 00 00 00 00 48 ff 41 08 48 89 74 24 38  D......H.A.H.t$8
	0x0110 48 89 5c 24 40 48 8b 6c 24 20 48 83 c4 28 c3 31  H.\$@H.l$ H..(.1
	0x0120 c0 e8 00 00 00 00 eb df 0f 57 c0 0f 11 44 24 38  .........W...D$8
	0x0130 48 8b 6c 24 20 48 83 c4 28 c3 4c 89 c9 0f 1f 00  H.l$ H..(.L.....
	0x0140 e8 00 00 00 00 48 89 d8 48 89 d1 e8 00 00 00 00  .....H..H.......
	0x0150 48 89 d0 48 89 f1 e8 00 00 00 00 0f 1f 44 00 00  H..H.........D..
	0x0160 e8 00 00 00 00 90 e8 00 00 00 00 e9 90 fe ff ff  ................
	rel 5+4 t=17 TLS+0
	rel 173+4 t=16 "".sleepDuration+0
	rel 182+4 t=8 time.Sleep+0
	rel 247+4 t=16 runtime.writeBarrier+-1
	rel 290+4 t=8 runtime.gcWriteBarrier+0
	rel 321+4 t=8 runtime.panicIndex+0
	rel 332+4 t=8 runtime.panicIndex+0
	rel 343+4 t=8 runtime.panicIndex+0
	rel 353+4 t=8 runtime.panicdivide+0
	rel 359+4 t=8 runtime.morestack_noctxt+0
"".(*RingBuffer).Clear STEXT size=85 args=0x8 locals=0x8 funcid=0x0
	0x0000 00000 (xiaochen.go:93)	TEXT	"".(*RingBuffer).Clear(SB), ABIInternal, $8-8
	0x0000 00000 (xiaochen.go:93)	MOVQ	(TLS), CX
	0x0009 00009 (xiaochen.go:93)	CMPQ	SP, 16(CX)
	0x000d 00013 (xiaochen.go:93)	PCDATA	$0, $-2
	0x000d 00013 (xiaochen.go:93)	JLS	78
	0x000f 00015 (xiaochen.go:93)	PCDATA	$0, $-1
	0x000f 00015 (xiaochen.go:93)	SUBQ	$8, SP
	0x0013 00019 (xiaochen.go:93)	MOVQ	BP, (SP)
	0x0017 00023 (xiaochen.go:93)	LEAQ	(SP), BP
	0x001b 00027 (xiaochen.go:93)	FUNCDATA	$0, gclocals·1a65e721a2ccc325b382662e7ffee780(SB)
	0x001b 00027 (xiaochen.go:93)	FUNCDATA	$1, gclocals·69c1753bd5f81501d95132d08af04464(SB)
	0x001b 00027 (xiaochen.go:94)	XORPS	X0, X0
	0x001e 00030 (xiaochen.go:94)	MOVQ	"".b+16(SP), AX
	0x0023 00035 (xiaochen.go:94)	MOVUPS	X0, 40(AX)
	0x0027 00039 (xiaochen.go:94)	PCDATA	$0, $-2
	0x0027 00039 (xiaochen.go:94)	CMPL	runtime.writeBarrier(SB), $0
	0x002e 00046 (xiaochen.go:94)	JNE	65
	0x0030 00048 (xiaochen.go:94)	MOVQ	$0, 32(AX)
	0x0038 00056 (xiaochen.go:95)	PCDATA	$0, $-1
	0x0038 00056 (xiaochen.go:95)	MOVQ	(SP), BP
	0x003c 00060 (xiaochen.go:95)	ADDQ	$8, SP
	0x0040 00064 (xiaochen.go:95)	RET
	0x0041 00065 (xiaochen.go:94)	PCDATA	$0, $-2
	0x0041 00065 (xiaochen.go:94)	LEAQ	32(AX), DI
	0x0045 00069 (xiaochen.go:94)	XORL	AX, AX
	0x0047 00071 (xiaochen.go:94)	CALL	runtime.gcWriteBarrier(SB)
	0x004c 00076 (xiaochen.go:94)	JMP	56
	0x004e 00078 (xiaochen.go:94)	NOP
	0x004e 00078 (xiaochen.go:93)	PCDATA	$1, $-1
	0x004e 00078 (xiaochen.go:93)	PCDATA	$0, $-2
	0x004e 00078 (xiaochen.go:93)	CALL	runtime.morestack_noctxt(SB)
	0x0053 00083 (xiaochen.go:93)	PCDATA	$0, $-1
	0x0053 00083 (xiaochen.go:93)	JMP	0
	0x0000 64 48 8b 0c 25 00 00 00 00 48 3b 61 10 76 3f 48  dH..%....H;a.v?H
	0x0010 83 ec 08 48 89 2c 24 48 8d 2c 24 0f 57 c0 48 8b  ...H.,$H.,$.W.H.
	0x0020 44 24 10 0f 11 40 28 83 3d 00 00 00 00 00 75 11  D$...@(.=.....u.
	0x0030 48 c7 40 20 00 00 00 00 48 8b 2c 24 48 83 c4 08  H.@ ....H.,$H...
	0x0040 c3 48 8d 78 20 31 c0 e8 00 00 00 00 eb ea e8 00  .H.x 1..........
	0x0050 00 00 00 eb ab                                   .....
	rel 5+4 t=17 TLS+0
	rel 41+4 t=16 runtime.writeBarrier+-1
	rel 72+4 t=8 runtime.gcWriteBarrier+0
	rel 79+4 t=8 runtime.morestack_noctxt+0
"".main.func1 STEXT size=314 args=0x0 locals=0x40 funcid=0x0
	0x0000 00000 (xiaochen.go:14)	TEXT	"".main.func1(SB), NEEDCTXT|ABIInternal, $64-0
	0x0000 00000 (xiaochen.go:14)	MOVQ	(TLS), CX
	0x0009 00009 (xiaochen.go:14)	CMPQ	SP, 16(CX)
	0x000d 00013 (xiaochen.go:14)	PCDATA	$0, $-2
	0x000d 00013 (xiaochen.go:14)	JLS	304
	0x0013 00019 (xiaochen.go:14)	PCDATA	$0, $-1
	0x0013 00019 (xiaochen.go:14)	SUBQ	$64, SP
	0x0017 00023 (xiaochen.go:14)	MOVQ	BP, 56(SP)
	0x001c 00028 (xiaochen.go:14)	LEAQ	56(SP), BP
	0x0021 00033 (xiaochen.go:14)	FUNCDATA	$0, gclocals·7d2d5fca80364273fb07d5820a76fef4(SB)
	0x0021 00033 (xiaochen.go:14)	FUNCDATA	$1, gclocals·7e8800bf6619568fc5e6cdb20ca960ed(SB)
	0x0021 00033 (<unknown line number>)	MOVQ	DX, ""..autotmp_16+48(SP)
	0x0026 00038 (xiaochen.go:14)	MOVQ	16(DX), BX
	0x002a 00042 (xiaochen.go:14)	MOVQ	BX, "".b+32(SP)
	0x002f 00047 (xiaochen.go:14)	MOVQ	8(DX), SI
	0x0033 00051 (xiaochen.go:14)	MOVQ	SI, "".id+16(SP)
	0x0038 00056 (xiaochen.go:15)	XORL	AX, AX
	0x003a 00058 (xiaochen.go:15)	JMP	200
	0x003f 00063 (xiaochen.go:71)	MOVQ	"".sleepDuration(SB), AX
	0x0046 00070 (xiaochen.go:71)	MOVQ	AX, (SP)
	0x004a 00074 (xiaochen.go:71)	PCDATA	$1, $1
	0x004a 00074 (xiaochen.go:71)	CALL	time.Sleep(SB)
	0x004f 00079 (xiaochen.go:73)	MOVQ	""..autotmp_17+40(SP), AX
	0x0054 00084 (xiaochen.go:70)	MOVQ	"".b+32(SP), DX
	0x0059 00089 (xiaochen.go:70)	MOVQ	8(DX), BX
	0x005d 00093 (xiaochen.go:70)	MOVQ	(DX), SI
	0x0060 00096 (xiaochen.go:70)	ADDQ	SI, BX
	0x0063 00099 (xiaochen.go:70)	MOVQ	"".i+24(SP), R8
	0x0068 00104 (xiaochen.go:70)	CMPQ	R8, BX
	0x006b 00107 (xiaochen.go:70)	JGE	63
	0x006d 00109 (xiaochen.go:73)	TESTQ	SI, SI
	0x0070 00112 (xiaochen.go:73)	JEQ	293
	0x0076 00118 (xiaochen.go:18)	MOVQ	AX, CX
	0x0079 00121 (xiaochen.go:73)	MOVQ	R8, AX
	0x007c 00124 (xiaochen.go:14)	MOVQ	DX, BX
	0x007f 00127 (xiaochen.go:73)	CQO
	0x0081 00129 (xiaochen.go:73)	IDIVQ	SI
	0x0084 00132 (xiaochen.go:73)	MOVQ	32(BX), SI
	0x0088 00136 (xiaochen.go:73)	MOVQ	40(BX), R9
	0x008c 00140 (xiaochen.go:73)	CMPQ	R9, DX
	0x008f 00143 (xiaochen.go:73)	JLS	281
	0x0095 00149 (xiaochen.go:73)	SHLQ	$4, DX
	0x0099 00153 (xiaochen.go:73)	LEAQ	type.int(SB), R9
	0x00a0 00160 (xiaochen.go:73)	MOVQ	R9, (SI)(DX*1)
	0x00a4 00164 (xiaochen.go:73)	LEAQ	(SI)(DX*1), DI
	0x00a8 00168 (xiaochen.go:73)	LEAQ	8(DI), DI
	0x00ac 00172 (xiaochen.go:73)	PCDATA	$0, $-2
	0x00ac 00172 (xiaochen.go:73)	CMPL	runtime.writeBarrier(SB), $0
	0x00b3 00179 (xiaochen.go:73)	JNE	252
	0x00b5 00181 (xiaochen.go:73)	MOVQ	CX, 8(SI)(DX*1)
	0x00ba 00186 (xiaochen.go:15)	PCDATA	$0, $-1
	0x00ba 00186 (xiaochen.go:15)	LEAQ	1(R8), AX
	0x00be 00190 (xiaochen.go:15)	MOVQ	"".id+16(SP), SI
	0x00c3 00195 (xiaochen.go:15)	MOVQ	""..autotmp_16+48(SP), DX
	0x00c8 00200 (xiaochen.go:15)	CMPQ	SI, AX
	0x00cb 00203 (xiaochen.go:15)	JLE	263
	0x00cd 00205 (xiaochen.go:18)	MOVQ	32(DX), CX
	0x00d1 00209 (xiaochen.go:18)	MOVQ	24(DX), DI
	0x00d5 00213 (xiaochen.go:18)	CMPQ	AX, CX
	0x00d8 00216 (xiaochen.go:18)	JCC	298
	0x00da 00218 (xiaochen.go:15)	MOVQ	AX, "".i+24(SP)
	0x00df 00223 (xiaochen.go:18)	MOVQ	(DI)(AX*8), CX
	0x00e3 00227 (xiaochen.go:18)	MOVQ	CX, (SP)
	0x00e7 00231 (xiaochen.go:18)	PCDATA	$1, $2
	0x00e7 00231 (xiaochen.go:18)	CALL	runtime.convT64(SB)
	0x00ec 00236 (xiaochen.go:16)	XCHGL	AX, AX
	0x00ed 00237 (xiaochen.go:18)	MOVQ	8(SP), AX
	0x00f2 00242 (xiaochen.go:18)	MOVQ	AX, ""..autotmp_17+40(SP)
	0x00f7 00247 (xiaochen.go:70)	JMP	84
	0x00fc 00252 (xiaochen.go:73)	PCDATA	$0, $-2
	0x00fc 00252 (xiaochen.go:73)	NOP
	0x0100 00256 (xiaochen.go:73)	CALL	runtime.gcWriteBarrierCX(SB)
	0x0105 00261 (xiaochen.go:73)	JMP	186
	0x0107 00263 (xiaochen.go:21)	PCDATA	$0, $-1
	0x0107 00263 (xiaochen.go:21)	PCDATA	$1, $-1
	0x0107 00263 (<unknown line number>)	NOP
	0x0107 00263 (xiaochen.go:65)	MOVB	$1, 24(BX)
	0x010b 00267 (xiaochen.go:66)	MOVQ	SI, 16(BX)
	0x010f 00271 (xiaochen.go:21)	MOVQ	56(SP), BP
	0x0114 00276 (xiaochen.go:21)	ADDQ	$64, SP
	0x0118 00280 (xiaochen.go:21)	RET
	0x0119 00281 (xiaochen.go:73)	MOVQ	DX, AX
	0x011c 00284 (xiaochen.go:73)	MOVQ	R9, CX
	0x011f 00287 (xiaochen.go:73)	PCDATA	$1, $0
	0x011f 00287 (xiaochen.go:73)	NOP
	0x0120 00288 (xiaochen.go:73)	CALL	runtime.panicIndex(SB)
	0x0125 00293 (xiaochen.go:73)	CALL	runtime.panicdivide(SB)
	0x012a 00298 (xiaochen.go:18)	CALL	runtime.panicIndex(SB)
	0x012f 00303 (xiaochen.go:18)	XCHGL	AX, AX
	0x0130 00304 (xiaochen.go:18)	NOP
	0x0130 00304 (xiaochen.go:14)	PCDATA	$1, $-1
	0x0130 00304 (xiaochen.go:14)	PCDATA	$0, $-2
	0x0130 00304 (xiaochen.go:14)	CALL	runtime.morestack(SB)
	0x0135 00309 (xiaochen.go:14)	PCDATA	$0, $-1
	0x0135 00309 (xiaochen.go:14)	JMP	0
	0x0000 64 48 8b 0c 25 00 00 00 00 48 3b 61 10 0f 86 1d  dH..%....H;a....
	0x0010 01 00 00 48 83 ec 40 48 89 6c 24 38 48 8d 6c 24  ...H..@H.l$8H.l$
	0x0020 38 48 89 54 24 30 48 8b 5a 10 48 89 5c 24 20 48  8H.T$0H.Z.H.\$ H
	0x0030 8b 72 08 48 89 74 24 10 31 c0 e9 89 00 00 00 48  .r.H.t$.1......H
	0x0040 8b 05 00 00 00 00 48 89 04 24 e8 00 00 00 00 48  ......H..$.....H
	0x0050 8b 44 24 28 48 8b 54 24 20 48 8b 5a 08 48 8b 32  .D$(H.T$ H.Z.H.2
	0x0060 48 01 f3 4c 8b 44 24 18 49 39 d8 7d d2 48 85 f6  H..L.D$.I9.}.H..
	0x0070 0f 84 af 00 00 00 48 89 c1 4c 89 c0 48 89 d3 48  ......H..L..H..H
	0x0080 99 48 f7 fe 48 8b 73 20 4c 8b 4b 28 49 39 d1 0f  .H..H.s L.K(I9..
	0x0090 86 84 00 00 00 48 c1 e2 04 4c 8d 0d 00 00 00 00  .....H...L......
	0x00a0 4c 89 0c 16 48 8d 3c 16 48 8d 7f 08 83 3d 00 00  L...H.<.H....=..
	0x00b0 00 00 00 75 47 48 89 4c 16 08 49 8d 40 01 48 8b  ...uGH.L..I.@.H.
	0x00c0 74 24 10 48 8b 54 24 30 48 39 c6 7e 3a 48 8b 4a  t$.H.T$0H9.~:H.J
	0x00d0 20 48 8b 7a 18 48 39 c8 73 50 48 89 44 24 18 48   H.z.H9.sPH.D$.H
	0x00e0 8b 0c c7 48 89 0c 24 e8 00 00 00 00 90 48 8b 44  ...H..$......H.D
	0x00f0 24 08 48 89 44 24 28 e9 58 ff ff ff 0f 1f 40 00  $.H.D$(.X.....@.
	0x0100 e8 00 00 00 00 eb b3 c6 43 18 01 48 89 73 10 48  ........C..H.s.H
	0x0110 8b 6c 24 38 48 83 c4 40 c3 48 89 d0 4c 89 c9 90  .l$8H..@.H..L...
	0x0120 e8 00 00 00 00 e8 00 00 00 00 e8 00 00 00 00 90  ................
	0x0130 e8 00 00 00 00 e9 c6 fe ff ff                    ..........
	rel 3+0 t=25 type.int+0
	rel 5+4 t=17 TLS+0
	rel 66+4 t=16 "".sleepDuration+0
	rel 75+4 t=8 time.Sleep+0
	rel 156+4 t=16 type.int+0
	rel 174+4 t=16 runtime.writeBarrier+-1
	rel 232+4 t=8 runtime.convT64+0
	rel 257+4 t=8 runtime.gcWriteBarrierCX+0
	rel 289+4 t=8 runtime.panicIndex+0
	rel 294+4 t=8 runtime.panicdivide+0
	rel 299+4 t=8 runtime.panicIndex+0
	rel 305+4 t=8 runtime.morestack+0
type..eq."".Entity STEXT dupok size=123 args=0x18 locals=0x28 funcid=0x0
	0x0000 00000 (<autogenerated>:1)	TEXT	type..eq."".Entity(SB), DUPOK|ABIInternal, $40-24
	0x0000 00000 (<autogenerated>:1)	MOVQ	(TLS), CX
	0x0009 00009 (<autogenerated>:1)	CMPQ	SP, 16(CX)
	0x000d 00013 (<autogenerated>:1)	PCDATA	$0, $-2
	0x000d 00013 (<autogenerated>:1)	JLS	116
	0x000f 00015 (<autogenerated>:1)	PCDATA	$0, $-1
	0x000f 00015 (<autogenerated>:1)	SUBQ	$40, SP
	0x0013 00019 (<autogenerated>:1)	MOVQ	BP, 32(SP)
	0x0018 00024 (<autogenerated>:1)	LEAQ	32(SP), BP
	0x001d 00029 (<autogenerated>:1)	FUNCDATA	$0, gclocals·dc9b0298814590ca3ffc3a889546fc8b(SB)
	0x001d 00029 (<autogenerated>:1)	FUNCDATA	$1, gclocals·69c1753bd5f81501d95132d08af04464(SB)
	0x001d 00029 (<autogenerated>:1)	MOVQ	"".q+56(SP), AX
	0x0022 00034 (<autogenerated>:1)	MOVQ	(AX), CX
	0x0025 00037 (<autogenerated>:1)	MOVQ	"".p+48(SP), DX
	0x002a 00042 (<autogenerated>:1)	CMPQ	(DX), CX
	0x002d 00045 (<autogenerated>:1)	JNE	112
	0x002f 00047 (<autogenerated>:1)	MOVQ	8(DX), CX
	0x0033 00051 (<autogenerated>:1)	MOVQ	16(DX), DX
	0x0037 00055 (<autogenerated>:1)	MOVQ	16(AX), BX
	0x003b 00059 (<autogenerated>:1)	NOP
	0x0040 00064 (<autogenerated>:1)	CMPQ	8(AX), CX
	0x0044 00068 (<autogenerated>:1)	JEQ	86
	0x0046 00070 (<autogenerated>:1)	XORL	AX, AX
	0x0048 00072 (<autogenerated>:1)	MOVB	AL, "".r+64(SP)
	0x004c 00076 (<autogenerated>:1)	MOVQ	32(SP), BP
	0x0051 00081 (<autogenerated>:1)	ADDQ	$40, SP
	0x0055 00085 (<autogenerated>:1)	RET
	0x0056 00086 (<autogenerated>:1)	MOVQ	CX, (SP)
	0x005a 00090 (<autogenerated>:1)	MOVQ	DX, 8(SP)
	0x005f 00095 (<autogenerated>:1)	MOVQ	BX, 16(SP)
	0x0064 00100 (<autogenerated>:1)	PCDATA	$1, $1
	0x0064 00100 (<autogenerated>:1)	CALL	runtime.efaceeq(SB)
	0x0069 00105 (<autogenerated>:1)	MOVBLZX	24(SP), AX
	0x006e 00110 (<autogenerated>:1)	JMP	72
	0x0070 00112 (<autogenerated>:1)	XORL	AX, AX
	0x0072 00114 (<autogenerated>:1)	JMP	72
	0x0074 00116 (<autogenerated>:1)	NOP
	0x0074 00116 (<autogenerated>:1)	PCDATA	$1, $-1
	0x0074 00116 (<autogenerated>:1)	PCDATA	$0, $-2
	0x0074 00116 (<autogenerated>:1)	CALL	runtime.morestack_noctxt(SB)
	0x0079 00121 (<autogenerated>:1)	PCDATA	$0, $-1
	0x0079 00121 (<autogenerated>:1)	JMP	0
	0x0000 64 48 8b 0c 25 00 00 00 00 48 3b 61 10 76 65 48  dH..%....H;a.veH
	0x0010 83 ec 28 48 89 6c 24 20 48 8d 6c 24 20 48 8b 44  ..(H.l$ H.l$ H.D
	0x0020 24 38 48 8b 08 48 8b 54 24 30 48 39 0a 75 41 48  $8H..H.T$0H9.uAH
	0x0030 8b 4a 08 48 8b 52 10 48 8b 58 10 0f 1f 44 00 00  .J.H.R.H.X...D..
	0x0040 48 39 48 08 74 10 31 c0 88 44 24 40 48 8b 6c 24  H9H.t.1..D$@H.l$
	0x0050 20 48 83 c4 28 c3 48 89 0c 24 48 89 54 24 08 48   H..(.H..$H.T$.H
	0x0060 89 5c 24 10 e8 00 00 00 00 0f b6 44 24 18 eb d8  .\$........D$...
	0x0070 31 c0 eb d4 e8 00 00 00 00 eb 85                 1..........
	rel 5+4 t=17 TLS+0
	rel 101+4 t=8 runtime.efaceeq+0
	rel 117+4 t=8 runtime.morestack_noctxt+0
go.cuinfo.packagename. SDWARFCUINFO dupok size=0
	0x0000 6d 61 69 6e                                      main
""..inittask SNOPTRDATA size=32
	0x0000 00 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00  ................
	0x0010 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	rel 24+8 t=1 time..inittask+0
go.info."".NewRingBuffer$abstract SDWARFABSFCN dupok size=30
	0x0000 04 2e 4e 65 77 52 69 6e 67 42 75 66 66 65 72 00  ..NewRingBuffer.
	0x0010 01 01 11 73 69 7a 65 00 00 00 00 00 00 00        ...size.......
	rel 0+0 t=24 type.*"".RingBuffer+0
	rel 0+0 t=24 type.int+0
	rel 25+4 t=31 go.info.int+0
go.info."".(*RingBuffer).Put$abstract SDWARFABSFCN dupok size=39
	0x0000 04 2e 28 2a 52 69 6e 67 42 75 66 66 65 72 29 2e  ..(*RingBuffer).
	0x0010 50 75 74 00 01 01 11 62 00 00 00 00 00 00 11 65  Put....b.......e
	0x0020 00 00 00 00 00 00 00                             .......
	rel 0+0 t=24 type."".Entity+0
	rel 0+0 t=24 type.*"".RingBuffer+0
	rel 26+4 t=31 go.info.*"".RingBuffer+0
	rel 34+4 t=31 go.info."".Entity+0
go.info."".(*RingBuffer).SetEnd$abstract SDWARFABSFCN dupok size=43
	0x0000 04 2e 28 2a 52 69 6e 67 42 75 66 66 65 72 29 2e  ..(*RingBuffer).
	0x0010 53 65 74 45 6e 64 00 01 01 11 62 00 00 00 00 00  SetEnd....b.....
	0x0020 00 11 69 64 00 00 00 00 00 00 00                 ..id.......
	rel 0+0 t=24 type.*"".RingBuffer+0
	rel 0+0 t=24 type.int+0
	rel 29+4 t=31 go.info.*"".RingBuffer+0
	rel 38+4 t=31 go.info.int+0
"".sleepDuration SNOPTRDATA size=8
	0x0000 e8 03 00 00 00 00 00 00                          ........
runtime.nilinterequal·f SRODATA dupok size=8
	0x0000 00 00 00 00 00 00 00 00                          ........
	rel 0+8 t=1 runtime.nilinterequal+0
runtime.memequal64·f SRODATA dupok size=8
	0x0000 00 00 00 00 00 00 00 00                          ........
	rel 0+8 t=1 runtime.memequal64+0
runtime.gcbits.01 SRODATA dupok size=1
	0x0000 01                                               .
type..namedata.*interface {}- SRODATA dupok size=16
	0x0000 00 00 0d 2a 69 6e 74 65 72 66 61 63 65 20 7b 7d  ...*interface {}
type.*interface {} SRODATA dupok size=56
	0x0000 08 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0010 4f 0f 96 9d 08 08 08 36 00 00 00 00 00 00 00 00  O......6........
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00                          ........
	rel 24+8 t=1 runtime.memequal64·f+0
	rel 32+8 t=1 runtime.gcbits.01+0
	rel 40+4 t=5 type..namedata.*interface {}-+0
	rel 48+8 t=1 type.interface {}+0
runtime.gcbits.02 SRODATA dupok size=1
	0x0000 02                                               .
type.interface {} SRODATA dupok size=80
	0x0000 10 00 00 00 00 00 00 00 10 00 00 00 00 00 00 00  ................
	0x0010 e7 57 a0 18 02 08 08 14 00 00 00 00 00 00 00 00  .W..............
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0040 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	rel 24+8 t=1 runtime.nilinterequal·f+0
	rel 32+8 t=1 runtime.gcbits.02+0
	rel 40+4 t=5 type..namedata.*interface {}-+0
	rel 44+4 t=6 type.*interface {}+0
	rel 56+8 t=1 type.interface {}+80
type..eqfunc."".Entity SRODATA dupok size=8
	0x0000 00 00 00 00 00 00 00 00                          ........
	rel 0+8 t=1 type..eq."".Entity+0
type..namedata.*main.Entity. SRODATA dupok size=15
	0x0000 01 00 0c 2a 6d 61 69 6e 2e 45 6e 74 69 74 79     ...*main.Entity
type.*"".Entity SRODATA size=56
	0x0000 08 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0010 a5 ed fb 08 08 08 08 36 00 00 00 00 00 00 00 00  .......6........
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00                          ........
	rel 24+8 t=1 runtime.memequal64·f+0
	rel 32+8 t=1 runtime.gcbits.01+0
	rel 40+4 t=5 type..namedata.*main.Entity.+0
	rel 48+8 t=1 type."".Entity+0
runtime.gcbits.04 SRODATA dupok size=1
	0x0000 04                                               .
type..namedata.ID. SRODATA dupok size=5
	0x0000 01 00 02 49 44                                   ...ID
type..namedata.V. SRODATA dupok size=4
	0x0000 01 00 01 56                                      ...V
type."".Entity SRODATA size=144
	0x0000 18 00 00 00 00 00 00 00 18 00 00 00 00 00 00 00  ................
	0x0010 25 86 cd ae 07 08 08 19 00 00 00 00 00 00 00 00  %...............
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0040 02 00 00 00 00 00 00 00 02 00 00 00 00 00 00 00  ................
	0x0050 00 00 00 00 00 00 00 00 40 00 00 00 00 00 00 00  ........@.......
	0x0060 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0070 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0080 00 00 00 00 00 00 00 00 10 00 00 00 00 00 00 00  ................
	rel 24+8 t=1 type..eqfunc."".Entity+0
	rel 32+8 t=1 runtime.gcbits.04+0
	rel 40+4 t=5 type..namedata.*main.Entity.+0
	rel 44+4 t=5 type.*"".Entity+0
	rel 56+8 t=1 type."".Entity+96
	rel 80+4 t=5 type..importpath."".+0
	rel 96+8 t=1 type..namedata.ID.+0
	rel 104+8 t=1 type.int+0
	rel 120+8 t=1 type..namedata.V.+0
	rel 128+8 t=1 type.interface {}+0
type..namedata.*[]interface {}- SRODATA dupok size=18
	0x0000 00 00 0f 2a 5b 5d 69 6e 74 65 72 66 61 63 65 20  ...*[]interface 
	0x0010 7b 7d                                            {}
type.*[]interface {} SRODATA dupok size=56
	0x0000 08 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0010 f3 04 9a e7 08 08 08 36 00 00 00 00 00 00 00 00  .......6........
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00                          ........
	rel 24+8 t=1 runtime.memequal64·f+0
	rel 32+8 t=1 runtime.gcbits.01+0
	rel 40+4 t=5 type..namedata.*[]interface {}-+0
	rel 48+8 t=1 type.[]interface {}+0
type.[]interface {} SRODATA dupok size=56
	0x0000 18 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0010 70 93 ea 2f 02 08 08 17 00 00 00 00 00 00 00 00  p../............
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00                          ........
	rel 32+8 t=1 runtime.gcbits.01+0
	rel 40+4 t=5 type..namedata.*[]interface {}-+0
	rel 44+4 t=6 type.*[]interface {}+0
	rel 48+8 t=1 type.interface {}+0
type..namedata.*main.RingBuffer. SRODATA dupok size=19
	0x0000 01 00 10 2a 6d 61 69 6e 2e 52 69 6e 67 42 75 66  ...*main.RingBuf
	0x0010 66 65 72                                         fer
type..namedata.*func(*main.RingBuffer)- SRODATA dupok size=26
	0x0000 00 00 17 2a 66 75 6e 63 28 2a 6d 61 69 6e 2e 52  ...*func(*main.R
	0x0010 69 6e 67 42 75 66 66 65 72 29                    ingBuffer)
type.*func(*"".RingBuffer) SRODATA dupok size=56
	0x0000 08 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0010 96 ce 36 15 08 08 08 36 00 00 00 00 00 00 00 00  ..6....6........
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00                          ........
	rel 24+8 t=1 runtime.memequal64·f+0
	rel 32+8 t=1 runtime.gcbits.01+0
	rel 40+4 t=5 type..namedata.*func(*main.RingBuffer)-+0
	rel 48+8 t=1 type.func(*"".RingBuffer)+0
type.func(*"".RingBuffer) SRODATA dupok size=64
	0x0000 08 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0010 4b d9 34 f5 02 08 08 33 00 00 00 00 00 00 00 00  K.4....3........
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	rel 32+8 t=1 runtime.gcbits.01+0
	rel 40+4 t=5 type..namedata.*func(*main.RingBuffer)-+0
	rel 44+4 t=6 type.*func(*"".RingBuffer)+0
	rel 56+8 t=1 type.*"".RingBuffer+0
type..namedata.*func(*main.RingBuffer) interface {}- SRODATA dupok size=39
	0x0000 00 00 24 2a 66 75 6e 63 28 2a 6d 61 69 6e 2e 52  ..$*func(*main.R
	0x0010 69 6e 67 42 75 66 66 65 72 29 20 69 6e 74 65 72  ingBuffer) inter
	0x0020 66 61 63 65 20 7b 7d                             face {}
type.*func(*"".RingBuffer) interface {} SRODATA dupok size=56
	0x0000 08 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0010 75 61 3b f3 08 08 08 36 00 00 00 00 00 00 00 00  ua;....6........
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00                          ........
	rel 24+8 t=1 runtime.memequal64·f+0
	rel 32+8 t=1 runtime.gcbits.01+0
	rel 40+4 t=5 type..namedata.*func(*main.RingBuffer) interface {}-+0
	rel 48+8 t=1 type.func(*"".RingBuffer) interface {}+0
type.func(*"".RingBuffer) interface {} SRODATA dupok size=72
	0x0000 08 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0010 26 44 da 55 02 08 08 33 00 00 00 00 00 00 00 00  &D.U...3........
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 01 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0040 00 00 00 00 00 00 00 00                          ........
	rel 32+8 t=1 runtime.gcbits.01+0
	rel 40+4 t=5 type..namedata.*func(*main.RingBuffer) interface {}-+0
	rel 44+4 t=6 type.*func(*"".RingBuffer) interface {}+0
	rel 56+8 t=1 type.*"".RingBuffer+0
	rel 64+8 t=1 type.interface {}+0
type..namedata.*func(*main.RingBuffer, main.Entity)- SRODATA dupok size=39
	0x0000 00 00 24 2a 66 75 6e 63 28 2a 6d 61 69 6e 2e 52  ..$*func(*main.R
	0x0010 69 6e 67 42 75 66 66 65 72 2c 20 6d 61 69 6e 2e  ingBuffer, main.
	0x0020 45 6e 74 69 74 79 29                             Entity)
type.*func(*"".RingBuffer, "".Entity) SRODATA dupok size=56
	0x0000 08 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0010 c5 ae e6 f8 08 08 08 36 00 00 00 00 00 00 00 00  .......6........
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00                          ........
	rel 24+8 t=1 runtime.memequal64·f+0
	rel 32+8 t=1 runtime.gcbits.01+0
	rel 40+4 t=5 type..namedata.*func(*main.RingBuffer, main.Entity)-+0
	rel 48+8 t=1 type.func(*"".RingBuffer, "".Entity)+0
type.func(*"".RingBuffer, "".Entity) SRODATA dupok size=72
	0x0000 08 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0010 c4 51 21 3b 02 08 08 33 00 00 00 00 00 00 00 00  .Q!;...3........
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0040 00 00 00 00 00 00 00 00                          ........
	rel 32+8 t=1 runtime.gcbits.01+0
	rel 40+4 t=5 type..namedata.*func(*main.RingBuffer, main.Entity)-+0
	rel 44+4 t=6 type.*func(*"".RingBuffer, "".Entity)+0
	rel 56+8 t=1 type.*"".RingBuffer+0
	rel 64+8 t=1 type."".Entity+0
type..namedata.*func(*main.RingBuffer, int)- SRODATA dupok size=31
	0x0000 00 00 1c 2a 66 75 6e 63 28 2a 6d 61 69 6e 2e 52  ...*func(*main.R
	0x0010 69 6e 67 42 75 66 66 65 72 2c 20 69 6e 74 29     ingBuffer, int)
type.*func(*"".RingBuffer, int) SRODATA dupok size=56
	0x0000 08 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0010 6f 03 67 84 08 08 08 36 00 00 00 00 00 00 00 00  o.g....6........
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00                          ........
	rel 24+8 t=1 runtime.memequal64·f+0
	rel 32+8 t=1 runtime.gcbits.01+0
	rel 40+4 t=5 type..namedata.*func(*main.RingBuffer, int)-+0
	rel 48+8 t=1 type.func(*"".RingBuffer, int)+0
type.func(*"".RingBuffer, int) SRODATA dupok size=72
	0x0000 08 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0010 99 7a c6 b0 02 08 08 33 00 00 00 00 00 00 00 00  .z.....3........
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0040 00 00 00 00 00 00 00 00                          ........
	rel 32+8 t=1 runtime.gcbits.01+0
	rel 40+4 t=5 type..namedata.*func(*main.RingBuffer, int)-+0
	rel 44+4 t=6 type.*func(*"".RingBuffer, int)+0
	rel 56+8 t=1 type.*"".RingBuffer+0
	rel 64+8 t=1 type.int+0
type..namedata.Clear. SRODATA dupok size=8
	0x0000 01 00 05 43 6c 65 61 72                          ...Clear
type..namedata.*func()- SRODATA dupok size=10
	0x0000 00 00 07 2a 66 75 6e 63 28 29                    ...*func()
type.*func() SRODATA dupok size=56
	0x0000 08 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0010 9b 90 75 1b 08 08 08 36 00 00 00 00 00 00 00 00  ..u....6........
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00                          ........
	rel 24+8 t=1 runtime.memequal64·f+0
	rel 32+8 t=1 runtime.gcbits.01+0
	rel 40+4 t=5 type..namedata.*func()-+0
	rel 48+8 t=1 type.func()+0
type.func() SRODATA dupok size=56
	0x0000 08 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0010 f6 bc 82 f6 02 08 08 33 00 00 00 00 00 00 00 00  .......3........
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00                                      ....
	rel 32+8 t=1 runtime.gcbits.01+0
	rel 40+4 t=5 type..namedata.*func()-+0
	rel 44+4 t=6 type.*func()+0
type..namedata.Get. SRODATA dupok size=6
	0x0000 01 00 03 47 65 74                                ...Get
type..namedata.*func() interface {}- SRODATA dupok size=23
	0x0000 00 00 14 2a 66 75 6e 63 28 29 20 69 6e 74 65 72  ...*func() inter
	0x0010 66 61 63 65 20 7b 7d                             face {}
type.*func() interface {} SRODATA dupok size=56
	0x0000 08 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0010 42 88 01 49 08 08 08 36 00 00 00 00 00 00 00 00  B..I...6........
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00                          ........
	rel 24+8 t=1 runtime.memequal64·f+0
	rel 32+8 t=1 runtime.gcbits.01+0
	rel 40+4 t=5 type..namedata.*func() interface {}-+0
	rel 48+8 t=1 type.func() interface {}+0
type.func() interface {} SRODATA dupok size=64
	0x0000 08 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0010 23 b4 1c f1 02 08 08 33 00 00 00 00 00 00 00 00  #......3........
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	rel 32+8 t=1 runtime.gcbits.01+0
	rel 40+4 t=5 type..namedata.*func() interface {}-+0
	rel 44+4 t=6 type.*func() interface {}+0
	rel 56+8 t=1 type.interface {}+0
type..namedata.Put. SRODATA dupok size=6
	0x0000 01 00 03 50 75 74                                ...Put
type..namedata.*func(main.Entity)- SRODATA dupok size=21
	0x0000 00 00 12 2a 66 75 6e 63 28 6d 61 69 6e 2e 45 6e  ...*func(main.En
	0x0010 74 69 74 79 29                                   tity)
type.*func("".Entity) SRODATA dupok size=56
	0x0000 08 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0010 ee b1 c2 5a 08 08 08 36 00 00 00 00 00 00 00 00  ...Z...6........
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00                          ........
	rel 24+8 t=1 runtime.memequal64·f+0
	rel 32+8 t=1 runtime.gcbits.01+0
	rel 40+4 t=5 type..namedata.*func(main.Entity)-+0
	rel 48+8 t=1 type.func("".Entity)+0
type.func("".Entity) SRODATA dupok size=64
	0x0000 08 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0010 6e 97 55 08 02 08 08 33 00 00 00 00 00 00 00 00  n.U....3........
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	rel 32+8 t=1 runtime.gcbits.01+0
	rel 40+4 t=5 type..namedata.*func(main.Entity)-+0
	rel 44+4 t=6 type.*func("".Entity)+0
	rel 56+8 t=1 type."".Entity+0
type..namedata.SetEnd. SRODATA dupok size=9
	0x0000 01 00 06 53 65 74 45 6e 64                       ...SetEnd
type..namedata.*func(int)- SRODATA dupok size=13
	0x0000 00 00 0a 2a 66 75 6e 63 28 69 6e 74 29           ...*func(int)
type.*func(int) SRODATA dupok size=56
	0x0000 08 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0010 2b 1f 12 8c 08 08 08 36 00 00 00 00 00 00 00 00  +......6........
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00                          ........
	rel 24+8 t=1 runtime.memequal64·f+0
	rel 32+8 t=1 runtime.gcbits.01+0
	rel 40+4 t=5 type..namedata.*func(int)-+0
	rel 48+8 t=1 type.func(int)+0
type.func(int) SRODATA dupok size=64
	0x0000 08 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0010 84 e6 f1 18 02 08 08 33 00 00 00 00 00 00 00 00  .......3........
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	rel 32+8 t=1 runtime.gcbits.01+0
	rel 40+4 t=5 type..namedata.*func(int)-+0
	rel 44+4 t=6 type.*func(int)+0
	rel 56+8 t=1 type.int+0
type.*"".RingBuffer SRODATA size=136
	0x0000 08 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0010 b4 e2 d7 2c 09 08 08 36 00 00 00 00 00 00 00 00  ...,...6........
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00 00 00 00 00 04 00 04 00  ................
	0x0040 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0050 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0060 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0070 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0080 00 00 00 00 00 00 00 00                          ........
	rel 24+8 t=1 runtime.memequal64·f+0
	rel 32+8 t=1 runtime.gcbits.01+0
	rel 40+4 t=5 type..namedata.*main.RingBuffer.+0
	rel 48+8 t=1 type."".RingBuffer+0
	rel 56+4 t=5 type..importpath."".+0
	rel 72+4 t=5 type..namedata.Clear.+0
	rel 76+4 t=27 type.func()+0
	rel 80+4 t=27 "".(*RingBuffer).Clear+0
	rel 84+4 t=27 "".(*RingBuffer).Clear+0
	rel 88+4 t=5 type..namedata.Get.+0
	rel 92+4 t=27 type.func() interface {}+0
	rel 96+4 t=27 "".(*RingBuffer).Get+0
	rel 100+4 t=27 "".(*RingBuffer).Get+0
	rel 104+4 t=5 type..namedata.Put.+0
	rel 108+4 t=27 type.func("".Entity)+0
	rel 112+4 t=27 "".(*RingBuffer).Put+0
	rel 116+4 t=27 "".(*RingBuffer).Put+0
	rel 120+4 t=5 type..namedata.SetEnd.+0
	rel 124+4 t=27 type.func(int)+0
	rel 128+4 t=27 "".(*RingBuffer).SetEnd+0
	rel 132+4 t=27 "".(*RingBuffer).SetEnd+0
runtime.gcbits.10 SRODATA dupok size=1
	0x0000 10                                               .
type..namedata.mask- SRODATA dupok size=7
	0x0000 00 00 04 6d 61 73 6b                             ...mask
type..namedata.readOffset- SRODATA dupok size=13
	0x0000 00 00 0a 72 65 61 64 4f 66 66 73 65 74           ...readOffset
type..namedata.endOffset- SRODATA dupok size=12
	0x0000 00 00 09 65 6e 64 4f 66 66 73 65 74              ...endOffset
type..namedata.end- SRODATA dupok size=6
	0x0000 00 00 03 65 6e 64                                ...end
type..namedata.list- SRODATA dupok size=7
	0x0000 00 00 04 6c 69 73 74                             ...list
type."".RingBuffer SRODATA size=216
	0x0000 38 00 00 00 00 00 00 00 28 00 00 00 00 00 00 00  8.......(.......
	0x0010 7c a5 d4 bb 07 08 08 19 00 00 00 00 00 00 00 00  |...............
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0040 05 00 00 00 00 00 00 00 05 00 00 00 00 00 00 00  ................
	0x0050 00 00 00 00 00 00 00 00 88 00 00 00 00 00 00 00  ................
	0x0060 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0070 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0080 00 00 00 00 00 00 00 00 10 00 00 00 00 00 00 00  ................
	0x0090 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x00a0 20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00   ...............
	0x00b0 00 00 00 00 00 00 00 00 30 00 00 00 00 00 00 00  ........0.......
	0x00c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x00d0 40 00 00 00 00 00 00 00                          @.......
	rel 32+8 t=1 runtime.gcbits.10+0
	rel 40+4 t=5 type..namedata.*main.RingBuffer.+0
	rel 44+4 t=5 type.*"".RingBuffer+0
	rel 48+8 t=1 type..importpath."".+0
	rel 56+8 t=1 type."".RingBuffer+96
	rel 80+4 t=5 type..importpath."".+0
	rel 96+8 t=1 type..namedata.mask-+0
	rel 104+8 t=1 type.int+0
	rel 120+8 t=1 type..namedata.readOffset-+0
	rel 128+8 t=1 type.int+0
	rel 144+8 t=1 type..namedata.endOffset-+0
	rel 152+8 t=1 type.int+0
	rel 168+8 t=1 type..namedata.end-+0
	rel 176+8 t=1 type.bool+0
	rel 192+8 t=1 type..namedata.list-+0
	rel 200+8 t=1 type.[]interface {}+0
type..namedata.*[]int- SRODATA dupok size=9
	0x0000 00 00 06 2a 5b 5d 69 6e 74                       ...*[]int
type.*[]int SRODATA dupok size=56
	0x0000 08 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0010 1b 31 52 88 08 08 08 36 00 00 00 00 00 00 00 00  .1R....6........
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00                          ........
	rel 24+8 t=1 runtime.memequal64·f+0
	rel 32+8 t=1 runtime.gcbits.01+0
	rel 40+4 t=5 type..namedata.*[]int-+0
	rel 48+8 t=1 type.[]int+0
type.[]int SRODATA dupok size=56
	0x0000 18 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0010 8e 66 f9 1b 02 08 08 17 00 00 00 00 00 00 00 00  .f..............
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00                          ........
	rel 32+8 t=1 runtime.gcbits.01+0
	rel 40+4 t=5 type..namedata.*[]int-+0
	rel 44+4 t=6 type.*[]int+0
	rel 48+8 t=1 type.int+0
type..namedata.*struct { F uintptr; count int; buffer *main.RingBuffer; putList []int }- SRODATA dupok size=75
	0x0000 00 00 48 2a 73 74 72 75 63 74 20 7b 20 46 20 75  ..H*struct { F u
	0x0010 69 6e 74 70 74 72 3b 20 63 6f 75 6e 74 20 69 6e  intptr; count in
	0x0020 74 3b 20 62 75 66 66 65 72 20 2a 6d 61 69 6e 2e  t; buffer *main.
	0x0030 52 69 6e 67 42 75 66 66 65 72 3b 20 70 75 74 4c  RingBuffer; putL
	0x0040 69 73 74 20 5b 5d 69 6e 74 20 7d                 ist []int }
type.*struct { F uintptr; "".count int; "".buffer *"".RingBuffer; "".putList []int } SRODATA dupok size=56
	0x0000 08 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0010 b5 10 72 d4 08 08 08 36 00 00 00 00 00 00 00 00  ..r....6........
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00                          ........
	rel 24+8 t=1 runtime.memequal64·f+0
	rel 32+8 t=1 runtime.gcbits.01+0
	rel 40+4 t=5 type..namedata.*struct { F uintptr; count int; buffer *main.RingBuffer; putList []int }-+0
	rel 48+8 t=1 type.noalg.struct { F uintptr; "".count int; "".buffer *"".RingBuffer; "".putList []int }+0
runtime.gcbits.0c SRODATA dupok size=1
	0x0000 0c                                               .
type..namedata..F- SRODATA dupok size=5
	0x0000 00 00 02 2e 46                                   ....F
type..namedata.count- SRODATA dupok size=8
	0x0000 00 00 05 63 6f 75 6e 74                          ...count
type..namedata.buffer- SRODATA dupok size=9
	0x0000 00 00 06 62 75 66 66 65 72                       ...buffer
type..namedata.putList- SRODATA dupok size=10
	0x0000 00 00 07 70 75 74 4c 69 73 74                    ...putList
type.noalg.struct { F uintptr; "".count int; "".buffer *"".RingBuffer; "".putList []int } SRODATA dupok size=176
	0x0000 30 00 00 00 00 00 00 00 20 00 00 00 00 00 00 00  0....... .......
	0x0010 30 fc 17 cd 02 08 08 19 00 00 00 00 00 00 00 00  0...............
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0040 04 00 00 00 00 00 00 00 04 00 00 00 00 00 00 00  ................
	0x0050 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0060 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0070 00 00 00 00 00 00 00 00 10 00 00 00 00 00 00 00  ................
	0x0080 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0090 20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00   ...............
	0x00a0 00 00 00 00 00 00 00 00 30 00 00 00 00 00 00 00  ........0.......
	rel 32+8 t=1 runtime.gcbits.0c+0
	rel 40+4 t=5 type..namedata.*struct { F uintptr; count int; buffer *main.RingBuffer; putList []int }-+0
	rel 44+4 t=6 type.*struct { F uintptr; "".count int; "".buffer *"".RingBuffer; "".putList []int }+0
	rel 48+8 t=1 type..importpath."".+0
	rel 56+8 t=1 type.noalg.struct { F uintptr; "".count int; "".buffer *"".RingBuffer; "".putList []int }+80
	rel 80+8 t=1 type..namedata..F-+0
	rel 88+8 t=1 type.uintptr+0
	rel 104+8 t=1 type..namedata.count-+0
	rel 112+8 t=1 type.int+0
	rel 128+8 t=1 type..namedata.buffer-+0
	rel 136+8 t=1 type.*"".RingBuffer+0
	rel 152+8 t=1 type..namedata.putList-+0
	rel 160+8 t=1 type.[]int+0
type..importpath.time. SRODATA dupok size=7
	0x0000 00 00 04 74 69 6d 65                             ...time
gclocals·3e27b3aa6b89137cce48b3379a2a6610 SRODATA dupok size=8
	0x0000 05 00 00 00 00 00 00 00                          ........
gclocals·33b8ebcfd207d68e0bd1318670f654e5 SRODATA dupok size=13
	0x0000 05 00 00 00 03 00 00 00 00 04 02 06 03           .............
gclocals·2589ca35330fc0fce83503f4569854a0 SRODATA dupok size=10
	0x0000 02 00 00 00 02 00 00 00 00 00                    ..........
gclocals·9fb7f0986f647f17cb53dda1484e0f7a SRODATA dupok size=10
	0x0000 02 00 00 00 01 00 00 00 00 01                    ..........
gclocals·1a65e721a2ccc325b382662e7ffee780 SRODATA dupok size=10
	0x0000 02 00 00 00 01 00 00 00 01 00                    ..........
gclocals·69c1753bd5f81501d95132d08af04464 SRODATA dupok size=8
	0x0000 02 00 00 00 00 00 00 00                          ........
gclocals·385b9fcf304627fb2d5e79f269b14707 SRODATA dupok size=10
	0x0000 02 00 00 00 04 00 00 00 09 00                    ..........
gclocals·e6397a44f8e1b6e77d0f200b4fba5269 SRODATA dupok size=10
	0x0000 02 00 00 00 03 00 00 00 01 00                    ..........
gclocals·7d2d5fca80364273fb07d5820a76fef4 SRODATA dupok size=8
	0x0000 03 00 00 00 00 00 00 00                          ........
gclocals·7e8800bf6619568fc5e6cdb20ca960ed SRODATA dupok size=11
	0x0000 03 00 00 00 03 00 00 00 00 07 05                 ...........
gclocals·dc9b0298814590ca3ffc3a889546fc8b SRODATA dupok size=10
	0x0000 02 00 00 00 02 00 00 00 03 00                    ..........
