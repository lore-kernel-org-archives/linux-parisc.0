Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta05ps.bigpond.com (mta05ps.bigpond.com [144.135.25.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id 89FC54829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 12 Jan 2003 03:59:12 -0700 (MST)
Received: from piglet2.sspl.net.au ([144.135.25.87]) by
          mta05ps.bigpond.com (Netscape Messaging Server 4.15 mta05ps Jul
          16 2002 22:47:55) with SMTP id H8LL6G00.53B for
          <parisc-linux@lists.parisc-linux.org>; Sun, 12 Jan 2003 20:59:04 +1000
Received: from pete by piglet2.sspl.net.au with local (Exim 3.35 #1 (Debian))
	id 18Xfsh-0007yJ-00
	for <parisc-linux@lists.parisc-linux.org>; Sun, 12 Jan 2003 22:02:19 +1100
Date: Sun, 12 Jan 2003 22:02:19 +1100
From: Peter Lavender <plaven@bigpond.net.au>
To: parisc <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] upgrading kernel
Message-ID: <20030112110219.GC13397@piglet2>
Reply-To: plaven@bigpond.net.au
References: <20030112073656.GB13397@piglet2> <20030112073506.GB1177@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030112073506.GB1177@tausq.org>
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

* Randolph Chung (randolph@tausq.org) wrote:


> > Is upgrading the kernel for a stable system the same as for i386?  I
> > haven't done this with debian before.. but I'm sure there's something
> > debian about doing it.. :)
> > 
> > I'll find the relevant doco.. just want to know if it's the same for
> > the HPPA stuff.
> 
> Check out the "Kernel installation" section of the parisc linux boot
> howto
> 
> http://pateam.esiee.fr/parisc-linux-boot/PA-RISC-Linux-Boot-HOWTO/kernelinstall.html

Thanks... this outlines what to do with a custom kernel.. I was
thinking there might be a debian way... like with kernel-packages (I
just reading up about it now for my i386 based system).

The kernel on the 715/64 is from last year sometime ago... I can get
the kernel version with uname becuase it seg faults.


Pete
:wq
