Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id C2FA0487B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Jun 2002 15:25:05 -0600 (MDT)
Message-Id: <200206212125.g5LLP37O028451@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] PA8000 modutils problems
To: xam@cs.ucc.ie (M. Grabert)
Date: Fri, 21 Jun 2002 17:25:03 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.LNX.4.44.0206212130310.4556-100000@sal.ucc.ie> from "M. Grabert" at Jun 21, 2002 09:52:20 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> Hi, I have some problems in compiling the latest kernels;
> 
> I tried pa35 (32bit), which caused unaligned address traps during boot
> (IIRC it was e2fsck).
> I rebooted with pa20, which worked (but has the known IO problems,
> i.e. copying a full CD to hard disk with lock up the machine).
> Later I tried compiling pa39 (32bit), but depmod reported
> "unhandled relocation of type 74" for each function in each module.
> Compiling 64bit with the (quite old) unofficial debs worked however,
> but there are some "unresolved symbols" in a few (=4) modules,
> each time the symbol is "__xchg64". I'm quite sure that in former times
> all modules worked. Since these modules are not important to me
> (smbfs and some ipv6 netfilter modules) there is no hurry ;)

Depmod does it own limited handling of relocations.  You probably
need to stick with the recommended compiler (debian 3.0.4 and binutils)
to be compatible with the relocation capability of depmod.  The
alignment issues also are likely a result of using 3.1.  BIGGEST_ALIGNMENT
was changed last Feb. to 128 bits to allow struct alignment suitable
for the ldcw semaphore insn.  I believe the deb version of gcc was
patched to do this as well.

> 
> I always compiled for the "PA8000" processor type; I know there were some
> issues with the PA8000 optimization and modutils, but remeber that these
> were fixed. Is this a regression ?

This only affects the scheduling of insns.  As far as I am aware,
there are no scheduling related bugs for any of the scheduling
models.  PA8000 will be the default for PA2.0 machines in 3.2.

Now, there is a known issue with PA2.0 code generation.  It affects
floating point loads from symbolic memory locations using the 32-bit
elf tools.  As a result, the code generation default is still PA1.1.
I'm planning to change this to PA2.0 for PA2.0 machines when the
assembler bug is fixed.

> One more question: is it a good idea to compile with gcc-3.1,
> e.g. make CC=gcc-3.1 HOSTCC=gcc-3.1 vmlinux ?
> Does gcc-3.1 generate better code (better optimized, fewer bugs?) or
> should I stick to gcc-3.0 since this is the "recommended" compiler
> (or at least the one the kernel developers use and know)

I would use the recommended compiler for the kernel.  It's difficult
to compare the debian patched versions with the vanilla FSF versions.
In general, 3.1 has fewer bugs than 3.0.  However, I doubt that it
is significantly better optimized.  For C++ apps, I would probably
go with a 3.2 snap because it has dw2 eh.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
