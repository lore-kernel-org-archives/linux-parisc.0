Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from spawn.hockeyfiend.com (dsl092-073-086.bos1.dsl.speakeasy.net [66.92.73.86])
	by dsl2.external.hp.com (Postfix) with ESMTP id F063F482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 29 Jan 2002 14:24:34 -0700 (MST)
Date: Tue, 29 Jan 2002 16:24:33 -0500 (EST)
From: "Christopher C. Chimelis" <chris@debian.org>
To: Dark Fiber <dfiber@mega-tokyo.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] cross compilation
In-Reply-To: <5.1.0.14.2.20020129205648.00a80ec8@pop.freeserve.net>
Message-ID: <Pine.LNX.4.21.0201291620010.2014-100000@spawn.hockeyfiend.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Tue, 29 Jan 2002, Dark Fiber wrote:

> it also talks about the debian version of binutils? what makes
> the debian binutils different from the standard ones and apply
> the hppa patches?

Not much, actually.  I'm working on a new version, but it should be very
easy to tell which patches I added to binutils for hppa.  To my
recollection, the only ones in the current binutils in debian that aren't
in HJ Lu's 2.11.92.0.12.3 are the three from Alan Modra that are already
in upstream CVS (stub size, refcount, and undefined symbol).  They are all
neatly placed in the debian/patches dir of the unpacked debian source
package (or just edit down the diff, if you'd like).  CVS may or may not
be better...I'm not sure yet.

> i've got a sinking feeling i wont be able to build it, but we will see
> how it goes. i'm hoping the hppa patches are all generic enough that
> i can use standard binutils, etc, otherwise i'll be in a world of trouble.

I'm going to be trying CVS on the A500 this week.  Email me outside the
list for my results compared to the debian package.  I'm currently trying
the same comparison on powerpc (since it's my laptop and is in front of me
right now).

C
