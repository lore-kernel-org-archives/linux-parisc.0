From: Stuart Brady <sdbrady@ntlworld.com>
Subject: Re: [parisc-linux] QEMU Port (Help needed)
Date: Mon, 5 Jun 2006 00:13:02 +0100
Message-ID: <20060604231302.GA18282@miranda.arrow>
References: <20060604160441.GA18082@miranda.arrow>
	<119aab440606041448t3952e3dfwf85f926ffdc5e441@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440606041448t3952e3dfwf85f926ffdc5e441@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jun 04, 2006 at 05:48:17PM -0400, Carlos O'Donell wrote:
> On 6/4/06, Stuart Brady <sdbrady@ntlworld.com> wrote:
> >I've had a stab at porting QEMU to PA-RISC... I've uploaded a patch
> >against QEMU 0.8.1 to:
> >
> >  http://homepage.ntlworld.com/wholehog/stuart/qemu/qemu-hppa-guest.diff
> >
> >It compiles, but I can't figure out why it's crashing.  Any ideas?
> 
> That's awesome to hear that you are working on QEMU for PARISC!
> It would rock to have a fast simulator. Even a semi-hosted environment
> would be a cool toy to play with.

It would be nice.  But I'm not sure if I _can_ finish this. :(

> Does QEMU crash?
> Does the emulated userspace crash?

QEMU crashes.  So far, I've only tried system emulation, not userspace
emulation.

An illegal instruction is being executed, and this appears to be for the
very first instruction that is emulated.  I get the following:

Program received signal SIGILL, Illegal instruction.
[Switching to Thread 16384 (LWP 6905)]
0x00b30f40 in stdout ()
(gdb)

bt makes gdb hang! :(  Unfortunately, my gdb-fu is pretty weak.

> A couple of comments about your patch:
> 
> 1. Remember 32-bit PARISC executables have both function pointers and
> function descriptors.

Ow.  I really have no idea about how this works.

> 2. The "gp" is r19, the "dp" is r27. I don't know what your reference
> to the "__dlt" is?

I don't know, either.  I was mainly guessing, based on what I saw in the
PA ELF supplement.  After changing it to use r19, gcc warns that r19 is
call-clobbered, but I don't know whether that's relevant.  I see the
same behaviour as before, though...

> 3. You can copy testandset from glibc linuxthreads pthread.h

Okay, I will do.  (I don't think this is the immediate problem, though.)

> 4. flush_icache_range can probably be copied from the kernel implementation.

Probably.  Much of QEMU is LGPLed, though... but I can certainly try
using the kernel implementation.

> Other than that, there are *all* sorts of things which could be wrong :)

Hmm... and they probably *are* wrong, too! :)

Thanks,
-- 
Stuart Brady
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
