
Appendix A: Instruction Set Architecture
=================================================

This appendix contains a table of the Epiphany instruction set architecture (ISA) opcodes and descriptions of all instructions listed in alphabetical order.

Table: Opcodes

| INSTR     |SIZE|31:29|28:26|25:23|22:20|19:16|15:13|12:10| 9:7  |6:4  |3:0 |
| ----------|----|-----|-----|-----|-----|-----|-----|-----|------|-----|----|
|**BRANCH** |    |     |     |     |     |     |     |     |      |     |    |
| BCOND     | 16 |     |     |     |     |     |I7II |III  |IIB3  |BBB  |0000|
| BCOND     | 32 |I23II|III  |III  |III  |IIII |III  |III  |IIB3  |BBB  |1000|
|**LDR/STR**|    |     |     |     |     |     |     |     |      |     |    |
| LDST DISP | 16 |     |     |     |     |     |RD2:0|RN2:0|I2II  |D1:0S|0100|
| LDST INDEX| 16 |     |     |     |     |     |RD2:0|RN2:0|RM2:0 |D1:0S|0001|
| LDST PM   | 16 |     |     |     |     |     |RD2:0|RN2:0|RM2:0 |D1:0S|0101|
| LDST DISP | 32 |RD5:3|RN5:3|PMI10|III  |IIII |RD2:0|RN2:0|III   |D1:0S|1100|
| LDST INDEX| 32 |RD5:3|RN5:3|RM5:3|00M  |0000 |RD2:0|RN2:0|RM2:0 |D1:0S|1001|
| LDST PM   | 32 |RD5:3|RN5:3|RM5:3|00M  |0000 |RD2:0|RN2:0|RM2:0 |D1:0S|1101|
| TESTSET   | 32 |RD5:3|RN5:3|RM5:3|010  |0000 |RD2:0|RN2:0|RM2:0 |100  |1001|
|**IMM-INT**|    |     |     |     |     |     |     |     |      |     |    |
| MOV IMM   | 16 |     |     |     |     |     |RD2:0|I7II |III   |  II0|0011|
| ADD IMM   | 16 |     |     |     |     |     |RD2:0|RN2:0|I2:0  |  001|0011|
| SUB IMM   | 16 |     |     |     |     |     |RD2:0|RN2:0|I2:0  |  011|0011|
| MOV IMM   | 32 |RD5:3|HI15I|III  |III  |xxxx |RD2:0|III  |III   |  II0|1011|
| ADD IMM   | 32 |RD5:3|RN5:3|xxI10|III  |IIII |RD2:0|RN2:0|III   |  001|1011|
| SUB IMM   | 32 |RD5:3|RN5:3|xxI10|III  |IIII |RD2:0|RN2:0|III   |  011|1011|
|**SHIFT**  |    |     |     |     |     |     |     |     |      |     |    |
| LSR       | 16 |     |     |     |     |     |RD2:0|RN2:0|S4:S2 |S1:00|0110|
| LSL       | 16 |     |     |     |     |     |RD2:0|RN2:0|S4:S2 |S1:01|0110|
| ASR       | 16 |     |     |     |     |     |RD2:0|RN2:0|S4:S2 |S1:00|1110|
| BITR      | 16 |     |     |     |     |     |RD2:0|RN2:0|RN2:0 |  001|1110|
| LSR       | 32 |RD5:3|RN5:3|xxx  |xxx  |0110 |RD2:0|RN2:0|S4:S2 |S1:00|1111|
| LSL       | 32 |RD5:3|RN5:3|xxx  |xxx  |0110 |RD2:0|RN2:0|S4:S2 |S1:01|1111|
| ASR       | 32 |RD5:3|RN5:3|xxx  |xxx  |1110 |RD2:0|RN2:0|S4:S2 |S1:00|1111|
| BITR      | 32 |RD5:3|RN5:3|xxx  |xxx  |1110 |RD2:0|RN2:0|RN2:0 |  001|1111|
|**REG-INT**|    |     |     |     |     |     |     |     |      |     |    |
| ADD       | 16 |     |     |     |     |     |RD2:0|RN2:0|RM2:0 |001  |1010|
| SUB       | 16 |     |     |     |     |     |RD2:0|RN2:0|RM2:0 |011  |1010|
| AND       | 16 |     |     |     |     |     |RD2:0|RN2:0|RM2:0 |101  |1010|
| ORR       | 16 |     |     |     |     |     |RD2:0|RN2:0|RM2:0 |111  |1010|
| EOR       | 16 |     |     |     |     |     |RD2:0|RN2:0|RM2:0 |000  |1010|
| ASR       | 16 |     |     |     |     |     |RD2:0|RN2:0|RM2:0 |110  |1010|
| LSR       | 16 |     |     |     |     |     |RD2:0|RN2:0|RM2:0 |100  |1010|
| LSL       | 16 |     |     |     |     |     |RD2:0|RN2:0|RM2:0 |010  |1010|
| ADD       | 32 |RD5:3|RN5:3|RM5:3|x00  | 1010|RD2:0|RN2:0|RM2:0 |001  |1111|
| SUB       | 32 |RD5:3|RN5:3|RM5:3|x00  | 1010|RD2:0|RN2:0|RM2:0 |011  |1111|
| AND       | 32 |RD5:3|RN5:3|RM5:3|x00  | 1010|RD2:0|RN2:0|RM2:0 |101  |1111|
| ORR       | 32 |RD5:3|RN5:3|RM5:3|x00  | 1010|RD2:0|RN2:0|RM2:0 |111  |1111|
| EOR       | 32 |RD5:3|RN5:3|RM5:3|x00  | 1010|RD2:0|RN2:0|RM2:0 |000  |1111|
| ASR       | 32 |RD5:3|RN5:3|RM5:3|x00  | 1010|RD2:0|RN2:0|RM2:0 |110  |1111|
| LSR       | 32 |RD5:3|RN5:3|RM5:3|x00  | 1010|RD2:0|RN2:0|RM2:0 |100  |1111|
| LSL       | 32 |RD5:3|RN5:3|RM5:3|x00  | 1010|RD2:0|RN2:0|RM2:0 |010  |1111|
|**FPU**    |    |     |     |     |     |     |     |     |      |     |    |
| FADD      | 16 |     |     |     |     |     |RD2:0|RN2:0|RM2:0 |000  |0111|
| FSUB      | 16 |     |     |     |     |     |RD2:0|RN2:0|RM2:0 |001  |0111|
| FMUL      | 16 |     |     |     |     |     |RD2:0|RN2:0|RM2:0 |010  |0111|
| FMADD     | 16 |     |     |     |     |     |RD2:0|RN2:0|RM2:0 |011  |0111|
| FMSUB     | 16 |     |     |     |     |     |RD2:0|RN2:0|RM2:0 |100  |0111|
| FLOAT     | 16 |     |     |     |     |     |RD2:0|RN2:0|RN2:0 |101  |0111|
| FIX       | 16 |     |     |     |     |     |RD2:0|RN2:0|RN2:0 |110  |0111|
| FABS      | 16 |     |     |     |     |     |RD2:0|RN2:0|RN2:0 |111  |0111|
| FADD      | 32 |RD5:3|RN5:3|RM5:3|x00  | 0111|RD2:0|RN2:0|RM2:0 |000  |1111|
| FSUB      | 32 |RD5:3|RN5:3|RM5:3|x00  | 0111|RD2:0|RN2:0|RM2:0 |001  |1111|
| FMUL      | 32 |RD5:3|RN5:3|RM5:3|x00  | 0111|RD2:0|RN2:0|RM2:0 |010  |1111|
| FMADD     | 32 |RD5:3|RN5:3|RM5:3|x00  | 0111|RD2:0|RN2:0|RM2:0 |011  |1111|
| FMSUB     | 32 |RD5:3|RN5:3|RM5:3|x00  | 0111|RD2:0|RN2:0|RM2:0 |100  |1111|
| FLOAT     | 32 |RD5:3|RN5:3|RN5:3|x00  | 0111|RD2:0|RN2:0|RN2:0 |101  |1111|
| FIX       | 32 |RD5:3|RN5:3|RN5:3|x00  | 0111|RD2:0|RN2:0|RN2:0 |110  |1111|
| FABS      | 32 |RD5:3|RN5:3|RN5:3|x00  | 0111|RD2:0|RN2:0|RN2:0 |111  |1111|
|**MOVE**   |    |     |     |     |     |     |     |     |      |     |    |
| MOVCOND   | 16 |     |     |     |     |     |RD2:0|RN2:0|x0B3  |BBB  |0010|
| MOVTS     | 16 |     |     |     |     |     |RD2:0|MM2:0|x10   |000  |0010|
| MOVFS     | 16 |     |     |     |     |     |RD2:0|MM2:0|x10   |001  |0010|
| MOVCOND   | 32 |RD5:3|RN5:3|xxx  | xxx |0010 |RD2:0|RN2:0|x0B3  |BBB  |1111|
| MOVTS     | 32 |RD5:3|MM5:3|xxx  |xG1:0|0010 |RD2:0|MM2:0|x10   |000  |1111|
| MOVFS     | 32 |RD5:3|MM5:3|xxx  |xG1:0|0010 |RD2:0|MM2:0|x10   |001  |1111|
|**JUMP**   |    |     |     |     |     |     |     |     |      |     |    |
| JR        | 16 |     |     |     |     |     |xxx  |RN2:0|x10   |100  |0010|
| JALR      | 16 |     |     |     |     |     |xxx  |RN2:0|x10   |101  |0010
| JR        | 32 |xxx  |RN5:3|xxx  | xxx |0010 |xxx  |RN2:0|x10   |100  |1111|
| JALR      | 32 |xxx  |RN5:3|xxx  | xxx |0010 |xxx  |RN2:0|x10   |101  |1111|
|**FLOW**   |    |     |     |     |     |     |     |     |      |     |    |
| WAND      | 16 |     |     |     |     |     |xxx  |xxx  |x11   |000  |0010|
| GIE       | 16 |     |     |     |     |     |xxx  |xxx  |011   |001  |0010|
| GID       | 16 |     |     |     |     |     |xxx  |xxx  |111   |001  |0010|
| NOP       | 16 |     |     |     |     |     |xxx  |xxx  |011   |001  |0010|
| IDLE      | 16 |     |     |     |     |     |xxx  |xxx  |011   |011  |0010|
| BKPT      | 16 |     |     |     |     |     |xxx  |xxx  |011   |100  |0010|
| MBKPT     | 16 |     |     |     |     |     |xxx  |xxx  |111   |100  |0010|
| RTI       | 16 |     |     |     |     |     |xxx  |xxx  |011   |101  |0010|
| SWI       | 16 |     |     |     |     |     |xxx  |xxx  |011   |110  |0010|
| TRAP      | 16 |     |     |     |     |     |xxx  |xxx  |111   |110  |0010|
| SYNC      | 16 |     |     |     |     |     |xxx  |xxx  |011   |111  |0010|

