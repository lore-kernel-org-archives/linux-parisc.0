Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id SAA32200
	for <hppa-linux@sod.res.cmu.edu>; Thu, 25 Mar 1999 18:48:27 -0500
Received: from the-village.bc.nu (lightning.swansea.uk.linux.org [194.168.151.1]) by snowcrash.cymru.net (8.8.7/8.7.1) with SMTP id XAA12370 for <hppa-linux@thepuffingroup.com>; Thu, 25 Mar 1999 23:48:15 GMT
Message-Id: <m10QKhK-0007U1C@the-village.bc.nu>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: [hppa-linux] syscall work
To: hppa-linux@thepuffingroup.com
Date: Fri, 26 Mar 1999 00:42:05 +0000 (GMT)
In-Reply-To: <199903252340.RAA08466@helgaaspc.rsn.hp.com> from "Bjorn Helgaas" at Mar 25, 99 05:40:11 pm
Content-Type: text
List-ID: <linux-parisc.vger.kernel.org>

> Of course, you don't *have* to share those mappings, but you will
> have more TLB misses and (unless you're careful about virtual address
> allocation for aliasing) more cache flushing.

Ok - yes so we do want a different address.
