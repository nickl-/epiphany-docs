Appendix E: Architectire Versions
==============================================================================

This chapter documents the differences between different versions of the Epiphany architecture.

## Epiphany-III

First product

## Epiphany-IV

A change was made to the software exception field of the STATUS register. This was considered an acceptable change since the software exception was broken in epiphany-III. New features were added to the CONFIG and MESHCONFIG register.

The following provides a summary of all changes.

|   Register          | Epiphany-III         |  Epiphany-IV                   |
|---------------------|----------------------|--------------------------------|
|   STATUS[19:16]     | 0100=unimplemented   |  1111=unimplemented            |
|                     | 0001=swi             |  1110=swi                      |
|                     | 0010=unaligned       |  1101=unaligned                |
|                     | 0101=illegal access  |  1100=illegal access           |
|                     | 0011=fpu exception   |  0111=fpu excpetion            |
|   CONFIG[11:8]      | N/A                  |  0011=Enables 64 bit counter   |
|   MESHCONFIG[7:4]   | 1111=N/A             |  1111=Counts any access        |

## Epiphany-V

TBD

\newpage