Table: Opcode Table Symbol Meanings

| Symbol |Desription                                                     |
|:------:|---------------------------------------------------------------|
| I      | Immediate, MSB denoted by I#, LSBs by simple I (example I3III)|
| D      | Datasize[1:0]                                                 |
| B3:0   | Branch code                                                   |
| S      | Store option                                                  |
| M      | Minus (subtract) option                                       |
| P      | Postmodify option                                             |
| H      | High/low immediate write option                               |
| x      | Don't care (should be zero for for forward compatibility)     |
| G      | MMR group                                                     |

\newpage

Table: Instruction Set Assembly Syntax

| Field  | Description                                              |
|--------|----------------------------------------------------------|
| COND   | One of 16 condition codes                                |
| RD     | Destination register (R0-R63).                           |
| RN     | Primary source register (R0-R63).                        |
| RM     | Secondary source register (R0-R63).                      |
| OP2    | Secondary operand. <simm3 or simm11 or RM>               |
| DM     | Datamode. Options are B,H,L,D                            |
| OFFSET | Load/store address offset: <imm3 or imm11>               |
| IMM    | Unsigned immediate per instruction                       |
| IMM3   | Unsigned immediate value in range 0 to 7                 |
| IMM8   | Unsigned immediate value in range 0 to 255               |
| IMM11  | Unsigned immediate value in range 0 to 2047              |
| IMM16  | Unsigned immediate value in range 0 to 65,535            |
| SIMM   | Signed immediate per instruction                         |
| SIMM3  | Signed immediate value in range -4 to +3                 |
| SIMM8  | Signed immediate value in range -128 to +127             |
| SIMM11 | Signed immediate value in range -1024 to +1023           |
| SIMM24 | Signed immediate value in range -8,388,608 to +8,388,607 |
| LABEL  | Jump/Branch label resolved by assembler                  |
| INSTR.l| The “.l” suffix is used to indicate a 32 bit instruction |

\newpage

## ADD ##

The ADD instruction adds an integer register value (RN) with a second integer operand  (RM or SIMM3 or SIMM11). The result is written to register RD.

