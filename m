Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id MAA04785
	for <hppa-linux@sod.res.cmu.edu>; Mon, 22 Mar 1999 12:19:19 -0500
Received: from the-village.bc.nu (lightning.swansea.uk.linux.org [194.168.151.1]) by snowcrash.cymru.net (8.8.7/8.7.1) with SMTP id RAA06147 for <hppa-linux@thepuffingroup.com>; Mon, 22 Mar 1999 17:18:36 GMT
Message-Id: <m10P9Bi-0007U1C@the-village.bc.nu>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: [hppa-linux] Picky details of TLB fault handlers
To: hppa-linux@thepuffingroup.com
Date: Mon, 22 Mar 1999 18:12:34 +0000 (GMT)
In-Reply-To: <199903221705.LAA01108@helgaaspc.rsn.hp.com> from "Bjorn Helgaas" at Mar 22, 99 11:05:09 am
Content-Type: text
List-ID: <linux-parisc.vger.kernel.org>

> HP-UX does exactly this sort of thing for handling many traps and
> interrupts.  It is fairly expensive, though, since you have to have
> a stack on which to save the IPSW/IIAQ and probably a bunch of other
> registers, and it's too much messing around for a TLB miss.

I'm right in assuming its legal to swap the return address - so the TLB
handler can do a short piece of TLB handling for a present page miss,
then stash the return into the kernel stack and rfi into the page fault handler
so it will in turn return to the user context ?

Alan
