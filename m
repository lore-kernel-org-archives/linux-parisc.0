Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 717314829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Oct 2002 21:47:12 -0600 (MDT)
Message-Id: <200210020347.g923l7gx029193@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [roland@redhat.com: Re: [PATCH] glibc 2.2.94 - hppa - min kernel and unwind-find-fde]
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Tue, 1 Oct 2002 23:47:07 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20021002031406.GA32230@systemhalted> from "Carlos O'Donell" at Oct 1, 2002 11:14:06 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> > > > 2002-10-01  Matthew Wilcox  <willy@debian.org>
> > > > 
> > > > 	* sysdeps/unix/sysv/linux/configure: 
> > > > 	Make 2.4.18 minimum linux kernel for hppa, and add 
> > > > 	libc_cv_gcc_unwind_find_fde=yes.
> > > 
> > > This log entry is for a generated file, and there is no log entry for the
> > > actual source file.
> > 
> > I noticed this when I was fixing the gcc dw2 exception support.  Changing
> > it didn't seem to have any affect on the v3 or g++ testsuite results, but
> > it seems the correct thing to do.
> > 
> 
> Setting "libc_cv_gcc_unwind_find_fde=no" seems the correct thing to do?

That seems reasonable for gcc 3.0.4.  However, it may not matter.  With
gcc 3.3 and a slightly hacked glibc-2.2.5-14, I see the following in my
build log:

checking for DWARF2 unwind info support... (cached) no

This should be yes.  I haven't investigated why this is so.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
