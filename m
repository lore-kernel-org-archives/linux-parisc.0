Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA06130
	for <parisc-linux@puffin.external.hp.com>; Mon, 25 Oct 1999 16:04:05 -0600
From: Frank Rowand <frowand@cup.hp.com>
Message-Id: <199910252205.PAA08931@xsvr4.cup.hp.com>
To: rbradetich@uswest.net
Date: Mon, 25 Oct 1999 15:05:02 PDT
Cc: parisc-linux@thepuffingroup.com
Subject: [parisc-linux] comments for BTLB setup (no TABs)
List-ID: <linux-parisc.vger.kernel.org>


(Sorry all for the previous message, I use 4 column tabstops, the rest of
the world uses 8 column tabstops.  I took the tabs out this time.)

Ryan,

You didn't do too bad for a first shot at reading pa-risc assembly, but
let me help you out a bit.

you wrote (among other things...):

> /* Why are we setting up the BTLB?  */
> /* setup the BTLB.  XXX: This assumes a unified BTLB */
> ldo       128(%sp),%sp
> stw       %arg0, -128(%sp)
> stw       %arg1, -124(%sp)
> stw       %arg2, -120(%sp)
> stw       %arg3, -116(%sp)
> 
> /* What are we doing here? */
> ldo       0x388(%r0), %r1         ; What is the significance of 0x388?
>                                         ; 0x388 (Page C-3) Start of MEM_PDC[32-63]
> 
> ldwax  %r0(%r1), %r1       ; ldwax does not exist in PA-RISC 2.0??
>                            ; Do we need this statement??
> 
> ldo    18(%r0), %arg0      ; (Page C-4) MEM_PF_LEN (Checksum for MEM_POW_FAIL)
> ldo    1(%r0), %arg1       ; (Page C-4) MEM_POW_FAIL
> ldil   L%0xc0000, %arg3    ; What this significance of this statement?
> ldo    0(%r0), %arg2       ; (Page C-4) 0
> 
> ldil   L%0x00000000, %r22  ; Start of PAGE0 Data format (C-3)?
> stw    %r22, -52(%sp)
> 
> ldo    4096(0), %r22       ; What is the significance of 0x4096?
> stw    %r22, -56(%sp)      ; End of the PAGE0 Data format (C-3)?
> 
> ldil   L%0x03000000, %r22  ; What is the significance of 0x03000000?
> stw    %r22, -60(%sp)
> 
> ldo    0(%r0), %r22        ; We already stored 0 once ... Why again?
> stw    %r22, -64(%sp)
> 
> ldil   L%PA(.+12),%r2      ; Not sure what this is doing ..... 
> bv     %r0(%r1)            ; %r1 is set by ldil ...        
> ldo    R%PA(.+4)(%r2), %r2 ; No clue about this either ... (.+4)  -> pc-relative
> 
> /* Restore the origional values of %arg0 - %arg3 from the stack */
> ldw       -128(%sp), %arg0
> ldw       -124(%sp), %arg1
> ldw       -120(%sp), %arg2
> ldw       -116(%sp), %arg3
> ldo       -128(%sp), %sp



First, some notes that will provide some context for the comments in the
code below:


PDCE_PROC is the entry point for calling PDC, see the third paragraph in the
IO ARS chapter "PDC Procedures".  (This chapter is available at
http://devresource.hp.com/devresource/Docs/Refs/PDC32.pdf, which I got to 
from http://devresource.hp.com/devresource/Docs/DocLibrary.html#archrefs.)

For the argument passing conventions for PDCE_PROC, see section 1.3 and 1.4
of the "PDC Procedures" chapter.


> ldo 18(%r0), %arg0     ; (Page C-4) MEM_PF_LEN (Checksum for MEM_POW_FAIL)

ldo is loading an address offset of %r0 (zero) + displacement of 18 into
%arg0.  It is not loading data from the offset, it is loading the offset.
This is just putting a constant into the target register.


> ; ldwax does not exist in PA-RISC 2.0??

Some of the Mnemonics changes from 1.1 to 2.0, but the instruction is
still there.  See Table J-2 in "PA-RISC 2.0 Architecture" by Jerry
Kane for how they renamed instructions.


Useful references for really understanding what's going on here are
the "PA-RISC 1.1 Architecture and Instruction Set Reference Manual"
(look for Block TLB in the index) and PDC_BLOCK_TLB in the "PDC
Procedures" chapter of the IO ARS.

I don't know where Ryan got appendix C (the puffin links seem stale),
but the PA 2.0 version is on the devresource page I mentioned above.
The 2.0 version is the same for the specific reference I make in the
comments below.


Then the same code with comments (and to the peanut gallery, no, I would
not normally comment this profusely), should answer a lot of your
confusion:


        /* setup the BTLB.  XXX: This assumes a unified BTLB */
        ldo             128(30),30          ;create a stack frame
        stw             26, -128(30)
        stw             25, -124(30)
        stw             24, -120(30)
        stw             23, -116(30)

        ldo             0x388(0), 1         ; IO ARS p.C-3, C-6, MEM_PDC
        ldwax           0(1), 1             ; get address of PDCE_PROC()

        ldo             18(0), 26           ; arg0 - PDC_BLOCK_TLB()
        ldo             1(0), 25            ; arg1 - Insert entry
        ldil            L%0xc0000, 23       ; arg3 - virtual addr LSbits
                                            ; should this be %L0xc0000000 ??
        ldo             0(0), 24            ; arg2 - virtual addr MSbits
        ldil            L%0x00000000, 22
        stw             22, -52(30)         ; arg4 - physical addr
        ldo             4096(0), 22
        stw             22, -56(30)         ; arg5 - length in pages
        ldil            L%0x03000000, 22
        stw             22, -60(30)         ; arg6 - entry info
                                            ;        (access rights & ID)
        ldo              0(0), 22
        stw             22, -64(30)         ; arg7 - slot 0
        ldil            L%PA(.+12), 2
        bv              0(1)                ; PDCE_CALL(PDC_BLOCK_TLB, ...)
        ldo             R%PA(.+4)(2), 2     ; set return pointer to next
                                            ; instruction

        ldo             0x388(0), 1
        ldwax           0(1), 1
        ldo             18(0), 26
        ldo             1(0), 25
        ldil            L%0xc0000, 23
        ldo             0(0), 24
        ldil            L%0x00000000, 22
        stw             22, -52(30)
        ldo             4096(0), 22
        stw             22, -56(30)
        ldil            L%0x03000000, 22
        stw             22, -60(30)
        ldo              2(0), 22
        stw             22, -64(30)         ; arg7 - slot 2
        ldil            L%PA(.+12), 2
        bv              0(1)                ; PDCE_CALL(PDC_BLOCK_TLB, ...)
        ldo             R%PA(.+4)(2), 2

        comb,<>          0,28, blargh       ; if (return value <> 0) blargh()
        ldw             -128(30), 26
        ldw             -124(30), 25
        ldw             -120(30), 24
        ldw             -116(30), 23
        ldo             -128(30),30



-Frank Rowand
