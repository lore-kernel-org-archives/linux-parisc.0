Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out1.bellatlantic.net (smtp-out1.bellatlantic.net [199.45.40.143])
	by dsl2.external.hp.com (Postfix) with ESMTP id 24A784A19
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Feb 2001 09:19:46 -0700 (MST)
Received: from neuronet.pitt.edu (adsl-151-201-241-153.pittpa.adsl.bellatlantic.net [151.201.241.153])
	by smtp-out1.bellatlantic.net (8.9.1/8.9.1) with ESMTP id LAA22537
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Feb 2001 11:19:59 -0500 (EST)
Sender: raffo@bellatlantic.net
Message-ID: <3A91479E.9C9EB68A@neuronet.pitt.edu>
Date: Mon, 19 Feb 2001 11:19:42 -0500
From: "Rafael E. Herrera" <raffo@neuronet.pitt.edu>
MIME-Version: 1.0
Cc: PL <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Cannot build 02/18/2001 glibc
References: <Pine.LNX.4.21.0102191946290.23583-100000@front.linuxcare.com.au>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alan Modra wrote:
> 
> On Mon, 19 Feb 2001, Rafael E. Herrera wrote:
> 
> > checking for assembler line separator... *** You need a newer assembler
> > to compile glibc
> >[snip]
> >  /usr/i486-suse-linux/bin/as -V -Qy -v -o conftest.o conftest.s
> 
> Oops, this is an x86 assembler.
> 
> > The binaries called and the version numbers are shown. Do I need to
> > upgrade the assembler or is it a PATH misconfiguration? Thanks.
> 
> You need the hppa-linux assembler installed and available on your PATH.

The PATH needs to include both of these entries:

PATH=~/palinux/bin:~/palinux/hppa-linux/bin:$PATH

I had just first one before.

-- 
     Rafael
