Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA07439
	for <parisc-linux@puffin.external.hp.com>; Wed, 8 Dec 1999 09:00:10 -0700
Message-Id: <199912081554.IAA21679@debian.fc.hp.com>
To: Ulrich Strelow <ulrich_strelow@yahoo.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] a pretty big change 
In-reply-to: Your message of "Wed, 08 Dec 1999 05:27:15 PST."
             <19991208132715.19922.qmail@web501.mail.yahoo.com>
Date: Wed, 08 Dec 1999 08:54:39 -0700
From: Paul Bame <bame@fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= Hi all,
= 
= I have build a new kernel with the CVS version
= 19991205 and I get the following console output when I
= try to boot it on my 715/33:

If you'll place that kernel somewhere I can get it, I'll check
this, or you can.  Look into the kernel and/or System.map
for what's at 0xc004a078, which is inside a procedure which will
return to 0xc0112000.  It looks like a null (or small) pointer
dereference because we're trying to create a virtual mapping for address 0.

	-P

= PARISC/Linux Bootstrap Version 0.6 (interactive)
= By Helge Deller & Jason Eckhardt
= Built Mon Dec 6 11:13:34 MET 1999 by root@be5359
= 
= Reading parameters...done.
= 
= Loading PA-RISC/Linux Kernel...
= 
= Please enter the command-line:
= /stand/vmlinux HOME=/ TERM=LINUX console=tty
= 
= SOM-Kernel:
= aux_header_location: 00000080
= som       : 00200080
= exec_dfile: 000CE000
= exec_dsize: 00081000
= exec_dmem : C00A0000
= exec_tfile: 0003E000
= exec_tsize: 0008F008
= exec_tmem : C0010000
= Code at 0x00010000, size=0x0008F008
= Data at 0x000A0000, size=0x00081000
= BSS  at 0x00121000.
= 
= Transferring control to kernel. (At entry point
= 0x00010000)
= kernel(0x146880, 0x504010, 0x146880, 0x12c30)
= Boot loader: PA/Linux, maybe PALO
= kernel free mem 0x00146880
= realmode_setup exiting
= Can't insert TLB miss handler pa 0x40000000 va
= 0x00000000
= r0-3    0x0004fb0b      0xc0112000      0xc004a170    
=  0x00000000
= r4-7    0xc0112000      0x00000000      0x00000400    
=  0x00000000
= r8-11   0xc01db000      0x00000000      0x00000400    
=  0x00000100
= r12-15  0xc01a4988      0x00000000      0x00000000    
=  0x00000000
= r16-19  0x00000000      0x00000400      0x00001000    
=  0x0000001f
= r20-23  0x00000020      0xc01a001c      0x00000001    
=  0xc01268b0
= r24-27  0x00000000      0x00000400      0x00000000    
=  0xc009f000
= r28-31  0xc01db000      0x0000000b      0xc01a4f40    
=  0xc007a39c
= sr0-3   0x00000000      0x00000000      0x00000000    
=  0x00000000
= sr4-7   0x00000000      0x00000000      0x00000000    
=  0x00000000
= iasq 0x00000020 0x00000003
= iaoq 0xc004a078 0xc004a07c
= cr30 0x00000000 ksp 0x00000001 kpc 0xc01a4f80 sar
= 0x00000012
= iir 0x48730038
= 
= The last successful booting kernel was from the CVS
= version 19991123.
= 
= Any ideas ?
= Ulrich
= 
= --- Paul Bame <bame@debian.fc.hp.com> wrote:
= > 
= > I just committed the changes to embed real-mode code
= > in a separate
= > executable inside vmlinux.  It should cause no
= > functional changes
= > in theory.  Read all about it in
= > arch/parisc/real/README and
= > ee.html.  If you have terrible new problems,
= > I've attached a list of CVS commands to check out
= > the files before I
= > started hacking on them.  I haven't seen a shell
= > prompt from this
= > set of hacks so beware...
= > 
= > 	-Paul Bame
= > 
= > prumpf- I moved kernel_thread and friends from
= > 	real/<something> to kernel/head.S  I also
= > re-enabled BTLB in
= > 	real/setup.c so I could get further in the boot. 
= > Left some
= > 	debugging printks in the handle_real_interrupt
= > handler too.
= > 
= > cvs update -r1.25 arch/parisc/Makefile
= > 	cvs update -A arch/parisc/Makefile
= > cvs update -r1.28 arch/parisc/kernel/Makefile
= > 	cvs update -A arch/parisc/kernel/Makefile
= > cvs update -r1.35 arch/parisc/kernel/head.S
= > 	cvs update -A arch/parisc/kernel/head.S
= > cvs update -r1.39 arch/parisc/kernel/irq.c
= > 	cvs update -A arch/parisc/kernel/irq.c
= > cvs update -r1.14 arch/parisc/kernel/pdc.c
= > 	cvs update -A arch/parisc/kernel/pdc.c
= > cvs update -r1.25 arch/parisc/kernel/pdc_cons.c
= > 	cvs update -A arch/parisc/kernel/pdc_cons.c
= > cvs update -r1.73 arch/parisc/kernel/setup.c
= > 	cvs update -A arch/parisc/kernel/setup.c
= > cvs update -r1.11 arch/parisc/kernel/traps.c
= > 	cvs update -A arch/parisc/kernel/traps.c
= > cvs update -r1.2 arch/parisc/real/Makefile
= > 	cvs update -A arch/parisc/real/Makefile
= > cvs update -r1.2 arch/parisc/real/head.S
= > 	cvs update -A arch/parisc/real/head.S
= > cvs update -r1.2 arch/parisc/real/interruption.S
= > 	cvs update -A arch/parisc/real/interruption.S
= > cvs update -r1.2 arch/parisc/real/lib.c
= > 	cvs update -A arch/parisc/real/lib.c
= > cvs update -r1.2 arch/parisc/real/pdc.c
= > 	cvs update -A arch/parisc/real/pdc.c
= > cvs update -r1.2 arch/parisc/real/real.h
= > 	cvs update -A arch/parisc/real/real.h
= > cvs update -r1.2 arch/parisc/real/real_s.S
= > 	cvs update -A arch/parisc/real/real_s.S
= > cvs update -r1.2 arch/parisc/real/setup.c
= > 	cvs update -A arch/parisc/real/setup.c
= > cvs update -r1.1 arch/parisc/real/traps.c
= > 	cvs update -A arch/parisc/real/traps.c
= > cvs update -r1.1 include/asm-parisc/real.h
= > 	cvs update -A include/asm-parisc/real.h
= > 
= >
= ---------------------------------------------------------------------------
= > To unsubscribe: send e-mail to
= > parisc-linux-request@thepuffingroup.com with
= > `unsubscribe' as the subject.
= > 
= > 
= 
= __________________________________________________
= Do You Yahoo!?
= Thousands of Stores.  Millions of Products.  All in one place.
= Yahoo! Shopping: http://shopping.yahoo.com
