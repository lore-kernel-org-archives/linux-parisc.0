Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA21453
	for <parisc-linux@puffin.external.hp.com>; Thu, 9 Dec 1999 10:56:28 -0700
Message-Id: <199912091758.KAA29442@debian.fc.hp.com>
To: "Brian S. Julin" <bri@mojo.calyx.net>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] More 9.05 notes and recipe.html 
In-reply-to: Your message of "Thu, 09 Dec 1999 12:55:32 EST."
             <Pine.BSO.4.20.9912091249560.274-100000@mojo.calyx.net>
Date: Thu, 09 Dec 1999 10:58:34 -0700
From: Paul Bame <bame@fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= Finally got the build working, but no luck booting
= (this is a 715/64) with either that or the images
= on the web site.  IPL encounters an error of some sort,
= but provides no specifics.  I've only tried booting over 
= LAN so far.

If you're using the HPUX boot loader, be sure to run som_relocate
(which will need re-building to run on hpux 9.x) on vmlinux before
trying to boot it.

	-Paul Bame
