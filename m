From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Can't find a register in R1_REGS while reloading asm.
Date: Mon, 24 Mar 2008 13:04:02 -0400 (EDT)
Message-ID: <20080324170403.630904EB5@hiauly1.hia.nrc.ca>
References: <119aab440803240528n45bdd86ag193f50175d3d0c85@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, dave.anglin@nrc.ca
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440803240528n45bdd86ag193f50175d3d0c85@mail.gmail.com> from "Carlos O'Donell" at Mar 24, 2008 08:28:48 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> I've switched over to gcc-4_3-branch to do some hppa-linux libc
> testing. While the gcc testsuite looks OK, modulo the builtin-math
> failures (and a completely failed libgomp testsuite, likely an
> environment setup issue), I can no longer build glibc.
> 
> When compiling the first function which uses the atomic.h macro, I get
> the following failure in reload:
> ~~~
> ../ports/sysdeps/unix/sysv/linux/hppa/nptl/lowlevellock.h:220: error:
> can't find a register in class 'R1_REGS' while reloading 'asm
> '
> dcigettext.c:1106: error: can't find a register in class 'R1_REGS'
> while reloading 'asm'
> dcigettext.c:1168: error: can't find a register in class 'R1_REGS'
> while reloading 'asm'
> dcigettext.c:1198: error: can't find a register in class 'R1_REGS'
> while reloading 'asm'
> ../ports/sysdeps/unix/sysv/linux/hppa/nptl/lowlevellock.h:220: error:
> 'asm' operand has impossible constraints
> ~~~
> 
> This is gcc/reload1.c (spill_failure) failing to find a spill for some
> rtx that *needs* R1_REGS. AFAIK there is a small class of instructions
> that use R1_REGS implicitly, I assume one of those is needing r1 and
> can't get a use for it.
> 
> If reload was naive it could just spill/restore everything, but I
> think it's trying too hard and failing.
> 
> Do you have any hints for debugging this? Will I have to turn this
> macro into a function to avoid this sort of issue? I hate to take the
> function call penalty.

This is GCC PR 35193.  This is really a gcse/reload issue.  At the
moment, I don't have a fix.

The fundamental issue is there's only one r1 register and its
needed for memory loads and stores.  The PA backend has always used
separate rtl for the addil insn.  This makes it possible for gcse
to eliminate duplicated addil insns.  However, it can't do this
if the two addil insns are separated by a call or an asm which uses
r1 (well it could if reload didn't pick r1 for the addil).

We never see this problem for calls.  The asm in this case is effectively
a call but it lacks some of the attribute of a call insn.

Reload gets in trouble when it picks r1.  If it had picked some
other register (ie., one that isn't clobbered by the asm), the ICE
wouldn't have occurred.  Older GCC versions do this but I was unable
to find any specific change that introduced the failure.  It seems
the problem was latent.

r1 is essentially last in the register allocation order.  This was
clearly done to prevent this situation.

Possibly, something could be done with costs.  This probably could be
fixed in the backend, but it would require some nasty post reload
splits.  However, I think the approach would be detrimental to overall
code.  So, I think it would be better to adjust gcse or reload.

Turning the macro into a function call would help, but this is a GCC
bug.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
