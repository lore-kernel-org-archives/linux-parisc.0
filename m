Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (oe62.law3.hotmail.com [209.185.240.63])
	by dsl2.external.hp.com (Postfix) with ESMTP id 92A66482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 Aug 2002 09:23:29 -0600 (MDT)
From: "Alex Green" <alexdgreen@hotmail.com>
To: "Paul Bame" <bame@fc.hp.com>
Cc: <parisc-linux@lists.parisc-linux.org>
References: <OE22Aztxc1o8yfogkJX00009958@hotmail.com> <20020807123807.GB9966@systemhalted>  <OE50nwpGR881Np7vXee0000cb29@hotmail.com>  <E17cSWK-0000pp-00@paul.bame>
Subject: Re: [parisc-linux] palo issues
Date: Wed, 7 Aug 2002 17:23:26 +0200
Message-ID: <OE62f84mtceYvUAA3qj0000304b@hotmail.com>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

ok the file was build using make bzImage... surely this would produce a
proper image..... or not?

----- Original Message -----
From: "Paul Bame" <bame@fc.hp.com>
To: "Alex Green" <alexdgreen@hotmail.com>
Sent: Wednesday, August 07, 2002 5:14 PM
Subject: Re: [parisc-linux] palo issues


> > ok, well i got the PALO to start however it now crashes with the
following
> > error:
> >
> > Couldn't grok your kernel executable formatERROR: failed to load kernel.
> >
> > What does this mean?
>
> The normal reason for this error is that the file isn't an elf32
> or elf64 executable.  Common mistakes are using a lifimage instead
> of a 'vmlinux' (e.g., elf kernel).  Once someone used a tarball
> (of the pre-built kernels on ftp.parisc-linux.org/kernels/32) without
> unpacking it first.
>
> Run 'file' on what you're telling palo to load.
>
> -P
>
