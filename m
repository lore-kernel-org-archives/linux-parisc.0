Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6394E4A19
	for <parisc-linux@lists.parisc-linux.org>; Tue, 20 Feb 2001 10:57:09 -0700 (MST)
To: "Rafael E. Herrera" <raffo@neuronet.pitt.edu>
Cc: PL <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Cannot build 02/18/2001 glibc 
In-Reply-To: Message from "Rafael E. Herrera" <raffo@neuronet.pitt.edu>
   of "Mon, 19 Feb 2001 11:19:42 EST." <3A91479E.9C9EB68A@neuronet.pitt.edu>
References: <Pine.LNX.4.21.0102191946290.23583-100000@front.linuxcare.com.au>
  <3A91479E.9C9EB68A@neuronet.pitt.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 20 Feb 2001 10:59:38 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010220175938.6DE7B37C9D@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Rafael E. Herrera" writes...

> Alan Modra wrote:
> > 
> > On Mon, 19 Feb 2001, Rafael E. Herrera wrote:
> > 
> > > checking for assembler line separator... *** You need a newer assembler
> > > to compile glibc
> > >[snip]
> > >  /usr/i486-suse-linux/bin/as -V -Qy -v -o conftest.o conftest.s
> > 
> > Oops, this is an x86 assembler.
> > 
> > > The binaries called and the version numbers are shown. Do I need to
> > > upgrade the assembler or is it a PATH misconfiguration? Thanks.
> > 
> > You need the hppa-linux assembler installed and available on your PATH.
> 
> The PATH needs to include both of these entries:
> 
> PATH=~/palinux/bin:~/palinux/hppa-linux/bin:$PATH
> 
> I had just first one before.

No, you don't want hppa-linux/bin in there because then the build will only 
use the cross-compiler and will fail if it needs to build any i386 
binaries(like intermediate build tools etc.). As long as you have --host and 
--build set right then the build will do the right thing.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
