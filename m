Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [156.153.255.205])
	by dsl2.external.hp.com (Postfix) with ESMTP id 764624829
	for <parisc-linux@parisc-linux.org>; Fri, 17 Jan 2003 09:38:34 -0700 (MST)
Received: from smtp1.fc.hp.com (smtp1b.fc.hp.com [15.15.136.127])
	by atlrel6.hp.com (Postfix) with ESMTP id C8055225
	for <parisc-linux@parisc-linux.org>; Fri, 17 Jan 2003 11:38:33 -0500 (EST)
Received: from ldl.fc.hp.com (ldl.fc.hp.com [15.1.50.190])
	by smtp1.fc.hp.com (Postfix) with ESMTP id 784E13813B
	for <parisc-linux@parisc-linux.org>; Fri, 17 Jan 2003 09:38:33 -0700 (MST)
Received: from paul.bame (paul.bame [10.66.2.7])
	by ldl.fc.hp.com (Postfix) with ESMTP id 69448418C
	for <parisc-linux@parisc-linux.org>; Fri, 17 Jan 2003 09:38:33 -0700 (MST)
Received: from fc.hp.com (localhost [127.0.0.1])
	by paul.bame (Postfix) with ESMTP id 3D59915192
	for <parisc-linux@parisc-linux.org>; Fri, 17 Jan 2003 09:38:33 -0700 (MST)
To: Linux/HPPA List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] CVS checkouts on ftp server 
In-Reply-To: Your message of "Fri, 17 Jan 2003 18:46:25 +0800."
             <20030117184623.C23928@neep.com.au>
References: <20030115122121.C799@neep.com.au> <20030115131651.F26554@parcelfarce.linux.theplanet.co.uk>  <20030117184623.C23928@neep.com.au> 
Date: Fri, 17 Jan 2003 09:38:33 -0700
From: Paul Bame <bame@fc.hp.com>
Message-Id: <20030117163833.3D59915192@paul.bame>
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

> > Those aren't currently being generated (AFAIK).  What _is_ being generated
> > are the patches against upstream: http://ftp.parisc-linux.org/2.5/kernel-sr
> c/
> 
> Ah yes, I saw those.  But then I'll need to make a vanilla Linus tree,
> and I am lazy.  I mean, streamlined and efficient.  =)

One reason I didn't bother with tarballs for 2.5 is it appears from
my limited sample that the tradition is per-arch patches -- and it makes
us appear to be more part of linux development rather than our own thing.

I also find that on slow links, I'm more likely to have a Linus kernel
tree somewhere nearby (perhaps on my x86 box) so only have to wait through
transferring the patch.  Less likely with 2.5 of course since it's changing
fast.

> It'd be nice.  Yes, I'd like it, if it's not a problem for anyone.
> Otherwise I'll try the above method, or slowly drag it out of CVS.  I'm
> assuming that occasional linux-2.5 tarballs might be useful for people
> other than me of course ...

Nobody else has asked.  I just posted a 2.5 tarball in the 2.5 patches
directory, which can then be kept up to date with CVS or with the
incremental patches.

> > > Also the /cvs directory contains a few files that look like stuff-ups
> > > from the CVS tarball roller: linux-.tar.gz and patch-.diff.gz ...
> > 
> > I can see them... but I can also see the CVS scripts are still running.
> > Possibly they'll be renamed later.
> 
> Doesn't seem to be; they're empty files (though > 0 bytes from gzip).  I
> think the checkout script is using an empty variable, eg linux-$i.tar.gz
> or whatever.  The 'latest' softlinks are to these empty files.  I can't
> see any likely-looking tarball-rolling scripts in CVSROOT/ so I'm unable
> to investigate further.

Nothing was obviously wrong with the script or log so I'm kicking it
off again.

	-P
