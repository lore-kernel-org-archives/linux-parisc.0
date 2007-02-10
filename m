From: Alan <alan@lxorguk.ukuu.org.uk>
Subject: Re: [parisc-linux] J5600 Video
Date: Sat, 10 Feb 2007 12:24:10 +0000
Message-ID: <20070210122410.4aa55613__5319.95810238204$1416624279$gmane$org@localhost.localdomain>
References: <45CA42F4.2070207@cox.net>
	<e6eae0290702071605x213ec1cdq81dc168a390fb84b@mail.gmail.com>
	<200702101150.08977.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 debian-glibc@lists.debian.org
To: Helge Deller <deller@gmx.de>
Return-Path: <alan@lxorguk.ukuu.org.uk>
In-Reply-To: <200702101150.08977.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

> I think you will fail.
> If I remember correctly Vodoo3 needs the on-board i386 Graphics-BIOS to get into a useful state which can be used by vodoo fbdev driver.
> Vodoo1 or Vodoo2 do work as framebuffer devices though.

The voodoo1/2 were designed as add on boards so there is enough info in
the docs to boot them, and in the source tree for glide to boot them
properly. The voodoo3 glide source tree may contain enough info, its hard
to tell.