**Syntax:**
```
	ADD RD, RN, RM  
	ADD RD, RN, #SIMM3  
	ADD RD, RN, #SIMM11  
```
**Operands:**
```
	RD: Destination register
	RN: First operand register
	RM: Second operand register
	SIMM3: 3 bit signed immediate value
	SIMM11: 11 bit signed immediate value
```
**Flags Updated:**
```
	AN
	AZ
	AV
	AC
```
**Operation:**
```
	RD = RN + OP2;
	AN = RD[31];
	AC = CARRY OUT;
	AZ = (RD[31:0] == 0);
	OV = (( RD[31] & ~RM[31] & ~RN[31] ) | ( ~RD[31] & RM[31] & RN[31] ))
	AVS = AVS | AV;
```

**Example:**
```
	ADD R1, R1, R3      // R1 = R1 + R3
	ADD R2, R1, #2      // immediate should have '#'
	ADD R2, R1, #-100   // add signed value -100 to R1 and write result to R2
```

\newpage

## AND ##

The AND instruction performs a logical “AND” between operand RN and operand RM and places the result in register RD.

**Syntax:**
```
	AND RD, RN, RM
```
**Operands:**
```
	RD:	Destination register
	RN:	First operand register
	RM:	Second operand register
```
**Flags Updated:**
```
	AN
	AZ
	AV
	AC
```

**Operation:**
```
	RD = RN & RM;
	AN = RD[31];
	AV = 0;
	AC = 0;
	AZ = (RD[31:0] == 0);
```

**Example:**
```
	AND R2, R1, R0     // R2 = R1 & R0
```
\newpage

## ASR ##

The ASR instruction performers an arithmetic shift right of the RN operand based on the unsigned 5 bit shift value in IMM5 or RM. The result is sign extended using bit RN[31] and placed in register RD.

**Syntax:**
```
	ASR RD, RN, RM
	ASR RD, RN, #IMM5
```
**Operands:**
```
	RD: Destination register
	RN: First operand register
	RM: Second operand register
	IMM5: 5 bit unsigned immediate shift value
```
**Flags Updated:**
```
	AN
	AZ
	AV
	AC
```
**Operation:**
```
	RD = RN >>> RM (or IMM5)
	AN = RD[31]
	AV = 0
	AC = 0
	AZ = (RD[31:0] == 0);
```

**Example:**
```
	ASR R0,R1,R2     // R0 = R1 >>> R2
	ASR R0,R1,#4     // R0 = R1 >>> 4
```

\newpage

## BCOND ##

The branch instruction causes a branch to a target address based on the evaluation of one of 16 condition codes. The instruction allows conditional and unconditional branching forwards and backwards relative to the current value of the program counter. All branches are relative with respect to the current program counter. Valid condition codes include EQ, NE, GT, GTEU, LTEU, LTU, GT, GTE, LT, LTE, BEQ, BNE, BLT, BLTE, L, "empty" :

**Syntax:**
```
	BCOND SIMM8
	BCOND SIMM24
```

**Operands:**
```
	COND: One of 15 conditions to evaluate before performing the jump(branch).
	SIMM8: Signed 8 bit immediate value to add to current PC.
	SIMM24: Signed 24 bit immediate value to add to current PC.
```

**Flags Updated:**
```
	None
```

**Operation:**
```
	IF (Passed)COND)) then
	PC = PC +(SignExtend(SIMM) << 1)
```

**Examples:**

```
	    MOV  R0,#10   // initialize loop
loop:	FADD R3,R2,R1 // some operation
		SUB R0,R0,#1  // decrement loop counter
		BNE loop      // loop while R0 is not equal to 0
```

\newpage

## BL ##

The branch instruction causes the upcoming PC to be saved in the LR register followed by a branch to a target. The branch is relative with respect to the current program counter.

**Syntax:**
```
	BL SIMM8
	BL SIMM24
```

**Operands:**
```
	SIMM8: Signed 8 bit immediate value to add to current PC.
	SIMM24: Signed 24 bit immediate value to add to current PC.
```

**Flags Updated:**
```
	None
```

**Operation:**
```
	LR=next PC;
	PC = PC +(SignExtend(SIMM) <<1)
```

**Example:**
```
	BL MY_FUNC  // save PC to LR register and jump to MY_FUNC address
```

\newpage

## BITR ##

The BITR instruction reverses the order of the bits in the operand RN, the LSB becomes the MSB and the MSB becomes the LSB, etc. and places the result in register RD.

**Syntax:**
```
	BITR  RD, RN
```

**Operands:**
```
	RD:	Destination register
	RN:	First operand register
```

**Flags Updated:**
```
	AN
	AZ
	AV
	AC
```
**Operation:**
```
	for(i=0;i<32;i=i+1){
		RD[i]=RN[31-i];
	}
	AZ = (RD[31:0] == 0)
	AN = RD[31]
	AV = 0
	AC = 0
```

**Example:**
```
	MOV 	R0,%low(0xx87654321)	// set register value
	MOVT	R0,%high(0xx87654321)	//
	BITR    R1,R0 			        // R1 gets 0x84C2A6B1
```

\newpage

## BKPT

The BKPT instruction causes the processor to halt and wait for external inputs. Processor operation is resumed by writing to the DEBUGCMD register. 

**Syntax:**
```
	BKPT
```
**Operands:**
```
	None
```
**Flags Updated:**
```
	None
```

**Operation:**
```
	PC=PC
	DEBUGSTATUS=halted	
```

**Example:**
```
	ADD R0,R1,R2   // regular instruction
	BKPT           // breakpoint instruction 
```


\newpage

## EOR ##
The EOR instruction logically XORs the operand in register RN with the operand in register RM and places the result in register RD.

**Syntax:**
```
	EOR RD, RN, RM
```

**Operands:**
```
	RD:	Destination register
	RN:	First operand register
	RM:	Second operand register
```

**Flags Updated:**
```
	AN
	AZ
	AV
	AC
```

**Operation:**
```
	RD 	= RN ^ RM
	AN 	= RD[31]
	AV 	= 0
	AC  = 0
	AZ  = (RD[31:0] == 0)
```

**Example:**
```
	EOR R2,R0,R1	// R2 = R0 ^ R1
```

\newpage

## FABS ##

The FABS instruction finds the absolute value of a floating-point value in register value RN and and places the result in register RD. The operation updates the floating-point arithmetic flags.

**Syntax:**
```
	FABS RD, RN
```

**Opreands:**
```
	RD			Destination register
	RN			First operand register
```

**Flags Updated:**
```
	BN
	BZ
	BV
	BIS
	BUS
	BVS
```

**Operation:**
```
	RD  = abs(RN)
	BN  = RD[31]
	BZ  = (RD[30:0]==0)
	BV  = (UnbiasedExponent(RD) > 127)
	BUS = (UnbiasedExponent(RD) < -126)
	BIS = (RM == NAN | RN == NAN)
	BVS = BVS | BV
```

**Example:**
```
	FABS R2,R1   // R2 = abs(R1)
```

