Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id MAA17510
	for <hppa-linux@sod.res.cmu.edu>; Fri, 26 Mar 1999 12:03:59 -0500
From: Michael Shalayeff <mickey@lucifier.dial-up.user.akula.net>
Message-Id: <199903261703.MAA19278@lucifier.dial-up.user.akula.net>
Subject: Re: [hppa-linux] syscall work
In-Reply-To: <36FB6BA6.C5F70C93@netscape.com> from Mike Shaver at "Mar 26, 99 06:12:38 am"
To: shaver@netscape.com (Mike Shaver)
Date: Fri, 26 Mar 1999 12:03:26 -0500 (EST)
Cc: mickey@openbsd.org, hppa-linux@thepuffingroup.com
Reply-To: mickey@openbsd.org
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Making, drinking tea and reading an opus magnum from Mike Shaver:
> Michael Shalayeff wrote:
> > Making, drinking tea and reading an opus magnum from Mike Shaver:
> > > While we're on the topic, though: why 0xC0000004 and not 0xC0000000 as
> > 0xC0000004 is because hpux uses it (;
> Actually, I meant ``why does HP-UX use that address?''. =)
my guess is NULL-challenge (:

> > dunno about linux's binary emulation principles, but for
> > all bsd's the emulation parameters pointer is located in the proc
> > structure, which allows syscall emulation to work even all
> > the emulated os'es are using the same syscall entry point (on some
> > architectures there might be only one possible way for syscall, 4 xampl)
> 
> Yes, we can do that too (and do on SPARC for Solaris at least, perhaps
> SunOS as well), but it seems less efficient than just using different
> syscall numbers or -- in the case of lovely hardware like PA-RISC --
> using a different gateway address.
ok, valid.
let's think what is less efficient: extra mapped page, or
extra indirrect ptr reference?
my point is, why map extra page (and waiste extra page) ?
one page is 128 page dir entries, hehe (; returning to the pd discussion)

> > > the target address?  (Although there are other bugs, like ``ldo 5,%r22''
> > > instead of ``ldi 5,%r22'' in the Assembler Ref as well, so maybe this is
> > > another?)
> > there is no such pa-risc instruction like ldi, it's a pseudo-asm-insn
> > which is actually ldo imm(0), rt
> > the whole pa-risc asm is full of pseudo-insns (like comb, comib, b(ranch))
> 
> That I know, but ``ldo 5,%r22'' is illegal syntax (according to gas and
> the assembler reference, anyway), and that's what appears in the
> Assembler Ref.
ah, oh, that's too bad.
i guess i've made the typo/reado as they did in the manual (:
(btw, 'i' and 'o' are very close on the kbd ;)

cu

-- 
    paranoic mickey       (my employers have changed but, the name has remained)
