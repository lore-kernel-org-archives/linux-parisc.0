From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] [RFC] Revamp exception handling in the kernel
Date: Sun, 12 Sep 2004 09:47:08 -0400
Message-ID: <20040912134707.GL1854@baldric.uwo.ca>
References: <20040911165325.GO28659@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: Randolph Chung <randolph@tausq.org>,
 James Bottomley <James.Bottomley@steeleye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040911165325.GO28659@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> The patch below, based on my discussions with jejb, changes this
> behaviour so that it more closely matches what happens on other
> architectures (but with a twist...): the exception table entries now
> contain an *absolute* address to branch to for the fixup [1]. The 
> fixups are placed in a separate fixup section (this simplifies a bit of 
> code in unaligned.c too). The fixup code loads up whatever values are 
> required by the caller, and typically branches back to the original 
> code at a correct location to continue.

I'm looking through the module loading code and worrying about how
absolute fixups works when a module needs a fixup?
 
> This frees up the bottom two bits for other purposes -- currently there
> is no way to pass the faulting address and instruction back to an
> exception table handler. The proposal is to reuse the bottom 2 bits to
> indicate whether the faulting address/insn should be passed back to the
> handler in r8/r9. (this will be used by the optimized pa copy routines,
> for example)

I think this is a brilliant proposal. I found the use of r8/r9 a bit
washy and rather useless in the current implementation.

> One downside of this approach is that the extra fixup sections take up
> more space, so the end kernel is bigger. In my test on 64-bit, the
> kernel size increases by ~2%.

What is that converted to bytes?
 
> The patch below has been tested against 2.6.8.1-pa11 on 64-bit-SMP, and
> compile tested on 32-bit-UP. I don't have a 32-bit machine to test on
> atm, so test reports are most welcome [2]. I've applied the manual stubs
> trick that jejb mentioned earlier, but only for 64-bit, since the 32-bit
> linker is able to generate those stubs automatically when needed.
> 
> Comments?

How are we handling module fixups with absolute fixup addresses?

Is there ever a case where you want only the faulting instruction and
not the faulting address aswell? This might be a case for saving a flag,
if you are going to write to r9 you might aswell write two words,
anyway? The code has already locked r8/r9 into variables and gcc won't
do a better job for you.

0x2 = 1 then Write r8/r9 values (slow path)
0x2 = 0 then do nothing (fast path)

Then 0x1 is free to be used for something magical.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