\newpage

## FADD ##

The FADD instruction adds two 32-bit floating-point operands together and places the result in a third register. The operation updates the floating point arithmetic flags.

**Syntax:**
```
	FADD RD, RN, RM
```
**Operands:**
```
	RD	Destination register
	RN	First operand register
	RM	Second operand register
```
**Flags Updated:**
```
	BN
	BZ
	BV
	BIS
	BUS
	BVS
```

**Operation:**
```
	RD  = RN + RM
	BN  = RD[31]
	BZ  = (RD[30:0]==0)
	BV  = (UnbiasedExponent(RD) > 127)
	BUS = (UnbiasedExponent(RD) < -126)
	BIS = (RM == NAN | RN == NAN)
	BVS = BVS | BV
```
**Example:**
```
	FADD R2,R1,R0    // R2 = R1 + R0
```

\newpage

## FIX ##

These FIX instruction converts the floating-point RN operand to a 32-bit signed integer result. The floating-point operand is rounded or truncated. The result is placed in register RD. A NAN input returns a floating-point all ones result. All underflow results, or input which are zero or denormal, return zero. Overflow result always returns a signed saturated result: 0x7FFFFFFF for positive, and 0x80000000 for negative.

**Syntax:**
```
	FIX RD, RN
```

**Operands:**
```
	RD	Integer result register
	RN	Floating-point input operand register
```

**Flags Updated:**
```
	BN
	BZ
	BV
	BIS
	BUS
	BVS
```

**Operation:**
```
	RD  = fix(RN)
	BN  = RD[31]
	BZ  = (RD[30:0]==0)
	BV  = (UnbiasedExponent(RD) > 127)
	BUS = (UnbiasedExponent(RD) < -126)
	BIS = (RM == NAN | RN == NAN)
	BVS = BVS | BV
```

**Example:**
```
	FIX R2,R1   // R2 = fix(R1)
```

\newpage

## FLOAT ##

The FLOAT instructions convert the fixed-point operand in RN to a floating-point result. The final result is placed in register RD. Rounding is to nearest (IEEE) or by truncation, to a 32-bit boundary, as defined by the rounding mode. Overflow returns ±infinity (round-to-nearest),underflow returns ±zero.

**Syntax:**
```
	FLOAT RD, RN
```

**Operands:**
```
	RD	Floating point result register
	RN	Integer input operand register
```

**Flags Updated:**
```
	BN
	BZ
	BV
	BIS
	BUS
	BVS
```

**Operation:**
```
	RD  = float(RN)
	BN  = RD[31]
	BZ  = (RD[30:0]==0)
	BV  = (UnbiasedExponent(RD) > 127)
	BUS = (UnbiasedExponent(RD) < -126)
	BIS = (RM == NAN | RN == NAN)
	BVS = BVS | BV
```

**Example:**
```
	FLOAT R2,R1   // R2 = float (R1)
```

\newpage

## FMADD ##

The FMADD instruction multiplies one floating-point register value (RM) with a second floating-point register value (RN), adds the result to a third register(RD) and places the result in register RD. The operation updates the floating-point arithmetic flags.

**Syntax:**
```
	FMADD RD, RN, RM
```

**Operands:**
```
	RD:	Accumulation register for fused multiply add instruction (input/output) 
	RN:	First operand register
	RM:	Second operand register
```

**Flags Updated:**
```
	BN
	BZ
	BV
	BIS
	BUS
	BVS
```

**Operation:**
```
	RD  = RD + RN * RM
	BN  = RD[31]
	BZ  = (RD[30:0]==0)
	BV  = (UnbiasedExponent(RD) > 127)
	BUS = (UnbiasedExponent(RD) < -126)
	BIS = (RM == NAN | RN == NAN)
	BVS = BVS | BV
```

**Example:**
```
	FMADD R2,R1,R0 // R2 = R2 + R1 * R0
```

\newpage

## FMUL ##

**Description:**
The FMUL instruction multiplies one floating-point register value (RM) with a second floating-point register value (RN) and places the result in register RD. The operation updates the floating-point arithmetic flags.

**Syntax:**
```
	FMUL RD, RN, RM
```
**Operands:**
```
	RD			Destination register
	RN			First operand register
	RM			Second operand register
```

**Flags Updated:**
```
	BN
	BZ
	BV
	BIS
	BUS
	BVS
```

**Operation:**
```
	RD  = RN * RM
	BN  = RD[31]
	BZ  = (RD[30:0]==0)
	BV  = (UnbiasedExponent(RD) > 127)
	BUS = (UnbiasedExponent(RD) < -126)
	BIS = (RM == NAN | RN == NAN)
	BVS = BVS | BV
```

**Example:**
```
	FMUL R2,R1,R0   // R2 = R1 + R0
```

\newpage

## FMSUB ##

The FSUB instruction multiplies one floating-point register value (RM) with a second floating-point register value (RN), subtracts the result from a third register(RD) and writes and places the result in register RD. The operation updates the floating-point arithmetic flags.

**Syntax:**
```
	FMSUB RD, RN, RM
```

**Operands:**
```
	RD	Accumulation register for fused multiply sub instruction
	RN	First operand register
	RM	Second operand register
```

**Flags Updated:**
```
	BN
	BZ
	BV
	BIS
	BUS
	BVS
```

**Operation:**
```
	RD  = RD - RN * RM
	BN  = RD[31]
	BZ  = (RD[30:0]==0)
	BV  = (UnbiasedExponent(RD) > 127)
	BUS = (UnbiasedExponent(RD) < -126)
	BIS = (RM == NAN | RN == NAN)
	BVS = BVS | BV
```

**Example:**
```
	FMSUB R2,R1,R0    // R2 = R2 - R1 * R0
```

\newpage

## FSUB ##

The FSUB instruction subtracts one floating-point register value(RM) from another floating 	point register value(RN) and places the result in a third destination register(RD). The operation updates the floating-point arithmetic flags.

**Syntax:**
```
	FSUB RD, RN, RM
```

**Operands:**
```
	RD	Destination register
	RN	First operand register
	RM	Second operand register
```

**Flags Updated:**
```
	BN
	BZ
	BV
	BIS
	BUS
	BVS
```

**Operation:**
```
	RD  = RN - RM
	BN  = RD[31]
	BZ  = (RD[30:0]==0)
	BV  = (UnbiasedExponent(RD) > 127)
	BUS = (UnbiasedExponent(RD) < -126)
	BIS = (RM == NAN | RN == NAN)
	BVS = BVS | BV
```

**Example:**
```
	FSUB R2,R1,R0  // R2 = R1 - R0
```

\newpage

## GID ##

Disables all interrupts by setting bit[1] of the status register. To safely enable interrupts again, use the GIE instruction.

