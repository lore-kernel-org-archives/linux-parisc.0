Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id PAA28015
	for <hppa-linux@sod.res.cmu.edu>; Thu, 25 Mar 1999 15:47:06 -0500
Received: from mailhost.rsn.hp.com (root@idiot.rsn.hp.com [15.99.200.11])
	by atlrel1.hp.com (8.8.6 (PHNE_14041)/8.8.5tis) with ESMTP id PAA22646
	for <hppa-linux@thepuffingroup.com>; Thu, 25 Mar 1999 15:46:44 -0500 (EST)
Received: from helgaaspc.rsn.hp.com (root@helgaaspc.rsn.hp.com [15.99.148.145])
	by mailhost.rsn.hp.com (8.8.6 (PHNE_14041)/8.8.6) with ESMTP id OAA04242
	for <hppa-linux@thepuffingroup.com>; Thu, 25 Mar 1999 14:46:53 -0600 (CST)
Received: from helgaaspc.rsn.hp.com (helgaas@localhost [127.0.0.1])
	by helgaaspc.rsn.hp.com (8.8.7/8.8.7) with ESMTP id OAA08061
	for <hppa-linux@thepuffingroup.com>; Thu, 25 Mar 1999 14:46:52 -0600
Message-Id: <199903252046.OAA08061@helgaaspc.rsn.hp.com>
To: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] syscall work 
Date: Thu, 25 Mar 1999 14:46:52 -0600
From: Bjorn Helgaas <helgaas@rsn.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Cary Coutant wrote
>
>I'd suggest *not* using the same gateway page address as HP-UX. If you 
>do, you won't be able to develop a later kernel extension to support 
>HP-UX binaries, unless you allocate syscall numbers carefully.

If Linux uses a different gateway page address than HP-UX (which I
think is a good idea), why not use a strategy like that used for
64-bit HP-UX apps, where the kernel supplies the address in a
register at application startup?
