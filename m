Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA07724
	for <parisc-linux@puffin.external.hp.com>; Wed, 3 May 2000 19:05:06 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 4 May 2000 01:05:04 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA13815;
	Thu, 4 May 2000 10:59:24 +1000
Date: Thu, 4 May 2000 10:59:24 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Paul Bame <bame@endor.fc.hp.com>
cc: grundler@cup.hp.com, acmyer@fc.hp.com, parisc-linux@thepuffingroup.com
Subject: Re: palinux binutils
In-Reply-To: <E12n2fW-00081F-00@endor.fc.hp.com>
Message-ID: <Pine.LNX.4.21.0005041041300.8334-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 3 May 2000, Paul Bame wrote:

> Alan -- we hear you're doing something with binutils for palinux but
> don't know what.  We desperately need a functional tool chain so

I checked in a bunch of patches to sourceware.cygnus.com CVS a day or so
ago.  These were only just little things I noticed while going over the
code trying to understand everything and come to grips with parisc.  I
suspect these fixes won't give you the functional tool chain you need, but
I'm working on it.  Once I've gone over bfd/elf32-hppa.c, I intend to make
everything available via CVS from the puffin machines.  It's taking longer
than I thought it would...

> I'm going to hack at it a bit but don't want to do anything stupid
> (actually with my level of knowledge of gcc, glibc, and binutils, it's
> certain I'll do *something* stupid).  Sammy may also be
> doing something soon to solve the .proc/.procend stuff (in the linker
> I think).

I'm sure I'll do many stupid things :)

-- 
Linuxcare.  Support for the Revolution.
