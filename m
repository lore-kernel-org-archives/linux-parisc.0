Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id OAA07950
	for <hppa-linux@sod.res.cmu.edu>; Mon, 22 Mar 1999 14:09:36 -0500
Received: from mailhost.rsn.hp.com (root@idiot.rsn.hp.com [15.99.200.11])
	by atlrel1.hp.com (8.8.6 (PHNE_14041)/8.8.5tis) with ESMTP id OAA11980
	for <hppa-linux@thepuffingroup.com>; Mon, 22 Mar 1999 14:09:18 -0500 (EST)
Received: from helgaaspc.rsn.hp.com (root@helgaaspc.rsn.hp.com [15.99.148.145])
	by mailhost.rsn.hp.com (8.8.6 (PHNE_14041)/8.8.6) with ESMTP id NAA27665
	for <hppa-linux@thepuffingroup.com>; Mon, 22 Mar 1999 13:09:26 -0600 (CST)
Received: from helgaaspc.rsn.hp.com (helgaas@localhost [127.0.0.1])
	by helgaaspc.rsn.hp.com (8.8.7/8.8.7) with ESMTP id NAA01345
	for <hppa-linux@thepuffingroup.com>; Mon, 22 Mar 1999 13:09:26 -0600
Message-Id: <199903221909.NAA01345@helgaaspc.rsn.hp.com>
To: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] Picky details of TLB fault handlers 
Date: Mon, 22 Mar 1999 13:09:26 -0600
From: Bjorn Helgaas <helgaas@rsn.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

>I'm right in assuming its legal to swap the return address - so the TLB
>handler can do a short piece of TLB handling for a present page miss,
>then stash the return into the kernel stack and rfi into the page fault handler
>so it will in turn return to the user context ?

Yes.
