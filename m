From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Can't find a register in R1_REGS while reloading asm.
Date: Mon, 24 Mar 2008 09:03:31 -0400
Message-ID: <119aab440803240603h1d465daamafa380767f171f4d@mail.gmail.com>
References: <119aab440803240528n45bdd86ag193f50175d3d0c85@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc <linux-parisc@vger.kernel.org>,
	"John David Anglin" <dave.anglin@nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440803240528n45bdd86ag193f50175d3d0c85@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Mar 24, 2008 at 8:28 AM, Carlos O'Donell
<carlos@systemhalted.org> wrote:
> Dave,
>
>  I've switched over to gcc-4_3-branch to do some hppa-linux libc
>  testing. While the gcc testsuite looks OK, modulo the builtin-math
>  failures (and a completely failed libgomp testsuite, likely an
>  environment setup issue), I can no longer build glibc.
>
>  When compiling the first function which uses the atomic.h macro, I get
>  the following failure in reload:
>  ~~~
>  ../ports/sysdeps/unix/sysv/linux/hppa/nptl/lowlevellock.h:220: error:
>  can't find a register in class 'R1_REGS' while reloading 'asm
>  '
>  dcigettext.c:1106: error: can't find a register in class 'R1_REGS'
>  while reloading 'asm'
>  dcigettext.c:1168: error: can't find a register in class 'R1_REGS'
>  while reloading 'asm'
>  dcigettext.c:1198: error: can't find a register in class 'R1_REGS'
>  while reloading 'asm'
>  ../ports/sysdeps/unix/sysv/linux/hppa/nptl/lowlevellock.h:220: error:
>  'asm' operand has impossible constraints
>  ~~~

I looked up how constrain_operands() works, and I realized that the
correct solution is probably this:

1) Remove "memory" from clobber.
2) Change the output constraint "=m" (*mem) to "+m" (*mem) to express
that the memory may be written to by the CAS operation.

This is a tighter constraint than before, but it is no longer
ambiguous. Previously we said we clobbered memory, but yet specified
some as read-only.

I was also worried about "*mem" as an output, and "mem" as a register
input. You need to treat these mem/pointer pairs with care.

This change to asm seems to have fixed the build failure. Yay.

Cheers,
Carlos.
