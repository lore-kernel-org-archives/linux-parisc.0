Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mout0.freenet.de (mout0.freenet.de [194.97.50.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id A764D482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 28 Jul 2001 04:36:21 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Reinhard Gimbel <Reinhard.Gimbel@freenet.de>
Reply-To: Reinhard.Gimbel@freenet.de
To: Grant Grundler <grundler@puffin.external.hp.com>
Date: Sat, 28 Jul 2001 12:35:20 +0200
Cc: parisc-linux@lists.parisc-linux.org, rbradetich@uswest.net
References: <200107261836.MAA19533@puffin.external.hp.com>
In-Reply-To: <200107261836.MAA19533@puffin.external.hp.com>
MIME-Version: 1.0
Message-Id: <01072812322001.00935@octopus>
Subject: [parisc-linux] C180 DINO/PCI problem; was: Help on install (2)
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:

> Reinhard Gimbel wrote:
> > My expirence is that the DINO I/O chip seems to be the key
> > element for that problem. Version 1.x of this chip crashes
> > the system like you describe it (crash during boot ... :-(
> > )
>
> You have Dino 1.x ? I didn't think HP ever shipped those to
> customers. Or did you mean another chip?
> Perhaps post the console log output?

A friend of mine has a C180 with DINO v1.x (according to the
boot messages of that box; I do not have a log of that box on 
hand at present).

The boot messages of my box (as posted in parisc-linux digest 
vol. 1 #204) looks like this:

[...]

Dino version 2.1 (bridge mode) found at 0xf2000000
 
 
The GSCtoPCI (Dino hrev 1) bus converter found may exhibit
data corruption.  See Service Note Numbers: A4190A-01, A4191A-01.
Systems shipped after Aug 20, 1997 will not exhibit this problem.
Models affected: C180, C160, C160L, B160L, and B132L workstations.
 
dino_bridge_init: IO_ADDR_EN hasn't been configured.
kernel BUG at dino.c:808!

[...]

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111100100001110
r0-3     00000000 102b2810 101c97cc 1f7a3a00
r4-7     1f7a3a28 00000006 00000000 00000000
r8-11    1f7a2000 000000ff 1fe02a74 00000200
r12-15   102b2810 00000001 00000400 1f584688
r16-19   1f584588 00000000 00000000 dae998dc
r20-23   00000008 1e1fc500 00000000 0000000f
r24-27   00000000 00000006 1f7a2000 1028a010
r28-31   00000000 00000400 1f584dc0 101bd938
sr0-3    00000000 000000b5 00000000 000000b5
sr4-7    00000000 00000000 00000000 00000000
 
IASQ: 00000000 00000000 IAOQ: 101d3004 101d3008
 IIR: 0e641288    ISR: 00000000  IOR: dae998e0
 ORIG_R28: 1073e740

[...]


> > My
> > DINO version (2.1) allows at least boot the system but the
> > system crashes when I try to do the next steps within the
> > installation procedure.
>
> On C180 that's most likely the problem with ccio driver.
> That's a known bug(s?)  that ryan bradetich hasn't been able
> to solve yet. If you can help ryan, mail him.

Ryan, what further information do you need ? Up to now I tried 
to use the palinux-0.9.2 image of esiee.fr only. No kernel 
(cross-) compilations for parisc-linux on my Intel Linux box so 
far. No expirence with palo etc. What can I do to help to solve 
the problem ?

Reinhard.
