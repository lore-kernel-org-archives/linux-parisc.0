Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA04633
	for <parisc-linux@puffin.external.hp.com>; Thu, 12 Aug 1999 11:14:36 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by palrel3.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id KAA06616
	for <parisc-linux@thepuffingroup.com>; Thu, 12 Aug 1999 10:15:46 -0700 (PDT)
Message-Id: <199908121712.KAA01110@milano.cup.hp.com>
To: Philipp Rumpf <prumpf@suse.de>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] GSC cards 
In-reply-to: Your message of "Thu, 12 Aug 1999 02:01:40 PDT."
             <19990812020139.J11312@suse.de>
Date: Thu, 12 Aug 1999 10:12:26 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:
> Hi,
> even if there was not much list traffic in the last weeks, development is
> going on and even making real progress.  We expect to run our first user
> space program RSN.
> 
> One of the areas we now have code for is GSC bus walking.  This code is
> basically engineered from some hints in the Dino documentation

Rather than depend on just one implementation, look at the PA I/O
Architecture documents. Dino is an implementation of a PA I/O device.
BTW, GSC and HP-PB bus walk are basically the same - both follow PA
I/O architecture.

grant

> and not
> tested with any other device (Lasi, Artist, and the CPU, though on the
> GSC bus, do not use the HPA pages and are not auto-detectable in the
> same way as Dino.
> 
> Therefore, if any of you have access to other machines than 712's or 
> A180[c]s (this includes 715s), or machines with GSC cards other than
> Dino-on-a-card based ones in them, please try to boot them with the Image
> at ftp://sunsite.auc.dk/pub/os/linux/parisc/testing/image-2.2.1-gsctest
> and send the lines between "GSC init" and "mem_init bla bla bla" here
> (it might be a good idea to keep the subject line "Re: GSC cards" instead
> to avoid annoying anybody).
> 
> TIA,
> 
> 	Philipp Rumpf
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 

Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
