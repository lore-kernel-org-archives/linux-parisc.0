Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 94B8A482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Sep 2001 09:42:40 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15kSRr-0000bv-00; Fri, 21 Sep 2001 16:42:39 +0100
Date: Fri, 21 Sep 2001 16:42:39 +0100
From: Matthew Wilcox <willy@debian.org>
To: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>,
	parisc-linux@lists.parisc-linux.org, baldric-exec@baldric.uwo.ca
Subject: Re: [parisc-linux] testandset
Message-ID: <20010921164239.C27323@parcelfarce.linux.theplanet.co.uk>
References: <20010921113700.A25803@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010921113700.A25803@megatonmonkey.net>; from carlos@megatonmonkey.net on Fri, Sep 21, 2001 at 11:37:00AM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Sep 21, 2001 at 11:37:00AM -0400, Carlos O'Donell Jr. wrote:
> I'm sitting scratching my head becaues the ./sysdeps/hppa/dl-fptr.c
> is peppered with testandset, which used to be in pt-machine.h,
> but is now called try_lock within pt-machine.h

um, the hppa.dpatch definitely does patch this.  perhaps you were
overzealous with trimming the ia64 part of the patch?

-- 
Revolutions do not require corporate support.
