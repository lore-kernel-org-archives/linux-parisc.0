Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA23489
	for <parisc-linux@puffin.external.hp.com>; Fri, 14 Jan 2000 19:12:57 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.16.124.11])
	by atlrel2.hp.com (Postfix) with ESMTP id 93BB4C34
	for <parisc-linux@thepuffingroup.com>; Fri, 14 Jan 2000 20:13:31 -0500 (EST)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS 5.0.1) id RAA16646 for <parisc-linux@thepuffingroup.com>; Fri, 14 Jan 2000 17:13:45 -0800 (PST)
Message-Id: <200001150113.RAA16646@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] initcall and setup 
In-reply-to: Your message of "Fri, 14 Jan 2000 17:48:31 PST."
             <20000114174831.W11300@thepuffingroup.com>
Date: Fri, 14 Jan 2000 17:13:44 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> 
> One of the things which has changed during 2.3 development is
> initialisation.
...
> Unfortunately, we can't take advantage of this, because we don't yet have
> ELF tools.  This is implemented through an ELF section called __initcall
> which contains the address of the function to call.  We could try to hack
> something together with SOM, but I'd really rather not put the work in
> that will just be dumped later.

Just a clarification: The kernel will use ELF once the tool chain is
in place. The kernel is SOM now only because of our dependency
on HP-UX ld. Any forcasts for when we can switch to ELF?


...
> and why if you diff our kernel against Linus', you will find that we have
> reinserted some of the explicit calls to the setup routines that have
> been eliminated from the mainline tree.  It also explains why sometimes
> a driver may not be called even though you compiled it in.

Any general rules on where to reinsert stuff? (eg tulip_probe)
In the same place it's in the linux-2.2?
Is someone making a note to make sure the reinserted code gets
dropped when we migrate to either the next 2.3 (or possibly 2.4) release?

thanks,
grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
