Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA32692
	for <parisc-linux@puffin.external.hp.com>; Sat, 6 Nov 1999 12:03:20 -0700
Received: from xsvr4.cup.hp.com (xsvr4.cup.hp.com [15.0.68.169])
	by atlrel1.hp.com (Postfix) with ESMTP id BB8029D5
	for <parisc-linux@thepuffingroup.com>; Sat,  6 Nov 1999 14:04:39 -0500 (EST)
Received: from hp.com (localhost [127.0.0.1]) by xsvr4.cup.hp.com with ESMTP (8.7.6/8.7.3) id LAA00498 for <parisc-linux@thepuffingroup.com>; Sat, 6 Nov 1999 11:04:39 -0800 (PST)
Sender: frowand@cup.hp.com
Message-ID: <38247BC6.6859F356@hp.com>
Date: Sat, 06 Nov 1999 11:04:38 -0800
From: Frank Rowand <frank_rowand@hp.com>
Reply-To: frowand@cup.hp.com
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Okay, I give up.
References: <199911060727.XAA15167@milano.cup.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
> 
> Alex deVries wrote:
> > How do I extract an sversion and hversion out of ioscan -F output?
> >
> > For instance:
> >
> > pa:wsio:F:F:F:0:0:0:ext_bus:c720:8/12:1 49 0 132 0 0 137 128 7 0 0 0 91 62 0
> >   2 :0:root.ccio.c720:c720:CLAIMED:INTERFACE:GSC add-on Fast/Wide SCSI Interf
> >   ace:0
> 
> 1) Use ":" as a field seperator (that's probably obvious)
> 
> 2) field 1 indicates the structure/contents of field 12.
>    "pa" says field 12 is IODC data (16 bytes).
>    "pci" says field 12 is PCI vendor/product (4 bytes).
> 
> 3) IODC data format should be documented in IOACD or somewhere.
>    PCI isn't. It's the PCI vendor/product ID from config space.


See "IODC Data Bytes" in the IODC chapter of the IOACD (it's the first section
after the introduction).


> Short (but cryptic) answer is first three "nibbles" (4-bit quantities)
> are HV model. Next nibble is HV rev.  SV rev is the high order nibble
> of the 5th byte (iodc[4]). SV model the following 5 nibbles.
> 
> So printing the values in hex should make them easier to eye-ball
> and correlate to either hardware.c entries or PCI output.
> 
> > There doesn't seem to be a consistant way to parse it.
> 
> The "pa" vs. "pci" probably makes it look inconsistent.
> 
> cheers,
> grant
> 
> >
> > - Alex
> > --
> > Alex deVries <adevries@thepuffingroup.com>
> > Vice President Engineering
> > The Puffin Group
> >
> > ---------------------------------------------------------------------------
> > To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> > `unsubscribe' as the subject.
> >
> 
> Grant Grundler
> Unix Developement Lab
> +1.408.447.7253
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
