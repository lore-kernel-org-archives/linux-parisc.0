Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id RAA29952
	for <hppa-linux@sod.res.cmu.edu>; Thu, 25 Mar 1999 17:12:17 -0500
Received: from the-village.bc.nu (lightning.swansea.uk.linux.org [194.168.151.1]) by snowcrash.cymru.net (8.8.7/8.7.1) with SMTP id WAA10063 for <hppa-linux@thepuffingroup.com>; Thu, 25 Mar 1999 22:12:04 GMT
Message-Id: <m10QJCG-0007U1C@the-village.bc.nu>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: [hppa-linux] syscall work
To: hppa-linux@thepuffingroup.com
Date: Thu, 25 Mar 1999 23:05:55 +0000 (GMT)
In-Reply-To: <199903251919.LAA01701@cllmail.cup.hp.com> from "Cary Coutant" at Mar 25, 99 11:23:20 am
Content-Type: text
List-ID: <linux-parisc.vger.kernel.org>

> I'd suggest *not* using the same gateway page address as HP-UX. If you 
> do, you won't be able to develop a later kernel extension to support 
> HP-UX binaries, unless you allocate syscall numbers carefully.

Doesn't that depend which gateway page you map into each application ?
