Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3E5774A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 14 Mar 2001 17:07:43 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id LAA27858;
	Thu, 15 Mar 2001 11:07:40 +1100
Date: Thu, 15 Mar 2001 11:07:39 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: "Paul J.Y. Lahaie" <pjlahaie@linuxcare.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] perl-5.6.0 build problems
In-Reply-To: <Pine.LNX.4.21.0103151018450.27636-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0103151027510.27636-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 15 Mar 2001, Alan Modra wrote:

> On Wed, 14 Mar 2001, Paul J.Y. Lahaie wrote:
> 
> > If I use the debian build (with the patch), perl.static and perl.debug
> > complete building, but a dynamic version crashes immediately on startup
> > from loading libperl.so.5.6.0 with the following fault:
> 
> Is this with the latest fix to gcc?

Ermm, should have read your last message first.  What about all the
libraries that perl is loading though?  And where did the crash occur?

You can find the crash location within a shared lib by doing

ldd <binary that crashed ie. miniperl>

Note the load addresses, and compare against do_fage_fault dump IAOQ.
Then

objdump -d <library> | less

To double check, the instruction that faulted should be the same as the
do_page_fault IIR.
