Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id OAA07799
	for <hppa-linux@sod.res.cmu.edu>; Mon, 22 Mar 1999 14:05:31 -0500
Received: from the-village.bc.nu (lightning.swansea.uk.linux.org [194.168.151.1]) by snowcrash.cymru.net (8.8.7/8.7.1) with SMTP id TAA08431 for <hppa-linux@thepuffingroup.com>; Mon, 22 Mar 1999 19:05:21 GMT
Message-Id: <m10PAr3-0007U2C@the-village.bc.nu>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: [hppa-linux] Document Priority?
To: hppa-linux@thepuffingroup.com
Date: Mon, 22 Mar 1999 19:59:20 +0000 (GMT)
In-Reply-To: <199903221856.KAA04931@meow.sr.hp.com> from "Bill Katz" at Mar 22, 99 10:56:37 am
Content-Type: text
List-ID: <linux-parisc.vger.kernel.org>

The TLB miss stuff would be a good early one, that and the basic I/O.
The normal approach ports have taken is to get the basic kernel core
up and then the network card. That lets you use an NFS root - and means you
don't turn your disk to sillyputty while debugging the vm bugs 

> 	What output format should I generate? PostScript? PDF? PCL?

I can still work nroff ;)
