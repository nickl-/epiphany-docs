
Chapter2: Memory Architecture
============================================================================

## Memory Map

The Epiphany has a flat memory address space consisting of $2^{N}$ 8-bit bytes. Byte addresses are treated as unsigned numbers, running from 0 to $2^{N} - 1$.The complete Epiphany memory map is flat, distributed, and shared by all processors in the system. Each mesh node has a local 1MB range of memory that is accessible by the mesh node itself starting at address 0x0 and ending at address 0xFFFFF. The globally addressable mesh node ID is 12 bits for the 32-bit memory architecture and 30 bits in the 64-bit architecture. The recommended Epiphany architecture implementation uses multi-banked software-managed scratch-pad memory at each processor node.

The complete memory map for the 32-bit Epiphany architecture is shown in the following figure.

**Figure:** 32-bit Memory Map

Data can be accessed diretly from local core memory or from outside the core. Instructions can only fetched directly from local memory. Performance is optimized when the data and instructions are placed in separate local-memory banks.

Figure 2 shows a 64-node region of the memory map, highlighting the upper address range of each mesh node and its corresponding mnemonic (row, column) coordinate. The memory map is laid out as a mesh to match the natural geometrical mapping of Epiphany’s Network-On-Chip. The dotted line in Figure 6 shows the I/O boundary and memory map for a hypothetical system consisting of four 16-core chips connected in a glue-less fashion on a board. A 32-bit address map supports up to 4095 cores in a single shared memory system and a 64-bit address supports over 1 Billion cores. In most systems some of the memory space will be dedicated to off-chip SDRAM and memory mapped IO peripherals, reducing the number of cores available for direct memory mapping.

**Figure:** Memory Layout

Each CPU can access any other CPU's memory by specifying the appropriate row-column fields of the address field in a memory read or write transactions. From a programmer's viewpoint, the only difference between on-chip communication and off-chip communication is in transaction bandwidth and latency. In the Figure 6 memory map, if core (32,32) wants to perform a read operation from core (39,39), it would send a read address with the upper bits 0x9e7 and specify a return address with upper bits 0x820 to the mesh network. The network takes care of the rest, making sure that the read request propagates to the read destination and that data is correctly returned to the mesh node that initiated the request.

The following code example illustrate the simplicity of inter-processor communication using the Epiphany shared memory model. For ease of use and robustness, frameworks have been developed that build on top of the direct shared memory mapped model. 

```
	//LOCAL WRITE
	
	MOV 	R0, 0x1000	// set address value
	STR     R1,[R0]     // store register R1 to a local memory address R0
```

```
	//REMOTE WRITE
	
    MOV 	R0,%low(0x80800000)	// set address value
	MOVT	R0,%high(0x8080000)	//
    STR     R1,[R0]             // store register R1 to a remote memory address R0
```

**Figure:** Read Request Example


## Memory Order Model

All read and write transactions from local memory follow a strong memory-order model, meaning that the transactions complete in the same order in which they were dispatched by the program sequencer.

For read and write transactions that access non-local (remote) memory, the memory order restrictions are relaxed to improve performance.

The following Table shows the ordering guaranteed for remote memory transactions in the Epiphany architecture. Instruction #1 refers to the first instruction in a sequential program, and instruction #2 refers to any instruction following the first one in that same program. Programs relying on strict memory ordering must use appropriate synchronizatoin primitives in software to guarantee proper operation.

Table: Memory Transaction Ordering Rule

| Transfer #1   | Transfer #2  | Deterministic |
| --------------|--------------|---------------|
| Read Core A   | Read Core A  | Yes           |
| Read Core A   | Read Core B  | Yes           |
| Read Core A   | Write Core A | Yes           |
| Read Core A   | Write Core B | Yes           |
| Write Core A  | Write Core A | Yes           |
| Write Core A  | Write Core B | No            |
| Write Core A  | Read Core A  | No            |
| Write Core A  | Read Core B  | No            |

## Endianness

The Epiphany architecture is a little-endian memory architecture. 

## Alignment Restrictions

The Epiphany architecture expects all memory accesses to be aligned: doubleword accesses must be doubleword-aligned, word accesses must be word-aligned, and halfword accesses must be halfword-aligned. The following Table summarizes the restrictions on the three LSBs of the address used to access memory for each type of memory transaction. An “x” in the address field refers to a bit that can be any value. Load and store transactions with unaligned addresses generate a software exception that is handled by the node's interrupt controller. For unaligned write accesses, data is still written to memory, but the data written will be incorrect. Unaligned reads return values to the register file before an unaligned exception occur.

Table: Load and Store Memory-Alignment Restrictions

| Data Type  | Address[2:0] |
|------------|--------------|
| Byte       | xxx          |
| Halfword   | xx0          |
| Word       | x00          |
| Doubleword | 000          |

All instructions must be aligned on half-word boundaries. 

\newpage
