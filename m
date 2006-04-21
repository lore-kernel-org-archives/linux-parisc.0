From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] Does it lakes some cloberred r1 in
Date: Fri, 21 Apr 2006 13:52:40 -0500
Message-ID: <200604211352.40519.mszick@morethan.org>
References: <119aab440604201009t2e5513c4n69b4a68477998768@mail.gmail.com>
	<200604201728.k3KHSH7W022804@hiauly1.hia.nrc.ca>
	<119aab440604201304g165a9218n885ef29fbfb7983b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440604201304g165a9218n885ef29fbfb7983b@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu April 20 2006 15:04, Carlos O'Donell wrote:
> parisc,
>

Some 'deep background' since the thread Joel and I are discussing
is nearly a month old now.
http://lists.parisc-linux.org/pipermail/parisc-linux/2006-March/028603.html
 
> Cat's out of the bag, even Dave seems interested. Randolph, tell me
> when I'm wrong. I did a review of this code for Randolph when he
> implemented the first iteration.
> 
> > > Q: Does the process of interruption clobber registers?
> > r8 and r9?
> 
> Normally no, these are shadowed registers. However see below.
> 

The relevant part of the dump:

IASQ: 0000000000000000 0000000000000000 IAOQ: 000000001010e728 000000001010e718
 IIR: 0f48109c    ISR: 0000000000000080  IOR: 0000000000000002
 CPU:        0   CR30: 000000008b1bc000 CR31: 000000001053c000
 ORIG_R28: 000000001013f77c
 IAOQ[0]: _read_lock+0x18/0x30
 IAOQ[1]: _read_lock+0x8/0x30
 RP(r2): send_group_sig_info+0x3c/0xb0

Note the values of IAOQ...

I told Joel that the only way I knew of they could look like that
was a branch in the delay slot of a branch.

Which is a neat way to execute one instruction out of linear, sequential
order, but that I did not believe the compiler used that trick.
I.E:
It was either hand coded that way or a sign of something wrong.
[I might have told Joel wrong - if so, sorry Joel]

I did not think of the possibility of the queue being diddled with, using
the trashed value of a register.

I mention this at this time, so eyes can be watching for this 'back to
the future' execution order after this set of fixes goes in.

Mike

> Routines used reside in:
> ~~~~~~~~~~~~~~~~~~
> kernel/entry.S
> kernel/traps.c
> mm/fault.c
> 
> Exception Stages:
> ~~~~~~~~~~~~~~~
> Exception happens.
> Trap handler executes.
> We don't handle the exception in assembly?
> Shadow registers are not enough to execute C code.
> All registers saved.
> Load or Store has an exception table entry "fixup" in the kernel.
> iaoq[0] and iaoq[1] are set to the address of the fixup.
> gr[0] has the B-bit zeroed.
> When the interrupt returns you execute the fixup function.
> 
> A: The process of interruption does not clobber any registers.
> Corollory: The process of fixup uses r8/r9 as outputs, with r1 clobbered.
> 
> A: The fixups run in the original context of the failed load/store.
> 
> Generic Fixup Functions
> ~~~~~~~~~~~~~~~~~~~
> There are 4 generic fixup functions:
> The first 2 correspond to failed loads.
> The second 2 correspond to failed stores.
> There is also a FIXUP_BRANCH in the emulation routines.
> 
> arch/parisc/lib/fixup.S
> fixup_get_user_skip1  (Skip 1 word, used in 32-bit mode)
> fixup_get_user_skip2  (Skip 2 words, used in 64-bit mode)
> fixup_put_user_skip1  ( " )
> fixup_put_user_skip2  ( " )
> 
> The macro "get_fault_ip" is used by each of the 4 generic
> fixups and clobbers both inputs and r1.
> 
> The registers used for each of the following functions:
> r8 - Stores return value / Used as temp in get_fault_ip
> r9 - Returned value (We don't want to clobber ret0)
> r1 - Used as temp to load fault ip + 4/8, Used as temp in get_fault_ip.
> 
> All of the put get asm routines should list "r1" as a clobber.
> All of the put get asm routines already list r8 and r9 as outputs.
> 
> Joel is correct in saying that there is a __put_kernel_asm for 64-bit
> mode which is missing an r1 clobber. However, you need to know why
> you are correct and understand the repercussions of the change.
> 
> All of the routines using FIXUP_BRANCH must specify "r1" clobbered.
> 
> Caveats:
> - The fixup routines read the exception tables but don't list that
>   memory as an input. Hence mixing put and get user/kernel
>   calls and modifications to the exception tables is dangerous?
> 
> Summary:
> - Add the missing "r1" clobber to the 64-bit put kernel macro.
>   Run a boot test. Post a patch including the result of the boot test.
> 
> - Add the missing "r1" clobbers to any asm using FIXUP_BRANCH.
>   Run a boot test. Post a pach including the result of the boot test.
> 
> Thanks!
> 
> Cheers,
> Carlos.
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
