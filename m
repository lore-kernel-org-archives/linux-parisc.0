Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 60145482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  3 Apr 2001 08:08:09 -0600 (MDT)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id AAA31413;
	Wed, 4 Apr 2001 00:08:04 +1000
Date: Wed, 4 Apr 2001 00:08:04 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Markus Werle <markus@lufmech.rwth-aachen.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] cvs-gcc: howto build a 64-bit version?
In-Reply-To: <3AC9C4C1.D6078033@lufmech.rwth-aachen.de>
Message-ID: <Pine.LNX.4.21.0104040001140.6476-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 3 Apr 2001, Markus Werle wrote:

> Are You talking about thge redhat cvs tree?

Yes. The site used to be called sourceware.cygnus.com, and I'm not yet
used to the new name, sources.redhat.com

> Is that tree more up-to-date/applicable for hpux than puffin's?

Yes and no.  Yes, we have PA specific fixes in our tree that aren't yet in
sourceware (there I go again), but on the other hand we are lagging a
little behind the gcc-3.0 tree.

> cc1: Internal compiler error in set_sizetype, at stor-layout.c:1673

I don't see this error when either cross-compiling or natively
boot-strapping gcc under hppa-linux.  It's possible your bootstrap
compiler has bugs that are preventing a successful build.

Alan
-- 
Linuxcare
