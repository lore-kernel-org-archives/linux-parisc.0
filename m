Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 498664A18
	for <parisc-linux@lists.parisc-linux.org>; Tue, 30 Jan 2001 18:56:14 -0700 (MST)
Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id SAA23823
	for <parisc-linux@puffin.external.hp.com>; Tue, 30 Jan 2001 18:52:08 -0700
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by palrel1.hp.com (Postfix) with ESMTP id B5D8416FA
	for <parisc-linux@puffin.external.hp.com>; Tue, 30 Jan 2001 15:54:46 -0800 (PST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA12383;
	Wed, 31 Jan 2001 10:45:01 +1100
Date: Wed, 31 Jan 2001 10:45:01 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: "Paul J.Y. Lahaie" <pjlahaie@linuxcare.com>,
	parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] Weird compile problems 
In-Reply-To: <20010130233603.B823337C90@carmen.fc.hp.com>
Message-ID: <Pine.LNX.4.21.0101311037120.19209-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 30 Jan 2001, Matt Taggart wrote:

> I suspect that your make actually died during the make install right? This is 

No, during the build.

> the problem that John Marvin and I are working on. The pthread changes that he 
> made broke things that use librt and libpthread. In our current nfsroot that 
> is tar, make, and sleep. For now we're using a static make to complete the 
> install. Once I have a new glibc package built I will do new new 
> make,tar,sleep stuff too.
> 
> > Hmm, looking at what I just wrote, you can hardly call it a "successful
> > bootstrap".  I'm investigating the ld.so.1 problem - at least that one is
> > reproducable.
> 
> I was seeing that here too but John wasn't. We're currently trying to 
> determine the differences in our build environments. What system are you 
> building on and what nfsroot/kernel are you using?

Machine is a 712/80, nfsroot started life as nfsroot-20001009 but has been
tweaked quit a bit - compiler, binutils, glibc.  Kernel is one I built
from CVS checked out 24th. Jan.

Alan
-- 
Linuxcare.  Support for the Revolution.
