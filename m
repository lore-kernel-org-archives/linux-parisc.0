Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id LAA16475
	for <hppa-linux@sod.res.cmu.edu>; Fri, 26 Mar 1999 11:10:26 -0500
Received: from tintin.mcom.com (tintin.mcom.com [205.217.233.42])
	by netscape.com (8.8.5/8.8.5) with ESMTP id IAA02162
	for <hppa-linux@thepuffingroup.com>; Fri, 26 Mar 1999 08:09:48 -0800 (PST)
Sender: shaver@netscape.com (Mike Shaver)
Message-ID: <36FB6BA6.C5F70C93@netscape.com>
Date: Fri, 26 Mar 1999 06:12:38 -0500
From: Mike Shaver <shaver@netscape.com>
MIME-Version: 1.0
To: mickey@openbsd.org
CC: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] syscall work
References: <199903261539.KAA28977@lucifier.dial-up.user.akula.net>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Michael Shalayeff wrote:
> Making, drinking tea and reading an opus magnum from Mike Shaver:
> > While we're on the topic, though: why 0xC0000004 and not 0xC0000000 as
> 0xC0000004 is because hpux uses it (;

Actually, I meant ``why does HP-UX use that address?''. =)

> dunno about linux's binary emulation principles, but for
> all bsd's the emulation parameters pointer is located in the proc
> structure, which allows syscall emulation to work even all
> the emulated os'es are using the same syscall entry point (on some
> architectures there might be only one possible way for syscall, 4 xampl)

Yes, we can do that too (and do on SPARC for Solaris at least, perhaps
SunOS as well), but it seems less efficient than just using different
syscall numbers or -- in the case of lovely hardware like PA-RISC --
using a different gateway address.

> > the target address?  (Although there are other bugs, like ``ldo 5,%r22''
> > instead of ``ldi 5,%r22'' in the Assembler Ref as well, so maybe this is
> > another?)
> there is no such pa-risc instruction like ldi, it's a pseudo-asm-insn
> which is actually ldo imm(0), rt
> the whole pa-risc asm is full of pseudo-insns (like comb, comib, b(ranch))

That I know, but ``ldo 5,%r22'' is illegal syntax (according to gas and
the assembler reference, anyway), and that's what appears in the
Assembler Ref.

Mike

-- 
158640.45 72598.35
