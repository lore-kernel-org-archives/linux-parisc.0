Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 90EE44A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Feb 2001 18:31:25 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id MAA09813;
	Fri, 16 Feb 2001 12:28:48 +1100
Date: Fri, 16 Feb 2001 12:28:48 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: Bdale Garbee <bdale@gag.com>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] db2 build failed 
In-Reply-To: <20010216004854.5F4A438786@carmen.fc.hp.com>
Message-ID: <Pine.LNX.4.21.0102161212030.5178-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 15 Feb 2001, Matt Taggart wrote:

> > And, amazingly, he's just committed a fix.  :-)
> 
> Of course right after I finished building a new xc based on the devel branch :(
> I am rebuilding now and will post shortly.

Sorry.  I thought the fix would take me longer. :)

Note that -p is still not compatible with -fpic (and that means -p is not
OK for hppa64 at all, because there you always get PIC).  I'm not sure of
all the reasons why -p and -fpic are incompatible, but one is to do with
the way the prologue code generates a symbol ref.  _That_ problem will
still generate compiler crashes, but you do get a warning.

Err, I just looked at our glibc support for profiling, gmon/mcount.c, and
see that the prologue code is wrong anyway.  What's there is for HPUX
_mount, which is non-standard.  !@(*$&()*

So that's double sorry, I guess :-(

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
