Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id VAA25448
	for <parisc-linux@puffin.external.hp.com>; Fri, 22 Oct 1999 21:20:36 -0600
Sender: rbrad@mailserv2.iuinc.com
Message-ID: <38112F79.CF8C3C8C@uswest.net>
Date: Fri, 22 Oct 1999 21:46:01 -0600
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: frowand@cup.hp.com
CC: parisc-linux@thepuffingroup.com, Paul Bame <bame@debian.fc.hp.com>
Subject: Re: [parisc-linux] Boot messages from C3000 console
References: <Pine.LNX.4.10.9910212221480.18206-100000@vodka.thepuffingroup.com> <99102217512801.00256@P100> <38109F94.7DA3551A@hp.com>
Content-Type: multipart/mixed;
 boundary="------------B83F451A9D117A9432392387"
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------B83F451A9D117A9432392387
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Frank Rowand wrote:

> Helge Deller wrote:
> >
> > Am Fri, 22 Oct 1999 schrieb Alex deVries:
> > > On Thu, 21 Oct 1999, Frank Rowand wrote:
> > > > Ok, tirade mode off.  This is where my newbie status becomes apparent.  Please
> > > > excuse any foot in mouth here.  I looked at the Puffin web page and didn't
> > > > notice anything about the process of making sure that code that is submitted
> > > > has some minimal level of quality.  Is it just a matter of the community
> > > > applying peer pressure?
> > >
> > > In fact, it's *ALL* about the community applying pressure.
> > >
> > > If the code in head.S is a bit rough, remember that it was just about the
> > > first PA-RISC assembler that Helge or Philipp had ever written, so do keep
> > > that in mind.  Also, at the start of the project, there was a very
> > > conscious effort to only be concerned with 1.1 code.  It doesn't surprise
> > > me in the least that it's not 2.0 compliant.
> > >
> > > I agree that the code is unreadable though;  I've simply passed it off on
> > > not being able to understand parisc assembler well enough.
> > >
> > > We'd all appreciate it if you could commit appropriate changes to make the
> > > code clearer.
> > >
> > > - Alex
> >
> > Thanks Alex,
> >
> > Yes, we all know that the boot-loader really needs a complete clean-up, and as
> > it looks like I´m the maintainer of the bootloader.
> >
> > It´s really funny to see people from HP talking to the list and saying somthing
> > about code-quality, but only as a little reminder:
> > When I wrote the bootloader I had no documentation on bootloading from HP at
> > all, no knowledge of parisc and got it only working with trial & error methods
> > in day and night-sessions. More, it´s first goal was to get at least a kernel
> > booted so that the real kernel-development could start. (See my messages in the
>
> <stuff deleted>
>
> First, thanks to all for the gentle replies.  I like this community!!
>
> Alex, I guess I wasn't clear enough about what my issue was.  I wasn't complaining
> about the actual code (I try to avoid that, as long as code is mostly correct
> (works)).  My concern was that I, with twelve years experience with PA-RISC
> (including four different OSs - MPE, NextStep, HP-RT, and HP-UX), had to go to
> external documentation to read what is trivial code (a PDC call) when a
> one line comment would have made it obvious that the code was calling
> PDC_BLOCK_TLB().  For me, just annoying - for someone who might be missing one
> or two of the bits of knowledge, potentially a multi-hour sidetrack to
> understand some trivial code.  I want to encourage people to make the code
> easily readable so I don't have to waste a lot of time when my help is requested
> to debug or contribute code.
>
> Helge, I wasn't complaining about the boot-loader, I think you are mixing two
> different threads together.  And I'm not complaining about the algorithms,
> the instructions coded, correctness of code, or anything like that.  I'm just
> saying that the sequence that I had to read in head.S to figure out the
> cause of the HPMC on the C3000 needed at least a comment to make it readable
> without having to know about and consult external documents.  (And Grant made
> a good point that using defines instead of numbers can also increase
> readability significantly).
>
> And yes, I suspect that adding the comment to the code will be my first
> submission to parisc linux (how embaressing to submit a comment before
> submitting any code!).
>

Sorry I haven't responded to this thread earlier .... (Spent last week traveling ...)
I've been working on trying to figure out
how the boot-loader works, and get it to work on the C200+ (which is PA-RISC 2.0)  I'm
going to assume the
C3000 is also PA-RISC 2.0 also.  I've gone through and attempted to clean up clean up
the code and put in
comments so that I could understand it.  (I've attach my modified head.S.  Be gentle
.... this is my first attempt at
PA-RISC assembly)

Since there seems to be other interest in getting this to work, I'd be very interested
in sharing what I have learned,
and working with others to get this to work.

-Ryan Bradetich who is finally home again.
P.S I really want to help on this port, but I can't until it boots on the C200.

>
> Thanks all,
>
> Frank Rowand
>
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.

--------------B83F451A9D117A9432392387
Content-Type: text/plain; charset=us-ascii;
 name="head.S"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="head.S"

/*
 *
 * This file is subject to the terms and conditions of the GNU General Public
 * License.  See the file "COPYING" in the main directory of this archive
 * for more details.
 *
 * Copyright (C) 1999 by Helge Deller
 * Copyright 1999 SuSE GmbH (Philipp Rumpf, prumpf@suse.de)
 *
 * Initial Version 04-23-1999 by Helge Deller (helge.deller@ruhr-uni-bochum.de)
 */


/* ---------------------------------------------------------------------------
 *
 * $Log: head.S,v $
 * Revision 1.32  1999/08/31 19:25:23  prumpf
 * fixes
 *
 * Revision 1.30  1999/08/21 19:07:07  prumpf
 * removed the initrd stuff for now
 *
 * Revision 1.29  1999/08/21 17:08:27  prumpf
 * debugging
 *
 * Revision 1.28  1999/08/10 15:44:35  prumpf
 * changes for having the kernel virtually mapped
 *
 * Revision 1.27  1999/08/06 17:05:11  prumpf
 * cleaned up a bit
 *
 * Revision 1.26  1999/07/24 00:00:41  deller
 *
 * * first work on initrd
 *
 * Revision 1.25  1999/07/21 00:30:34  deller
 *
 * * renamed some symbols in head.S (for mmu-code)
 * * the same changes in setup.c
 * * removed irq_setup() from setup.c (not used).
 *
 * Revision 1.24  1999/07/16 10:26:41  prumpf
 * Fixed some of the obvious problems so interruptions will work again
 *
 * Revision 1.23  1999/07/15 13:52:59  deller
 *
 * * found the problem, why kernel stopped with booting via hpux-loader:
 *   the hpux-bootloader did not zero-initialized the BSS segment, so
 *   that all uninitialized variables from kernel was in undefined state.
 * * the kernel now zero-initializes the BSS segment itself
 * * the memory-adress of the first free byte is now the same, it doesn't
 *   matter if you boot via hpux-loader or our ipl-loader....
 *
 * -> Now booting all ways (network, CD, HDD, hpux) should be OK !
 *
 * Revision 1.22  1999/07/14 09:36:52  deller
 *
 * * cache will be reset, when init_cache() is called,
 * * fatal() is called, when a function from fixme.c is called,
 * * the Kernel now gets the (yet static) command-line from the bootloader.
 *
 * Revision 1.21  1999/07/13 23:33:30  deller
 *
 * next approach on Phillips' bug-report. (better, should work, but not optimal!)
 * the bogompis/irq-detection hangs when booted via hpux-bootloader,
 * it seems that some general irq-flags has to be set in head.s or irq.c (?)
 *
 * Revision 1.20  1999/07/13 20:59:29  deller
 *
 * Phillip, would you try again with this....
 * Please remove the boot/boot_code/ipl-file before (maybe it's now done
 * automatically).
 *
 * Revision 1.18  1999/07/13 01:23:25  deller
 *
 * small changes in fixme.c - (it would be good to remove that file),
 * better memory-optimization in head.S for booting from the local hpux-bootloader
 * (tested with HP-UX 10.20).
 *
 * Revision 1.17  1999/07/09 21:54:44  deller
 *
 *
 * Fixed the hpux-bootloader-problem !
 * The problem was in head.S (where I assumed, that we always start the kernel
 * from our own bootloader).
 *
 * Now you can do:
 * boot pri isl
 * hpux /stand/vmlinux
 *
 * Revision 1.16  1999/07/08 15:47:31  prumpf
 * stack alignment is 64 bytes
 *
 */

/* 			FIXME !!!
    When vmlinux was started by the hpux-bootloader, then I don't know
    the size of the BSS-Data, which follows the end of the vmlinux-file.
    I did some debugging-tests here, and it seemed, that %arg3=%r23 will get 
    the HALF of the size of BSS from the bootloader, so I implemented that !
    If anybody has real documentation, please contact me:
    Helge Deller <helge.deller@ruhr-uni-bochum.de> or <deller@gmx.de>
    
    (NB: The commands for booting are: "boot pri isl" and "hpux /stand/vmlinux").

    Maybe I should mention, that this problem does not exist, when vmlinux
    was started by our own bootloader.

    Helge Deller, 99-07-13
*/

#define	PA(x) ((x)-0xc0000000)

#include <asm/offset.h>
#include <asm/psw.h>

	.level 1.1

	.space $TEXT$
	.subspa $UNWIND_START$,QUAD=0,ALIGN=8,ACCESS=0x2C,SORT=56
	.export $UNWIND_START
$UNWIND_START
	.subspa $UNWIND_END$,QUAD=0,ALIGN=8,ACCESS=0x2C,SORT=73
	.export $UNWIND_END
$UNWIND_END

	.space $TEXT$
	.subspa $FIRST$
	.import start_parisc,code
	.import init_task_union,data
	.import fault_vector,code
	.import	$global$
	
	.export stext
	.export _stext,data		; Kernel want it this way!
	.export $START$,entry
$START$	
_stext
stext
	.proc
	.callinfo

	copy		%r0,%dp			; Debug

	ldil		L%$global$,%dp		; Initialize the global
	ldo		R%$global$(%dp),%dp	; data pointer (%dp)
	
	ldil		L%TASK_SZ_ALGN,%r13
        ldo             R%TASK_SZ_ALGN(%r13),%r13
	
	ldil		L%PA(init_task_union+TASK_SZ_ALGN),%sp
	ldo		R%PA(init_task_union+TASK_SZ_ALGN)(%sp),%sp

	copy 		%sp,%r12		; Debug
	/*
	 * There are 2 possible methods, how vmlinux was started:
	 *
	 * 1. It was started by our own ipl-bootloader:
	 *     	%arg0=Kernel_MemFreeStart ( >= offset(_bss_start)) [not used!]
	 *	%arg1=ptr to the command line
	 *	%arg3(=%r23) holds HALF(!) of the size of the BSS-Segment 
	 *
	 * 2. It was started by the hpux-bootloader:
	 *	%arg0 should then be lower than offset(_bss_start)
	 * 	%arg1= ????? [not used!]
	 *	%arg3(=%r23) holds HALF(!) of the size of the BSS-Segment 
	 */

	ldil		L%_bss_start-0xc0000000,%r10
	ldo		R%_bss_start-0xc0000000(%r10),%r10	; _bss_start

	comclr,<<	%r10,%arg0,%r0		; is %arg0 < offset _bss_start ??
	copy		%r0,%arg1	

	sh1add		%arg3,%r10,%arg0	; _bss_start + 2*(bss_size)
	depi		3,1,2, %arg0            ; 0xC0000000 + %arg0

	/* Why are we setting up the BTLB?  */
	/* setup the BTLB.  XXX: This assumes a unified BTLB */
	ldo		128(%sp),%sp
	stw		%arg0, -128(%sp)
	stw		%arg1, -124(%sp)
	stw		%arg2, -120(%sp)
	stw		%arg3, -116(%sp)

	/* What are we doing here? */
	ldo		0x388(%r0), %r1		; What is the significance of 0x388?
						; 0x388 (Page C-3) Start of MEM_PDC[32-63]

	ldwax		%r0(%r1), %r1 	 	; ldwax does not exist in PA-RISC 2.0??
						; Do we need this statement??

	ldo		18(%r0), %arg0		; (Page C-4) MEM_PF_LEN (Checksum for MEM_POW_FAIL)
	ldo		1(%r0), %arg1		; (Page C-4) MEM_POW_FAIL
	ldil		L%0xc0000, %arg3        ; What this significance of this statement?
	ldo		0(%r0), %arg2           ; (Page C-4) 0

	ldil		L%0x00000000, %r22	; Start of PAGE0 Data format (C-3)?
	stw		%r22, -52(%sp)

	ldo		4096(0), %r22		; What is the significance of 0x4096?
	stw		%r22, -56(%sp) 		; End of the PAGE0 Data format (C-3)?

	ldil		L%0x03000000, %r22	; What is the significance of 0x03000000?
	stw		%r22, -60(%sp)

	ldo		0(%r0), %r22		; We already stored 0 once ... Why again?
	stw		%r22, -64(%sp)

	ldil		L%PA(.+12),%r2	        ; Not sure what this is doing ..... 
	bv		%r0(%r1)		; %r1 is set by ldil ...	
	ldo		R%PA(.+4)(%r2), %r2	; No clue about this either ... (.+4)  -> pc-relative

	/* Restore the origional values of %arg0 - %arg3 from the stack */
	ldw		-128(%sp), %arg0
	ldw		-124(%sp), %arg1
	ldw		-120(%sp), %arg2
	ldw		-116(%sp), %arg3
	ldo		-128(%sp), %sp
	
	/* Load the fault vector into %r10 */
	ldil		L%PA(fault_vector), %r10
	ldo		R%PA(fault_vector)(%r10), %r10
	
	/* Move the fault vector into %iva (%cr14) */
	mtctl		%r10, %iva

	/* Store the following value 0xF(%sp{2..31})
	depi		3, 1, 2, %sp
	/* Store this value to a temporary control register ....
	mtctl		%r0, %cr30

	mtsm		%r0			; Disable (most) interruptions

	
	/* kernel PSW:
	 *  - no interruptions except for HPMC and TOC (which are handled by PDC)
	 *  - Q bit set (IODC / PDC interruptions)
	 *  - big-endian
	 *  - virtually mapped
	 */
#define KERNEL_PSW 0x4000a
	
	/* Set the C, Q, and D bits */
	ldil		L%KERNEL_PSW,%r10
	ldo		R%KERNEL_PSW(%r10),%r10
	mtctl		%r10,%ipsw 
	
	mtctl		%r0,%cr17		; Clear two-level IIA Space Queue
	mtctl		%r0,%cr17		;    effectively setting kernel space.
	ldil		L%start_parisc,%r10
	ldo		R%start_parisc(%r10),%r10

	mtctl		%r10,%cr18
	ldo		4(%r10),%r10
	mtctl		%r10,%cr18

	mtctl		%arg0, %cr0

	rfi
	nop
	.procend

	.space	$PRIVATE$
	.subspa	$GLOBAL$
	.export	$global$,data
	.export	_data_start,data
$global$
_data_start
	.word 0	

/* offset(_bss_start) is the start of the $BSS-segment in vmlinux */

	.space	$PRIVATE$
	.subspa $BSS$,QUAD=1,ALIGN=8,ACCESS=31,ZERO,SORT=82
	.export	_bss_start,data
_bss_start

--------------B83F451A9D117A9432392387--
