Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA21360
	for <parisc-linux@puffin.external.hp.com>; Thu, 25 Jan 2001 18:51:13 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id 7F1D8DF8
	for <parisc-linux@thepuffingroup.com>; Thu, 25 Jan 2001 17:55:08 -0800 (PST)
Received: from localhost (grundler@localhost [127.0.0.1])
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) with SMTP id RAA22922
	for <parisc-linux@thepuffingroup.com>; Thu, 25 Jan 2001 17:57:15 -0800 (PST)
Message-Id: <200101260157.RAA22922@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] linux-2.4.0 
In-reply-to: Your message of "Fri, 26 Jan 2001 00:48:31 PST."
             <20010126004831.A8137@parcelfarce.linux.theplanet.co.uk>
Date: Thu, 25 Jan 2001 17:57:14 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> drivers/pci is almost unaltered from 2.4.0-test10 as grant thinks the
> changes which have been made will break our PCI code.

Unless someone objects, My plan is to continue working on CONFIG_SMP
until it boots on my A500. Then merge the 2.4.0 PCI stuff onto our
tree. The problem is names of pci "generic" functions changed -test11
or -test12 and what they do has been slightly changed. Certain things
definitely break A500 support. I need to revisit both the generic and
elroy code so it all works again.

...
> i'm going to send linus a patch tomorrow to get our arch/parisc and
> include/asm-parisc trees uptodate in his tree.

Which means the linus tree still won't build a parisc-kernel.
He'll have missing symbol errors in the PCI subsystem for sure.
But I guess we'll keep getting closer as time goes on.

thanks!
grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
