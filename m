Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id AAA29979
	for <parisc-linux@puffin.external.hp.com>; Sat, 6 Nov 1999 00:24:50 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.16.124.11])
	by palrel1.hp.com (Postfix) with ESMTP id E5DED25C
	for <parisc-linux@thepuffingroup.com>; Fri,  5 Nov 1999 23:26:08 -0800 (PST)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id XAA15167 for <parisc-linux@thepuffingroup.com>; Fri, 5 Nov 1999 23:27:11 -0800 (PST)
Message-Id: <199911060727.XAA15167@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Okay, I give up. 
In-reply-to: Your message of "Thu, 04 Nov 1999 23:07:28 PST."
             <Pine.LNX.4.10.9911042254060.16932-100000@vodka.thepuffingroup.com>
Date: Fri, 05 Nov 1999 23:27:11 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alex deVries wrote:
> How do I extract an sversion and hversion out of ioscan -F output?
> 
> For instance:
> 
> pa:wsio:F:F:F:0:0:0:ext_bus:c720:8/12:1 49 0 132 0 0 137 128 7 0 0 0 91 62 0 
>   2 :0:root.ccio.c720:c720:CLAIMED:INTERFACE:GSC add-on Fast/Wide SCSI Interf
>   ace:0

1) Use ":" as a field seperator (that's probably obvious)

2) field 1 indicates the structure/contents of field 12.
   "pa" says field 12 is IODC data (16 bytes).
   "pci" says field 12 is PCI vendor/product (4 bytes).

3) IODC data format should be documented in IOACD or somewhere.
   PCI isn't. It's the PCI vendor/product ID from config space.

Short (but cryptic) answer is first three "nibbles" (4-bit quantities)
are HV model. Next nibble is HV rev.  SV rev is the high order nibble
of the 5th byte (iodc[4]). SV model the following 5 nibbles.

So printing the values in hex should make them easier to eye-ball
and correlate to either hardware.c entries or PCI output.


> There doesn't seem to be a consistant way to parse it.

The "pa" vs. "pci" probably makes it look inconsistent.

cheers,
grant

> 
> - Alex
> -- 
> Alex deVries <adevries@thepuffingroup.com>
> Vice President Engineering
> The Puffin Group
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 

Grant Grundler
Unix Developement Lab
+1.408.447.7253
