Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id SAA31902
	for <hppa-linux@sod.res.cmu.edu>; Thu, 25 Mar 1999 18:40:24 -0500
Received: from mailhost.rsn.hp.com (root@idiot.rsn.hp.com [15.99.200.11])
	by atlrel2.hp.com (8.8.6 (PHNE_14041)/8.8.5tis) with ESMTP id SAA11453
	for <hppa-linux@thepuffingroup.com>; Thu, 25 Mar 1999 18:39:58 -0500 (EST)
Received: from helgaaspc.rsn.hp.com (root@helgaaspc.rsn.hp.com [15.99.148.145])
	by mailhost.rsn.hp.com (8.8.6 (PHNE_14041)/8.8.6) with ESMTP id RAA04747
	for <hppa-linux@thepuffingroup.com>; Thu, 25 Mar 1999 17:40:12 -0600 (CST)
Received: from helgaaspc.rsn.hp.com (helgaas@localhost [127.0.0.1])
	by helgaaspc.rsn.hp.com (8.8.7/8.8.7) with ESMTP id RAA08466
	for <hppa-linux@thepuffingroup.com>; Thu, 25 Mar 1999 17:40:11 -0600
Message-Id: <199903252340.RAA08466@helgaaspc.rsn.hp.com>
To: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] syscall work 
Date: Thu, 25 Mar 1999 17:40:11 -0600
From: Bjorn Helgaas <helgaas@rsn.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

>> I'd suggest *not* using the same gateway page address as HP-UX. If you 
>> do, you won't be able to develop a later kernel extension to support 
>> HP-UX binaries, unless you allocate syscall numbers carefully.
>
>Doesn't that depend which gateway page you map into each application ?

Here's one of the subtleties of PA-RISC VM.  Under HP-UX, there's only one
mapping (space 0, offset 0xC0000000) that is shared by all applications.
The libc stub branches to (%sr7,0xC0000000), and %sr7 always contains
a zero while running user apps.

Sharing a mapping between applications is a performance win, because
you can share the TLB entry and you can share the physical page without
worrying about any cache flushing issues.  Since PA-RISC has virtually-
indexed caches, you can only share physical pages under limited conditions
-- see appendix F in the 2.0 arch book.

Of course, you don't *have* to share those mappings, but you will
have more TLB misses and (unless you're careful about virtual address
allocation for aliasing) more cache flushing.
