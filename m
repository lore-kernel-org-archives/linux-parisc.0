Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA04228
	for <parisc-linux@puffin.external.hp.com>; Tue, 4 Jul 2000 19:54:47 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 5 Jul 2000 01:56:06 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id LAA00937;
	Wed, 5 Jul 2000 11:55:47 +1000
Date: Wed, 5 Jul 2000 11:55:47 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Ulrich Drepper <drepper@cygnus.com>
cc: bame@riverrock.org, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Get rid of %r8 linker stubs
In-Reply-To: <m3em591ji2.fsf@otr.mynet.cygnus.com>
Message-ID: <Pine.LNX.4.21.0007051151060.31061-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 4 Jul 2000, Ulrich Drepper wrote:

> Alan Modra <alan@linuxcare.com.au> writes:
> 
> > The trouble is that _init is a single function that's been split in two
> > (see glibc/csu/Makefile crti,crtn), thus the linker thinks it's quite OK
> > to insert a stub at the start of the second section.  I'll have to do
> > something special with the .init section to work around this problem.
> 
> Simply create an appropriate initfini.c file for HP/UX.  Look in the
> current glibc sources and you'll see that we already do this for SH.

Thanks for the hint.  It's probably a good idea.  Meanwhile, I've already
fixed the linker :)

Regards, Alan Modra
-- 
Linuxcare.  Support for the Revolution.
