Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id HAA15447
	for <parisc-linux@puffin.external.hp.com>; Fri, 9 Jul 1999 07:21:53 -0600
Date: Fri, 9 Jul 1999 16:11:58 +0300 (EETDST)
From: Hannu Martikka <martikka@stybba.ntc.nokia.com>
To: hull@cup.hp.com
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] vmlinux in C360
In-Reply-To: <000601bec967$5a2bd8b0$a64d000f@jh733131.cup.hp.com>
Message-ID: <Pine.HPX.4.05.9907091607460.19393-100000@gamgee.ntc.nokia.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 8 Jul 1999, Jim Hull wrote:

> > I guess the bootloader needs to force the W bit to 0?  I note that on
> > an interruption, the W bit is set to the value of the default width
> > bit, but how to set the default width bit is implementation defined.
> > Anyone care to hint at how to set the default width bit too?
> 
> You use PDC_PSW to set the default width and default endian bits.  See page 2-59
> in:
> 
> 	http://dtf.external.hp.com/dtf/swdev/pdf/pdc.pdf
There seems to be some problems with that url...
"Connection was refused by te server dtf.external.hp.com"

>  -- Jim
- Goodi
"The linuX Files -- The Source is Out There."
ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°
