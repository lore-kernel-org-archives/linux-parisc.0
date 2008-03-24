From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Can't find a register in R1_REGS while reloading asm.
Date: Mon, 24 Mar 2008 08:28:48 -0400
Message-ID: <119aab440803240528n45bdd86ag193f50175d3d0c85@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc <linux-parisc@vger.kernel.org>,
	"John David Anglin" <dave.anglin@nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Dave,

I've switched over to gcc-4_3-branch to do some hppa-linux libc
testing. While the gcc testsuite looks OK, modulo the builtin-math
failures (and a completely failed libgomp testsuite, likely an
environment setup issue), I can no longer build glibc.

When compiling the first function which uses the atomic.h macro, I get
the following failure in reload:
~~~
../ports/sysdeps/unix/sysv/linux/hppa/nptl/lowlevellock.h:220: error:
can't find a register in class 'R1_REGS' while reloading 'asm
'
dcigettext.c:1106: error: can't find a register in class 'R1_REGS'
while reloading 'asm'
dcigettext.c:1168: error: can't find a register in class 'R1_REGS'
while reloading 'asm'
dcigettext.c:1198: error: can't find a register in class 'R1_REGS'
while reloading 'asm'
../ports/sysdeps/unix/sysv/linux/hppa/nptl/lowlevellock.h:220: error:
'asm' operand has impossible constraints
~~~

This is gcc/reload1.c (spill_failure) failing to find a spill for some
rtx that *needs* R1_REGS. AFAIK there is a small class of instructions
that use R1_REGS implicitly, I assume one of those is needing r1 and
can't get a use for it.

If reload was naive it could just spill/restore everything, but I
think it's trying too hard and failing.

Do you have any hints for debugging this? Will I have to turn this
macro into a function to avoid this sort of issue? I hate to take the
function call penalty.

Cheers,
Carlos.
