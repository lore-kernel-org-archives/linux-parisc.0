Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA30755
	for <parisc-linux@puffin.external.hp.com>; Sun, 19 Nov 2000 11:33:50 -0700
Received: from hpugrca.grc.hp.com (hpugrca.grc.hp.com [15.137.20.50])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id 5782E1EC33
	for <parisc-linux@thepuffingroup.com>; Sun, 19 Nov 2000 19:35:59 +0100 (MET)
Received: from trillian.grc.hp.com (grccd310.grc.hp.com [15.139.202.109]) by hpugrca.grc.hp.com with ESMTP (8.8.6 (sendmail_886_v2)/8.7.3 SMKit7.01) id TAA17110 for <parisc-linux@thepuffingroup.com>; Sun, 19 Nov 2000 19:35:57 +0100 (MET)
Received: from marvin by trillian.grc.hp.com with local (Exim 3.16 #1 (Debian))
	id 13xZJl-00057Y-00
	for <parisc-linux@thepuffingroup.com>; Sun, 19 Nov 2000 19:35:57 +0100
Date: Sun, 19 Nov 2000 19:35:57 +0100
To: lrisc-Linux <parisc-linux@thepuffingroup.com>
Message-ID: <20001119193557.A8796@grccd310.grc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: Ingo Matthaes <imatthae@grc.hp.com>
Subject: [parisc-linux] A500 and glibc woes
List-ID: <linux-parisc.vger.kernel.org>

finally we've got a A500 for palinux testing. Unfortunately
we have some problems with it.
A 32 bit kernel complains about a very old firmware and claims
"that machine will probably never run linux"  But in fact, it 
will :-)
First question: Did anyone ever succeeded with a 32bit kernel
on that hardware ?

A 64 bit Kernel boots fine and recognizes all available hardware 
including the additional 100BT card. But it traps with the init
which comes with the latest nfsroot tarball. I built a new one
from the sourcesw of debians sysvlinux-2.78 and it does not trap
anymore, but the kernel told me about unimplemented 32 syscalls.
At this point I tried to build a 64 bit glibc in order to get
a crt1.o , which is needed to builf for a 64bit init.

Did anyone ever build a 64bit glibc out of the current cvs tree ?
Today I've got 


ologue/epilogue insn

(insn 433 431 435 (set (reg:DI 26 %r26)
        (reg:DI 2 %r2)) -1 (nil)
    (nil))
../sysdeps/unix/sysv/linux/init-first.c:105: Unrecognizable insn:

(insn 440 438 441 (set (reg:DI 24 %r24)
        (lo_sum:DI (reg:DI 1 %r1)
            (symbol_ref:DI ("LP$-001")))) -1 (insn_list 437 (nil))
    (expr_list:REG_DEAD (reg:DI 1 %r1)
        (expr_list:REG_UNUSED (reg:DI 24 %r24)
            (nil))))
../sysdeps/unix/sysv/linux/init-first.c:105: Internal compiler error in num_delay_slots, at insn-attrtab.c:2505

Thats the point I'm currently stucking.

BTW If someone involved into the port with access to the internal HP 
    Network needs access to that machine, please contact me.

Later
     Ingo

-- 
Tel: ++49-2102-908-210              German Response Center
Fax: ++49-2102-907-934              Berliner Str. 111
Mailto: Ingo_Matthaes@hp.com        40880 Ratingen
                                    Germany

HP Unix/Linux Competency Center
Network and High AvailabilitY

OpenPGP fingerprint = 4298E7785FFD65DC8950 14E9F17F8CB5B611AA4A
