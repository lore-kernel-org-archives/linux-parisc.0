Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA24469
	for <parisc-linux@puffin.external.hp.com>; Sat, 13 Jan 2001 10:03:23 -0700
Message-Id: <200101131708.JAA08678@milano.cup.hp.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Oopser 
In-reply-to: Your message of "Sat, 13 Jan 2001 07:34:08 PST."
             <20010113073408.B16185@parcelfarce.linux.theplanet.co.uk>
Date: Sat, 13 Jan 2001 09:08:38 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> 
> I'm interested in having a useful debugging tool written by someone who
> knows the processor really well.  What I basically want to be able to
> do is call oopser(10 * HZ) and have the machine reliably crash in 10
> seconds time (and do a register dump).  that would at least tell me
> where the kernel's got to.

static inline void oopser(unsigned long t)
{
	unsigned long flags;
	unsigned long addr=(unsigned long) -8L;

	mdelay((t * 1000)/HZ);

	/* Oopsy doopsy willy fall down and go boom :^) */
        asm volatile(
		"       rsm     2,%0
			ldwx    0(%2),%1"
		: "=&r" (flags), "=r" (t) : "r" (addr) );
}

mdelay watches CR16 and doesn't need (or even want) interrupts
enabled. If you want a register dump to console, call panic
or steal^H^H^H^H^Hborrow code from panic.
Otherwise it'll be in the HPMC portion of the PIM dump.
If it's truly inlined, GR2 and PC will be preserved.

I'm pretty sure -8L (reset vector?) won't work - but anything in
0xF-space (I/O space) which isn't ever used by platform devices
should work. Offhand I can't pick an address for all platforms.

grant

> it'd be most useful if it worked with interrupts disabled, but even
> something which required interrupts to be enabled would be of some use.
> 
> -- 
> Revolutions do not require corporate support.
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
