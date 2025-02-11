
Appendix C: Application Binary interface (EABI)
============================================================================

This chapter is intended for library developers and users who develop custom assembly routines that can be called from the Epiphany C-compiler. The Epiphany ABI (EABI) is an agreement between developers that ensures interoperability between different libraries. The EABI defines a common procedure call standard and restrictions on data types and alignment.

Some of the details defined by the ABI include:

* How the program (caller) should set up the machine state before calling a procedure.
* How the called procedure (callee) should preserve program state across the call. The right of the called procedure to alter the program state of its caller.

Conformance to this standard requires that:
* At all times, stack limits and basic stack alignment are observed.
* The routines of publicly visible interface conform to the procedure call standard.
* The data elements of publicly visible interface conform to the data layout rules. Data elements include: parameters to routines named in interfaces, static data, and all data addressed by pointer values across interfaces.


## Native Data Types

Table 8.1 shows the fundamental data types supported by the Epiphany architecture. Memory can be considered as an array of bytes, with each byte separately addressable by the software. The memory layout accepted is little-endian data. The least significant bit of an object is always bit 0. Words are defined as 32 bits, half-words as 16-bits and double words as 64-bits.

Table: Native Types

| C-Type             |Machine Type        |Bytes| Restriction                 |
|--------------------|--------------------|-----|-----------------------------|
| char               |Signed byte         | 1   |                             |
| unsigned char      |Unsigned byte       | 1   |                             |
| signed char        |Signed byte         | 1   |                             |
| signed short       |Signed half-word    | 2   | Must be half-word aligned   |
| unsigned short     |Unsigned half-word  | 2   | Must be half-word aligned   |
| signed int         |Signed word         | 4   | Must be word aligned        |
| unsigned int       |Unsigned word       | 4   | Must be word aligned        |
| signed long        |Signed word         | 4   | Must be word aligned        |
| unsigned long      |Unsigned word       | 4   | Must be word aligned        |
| signed long   long |Signed double word  | 8   | Must be double-word aligned |
| unsigned long long |Unsigned double word| 8   | Must be double-word aligned |
| float              |32b IEEE754         | 4   | Must be word aligned        |
| double             |64b IEEE754         | 8   | Must be double-word aligned |

## Composite Types

In additional to the fundamental data types described previously, the Epiphany supports composite types, which are a collection of one or more fundamental data types that can be processed as a single entity during procedure calls. Each one of the composite types may contain composite types and/or fundamental data types as members.

**Aggregates**
An aggregate is a type with members that are laid out sequentially in memory. The alignment of the aggregate shall be the alignment of its most aligned component. The size of the aggregate shall be the smallest multiple of its alignment that is sufficient to hold all of its members when they are laid out according to these rules.

**Unions**
A union is a composite type, where each of the members has the same address. The alignment of a union shall be the alignment of its most-aligned component. The size of a union shall be the smallest multiple of its alignment that is sufficient to hold its largest member. Structures and unions are laid out according to the fundamental data types of which they are composed. All members are laid out in declaration order.

**Arrays**
An array is a repeated sequence of some other type (its base type). The alignment of an array shall be the alignment of its base type. The size of an array shall be the size of the base type multiplied by the number of elements in the array.


## Procedure Call Standard
The Epiphany architecture includes 64 general word length purpose register. Table 8.2 below shows the register usage convention in the EABI. The register usage convention acts as a contract to guarantee that a caller and callee function can work together with predictable results. The EABI has 10 callee saved registers and 52 caller saved registers.

The first four registers R0-R3 (A1-A4) are used to pass argument values into a subroutine and to return a result value from a function. They may also be used to hold intermediate values within a routine (but, in general, only between subroutine calls). Typically, the registers R4-R11and R14-R15 are used to hold the values of a routine’s local variables. A subroutine must preserve the contents of the registers R4-R11 and R14-R15.

Fundamental types larger than 32 bits may be passed as parameters to, or returned as the result of, function calls. A double-word sized type is passed in two consecutive registers (e.g., R0 and R1, or R2 and R3).

The base standard provides for passing arguments in core registers (r0-r3) and on the stack. For subroutines that take a small number of parameters, only registers are used, greatly reducing procedure call overhead.

Table: Register Use Convention

| Name   | Alias| Role                               | Saved By |
|--------|------|------------------------------------|----------|
| R0     | A1   | Argument/result/scratch register #1| Caller   |
| R1     | A2   | Argument/result/scratch register #2| Caller   |
| R2     | A3   | Argument/result/scratch register #3| Caller   |
| R3     | A4   | Argument/result/scratch register #4| Caller   | 
| R4     | V1   | Register variable #1               | Callee   |
| R5     | V2   | Register variable #2               | Callee   |
| R6     | V3   | Register variable #3               | Callee   |
| R7     | V4   | Register variable #4               | Callee   |
| R8     | V5   | Register variable #5               | Callee   |
| R9     | V6   | Register variable #6               | Callee   |
| R10    | V7   | Register variable #7               | Callee   |
| R11    | V8   | Register variable #8               | Callee   |
| R12    | IP   | Intra-procedure call scratch reg   | Caller   |
| R13    | SP   | Stack pointer                      | n/a      |
| R14    | LR   | Link register                      | Callee   |
| R15    | FP   | Frame pointer                      | Callee   |
| R27:16 | FP   | General Use                        | Caller   |
| R31:28 | FP   | Reserved for constants             | n/a      |
| R63:32 | FP   | Reserved for constants             | Caller   |

## Stack Management

The stack is a contiguous area of memory that may be used for storage of local variables and for passing additional arguments to subroutines when there are insufficient argument registers available. The stack implementation is full-descending, with the current extent of the stack held in the register SP (R13). The stack will, in general, have both a base and a limit though in practice an application may not be able to determine the value of either.

The stack may have a fixed size or be dynamically extendable (by adjusting the stack-limit downwards).The rules for maintenance of the stack are divided into two parts: a set of constraints that must be observed at all times, and an additional constraint that must be observed at a public interface. At all times the following basic constraints must hold:

Stack-limit < SP <= stack-base. The stack pointer must lie within the extent of the stack.

(SP mod 4)=0. The stack pointer must at all times be aligned to a double word boundary (where SP is the value of register R13).

A process may only access (for reading or writing) the closed interval of the entire stack delimited by [SP, (stack-base – 1)].

## Subroutine Calls

The Epiphany includes ‘BL’ and ‘JALR’ instructions for calling subroutines. These instructions transfer the sequentially next value of the program counter—the return address —into the link register (LR) and the destination address into the program counter (PC). The result is to transfer control to the destination address, passing the return address in LR as an additional parameter to the called subroutine. Control is returned to the instruction following the BL/JALR when the return address is loaded back into the PC using the JR/RTS instruction.


## Subroutine Return Values

The manner in which a result is returned from a procedure is determined by the type of the result:

* A data type that is smaller than 4 bytes is zero or sign-extended to a word and returned in r0.
* A word-sized data type (e.g., int, float) is returned in r0.
* A double-word sized data type (e.g., long long, double) is returned in r0 and r1.
* A Composite Type not larger than 4 bytes is returned in r0. The format is as if the result had been stored in memory at a word-aligned address and then loaded into r0 with an LDR instruction. Any bits in r0 that lie outside the bounds of the result have unspecified values.
* A Composite Type larger than 4 bytes, or whose size cannot be determined statically by both caller and callee, is stored in memory at an address passed as an extra argument when the function was called. 

\newpage