**Syntax:**
```
	GID
```

**Flags Updated:**
```
	None
```

**Operation:**
```
	STATUS[1]=1
```

**Example:**
```
	GID		// sets STATUS[1]=1
```

\newpage

## GIE ##

Enables all interrupts in ILAT register, dependent on the per bit settings in the IMASK register.

**Syntax:**
```
	GIE
```

**Flags Updated:**
```
	None
```

**Operation:**
```
	STATUS[1]=0
```

**Example:**
```
	GIE		// sets STATUS[1]=0
```

\newpage

## IADD ##

The IADD instruction adds two 32-bit signed integer operands together and places the result in a third register.

**Syntax:**
```
	IADD RD, RN, RM
```

**Operands:**
```
	RD:	Destination register
	RN:	First operand register
	RM:	Second operand register
```


**Flags Updated:**
```
	BN
	BZ
```

**Operation:**
```
	RD =RN + RM
	BN = RD[31]
	BZ = (RD[31:0] == 0)
```					

**Example:**
```
	IADD R2, R1, R0 // R2 = R1 + R0
```

\newpage

## IMADD ##

The IMADD instruction multiplies one signed integer register value (RM) with a second signed integer register value (RN), adds the result to a third register(RD) and writes and places the result in register RD.

**Syntax:**
```
	IMADD RD, RN, RM
```

**Operands:**
```
	RD:	Accumulation register
	RN:	First operand register
	RM:	Second operand register
```


**Flags Updated:**
```
	BN
	BZ
```

**Operation:**
```
	RD = RD + RN * RM
	BN = RD[31]
	BZ = (RD[31:0] == 0)
```			

**Example:**
```
	IMADD R2, R1, R0   // R2 = R2 + R1 * R0
```

\newpage

## IMSUB ##

The IMSUB instruction multiplies one signed integer register value (RM)	with a second signed integer register value (RN), subtracts the result to a third register (RD) and writes and places the result in register RD.

**Syntax:**
```
	IMSUB RD, RN, RM
```

**Operands:**
```
	RD:	Accumulation register
	RN:	First operand register
	RM:	Second operand register
```
**Flags Updated:**
```
	BN
	BZ
```

**Operation:**
```
	RD = RD - RN * RM
	BN = RD[31]
	BZ = (RD[31:0] == 0)
```			

**Example:**
```
	IMSUB R2, R1, R0 // R2 = R2 - R1 * R0
```

\newpage

## IMUL ##

The IMUL instruction multiplies two signed integer register value (RN and RM ) and places the result in register RD.

**Syntax:**
```
	IMUL RD, RN, RM
```
**Operands:**
```
	RD:	Destination register
	RN:	First operand register
	RM:	Second operand register
```

**Flags Updated:**
```
	BN
	BZ
```

**Operation:**
```
	RD = RN * RM
	BN = RD[31]
	BZ = (RD[31:0] == 0)
```

**Example:**
```
	IMUL R2, R1, R0   // R2 = R1 * R0
```

\newpage

## ISUB ##

The ISUB instruction subtracts one signed integer register value (RM) from another signed integer register value (RN) and places the result in a third destination register (RD).

**Syntax:**
```
	ISUB RD, RN, RM
```

**Operands:**
```
	RD:	Destination register
	RN:	First operand register
	RM:	Second operand register
```

**Flags Updated:**
```
	BN
	BZ
```

**Operation:**
```
	RD = RN - RM
	BN = RD[31]
	BZ = (RD[31:0] == 0)
```			

**Example:**
```
	ISUB R2, R1, R0   // R2 = R1 - R0
```

\newpage

## IDLE ##

The instruction places the core in an idle state. The PC is halted and no more instructions are fetched until an interrupt wakes up the core.

**Syntax:**
```
	IDLE
```

**Flags Updated:**
```
	None
```

**Operation:**
```
	STATUS[0]=0
	while(!ILAT){
		PC=PC
	}
```
**Example:**
```
	IDLE	//  puts core in idle state
```

\newpage

## JALR ##

The register-and-link jump instruction causes an unconditional jump to absolute address contained in Rn. Before jumping to the compute address, the next PC is saved in the link register (LR). The instruction allows for efficient support for subroutines and allows for jumping to any address supported by the architecture.

**Syntax:**
```
	JALR RN
```

**Operands:**
```
	RN: 	Register containing absolute jump address
```

**Flags Updated:**
```
	None
```

**Operation:**
```
	LR = PC;
	PC = RN;
```

**Example:**
```
	MOV R0,#labA	//move label into register
	JALR R0		    //save PC in LR and jump to labA
```

\newpage

## JR ##

The register jump instruction causes an unconditional jump to the absolute address in register RN. This allows for jumping to any address supported by the architecture.

**Syntax:**
```
	JR RN
```

**Operands:**
```
	RN:	Register containing absolute jump address
```

**Flags Updated:**
```
	None
```

**Flags Updated:**
```
	None
```

**Operation:**
```
	PC = RN
```

**Example:**
```
	MOV R0,#label	//move label into register
    JR R0;		    //jump to label
```

\newpage

## LDR (DISPLACEMENT) ##

The displacement mode LDR instruction loads a data from memory to a general-purpose register (RD). The memory address is the sum of the base register value (RN) and an immediate index offset. The base register is not modified by the load operation. The instruction supports loading of byte, short, word, and double data. Data must be aligned in memory according to the size of the data. For double data loads, only even RD registers can be used.

**Syntax:**
```
	LDRSIZE RD, [RN, #+IMM3]
	LDRSIZE RD, [RN, #+/-IMM11]
```

**Operands:**
```
	SIZE	Byte(B), Half(H), Word(), or Double(D)
	RD	    Destination register for the data loaded from memory.
	RN	    Register containing the base address for the load instruction.
	IMM3 	Usigned 3 bit offset value left shifted by SIZE.
	IMM11	Usigned 11 bit offset value left shifted by SIZE.  
	'-'	    Specifies that immediate value should be subtracted from the base.
```

**Flags Updated:**
```
	None
```

**Operation:**
```
	address= RN +/- IMM << (log2(size_in_bits/8)) ;
	RD=memory[address];
```

**Example:**
```
	LDRB R2,[R1] 	    // R2=mem[R1+0], loads unsigned byte
	LDRB R2,[R1,#1]     // R2=mem[R1+1], loads unsigned byte
    LDRH R2,[R1,#1] 	// R2=mem[R1+2], loads unsigned half
	LDR  R2,[R1,#1] 	// R0=mem[R2+4], loads unsigned word
	LDRD R2,[R1,#1] 	// R0=mem[R2+8], loads unsigned double
```

\newpage

## LDR (INDEX) ##

