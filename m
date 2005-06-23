From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: Thu, 23 Jun 2005 09:09:52 -0400 (EDT)
Message-ID: <200506231309.j5ND9qHA021191@hiauly1.hia.nrc.ca>
References: <4282FEEC00010335@mail-3-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4282FEEC00010335@mail-3-bnl.tiscali.it> from "Joel Soete" at Jun
	23, 2005 09:19:51 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> And effectively with -mdisable-fpregs option a function like <do_setitimer>
> (amoung others) used __muldi3 as in:
> [...]
> 1012b630:       e8 4b 01 61     b,l 101016e8 <__muldi3>,rp
> [...]
> 1012b650:       e8 4b 01 21     b,l 101016e8 <__muldi3>,rp
> 1012b654:       08 03 02 5a     copy r3,r26
> [...]

The same issue that I mentioned previously applies to -mdisable-fpregs.
__muldi3 and similar routines in libgcc use fp regs and the xmpyu for
64-bit multiplation.  It takes two 32-bit values and produces a 64-bit
result.  In millicode, we can multiple to 32 bit values and produce a
32-bit result.  This isn't sufficient to implement __muldi3.  GCC needs
a pattern to duplicate xmpyu using millicode.  This could be done by
"long" multiplication.  Break the 32-bit values into two 16-bit chunks
and use the millicode multiply.

HPUX has millicode routines to do larger multiplication but these
routines weren't released.

I'm a bit surprised that 32-bit kernels needs 64-bit multiplication.
Anyway, xmpyu is much more efficient for multiplication than software.
Possibly, I should look at using the -mfixed-range option when building
libgcc as a first step.  Looking at libgcc, I think it needs fr4, fr5
and fr22-fr26.  __mulvdi3 needs the most registers.  The argument
registers are needed for some floating point conversion routines.
I doubt the kernel uses these.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
