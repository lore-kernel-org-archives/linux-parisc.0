Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA16691
	for <parisc-linux@puffin.external.hp.com>; Mon, 21 Aug 2000 12:18:04 -0600
Received: from ppp-1-63.cvx3.telinco.net (HELO rhirst.linuxcare.com) (@212.1.144.63)
  by mailserv2.iuinc.com with SMTP; 21 Aug 2000 18:17:53 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 7CAC2B005; Mon, 21 Aug 2000 19:16:42 +0100 (BST)
Date: Mon, 21 Aug 2000 19:16:42 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: David Huggins-Daines <dhd@linuxcare.com>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] test6 merge
Message-ID: <20000821191641.I4060@linuxcare.com>
References: <20000815160510.C7757@vodka.thepuffingroup.com> <20000819182245.F13870@linuxcare.com> <87itsuy2ef.fsf@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <87itsuy2ef.fsf@linuxcare.com>; from dhd@linuxcare.com on Mon, Aug 21, 2000 at 01:01:12PM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Aug 21, 2000 at 01:01:12PM -0400, David Huggins-Daines wrote:
> Richard Hirst <rhirst@linuxcare.com> writes:
> 
> > Those two files have a number of function names in common; they are
> > declared static, so it shouldn't matter.  ncr_chip_reset() is one
> > example.  In practice, the code in ncr53c8xx.c tries to call its local
> > ncr_chip_reset(), but ends up in the ncr_chip_reset() function in
> > sym53c8xx.c.
> > 
> > It appeared to work fine with 2.3.99pre8, and I havn't changed my
> > cross compiler.
> 
> I'm not seeing this problem here, at least, not based on an
> examination of the kernel's object code.
> 
> In mine I have:
> 
> sym53c8xx: ncr_chip_reset = c01cdec0 (a4)
>            ncr_attach     = c02a37e4 (934)
> ncr53c8xx: ncr_chip_reset = c01cdf80 (e8)
>            ncr_attach     = c02a6ff0 (5d8)

I have:

sym53c8xx: c01c4800 t ncr_chip_reset
           c029b964 ? ncr_attach
ncr53c8xx: c01c48c0 t ncr_chip_reset
           c029f130 ? ncr_attach

> Where ncr_attach calls ncr_chip_reset, it looks like:
> 
>     1d34:	0e b3 12 80 	stw  r19,0(sr0,r21)
>     1d38:	08 03 02 5a 	copy r3,r26
>     1d3c:	e8 40 00 00 	b,l 1d44 <ncr_attach+0x354>,rp
> 			1d3c: R_PARISC_PCREL17F	ncr_chip_reset
> 
> And in the object file, we have:
> 
> c02a7334:       0e b3 12 80     stw  r19,0(sr0,r21)
> c02a7338:       08 03 02 5a     copy r3,r26
> c02a733c:       e8 58 12 fd     b,l c0298cc0 <__init_begin+0xcc0>,rp

I have

c029f484:       08 03 02 5a     copy r3,r26
c029f488:       e8 58 04 d5     b,l c02906f8 <__init_begin+0x6f8>,rp

> 
> Pointing at this stub:
> 
> c0298cc0:       20 26 f8 03     ldil -3fe32800,r1
> c0298cc4:       e0 20 2f 02     be,n 780(sr4,r1)

Mine is

c02906f8:       20 22 d8 03     ldil -3fe3b800,r1
c02906fc:       e0 20 20 02     be,n 0(sr4,r1)


> 0x780 - 0x3fe32800 = 0xc01cdf80, which is the right one.

0 - 0x3fe3b800 = 0xc01c4800, which is the WRONG one

> This is with today's binutils.

This is with xc-20000802

For completeness, in sym53c8xx.c version of ncr_attach() I see

c029c010:       68 74 13 80     stw r20,9c0(sr0,r3)
c029c014:       e8 5a 0d b9     b,l c02906f8 <__init_begin+0x6f8>,rp

Which points at the same stub.

Guess I need a new binutils.

Thanks for your help,

Richard