The index mode LDR loads data from memory to a general-purpose register (RD). The memory address is the sum of the base register (RN) and an index register (RM). The base register is not modified by the load operation. The instruction supports loading of byte, short, word, and double data. Data must be aligned in memory according to the size of the data. For double data loads, only even RD registers can be used.

**Syntax:**
```
	LDRSIZE RD, [RN, +/-RM]
```
**Operands:**
```
	SIZE  Byte(B), Half(H), Word(), or Double(D) option
	RD	  Destination register for the word loaded from memory
	RN	  Register containing the base address for the load instruction
	RM	  Register containing the index address to add to the base address
	'-'   Specifies that RM should be subtracted from RN
```

**Flags Updated:**
```
	None
```

**Operation:**
```
	address= RN +/- RM;
	RD=memory[address];
```

**Example:**
```
	LDRB R2,[R1,R0]     // R2=mem[R1+R0], loads unsigned byte
    LDRH R2,[R1,R0] 	// R2=mem[R1+R0], loads unsigned half word
	LDR  R2,[R1,R0] 	// R0=mem[R2+R0], loads unsigned word
	LDRD R2,[R1,R0] 	// R0=mem[R2+R0], loads unsigned double
```	

\newpage

## LDR (INDEX-POSTMODIFY) ##

The post-modify mode LDR loads data from memory to a general purpose register (RD). The memory address used is the value of the base register (RN). After loading the data from memory, the base value register (RN) is updated with the sum of the initial base value and the index value (RM). The instruction supports loading of byte, short, word, and double data. Data must be aligned in memory according to the size of the data. For double data loads, only even numbered RD registers can be used.

**Syntax:**
```
	LDRSIZE RD, [RN], +/-RM
```

**Operands:**
```
	SIZE	Byte(B), Half(H), Word(), or Double(D)
	RD	    Destination register for the word loaded from memory.
	RN	    Register containing the base address for the load instruction.
	RM	    Register containing the index address for the load instruction.
	'-'	    Specifies that RM should be subtracted from RN
```
**Flags Updated:**
```
	None
```

**Operation:**
```
	address = RN;
	RD      = memory[address];
	RN      = RN +/- RM;
```

**Example:**
```
	LDRH R31,[R2],R1 	// loads short, updates R2
	LDRD R0,[R2],R1 	// loads double, updates R2
```

\newpage

## LDR (DISPLACEMENT-POSTMODIFY) ##

The post-modify mode LDR allows a word to be loaded from memory to a general-purpose register (RD). The memory address used is the value of the base register (RN). After loading the data from memory, the base value register (RN) is updated with the sum/subtraction of the initial base value and the immediate index value (IMM11). The instruction supports loading of byte, short, word, and double data. Data must be aligned in memory according to the size of the data. For double data loads, only even RD registers can be used.

**Syntax:**
```
	LDRSIZE RD, [RN], #+/-IMM11
```

**Operands:**
```
	SIZE	Byte(B), Half(H), Word(), or Double(D)
	RD	    Destination register for the data loaded from memory
    RN	    Register containing the base address for the load instruction
	IMM11	Usigned 11 bit offset value left shifted by 0, 1, 2 or 3 depending on SIZE.
	'-'	    Specifies that RM should be subtracted from RN
```

**Flags Updated:**
```
	None
```

**Operation:**
```
	address = RN;
	RD      = memory[address];
	RN      = RN +/- IMM11 << (log2(size_in_bits/8));
```

**Example:**
```
	LDRH R31,[R2],#1 	// loads half-word, updates R2 address
	LDRD R0,[R2],#4 	// loads double, updates R2 address
```

\newpage

## LSL ##

The LSL instruction performs a logical shift left of the RN operand based on  5 bit unsigned value (IMM5 or RM) Zeros fill the bit positions vacated by the shifted RN word and the result is placed in register RD.

**Syntax:**
```
	LSL RD, RN, RM
	LSL RD, RN, #IMM5
```

**Operands:**
```
	RD	  Destination register
	RN	  First operand register
	RM	  Second operand register
	IMM5  Five bit unsigned immediate value
```

**Flags Updated:**
```
	AN
	AZ
	AV
	AC
```

**Operation:**
```
	RD = RN << RM (or IMM5)
	AN 	= RD[31]
	AV 	= 0
	AC  = 0
	AZ  = (RD[31:0] == 0)
```

**Example:**
```
	LSL	R0,R1,R2	// R0 = R1 << R2
	LSL R0,R1,#3	// R0 = R1 << 3
```

\newpage

## LSR ##

The LSR instruction performs a logical shift right of the RN operand based on the 5 bi unsigned shift value (IMM5 or RM). Zeros fill the bit positions vacated by the shifted RN word. The result is placed in register RD.

**Syntax:**
```
	LSR RD, RN, RM
	LSR RD, RN, #IMM5
```

**Syntax:**
```
	RD	  Destination register
	RN	  First operand register
	RM	  Second operand register
	IMM5  Five bit unsigned immediate value
```


**Flags Updated:**
```
	AN
	AZ
	AV
	AC
```


**Operation:**
```
	RD = RN >> OP2
	AN 	= RD[31]
	AV 	= 0
	AC  = 0
	AZ  = (RD[31:0] == 0)
```

**Example:**
```
	LSR	R0,R1,R2	// R0 = R1 >> R2
	LSR R0,R1,#3	// R0 = R1 >> 3
```

\newpage

## MBKPT ##

The MBKPT instruction sends a halt signal to all cores in the system. The propagation of the MBKPT signal across the chip can be blocked by setting the appropriate edge bits in the MESHCONFIG register.

**Syntax:**
```
	MBKPT
```

**Flags Updated:**
```
	None
```

**Operation:**
```
	for (i=0;i<all_cores;i++){
		DEBUGSTATUS[0]=1
	}
```

\newpage

## MOVCOND ##

The MOV instruction conditionally copies the contents of the source register (RN) into the destination register (RD). The condition codes are the same as those of the conditional branch instructions. A MOV without any condition field moves register RN to register RD regardless of the state of the flags.

**Syntax:**
```
	MOVCOND RD, RN
```

**Operands:**
```
	COND	One of the 15 condition codes. If COND is " ", copy is unconditional.
	RD	    Destination register
	RN	    Source register for move operation.
```

**Flags Updated:**
```
	None
```

**Operation:**
```
	IF (COND==TRUE) then
	RD = RN
```

**Example:**
```
	MOVEQ	R2,R0 // copies R0 to R2 if EQ is TRUE
	MOV		R3,R1 // copies R1 to R3
```

\newpage

## MOV (IMMEDIATE) ##

**Description:**
The MOV immediate instruction copies an unsigned immediate constant in the destination register (RD).

