Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 32749484B
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Sep 2003 08:06:22 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 19uukZ-0003zM-SZ; Thu, 04 Sep 2003 15:06:15 +0100
Date: Thu, 4 Sep 2003 15:06:15 +0100
From: Matthew Wilcox <willy@debian.org>
To: Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel crash with 2.6.0-test4-pa8 on 715/100
Message-ID: <20030904140615.GN18654@parcelfarce.linux.theplanet.co.uk>
References: <3F5728AB.3040501@hrzpub.tu-darmstadt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F5728AB.3040501@hrzpub.tu-darmstadt.de>
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

On Thu, Sep 04, 2003 at 01:57:31PM +0200, Ruediger Scholz wrote:
> I tried to boot 2.6.0-test4-pa8 on my HP 715/100, but it crashed right 
> after the message "Freeing unused kernel memory...". I'm using debian 
> testing with devfs and gcc-3.3.1.
> I think the pb is devfs, so I will try to boot a kernel without it.
> Bootlog is attached, Config, System.map is here: 
> http://rscholz.bluehash.de/parisc

I'm seeing the same thing on my 712 without devfs.  Not sure what the
problem is, and I'm having a hard time getting that box back up as it has
a broken root filesystem (damn tar for being linked against libpthread!)

I decoded what's going on a little bit.  We're calling
drivers/char/tty_io.c::init_dev() with a `driver' variable set to
0x00000b00.  Quite what's gone wrong to get this to happen, I'm not sure.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
