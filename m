Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id HAA16020
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Sep 1999 07:27:16 -0600
Date: Wed, 22 Sep 1999 15:29:37 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: Parisc Linux <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] Questions understanding exec_kernel
Message-ID: <19990922152937.Y5481@suse.de>
References: <37E82CE6.3A5DFFB0@uswest.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <37E82CE6.3A5DFFB0@uswest.net>; from Ryan Bradetich on Tue, Sep 21, 1999 at 07:12:06PM -0600
List-ID: <linux-parisc.vger.kernel.org>

> /*
>  *  exec_kernel(entry_point, &commandline, Kernel_FreeMemStart,
> half_bss_size );
>  *  exec_kernel() calls our kernel...
>  */
> 
>  .EXPORT exec_kernel,code
>  .PROC
>  .CALLINFO
>  .ENTRY
> exec_kernel
>  mtsm     %r0                 ; Disable traps and interrupts.
> 
>  mtctl    %r0,        %cr17   ; Clear two-level IIA Space Queue
>  mtctl    %r0,        %cr17   ;    effectively setting kernel space.
>  [Question: Page 5-149 from the PA-RISC 1.1 Architecture and Instruction
> Set Reference Manual states: "Level 0:  If the target control register
> is CR 8, 9, 12, 13, 17, or 20, this instructin executes as a null
> instruction."  I am assuming we are running at level 0 since the rfi
> command required running at level 0, so what is the difference between a
> null instruction and a nop?]

Level 0 refers to the hardware here.  Level 0 hardware basically has no MMU,
so Linux will never run on it (does HP/UX ?)

>  copy     %arg2,      %arg0   ; commandline to arg1
>  [Note:  I think the comment is incorrect... we are actually copying the
> Kernel_FreeMemStart into arg0 ... Am I missunderstanding the comment?]

No, looks like the comment did not get changed when the instruction did.

>                               ; arg3 is not changed..
>  .EXIT
>  rfi    ; begin execution of kernel.
>  nop
>  [Question: Page 5-139 from the PA-RISC 1.1 Architecture and Instruction
> Set Reference Manual states: "Execution of an RFI instruction when any
> of the PSW !, I, or R bits are ones is an undefined operation."  We are
> explicitly setting the Q & I bits before calling the rfi command.  I
> don't understand how this works ... ]

We did execute mtsm 0 which sets the system mask (which includes the Q, I and
R bits) to 0.

	Philipp Rumpf