**Syntax:**
```
	MOV RD, #IMM8
	MOV RD, #IMM16
```

**Operands:**
```
	RD	    Destination register for move operation
	IMM8	8-Bit unsigned immediate value
	IMM16	16-Bit unsigned immediate value
```

**Flags Updated:**
```
	None
```

**Operation:**
```
	RD=IMM
```

**Example:**
```
	MOV R0,#25		// Sets R0 to 25
```

\newpage

## MOVT (IMMEDIATE) ##

The MOVT immediate instruction copies an unsigned immediate constant in the destination register (RD).

**Syntax:**
```
	MOVT RD, #IMM16;
```

**Operands:**
```
	RD		Destination register for move operation.
	IMM16	16-Bit unsigned immediate value.
```

**Flags Updated:**
```
	None
```

**Operation:**
```
	RD=Rd(low) | (IMM16 << 16)
```

**Example:**
```
	MOV R0,%low(0x90000000)		// sets lower 16 bits to value, zeroes out upper bits
	MOVT R0,%high(0x90000000)	// sets upper 16-bits, keeps lower 16 bits intact
```

\newpage

## MOVFS ##

The MOVFS instruction copies a value from a special core control register to a general-purpose register.

**Syntax:**
```
	MOVFS RD, MMR;
```

**Operands:**
```
	MMR		Memory mapped "special" register to copy
	RD		General-purpose destination register for move operation
```

**Flags Updated:**
```
	None
```

**Operation:**

```
	RD = MMR
```

**Example:**
```
	MOVFS R0, CONFIG	// copies CONFIG value to R0
```

\newpage

## MOVTS ##

**Description:**
The MOVTS instruction copies a value from a general purpose register file to a core control registers.

**Syntax:**
```
	MOVTS MMR, RN
```

**Operands:**
```
	MMR	Special Register to copy value into
	RN	General-purpose source register for move operation
```

**Flags Updated:**
```
	None
```

**Operation:**
```
	MMR = RN
```

**Example:**
```
	MOVTS CONFIG,R0	// copies R0 to CONFIG register
```

\newpage

## NOP ##

The instruction does nothing, but holds an instruction slot.

**Syntax:**
```
	NOP
```

**Flags Updated:**
```
	None
```

**Operation:**
```
	No operation
```

**Example:**
```
	NOP		// padding instruction
```

\newpage
`
## ORR ##

The ORR instruction logically 'OR's the RN and RM operands and places the result in register RD.

**Syntax:**
```
	ORR RD, RN, RM
```

**Operands:**
```
	RD	Destination register
	RN	First operand register
	RM	Second operand register
```

**Flags Updated:**
```
	AN
	AZ
	AV
	AC
```

**Operation:**
```
	RD 	= RN | RM
	AN 	= RD[31]
	AV 	= 0
	AC  = 0
	AZ  = (RD[31:0] == 0)
```

**Example:**
```
	ORR R2,R1,R0	// R2 = R1 | R0
```

\newpage

## RTI ##

The RTI instruction causes the address in the IRET register to be restored to the PC register, a clearing of the corresponding bit in the IPEND register. All actions are carried out as a single atomic operation.

**Syntax:**
```
	RTI;
```

**Flags Updated:**
```
	None
```

**Operation:**
```
	IPEND[i]=0; where i is the current interrupt level being serviced
	STATUS[1]=0;
	PC=IRET;
	<execute instruction at PC>
```

**Example:**
```
	RTI        // PC = IRET
```

\newpage

## RTS (alias instruction)

This is an alias instruction for JR LR. When branching to a subroutine using the BL or JALR instruction, the next instruction PC is saved in register R14 (LR). It is used to return from a subroutine/function in the program.

**Syntax:**
```
	RTS
```

**Flags Updated:**
```
	None
```

**Operation:**
```
	PC = R14;
```

**Example:**
```
	RTS	// sets PC=R14
```

\newpage

## SUB ##

The SUB instruction subtracts an integer register value (OP2) from an integer value in register (RN). The OP2 operand can be an immediate value (SIMM3 | SIMM11) or register value (RM).

**Syntax:**
```
	SUB RD, RN, RM
	SUB RD, RN, #SIMM3
	SUB RD, RN, #SIMM11
```

**Operands:**
```
	RD: Destination register
	RN: First operand register
	RM: Second operand register
	SIMM3: 3 bit signed immediate value
	SIMM11: 11 bit signed immediate value
```

**Flags Updated:**
```
	AN
	AZ
	AV
	AC
```

**Operation:**
```
	RD = RN - OP2
	AN = RD[31];
	AC = CARRY OUT;
	AZ = (RD[31:0] == 0);
	OV = (( RD[31] & ~RM[31] & ~RN[31] ) | ( ~RD[31] & RM[31] & RN[31] ))
	AVS = AVS | AV;
```

**Example:**
```
	SUB R2,R1,R0	// R2 = R1 + R0
