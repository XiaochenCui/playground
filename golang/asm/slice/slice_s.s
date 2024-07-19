"".main STEXT nosplit size=30 args=0x0 locals=0x18 funcid=0x0
	0x0000 00000 (slice.go:3)	TEXT	"".main(SB), NOSPLIT|ABIInternal, $24-0
	0x0000 00000 (slice.go:3)	SUBQ	$24, SP
	0x0004 00004 (slice.go:3)	MOVQ	BP, 16(SP)
	0x0009 00009 (slice.go:3)	LEAQ	16(SP), BP
	0x000e 00014 (slice.go:3)	FUNCDATA	$0, gclocals·33cdeccccebe80329f1fdbee7f5874cb(SB)
	0x000e 00014 (slice.go:3)	FUNCDATA	$1, gclocals·33cdeccccebe80329f1fdbee7f5874cb(SB)
	0x000e 00014 (<unknown line number>)	NOP
	0x000e 00014 (slice.go:5)	MOVL	$3, AX
	0x0013 00019 (slice.go:9)	MOVL	$1, CX
	0x0018 00024 (slice.go:9)	PCDATA	$1, $0
	0x0018 00024 (slice.go:9)	CALL	runtime.panicIndex(SB)
	0x001d 00029 (slice.go:9)	XCHGL	AX, AX
	0x0000 48 83 ec 18 48 89 6c 24 10 48 8d 6c 24 10 b8 03  H...H.l$.H.l$...
	0x0010 00 00 00 b9 01 00 00 00 e8 00 00 00 00 90        ..............
	rel 25+4 t=8 runtime.panicIndex+0
"".assign STEXT nosplit size=54 args=0x20 locals=0x18 funcid=0x0
	0x0000 00000 (slice.go:8)	TEXT	"".assign(SB), NOSPLIT|ABIInternal, $24-32
	0x0000 00000 (slice.go:8)	SUBQ	$24, SP
	0x0004 00004 (slice.go:8)	MOVQ	BP, 16(SP)
	0x0009 00009 (slice.go:8)	LEAQ	16(SP), BP
	0x000e 00014 (slice.go:8)	FUNCDATA	$0, gclocals·1a65e721a2ccc325b382662e7ffee780(SB)
	0x000e 00014 (slice.go:8)	FUNCDATA	$1, gclocals·69c1753bd5f81501d95132d08af04464(SB)
	0x000e 00014 (slice.go:9)	MOVQ	"".i+56(SP), AX
	0x0013 00019 (slice.go:9)	MOVQ	"".s+40(SP), CX
	0x0018 00024 (slice.go:9)	CMPQ	AX, CX
	0x001b 00027 (slice.go:9)	JCC	48
	0x001d 00029 (slice.go:9)	MOVQ	"".s+32(SP), CX
	0x0022 00034 (slice.go:9)	MOVQ	AX, (CX)(AX*8)
	0x0026 00038 (slice.go:10)	MOVQ	16(SP), BP
	0x002b 00043 (slice.go:10)	ADDQ	$24, SP
	0x002f 00047 (slice.go:10)	RET
	0x0030 00048 (slice.go:9)	PCDATA	$1, $1
	0x0030 00048 (slice.go:9)	CALL	runtime.panicIndex(SB)
	0x0035 00053 (slice.go:9)	XCHGL	AX, AX
	0x0000 48 83 ec 18 48 89 6c 24 10 48 8d 6c 24 10 48 8b  H...H.l$.H.l$.H.
	0x0010 44 24 38 48 8b 4c 24 28 48 39 c8 73 13 48 8b 4c  D$8H.L$(H9.s.H.L
	0x0020 24 20 48 89 04 c1 48 8b 6c 24 10 48 83 c4 18 c3  $ H...H.l$.H....
	0x0030 e8 00 00 00 00 90                                ......
	rel 49+4 t=8 runtime.panicIndex+0
go.cuinfo.packagename. SDWARFCUINFO dupok size=0
	0x0000 6d 61 69 6e                                      main
""..inittask SNOPTRDATA size=24
	0x0000 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0010 00 00 00 00 00 00 00 00                          ........
go.info."".assign$abstract SDWARFABSFCN dupok size=28
	0x0000 04 2e 61 73 73 69 67 6e 00 01 01 11 73 00 00 00  ..assign....s...
	0x0010 00 00 00 11 69 00 00 00 00 00 00 00              ....i.......
	rel 0+0 t=24 type.[]int+0
	rel 0+0 t=24 type.int+0
	rel 15+4 t=31 go.info.[]int+0
	rel 23+4 t=31 go.info.int+0
runtime.memequal64·f SRODATA dupok size=8
	0x0000 00 00 00 00 00 00 00 00                          ........
	rel 0+8 t=1 runtime.memequal64+0
runtime.gcbits.01 SRODATA dupok size=1
	0x0000 01                                               .
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
gclocals·33cdeccccebe80329f1fdbee7f5874cb SRODATA dupok size=8
	0x0000 01 00 00 00 00 00 00 00                          ........
gclocals·1a65e721a2ccc325b382662e7ffee780 SRODATA dupok size=10
	0x0000 02 00 00 00 01 00 00 00 01 00                    ..........
gclocals·69c1753bd5f81501d95132d08af04464 SRODATA dupok size=8
	0x0000 02 00 00 00 00 00 00 00                          ........
