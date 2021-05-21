"".main STEXT size=121 args=0x0 locals=0x80 funcid=0x0
	0x0000 00000 (slice.go:3)	TEXT	"".main(SB), ABIInternal, $128-0
	0x0000 00000 (slice.go:3)	MOVQ	(TLS), CX
	0x0009 00009 (slice.go:3)	CMPQ	SP, 16(CX)
	0x000d 00013 (slice.go:3)	PCDATA	$0, $-2
	0x000d 00013 (slice.go:3)	JLS	114
	0x000f 00015 (slice.go:3)	PCDATA	$0, $-1
	0x000f 00015 (slice.go:3)	ADDQ	$-128, SP
	0x0013 00019 (slice.go:3)	MOVQ	BP, 120(SP)
	0x0018 00024 (slice.go:3)	LEAQ	120(SP), BP
	0x001d 00029 (slice.go:3)	FUNCDATA	$0, gclocals·33cdeccccebe80329f1fdbee7f5874cb(SB)
	0x001d 00029 (slice.go:3)	FUNCDATA	$1, gclocals·54241e171da8af6ae173d69da0236748(SB)
	0x001d 00029 (slice.go:4)	LEAQ	""..autotmp_1+16(SP), DI
	0x0022 00034 (slice.go:4)	XORPS	X0, X0
	0x0025 00037 (slice.go:4)	PCDATA	$0, $-2
	0x0025 00037 (slice.go:4)	LEAQ	-48(DI), DI
	0x0029 00041 (slice.go:4)	DUFFZERO	$277
	0x003c 00060 (slice.go:4)	PCDATA	$0, $-1
	0x003c 00060 (slice.go:4)	LEAQ	""..autotmp_1+16(SP), DX
	0x0041 00065 (slice.go:4)	TESTB	AL, (DX)
	0x0043 00067 (slice.go:4)	JMP	69
	0x0045 00069 (slice.go:4)	JMP	71
	0x0047 00071 (slice.go:4)	MOVQ	DX, "".s+96(SP)
	0x004c 00076 (slice.go:4)	MOVQ	$1, "".s+104(SP)
	0x0055 00085 (slice.go:4)	MOVQ	$10, "".s+112(SP)
	0x005e 00094 (slice.go:4)	NOP
	0x0060 00096 (slice.go:5)	JMP	98
	0x0062 00098 (slice.go:5)	MOVL	$3, AX
	0x0067 00103 (slice.go:5)	MOVL	$1, CX
	0x006c 00108 (slice.go:5)	PCDATA	$1, $0
	0x006c 00108 (slice.go:5)	CALL	runtime.panicIndex(SB)
	0x0071 00113 (slice.go:5)	XCHGL	AX, AX
	0x0072 00114 (slice.go:5)	NOP
	0x0072 00114 (slice.go:3)	PCDATA	$1, $-1
	0x0072 00114 (slice.go:3)	PCDATA	$0, $-2
	0x0072 00114 (slice.go:3)	CALL	runtime.morestack_noctxt(SB)
	0x0077 00119 (slice.go:3)	PCDATA	$0, $-1
	0x0077 00119 (slice.go:3)	JMP	0
	0x0000 65 48 8b 0c 25 00 00 00 00 48 3b 61 10 76 63 48  eH..%....H;a.vcH
	0x0010 83 c4 80 48 89 6c 24 78 48 8d 6c 24 78 48 8d 7c  ...H.l$xH.l$xH.|
	0x0020 24 10 0f 57 c0 48 8d 7f d0 48 89 6c 24 f0 48 8d  $..W.H...H.l$.H.
	0x0030 6c 24 f0 e8 00 00 00 00 48 8b 6d 00 48 8d 54 24  l$......H.m.H.T$
	0x0040 10 84 02 eb 00 eb 00 48 89 54 24 60 48 c7 44 24  .......H.T$`H.D$
	0x0050 68 01 00 00 00 48 c7 44 24 70 0a 00 00 00 66 90  h....H.D$p....f.
	0x0060 eb 00 b8 03 00 00 00 b9 01 00 00 00 e8 00 00 00  ................
	0x0070 00 90 e8 00 00 00 00 eb 87                       .........
	rel 5+4 t=17 TLS+0
	rel 52+4 t=8 runtime.duffzero+277
	rel 109+4 t=8 runtime.panicIndex+0
	rel 115+4 t=8 runtime.morestack_noctxt+0
go.cuinfo.packagename. SDWARFCUINFO dupok size=0
	0x0000 6d 61 69 6e                                      main
""..inittask SNOPTRDATA size=24
	0x0000 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0010 00 00 00 00 00 00 00 00                          ........
gclocals·33cdeccccebe80329f1fdbee7f5874cb SRODATA dupok size=8
	0x0000 01 00 00 00 00 00 00 00                          ........
gclocals·54241e171da8af6ae173d69da0236748 SRODATA dupok size=9
	0x0000 01 00 00 00 03 00 00 00 00                       .........
