From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Error case in execve_wrapper?
Date: Sat, 27 Mar 2010 23:49:39 -0400
Message-ID: <119aab441003272049i3e554cb8i8dbfd13219865173@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc <linux-parisc@vger.kernel.org>,
	Helge Deller <deller@gmx.de>, Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Helge,

In arch/parisc/kernel/entry.S (execve_wrapper) we have this code:

        BL \execve,%r2
        copy %r1,%arg0

        ldo -FRAME_SIZE(%r30),%r30
        LDREG -RP_OFFSET(%r30),%r2

        /* If exec succeeded we need to load the args */

        ldo -1024(%r0),%r1
        cmpb,>>= %r28,%r1,error_\execve
        copy %r2,%r19

error_\execve:
        bv %r0(%r19)
        nop
        .endm

Why does this wrapper check the result of execve?

The cmpb has no nullification, therefore it always copies the return
pointer into r19, and we branch back to the syscall return path. IMO
checking the result of the syscall is not useful, since everything
should already be setup such that the normal restore process returns
to the newly exec'd process.

Comments?

Cheers,
Carlos.
