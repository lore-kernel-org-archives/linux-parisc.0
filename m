Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id MAA23400
	for <hppa-linux@sod.res.cmu.edu>; Thu, 18 Mar 1999 12:11:29 -0500
Received: from the-village.bc.nu (lightning.swansea.uk.linux.org [194.168.151.1]) by snowcrash.cymru.net (8.8.7/8.7.1) with SMTP id RAA06779 for <hppa-linux@thepuffingroup.com>; Thu, 18 Mar 1999 17:11:19 GMT
Message-Id: <m10NhAe-0007U1C@the-village.bc.nu>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: [hppa-linux] Gateway instructions
To: hppa-linux@thepuffingroup.com
Date: Thu, 18 Mar 1999 18:05:27 +0000 (GMT)
In-Reply-To: <36F12FE8.308782A2@netscape.com> from "Mike Shaver" at Mar 18, 99 11:55:04 am
Content-Type: text
List-ID: <linux-parisc.vger.kernel.org>

> Here's how I think it works:
> The GATE completer takes its privilege from the TLB entry for the page
> _containing_ the BRANCH-with-GATE (see 4-5 in the PARISC 2.0 book).  So
> what we do is have a page (at 0xC0000000, probably) that has
> appropriately high privilege level in the TLB, and yet is executable by
> the user-space process.  I think that means that the TLB access rights
> field is [100,11,11]:

Oh man its a vax  8)

Yeah that would be fairly believable. VMS actually does this sort of stuff
with the vax architecture equivalent for libraries - think  setuid mmap 8)
