Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA15557
	for <parisc-linux@puffin.external.hp.com>; Mon, 21 Aug 2000 11:02:06 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 21 Aug 2000 17:01:56 -0000
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] test6 merge
References: <20000815160510.C7757@vodka.thepuffingroup.com> <20000819182245.F13870@linuxcare.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 21 Aug 2000 13:01:12 -0400
In-Reply-To: Richard Hirst's message of "Sat, 19 Aug 2000 18:22:45 +0100"
Message-ID: <87itsuy2ef.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Richard Hirst <rhirst@linuxcare.com> writes:

> Those two files have a number of function names in common; they are
> declared static, so it shouldn't matter.  ncr_chip_reset() is one
> example.  In practice, the code in ncr53c8xx.c tries to call its local
> ncr_chip_reset(), but ends up in the ncr_chip_reset() function in
> sym53c8xx.c.
> 
> It appeared to work fine with 2.3.99pre8, and I havn't changed my
> cross compiler.

I'm not seeing this problem here, at least, not based on an
examination of the kernel's object code.

In mine I have:

sym53c8xx: ncr_chip_reset = c01cdec0 (a4)
           ncr_attach     = c02a37e4 (934)
ncr53c8xx: ncr_chip_reset = c01cdf80 (e8)
           ncr_attach     = c02a6ff0 (5d8)

Where ncr_attach calls ncr_chip_reset, it looks like:

    1d34:	0e b3 12 80 	stw  r19,0(sr0,r21)
    1d38:	08 03 02 5a 	copy r3,r26
    1d3c:	e8 40 00 00 	b,l 1d44 <ncr_attach+0x354>,rp
			1d3c: R_PARISC_PCREL17F	ncr_chip_reset

And in the object file, we have:

c02a7334:       0e b3 12 80     stw  r19,0(sr0,r21)
c02a7338:       08 03 02 5a     copy r3,r26
c02a733c:       e8 58 12 fd     b,l c0298cc0 <__init_begin+0xcc0>,rp

Pointing at this stub:

c0298cc0:       20 26 f8 03     ldil -3fe32800,r1
c0298cc4:       e0 20 2f 02     be,n 780(sr4,r1)

0x780 - 0x3fe32800 = 0xc01cdf80, which is the right one.

This is with today's binutils.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
