Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA18018
	for <parisc-linux@puffin.external.hp.com>; Wed, 18 Oct 2000 10:48:50 -0600
Message-Id: <200010181654.JAA14222@milano.cup.hp.com>
To: James Waterhouse <james.waterhouse@videotron.ca>
Cc: "parisc-linux@thepuffingroup.com" <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] booting on 712/60 
In-reply-to: Your message of "Wed, 18 Oct 2000 03:03:23 PDT."
             <39ED4B3B.85348ED2@videotron.ca>
Date: Wed, 18 Oct 2000 09:54:05 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

James Waterhouse wrote:
> Hello,
> 	I just compiled a ramdisk using mondays cvs src for everything. I'm
> using the graphics console ramdisk file off the puffin.external.hp.com
> (ramdisk20000530-sticon.tgz) to make the ramdisk. Now when I got to boot
> it boots up until the point where the kernel says...

iirc, ramdisk20000530-sticon.tgz uses a "kluge" /dev/tty major/minor number.
I was reading old mail on this and the kluge to use a different
major/minor confused me. I was told this was no longer needed.
So you can use a newer/regular ramdisk.

Mathew Wilcox posted the "how-to" on ramdisk:
    http://puffin.external.hp.com/mailing-lists/parisc-linux/2000/01-Jan/0078.html

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
