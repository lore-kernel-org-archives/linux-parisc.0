Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id BEE4D4829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Oct 2002 21:14:07 -0600 (MDT)
Date: Tue, 1 Oct 2002 23:14:06 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [roland@redhat.com: Re: [PATCH] glibc 2.2.94 - hppa - min kernel and unwind-find-fde]
Message-ID: <20021002031406.GA32230@systemhalted>
References: <20021001200329.GG25959@systemhalted> <200210012018.g91KIrCv028501@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200210012018.g91KIrCv028501@hiauly1.hia.nrc.ca>
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

> > Please figure it out and be sure.  You need it only if there are existing
> > old C++ binaries that have references to _Unwind_Find_FDE.  If there are no
> > C++ binaries you want to be compatible with that predate a certain GCC
> > version (not sure which off hand), then you don't need it.  But I don't
> > think it hurts to have it.
> 
> I believe that this is needed for dw2 exception support.  This doesn't
> work with gcc 3.0.4, so I don't think you need to worry much about old
> binaries.

So the rationale is:
It never worked, so removing it still leaves non-working old C++ binaries.

I assume I would be able to test this by looking at all the C++ binaries 
in the hppa archive and looking for ref's to _Unwind_Find_FDE.
 
> > > 2002-10-01  Matthew Wilcox  <willy@debian.org>
> > > 
> > > 	* sysdeps/unix/sysv/linux/configure: 
> > > 	Make 2.4.18 minimum linux kernel for hppa, and add 
> > > 	libc_cv_gcc_unwind_find_fde=yes.
> > 
> > This log entry is for a generated file, and there is no log entry for the
> > actual source file.
> 
> I noticed this when I was fixing the gcc dw2 exception support.  Changing
> it didn't seem to have any affect on the v3 or g++ testsuite results, but
> it seems the correct thing to do.
> 

Setting "libc_cv_gcc_unwind_find_fde=no" seems the correct thing to do?
                                    ^^^^
c.
