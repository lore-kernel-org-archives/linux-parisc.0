Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pilchuck.reedmedia.net (pilchuck.reedmedia.net [63.145.197.178])
	by dsl2.external.hp.com (Postfix) with ESMTP id 29BE1482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 26 Apr 2001 14:27:56 -0600 (MDT)
Date: Thu, 26 Apr 2001 13:27:54 -0700 (PDT)
From: "Jeremy C. Reed" <reed@reedmedia.net>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.21.0104261258350.11174-100000@pilchuck.reedmedia.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] HP 710 and miscellaneous questions ...
List-ID: <linux-parisc.vger.kernel.org>

I see "[t]his mailing list exists to serve the developers." Where is
the appropriate forum to discuss basic usage?

I have an HP 700 Series Apollo Model 710. As far as I can tell it has no
usable operating system (no HPUX). I can turn it on and connect to a
series of (CMOS?/BIOS?) prompts and menus via a serial cable. It does not
have a CD drive. I do not have HPUX to do any cross-compiles. (I have
installed a variety of flavours of BSD and Linux hundreds of times, but
always on i386 architectures.)

I want to use Linux (or BSD) on it. The PA-RISC webpages have links for
documentation, but none appear to explain a basic install. Where is the
documentation for installing Linux on a hard drive?

The software page (http://www.parisc-linux.org/software/) says "nfsroot"
is the easiest way; but the instructions say "you have to build on
HP/UX."

Is there simply a filesystem image (with kernel and userspace) that I can
dd to a harddrive that I can then use to boot my HP 710)? If so, where is
it? (And where is this documented?)

Also, I see an ISO image at
ftp://puffin.external.hp.com/pub/parisc/cd-images/; is there any
(easy) way to convert this ISO image to an image that I can dd on to my
hardrive (to use to boot)?

Thanks,

   Jeremy C. Reed
   http://bsd.reedmedia.net/
