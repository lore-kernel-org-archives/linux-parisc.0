Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id TAA13817
	for <parisc-linux@puffin.external.hp.com>; Tue, 21 Sep 1999 19:16:10 -0600
Sender: rbrad@mailserv2.iuinc.com
Message-ID: <37E82CE6.3A5DFFB0@uswest.net>
Date: Tue, 21 Sep 1999 19:12:06 -0600
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: Parisc Linux <parisc-linux@thepuffingroup.com>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Questions understanding exec_kernel
List-ID: <linux-parisc.vger.kernel.org>

Hello hackers:

I'm still trying to debug why I can load the kernel from exec_kernel (in
arch/parisc/boot/boot_code/ipl_s.S)


I've snipped the relevent section of code and have some questions
reguarding it.  (Pleae remember I'm, this is my first attempt with
PA-RISC, and I've been learning by reading the PA-RISC 1.1 Architecture
and Instruction Set Reference Manual, HP Assembler Reference Manual,
various comments throughout the code, and trial and error.)

/*
 *  exec_kernel(entry_point, &commandline, Kernel_FreeMemStart,
half_bss_size );
 *  exec_kernel() calls our kernel...
 */

 .EXPORT exec_kernel,code
 .PROC
 .CALLINFO
 .ENTRY
exec_kernel
 mtsm     %r0                 ; Disable traps and interrupts.

 mtctl    %r0,        %cr17   ; Clear two-level IIA Space Queue
 mtctl    %r0,        %cr17   ;    effectively setting kernel space.
 [Question: Page 5-149 from the PA-RISC 1.1 Architecture and Instruction
Set Reference Manual states: "Level 0:  If the target control register
is CR 8, 9, 12, 13, 17, or 20, this instructin executes as a null
instruction."  I am assuming we are running at level 0 since the rfi
command required running at level 0, so what is the difference between a
null instruction and a nop?]

 mtctl    %arg0,      %cr18   ; Stuff entry point into head of IIA
 ldo      4(%arg0),   %arg0   ;    Offset Queue, and entry point + 4
 mtctl    %arg0,      %cr18   ;    into tail of IIA Offset Queue.

 ldi      0x9,        %arg0   ; Set PSW Q & I bits (collect intrpt
 mtctl    %arg0,      %ipsw   ;    state, allow external intrpts).

 copy     %arg2,      %arg0   ; commandline to arg1
 [Note:  I think the comment is incorrect... we are actually copying the
Kernel_FreeMemStart into arg0 ... Am I missunderstanding the comment?]
                              ; arg3 is not changed..
 .EXIT
 rfi    ; begin execution of kernel.
 nop
 [Question: Page 5-139 from the PA-RISC 1.1 Architecture and Instruction
Set Reference Manual states: "Execution of an RFI instruction when any
of the PSW !, I, or R bits are ones is an undefined operation."  We are
explicitly setting the Q & I bits before calling the rfi command.  I
don't understand how this works ... ]
 .PROCEND

Thanks,
-Ryan
