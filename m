Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailin6.bigpond.com (juicer03.bigpond.com [139.134.6.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 64BD6482A
	for <parisc-linux@parisc-linux.org>; Thu,  7 Jun 2001 13:41:07 -0600 (MDT)
Received: from bubble.local ([144.135.24.69]) by
          mailin6.bigpond.com (Netscape Messaging Server 4.15) with SMTP
          id GEJ9HQ00.G8I for <parisc-linux@parisc-linux.org>; Thu, 7 Jun
          2001 10:03:26 +1000
Date: Thu, 7 Jun 2001 09:23:22 +0930
From: Alan Modra <amodra@bigpond.net.au>
To: Matthew Wilcox <willy@ldl.fc.hp.com>
Cc: parisc-linux@parisc-linux.org, aj@suse.de
Subject: Re: [parisc-linux] [aj@suse.de: Re: Remove multiline asm statements]
Message-ID: <20010607092322.E12263@bubble.local>
References: <20010606102430.V25417@zumpano.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010606102430.V25417@zumpano.fc.hp.com>; from willy@ldl.fc.hp.com on Wed, Jun 06, 2001 at 10:24:30AM -0600
List-ID: <linux-parisc.vger.kernel.org>

> > diff -urNx CVS glibc-223/sysdeps/hppa/dl-machine.h glibc-merge/sysdeps/hppa/dl-machine.h
> > --- glibc-223/sysdeps/hppa/dl-machine.h	Fri Apr 27 14:31:02 2001
> >+++ glibc-merge/sysdeps/hppa/dl-machine.h	Mon May  7 15:25:44 2001
> > @@ -75,11 +82,11 @@
> >  
> >  #if 0
> >    /* Use this method if GOT address not yet set up.  */
> 
> Can we remove the #if 0 code?

Yes.
