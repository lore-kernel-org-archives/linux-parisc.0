Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 03A554A18
	for <parisc-linux@lists.parisc-linux.org>; Wed, 31 Jan 2001 11:11:19 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA12352
	for <parisc-linux@puffin.external.hp.com>; Wed, 31 Jan 2001 11:07:11 -0700
Message-Id: <200101311813.KAA29222@milano.cup.hp.com>
To: Greg Ingram <ingram@symsys.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 2.4.1 Bits Won't Drive C100 
In-reply-to: Your message of "Wed, 31 Jan 2001 10:37:14 PST."
             <Pine.LNX.4.21.0101311009300.28557-100000@maestro.symsys.com>
Date: Wed, 31 Jan 2001 10:13:23 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Greg Ingram wrote:
> 
> Howdy,
> 
> Just tried the lastest 2.4.1 bits from CVS and it barfs on my C100.  
> Output follows.

Greg,
was this using the default .config?
ie the following sequence:
cvs update -A
make distclean
make oldconfig
make dep
make palo

(where cvs update reports no changes)


> No CPUs reported by firmware - probing...
> Found CPU at fffa0000
> CPU(s): 1 x PA7200 (PCX-T') at 100.000000 MHz

This is the output I was worried wouldn't work based on my recent changes.
It seems to be ok.


> SCSI subsystem driver Revision: 1.00
> zalon_scsi_callback: Zalon vers field is 0x1, IRQ 34
> ncr53c8xx: 53c720 detected

drivers/scsi/ncr53c8xx.c hasn't changed in a while:
| revision 1.14
| date: 2000/11/15 20:02:43;  author: rhirst;  state: Exp;  lines: +2 -2
| Allow lasi and zalon scsi in the same kernel

However, it looks like drivers/scsi/scsi_ioctl.c did:
| revision 1.6
| date: 2001/01/25 00:01:45;  author: willy;  state: Exp;  lines: +32 -44
| 
| Linus 2.4.0 merge (take one)
| ----------------------------
| revision 1.5
| date: 2000/11/10 21:43:28;  author: bame;  state: Exp;  lines: +5 -0
| merge with 2.4.0-test10
...

Or have you been able to boot kernels since the 2.4.0 merge?

I don't have time to chase this further (unless it crashes a box
I'm using :^). Any other takers?

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
