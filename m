Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA17292
	for <parisc-linux@puffin.external.hp.com>; Mon, 11 Oct 1999 11:08:41 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by cosrel1.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id LAA11961
	for <parisc-linux@thepuffingroup.com>; Mon, 11 Oct 1999 11:09:18 -0600 (MDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id KAA22401 for <parisc-linux@thepuffingroup.com>; Mon, 11 Oct 1999 10:08:51 -0700 (PDT)
Message-Id: <199910111708.KAA22401@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] unresolved symbol pci_proc_init 
In-reply-to: Your message of "Mon, 11 Oct 1999 04:27:14 PDT."
             <19991011112714.29613.rocketmail@web502.yahoomail.com>
Date: Mon, 11 Oct 1999 10:08:50 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Ulrich Strelow wrote:
> Hi all,
> 
> compiling the current CVS kernel for a non-PCI machine
> like my 715/33 leads to an unresolved symbol message
> for pci_proc_init.
> 
> In init/main.c is the following code:
> 
> #ifdef CONFIG_GECKO
>         gsc_init();
>         /*
>         ** pci_init() is NOT multi-PCI bus friendly.
>         */
> #ifdef CONFIG_PROC_FS
>         pci_proc_init();
> #endif
> #else
> #ifdef CONFIG_PCI
>         pci_init();
> #endif
> #endif
> 
> So pci_proc_init is included even if CONFIG_PCI is not
> set.

Ulrich,
Apologies - that's my fault. I wasn't very clean when changing the ifdefs
to invoke gsc_init(). The ifdef should read:

	#if defined(CONFIG_PCI) && defined(CONFIG_PROC_FS)
...

If no one else objects, go ahead and submit that - after you try it. :^)

On the same note, the ifdefs in gsc_init() probably need to
use "defined(CONFIG_PCI)" around the "dino_init()" call...

sorry,
grant

> Ulrich
> __________________________________________________
> Do You Yahoo!?
> Bid and sell for free at http://auctions.yahoo.com
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 

Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
