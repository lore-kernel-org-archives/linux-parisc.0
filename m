From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] Breaking PARISC ABI - Testing procedures?
Date: Mon, 26 Aug 2002 15:41:35 -0400
Message-ID: <20020826194135.GC632__3781.57437448881$1416621651$gmane$org@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: debian-glibc@lists.debian.org
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

debian-gcc,

I sense another PARISC ABI breakage coming in the very near
future. The ABI breakage is caused by the following three
items:

1- setjmp/longjmp implementation is flawed (Testing)
2- mcontext_t is incorrect in glibc (BTS #157374)
3- sizeof(long double) is incorrect in gcc and glibc (?)

My main question is:

How does one run a preliminary test to ferret out
possibly problems that were not forseen?

My current procedure is to build a new glibc, create
a chroot, install glibc there and begin building things.

Does anyone have a general procedure for this? Or is
this what experimental or unstable is about? :/  

---

I'm working on providing various test cases for "1-" and 
I already have a patch in my local glibc tree (the initial
patch made the mistake of not allocating enough room for
jmpbuf - kudos to Randolph for noticing that during RFC).

I have a patch for "2-" and it works, but we have a kernel
bug when copying registers into the sigcontext that gets
passed back to a 32-bit userspace from a 64-bit kernel.
Luckily the old definition of mcontect_t matches the new
sigcontext typedef for accesses to general registers and
floating point registers, so we maintain backwards compat
in that scenario. I would like to note that it has never
worked when running a 64-bit kernel under parisc :}

The last issue will get fixed when I get around to poking
changes at gcc.

c.
