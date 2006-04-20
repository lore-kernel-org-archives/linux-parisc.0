From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] Does it lakes some cloberred r1 in
Date: Thu, 20 Apr 2006 16:04:20 -0400
Message-ID: <119aab440604201304g165a9218n885ef29fbfb7983b@mail.gmail.com>
References: <119aab440604201009t2e5513c4n69b4a68477998768@mail.gmail.com>
	<200604201728.k3KHSH7W022804@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
 "Parisc List" <parisc-linux@lists.parisc-linux.org>,
 randolph <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200604201728.k3KHSH7W022804@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

parisc,

Cat's out of the bag, even Dave seems interested. Randolph, tell me
when I'm wrong. I did a review of this code for Randolph when he
implemented the first iteration.

> > Q: Does the process of interruption clobber registers?
> r8 and r9?

Normally no, these are shadowed registers. However see below.

Routines used reside in:
~~~~~~~~~~~~~~~~~~
kernel/entry.S
kernel/traps.c
mm/fault.c

Exception Stages:
~~~~~~~~~~~~~~~
Exception happens.
Trap handler executes.
We don't handle the exception in assembly?
Shadow registers are not enough to execute C code.
All registers saved.
Load or Store has an exception table entry "fixup" in the kernel.
iaoq[0] and iaoq[1] are set to the address of the fixup.
gr[0] has the B-bit zeroed.
When the interrupt returns you execute the fixup function.

A: The process of interruption does not clobber any registers.
Corollory: The process of fixup uses r8/r9 as outputs, with r1 clobbered.

A: The fixups run in the original context of the failed load/store.

Generic Fixup Functions
~~~~~~~~~~~~~~~~~~~
There are 4 generic fixup functions:
The first 2 correspond to failed loads.
The second 2 correspond to failed stores.
There is also a FIXUP_BRANCH in the emulation routines.

arch/parisc/lib/fixup.S
fixup_get_user_skip1  (Skip 1 word, used in 32-bit mode)
fixup_get_user_skip2  (Skip 2 words, used in 64-bit mode)
fixup_put_user_skip1  ( " )
fixup_put_user_skip2  ( " )

The macro "get_fault_ip" is used by each of the 4 generic
fixups and clobbers both inputs and r1.

The registers used for each of the following functions:
r8 - Stores return value / Used as temp in get_fault_ip
r9 - Returned value (We don't want to clobber ret0)
r1 - Used as temp to load fault ip + 4/8, Used as temp in get_fault_ip.

All of the put get asm routines should list "r1" as a clobber.
All of the put get asm routines already list r8 and r9 as outputs.

Joel is correct in saying that there is a __put_kernel_asm for 64-bit
mode which is missing an r1 clobber. However, you need to know why
you are correct and understand the repercussions of the change.

All of the routines using FIXUP_BRANCH must specify "r1" clobbered.

Caveats:
- The fixup routines read the exception tables but don't list that
  memory as an input. Hence mixing put and get user/kernel
  calls and modifications to the exception tables is dangerous?

Summary:
- Add the missing "r1" clobber to the 64-bit put kernel macro.
  Run a boot test. Post a patch including the result of the boot test.

- Add the missing "r1" clobbers to any asm using FIXUP_BRANCH.
  Run a boot test. Post a pach including the result of the boot test.

Thanks!

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
