Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 296E0482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Jun 2001 12:17:34 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15AFCt-0003gI-00; Wed, 13 Jun 2001 19:17:31 +0100
Date: Wed, 13 Jun 2001 19:17:31 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Tom <tom@Alaskatech.org>
Cc: PA-RISC Linux list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] clustering ??
Message-ID: <20010613191731.B12562@parcelfarce.linux.theplanet.co.uk>
References: <20010612094328.C1917@megatonmonkey.net> <Pine.LNX.4.33.0106120829320.26952-100000@devnull.alaskatech.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0106120829320.26952-100000@devnull.alaskatech.org>; from tom@Alaskatech.org on Tue, Jun 12, 2001 at 08:32:39AM -0800
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jun 12, 2001 at 08:32:39AM -0800, Tom wrote:
> On Tue, 12 Jun 2001, Carlos O'Donell Jr. wrote:
> [snip]
> > And yes, SSH will work as a direct replacement for RSH in MPICH.
> >
> > However, I believed that SSH was currently broken on PA-RISC due to OpenSSL.
> >
> > Haven't tried compiling non-open SSH :)
> > I think we might give it a shot tonight.
> 
> Not sure what "broken" may mean, but my 0.9 install has a working SSH
> server running on it. Mine *was* installed with contrib and non-free
> however, so it may be that a "pure" install doesn't have it.

the current openssh in the archives has a known bug (which i haven't seen
discussed on the list), which is that X forwarding does't work right.
at least not on my machine :-)

A bug which you'll see ssh trigger (but is actually in libc) is that it'll
set your rlimit to 2GB instead of infinity.  this should be fixed RSN.

-- 
Revolutions do not require corporate support.
