Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA13588
	for <parisc-linux@puffin.external.hp.com>; Thu, 21 Oct 1999 15:24:55 -0600
From: Stan Sieler <sieler@allegro.com>
Message-Id: <199910212124.OAA27459@bart.allegro.com>
Subject: Re: [parisc-linux] Boot messages from C3000 console
To: bame@debian.fc.hp.com (Paul Bame)
Date: Thu, 21 Oct 1999 14:24:30 -0700 (PDT)
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <199910212057.OAA19923@debian.fc.hp.com> from "Paul Bame" at Oct 21, 99 02:57:20 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Re:

Don't know if this helps at all...

> kernel, the system dies hard.  Someone who can read PIM dumps
> might deduce more from this log.
...
> HPMC Chassis Codes = 2cbf0  2500b  2cbf5  2cbfc  

In a possibly not-quite-matching manual:

   cbf0 = HPMC occurred
   500b = bus timeout (slot 0, bus 0)
   cbf5 = IVA+32 was equal to 0
   cbfc = branch to os HPMC failed
 
> General Registers 0 - 31
> 00-03   0000000000000000  ffffffffffffffff  00000000000100c4  0000000000504000
> 04-07   0000000000504010  0000000000504000  0000000000000048  00000000f0002f88
> 08-11   0050427700000002  000000000000004d  000000000012c320  000000000000000a
> 12-15   0000000000000000  00000000ffffffff  0000000000000000  00000000f0400004
> 16-19   000000f0f00008a4  000000f0f0000160  000000f0f0000158  fffffffffff80810
> 20-23   0000000003000000  0000000000001000  0000000000000000  00000000000c0000
> 24-27   0000000000000000  0000000000000001  00000000c0159610  ffffffffc00a8000
> 28-31   ffffffffffffffff  00000000000ac948  00000000000ac400  0200000000000204
> 
> <Press any key to continue (q to quit)> 
> 
> 
> Control Registers 0 - 31
> 00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
> 04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
> 08-11   0000000000000000  0000000000000000  0000000000000000  000000000000003c
> 12-15   0000000000000000  0000000000000000  0000000000000000  0000000000000000
> 16-19   0000001d9f33c26d  0000000000000000  0000000000010184  000000000e601181
> 20-23   00000000a627ffff  c0000000e0380810  0000000000000009  0000000080000000
> 24-27   00000000fdffffff  00000000ffffffff  0000000000000002  0000000008000009
> 28-31   00000000fdffffff  00000000ffffffff  00000000fdffffff  00000000fdffffff
> Space Registers 0 - 7
> 
> 00-03   00000000          00000000          00000000          00000000
> 04-07   00000000          00000000          00000000          00000000
> 
> IIA Space                    = 0x0000000000000000
> IIA Offset                   = 0x0000000000010188
...
> System Responder Address     = 0x000000fffff80810
> System Requestor Address     = 0x000000fffffa0000


CR19 (IIR) = e601181 = LDWAS    0(0,19),1

So, looks like an absolute load was being done, using R19 as the address:

   R19 = fffffffffff80810

The "System Responder Address", whatever that is, is 0x000000fffff80810
which is suspciciously similar to what's in R19.

SS
