Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id KAA15866
	for <hppa-linux@sod.res.cmu.edu>; Fri, 26 Mar 1999 10:39:53 -0500
From: Michael Shalayeff <mickey@lucifier.dial-up.user.akula.net>
Message-Id: <199903261539.KAA28977@lucifier.dial-up.user.akula.net>
Subject: Re: [hppa-linux] syscall work
In-Reply-To: <36FACD03.6446ACF4@netscape.com> from Mike Shaver at "Mar 25, 99 06:55:47 pm"
To: hppa-linux@thepuffingroup.com
Date: Fri, 26 Mar 1999 10:39:43 -0500 (EST)
Cc: hppa-linux@thepuffingroup.com
Reply-To: mickey@openbsd.org
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Making, drinking tea and reading an opus magnum from Mike Shaver:
> Bob Pflederer wrote:
> > 
> > > OK, I'm convinced.  I've changed unistd.h to use 0xC0000404 (on the next
> > > page) for the syscall gateway, although we can easily change it back.
> > 
> > Isn't the next page at 0xc0001000?  Or does linux have some concept of
> > 1k "pages" even though pages in the TLB are 4k?
> 
> Brain-o.  0xC0001004 it is.
> 
> While we're on the topic, though: why 0xC0000004 and not 0xC0000000 as
0xC0000004 is because hpux uses it (;
dunno about linux's binary emulation principles, but for
all bsd's the emulation parameters pointer is located in the proc
structure, which allows syscall emulation to work even all
the emulated os'es are using the same syscall entry point (on some
architectures there might be only one possible way for syscall, 4 xampl)

> the target address?  (Although there are other bugs, like ``ldo 5,%r22''
> instead of ``ldi 5,%r22'' in the Assembler Ref as well, so maybe this is
> another?)
there is no such pa-risc instruction like ldi, it's a pseudo-asm-insn
which is actually ldo imm(0), rt
the whole pa-risc asm is full of pseudo-insns (like comb, comib, b(ranch))

cu

-- 
    paranoic mickey       (my employers have changed but, the name has remained)