```

\newpage

## STR (DISPLACEMENT) ##

The displacement mode STR stores a word to memory from a general purpose register (RD). The memory address is the sum of the base register value (RN) and an immediate index offset. The base register is not modified by the store operation. The instruction supports storing of byte, short, word, and double data. Data must be aligned in memory according to the size of the data. For double data stores, only even RD registers can be used.

**Syntax:**
```
	STRSIZE RD, [RN, #+IMM3]
	STRSIZE RD, [RN, #+/-IMM11]
```


**Operands:**
```
	SIZE	Byte(B), Half(H), Word(), or Double(D)
	RD	    Destination register for the data loaded from memory.
	RN	    Register containing the base address for the load instruction.
	IMM3 	Usigned 3 bit offset value left shifted by SIZE.
	IMM11	Usigned 11 bit offset value left shifted by SIZE.  
	'-'	    Specifies that immediate value should be subtracted from the base. 
```

**Flags Updated:**
```
	None
```

**Operation:**
```
	address= RN +/- IMM << (log2(size_in_bits/8));
	memory[address]=RD;
```

**Example:**
```
	STRB	R31,[R2,#1]	  // stores R31 byte to addr in R2
	STR 	R0,[R2,#0x4]  // stores R0 word to addr in R2
```

## STR (INDEX) ##

The index mode STR stores a word to memory from a general-purpose register (RD). The memory address is the sum of a base register (RN) and an index register.(RM) The base register is not modified by the store operation. The instruction supports loading of byte, short, word, and double data. Data must be aligned in memory according to the size of the data. For double data loads, only even numbered RD registers can be used.

**Syntax:**
```
	STRSIZE RD, [RN, +/-RM]
```

**Operands:**
```
	SIZE	Byte(B), Half(H), Word(), or Double(D)
	RD	    Destination register for the data loaded from memory.
	RN	    Register containing the base address for the load instruction.
	RM	    Register containing the index address for the store instruction.
	'-'	    Specifies that immediate value should be subtracted from the base. 
```
**Flags Updated:**
```
	None
```

**Operation:**
```
	address= RN +/- RM;
	memory[address]=RD;
```

**Example:**
```
	STRB	R31,[R2,R1]	// stores byte to addr in R2
	STR 	R0,[R2,R1]	// stores word to addr in R2
```

\newpage

## STR (POSTMODIFY) ##

The postmodify STR instruction stores a word in memory from a general purpose register (RD). The memory address used is the value of the base register (RN). After storing the the data in memory, the base value register (RN) is updated with the sum of the initial base value(RN) and the index value in (RM). The instruction supports loading of byte, short, word, and double data. Data must be aligned in memory according to the size of the data. For double data loads, only even RD registers can be used.

**Syntax:**
```
	STRSIZE RD, [RN], +/-RM
```

**Operands:**
```
	SIZE	Byte(B), Half(H), Word(), or Double(D)
	RD	    Source register for the word stored to memory.
	RN	    Register containing the base address for the store instruction.
	RM	    Register containing the index address for the store instruction.
	'-'		Specifies that RM should be subtracted from RN
```

**Flags Updated:**
```
	None
```

**Operation:**
```
	address= RN;
	memory[address]=RD;
	RN=RN +/- RM;
```

**Example:**
```
	STRH	R31,[R2], R1  // stores half word to addr in R2
	STRD	R0,[R2], R3	  // stores double to addr in R2
```

\newpage

## STR (DISPLACEMENT-POSTMODIFY) ##

The postmodify STR instruction stores a word in memory from a general purpose register (RD). The memory address used is the value of the base register (RN). After storing the the data in memory, the base value 	register (RN) is updated with the sum of the initial base value(RN) 	and the index value in (IMM11). The instruction supports loading of byte, short, word, and double data. Data must be aligned in memory according to the size of the data. For double data loads, only even RD registers can 	be used.

**Syntax:**
* STRSIZE RD, [RN], +/-IMM11

**Operands:**

* SIZE	Byte(B), Half(H), Word(), or Double(D)
* RD	Source register for the data stored to memory
* RN	Register containing the base address for the load instruction
* IMM11	Usigned 11 bit offset value left shifted by 0, 1, 2 or 3 depending on SIZE.  
* '-'	Specifies that RM should be subtracted from RN

**Flags Updated:**
* None

**Operation:**
```
address= RN;
memory[address]=RD;
RN=RN +/- IMM11 << (log2(size_in_bits/8));
```

**Example:**
```
STRH	R31,[R2],#2	;stores half word to addr in R2
STRD	R0,[R2],#1	;stores double to addr in R2
```

\newpage

## SYNC ##

The SYNC instruction sends an interrupt to all processors SYNC input signals connected to the core asserting the SYNC.

**Syntax:**
```
	SYNC
```

**Flags Updated:**
```
	None
```

**Operation:**
```
	Sets the ILAT[0] of all cores within a work group to “1”.
```

\newpage

## TRAP ##

The TRAP instruction causes the processor to halt and wait for external inputs. The immediate field within the instruction opcode is not processed by the hardware but can be used by software such as a debugger or operating system to find out the reason for the TRAP instruction.

**Syntax:**
```
	TRAP IMM5
```

**Operands:**
```
	IMM5		An unsigned 5 bit value indicating what action to take.
```

**Codes:**

|IMM5   |  Description                                             |
|-------|----------------------------------------------------------|
| 0-2 	| reserved                                                 |
| 3 	| program exit indicator                                   |
| 4 	| indicates success, can be used to indicate “test passed” |
| 5 	| indicates assertion, test “failed”                       |
| 6 	| reserved                                                 |
| 7 	| initiates system call                                    |

In the case of TRAP 7, a system call is initiated. In this case, a sub argument needs to be passed in R3 indicating what further action to take, based on the following table. Arguments to the system calls are passed in Register R0-R2.

|Function     |  R0               |  R1            |  R2           | R3 |
|-------------|-------------------|----------------|---------------|----|
| File Open   | Path Name Pointer | 0              | 0             | 2  |
| File Close  | File Descriptor   | 0              | 0             | 3  |
| Read        | File Descriptor   | Buffer Pointer | Buffer Length | 4  |
| Write       | File Descriptor   | Buffer Pointer | Buffer Length | 5  |
| File Lseek  | File Descriptor   | File Offset    | Whence        | 6  |
| File Unlink | Path Name Pointer | 0              | 0             | 7  |
| Fstat       | Path Name Pointer | Status Pointer | 0             | 10 |
| Stat        | File Descriptor   | Status Pointer | 0             | 15 |

**Flags Updated:**
```
	None
```

**Operation:**
```
	Halts processor //puts it in debug halt mode
```
**Example:**
```
	TRAP 0	// Halt processor to prepare for write
```

\newpage

## TESTSET ##

The TESTSET instruction does an atomic “test-if-not-zero”, then conditionally writes a value to any memory location within the Epiphany architecture. The absolute address used for the test and set instruction must be located within the on-chip local memory and must be greater than 0x00100000. The instruction tests the value of a specific memory location and if that value is zero, writes in a new value from the local register file. If the value at the memory location was already set to a non-zero value, then the value is returned to the register file, but the memory location is left unmodified.

**Syntax:**
```
	TESTSET RD, [RN, +/-RM];
```

**Operands:**
```
	SIZE	Byte(B), Half(H), Word(), or Double(D)
	RD	    Source register for the word stored to memory.
	RN	    Register containing the base address for the store instruction.
	RM	    Register containing the index address for the store instruction.
	'-'		Specifies that RM should be subtracted from RN
```

**Flags Updated:**
```
	None
```

**Operation:**
```
	if ([RN+/-RM]) {
		RD= ([RN+/-RM])
	}
	else{
	([RN+/-RM])=RD
	RD=0;
	}
```

**Example:**
```
/*example of trying to lock on value in memory*/
loop: MOV R2, R3          // value to write
	  TESTSET R2, [R0, R1]// test-set
      SUB R2, R2, #0      // check result
     BNE loop             // keep trying
```

\newpage

## WAND ##

The WAND instruction sets flag bit [3] in the STATUS register and moves	on to the next instruction. When all cores in a group have set their respective wand bits, then an interrupt is generated on the WAND interrupt line. The instruction can be used to create fast distributed barriers.

**Syntax:**
```
	WAND
```

**Flags Updated:**
```
	None
```

**Operation:**
```
	STATUS[3]=1;
```

**Example:**
```
	WAND;
	IDLE; /*wait for every core in the group to execute WAND*/
```

\newpage
