Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA14670
	for <parisc-linux@puffin.external.hp.com>; Thu, 21 Oct 1999 16:50:54 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by cosrel1.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id QAA02518
	for <parisc-linux@thepuffingroup.com>; Thu, 21 Oct 1999 16:51:51 -0600 (MDT)
Message-Id: <199910212251.PAA29954@milano.cup.hp.com>
To: Paul Bame <bame@debian.fc.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Boot messages from C3000 console 
In-reply-to: Your message of "Thu, 21 Oct 1999 14:57:20 PDT."
             <199910212057.OAA19923@debian.fc.hp.com>
Date: Thu, 21 Oct 1999 15:51:58 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Paul Bame wrote:
> The short answer is once control is apparently transferred to the
> kernel, the system dies hard.  Someone who can read PIM dumps
> might deduce more from this log.

I can't find a PIM decoder for the C3000....I'll try the J5000
decoder later. Here's a few more notes by hand.
I saw Stan Sieler's reply and can fill in a few more gaps.

> HPMC Chassis Codes = 2cbf0  2500b  2cbf5  2cbfc

The bus time-out suggests the processor tried to access
0xfffff80810 and no device lives there.  The processor saw
an error condition (bus timeout) and brought the system down.

...
> IIA Space                    = 0x0000000000000000
> IIA Offset                   = 0x0000000000010188
> Check Type                   = 0x20000000
> CPU State                    = 0x9e000004
> Cache Check                  = 0x00000000
> TLB Check                    = 0x00000000
> Bus Check                    = 0x0030103b
> Assists Check                = 0x00000000
> Assist State                 = 0x00000000
> Path Info                    = 0x00000000
> System Responder Address     = 0x000000fffff80810
> System Requestor Address     = 0x000000fffffa0000

Responder is the address which was supposed to respond.
Requestor is the address of the device which started the transaction.
I would guess 0xff_fffa0000 is the processor.

What's at 0xff_fff80000?
And which driver uses offset 0x810?
(card-mode Dino does....but am pretty sure the kernel didn't get that far.)


This is the interesting part:

> 'B1000/C3000/J5000/J7000 Unarchitected (per-CPU)', revision 1, 140 bytes:
> 
> Check Summary                = 0xcb81041008000000
> Available Memory             = 0x0000000030000000
> CPU Diagnose Register 2      = 0x0200000000000204
> CPU Status Register 0        = 0x2420c20000000000
> CPU Status Register 1        = 0x8002000000000000
> SADD LOG                     = 0x0000000000000000
> Read Short LOG               = 0xc1af00fffff80810
	This is another copy of the offending address.

> ERROR_STATUS                 = 0x0000000000100010
	Broad Error on the Runway Bus
	
> MEM_ADDR                     = 0x000001ff3fffffff
> MEM_SYND                     = 0x0000000000000000
> MEM_ADDR_CORR                = 0x000001ff3fffffff
> MEM_SYND_CORR                = 0x0000000000000000
	No memory problems.

> RUN_DATA_HIGH                = 0xc1bff0fffed08040
> RUN_DATA_LOW                 = 0xc1bff0fffed08040
	Last data on runway before the error.
	0xFF_FEDO_8000 is runway bus interface register space.

> RUN_CTRL                     = 0x0000021c00001418
> RUN_ADDR                     = 0xc1bff0fffed08040
	Last ctrl/addr on the runway bus before the error.

> System Responder Path        = 0x00ffffffffffffff
	NULL path - default value. Not PCI related.
...


On K/T-class system, the I/O error log was invaluable.
Not sure how useful it is on this set of boxes.
I'm sure we'll see.

> 'B1000/C3000/J5000/J7000 IO Error Log', revision 0, 228 bytes:
> 
>  Rope     Word1        Word2            Word3
> - ------ ------------ ------------
>    0    0x00000000   0x0e0cc009   0x00000000fed30048
>    1    0x00000000   0x1e0cc009   0x00000000fed32048
>    2    ----------   0x2e0cc009   ------------------
>    3    ----------   0x3e0cc009   ------------------
>    4    0x00000000   0x4e0cc009   0x00000000fed38048
>    5    ----------   0x5e0cc009   ------------------
>    6    0x00000000   0x6e0cc009   0x00000000fed3c048
>    7    ----------   0x7e0cc009   ------------------

Grant Grundler
Unix Developement Lab
+1.408.447.7253
