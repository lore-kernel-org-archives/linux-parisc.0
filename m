Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA03990
	for <parisc-linux@puffin.external.hp.com>; Sat, 2 Sep 2000 19:01:58 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 3 Sep 2000 01:02:07 -0000
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Boot error on C200+
References: <39B1822A.4E8F20AB@uswest.net>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 02 Sep 2000 21:00:33 -0400
In-Reply-To: Ryan Bradetich's message of "Sat, 02 Sep 2000 16:41:46 -0600"
Message-ID: <87em32l26m.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Ryan Bradetich <rbradetich@uswest.net> writes:

> Kernel Fault: Code=7 regs=c7f98248 (Addr=00000110)
> 
> PSW  : 0004000b  GR 1 : 00002000  GR 2 : 00013403  GR 3 : 00000000
> GR 4 : 2001ff74  GR 5 : 00000000  GR 6 : 000777f4  GR 7 : 000010c4
> GR 8 : 000011bc  GR 9 : c7f98000  GR10 : c022fa78  GR11 : c0270030
> GR12 : c0270008  GR13 : c022fe14  GR14 : c0270000  GR15 : 617bfdfb
> GR16 : c027c60c  GR17 : 00000000  GR18 : c02b0000  GR19 : 00000001
> GR20 : 00000037  GR21 : 00089b9c  GR22 : 00089bd8  GR23 : 000010c4
> GR24 : 2001ff74  GR25 : 00000001  GR26 : 00000000  GR27 : 00088f00
> GR28 : b64d8e60  GR29 : b44302d0  GR30 : 20020140  GR31 : 00022d63
> SR0  : 00002000  SR1  : fffd2dff  SR2  : 00000000  SR3  : 00002000
> SR4  : 00000000  SR5  : 00002000  SR6  : 00002000  SR7  : 00002000
> 
> IASQ : 00000000 00000000 IAOQ : 00000110 00000114 ORIG_R28 : ffdf7fff
                           ^^^^^^^^^^^^^^^^^^^^^^^^

That is the syscall gateway page.  Note that the low bits of IAOQ are
clear, so you are running in kernel mode and kernel space at this
point.  Note also that the IAOQ points to just after the 'gate'
instruction in linux_gateway_page, and from the look of the space
registers, you've managed to successfully execute the instruction in
the delay slot of the gate (mtsp %r0,%sr4) but nothing else.

Note that GR20 is 0x37, which is the syscall number for fcntl(), which
confirms your earlier findings :-)

>  IIR : 43ffff40 ISR : 00000000 IOR : 00000000

That IIR doesn't look like any instruction on the syscall page that I
know of.  Perhaps the gateway page is not getting mapped properly.
The fact that it is trapping after the 'gate' instruction seems to
support this.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
