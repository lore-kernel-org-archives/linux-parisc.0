Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 78D4C485C
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Oct 2002 14:18:57 -0600 (MDT)
Message-Id: <200210012018.g91KIrCv028501@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [roland@redhat.com: Re: [PATCH] glibc 2.2.94 - hppa - min kernel and unwind-find-fde]
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Tue, 1 Oct 2002 16:18:53 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20021001200329.GG25959@systemhalted> from "Carlos O'Donell" at Oct 1, 2002 04:03:29 pm
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

> Please figure it out and be sure.  You need it only if there are existing
> old C++ binaries that have references to _Unwind_Find_FDE.  If there are no
> C++ binaries you want to be compatible with that predate a certain GCC
> version (not sure which off hand), then you don't need it.  But I don't
> think it hurts to have it.

I believe that this is needed for dw2 exception support.  This doesn't
work with gcc 3.0.4, so I don't think you need to worry much about old
binaries.

> > 2002-10-01  Matthew Wilcox  <willy@debian.org>
> > 
> > 	* sysdeps/unix/sysv/linux/configure: 
> > 	Make 2.4.18 minimum linux kernel for hppa, and add 
> > 	libc_cv_gcc_unwind_find_fde=yes.
> 
> This log entry is for a generated file, and there is no log entry for the
> actual source file.

I noticed this when I was fixing the gcc dw2 exception support.  Changing
it didn't seem to have any affect on the v3 or g++ testsuite results, but
it seems the correct thing to do.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
