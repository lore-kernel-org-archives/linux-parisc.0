Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id 845914829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Oct 2002 14:03:30 -0600 (MDT)
Received: from carlos by systemhalted with local (Exim 3.35 #1 (Debian))
	id 17wTEw-00079n-00
	for <parisc-linux@lists.parisc-linux.org>; Tue, 01 Oct 2002 16:03:30 -0400
Date: Tue, 1 Oct 2002 16:03:29 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20021001200329.GG25959@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [roland@redhat.com: Re: [PATCH] glibc 2.2.94 - hppa - min kernel and unwind-find-fde]
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

pa,

Do we actaully have such a thing as old C++ binaries? :)
Thoughs or comments appreciated.

c.

----- Forwarded message from Roland McGrath <roland@redhat.com> -----

Envelope-to: carlos@localhost
Delivery-date: Tue, 01 Oct 2002 15:51:34 -0400
From: Roland McGrath <roland@redhat.com>
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Cc: libc-alpha@sources.redhat.com, debian-glibc@lists.debian.org
Subject: Re: [PATCH] glibc 2.2.94 - hppa - min kernel and unwind-find-fde
X-Windows: ignorance is our most important resource.

> The following patch bumps up the minimum kernel required for hppa,
> and adds libc_cv_gcc_unwind_find_fde (I'm curious if this last bit 
> is still needed?). 

Please figure it out and be sure.  You need it only if there are existing
old C++ binaries that have references to _Unwind_Find_FDE.  If there are no
C++ binaries you want to be compatible with that predate a certain GCC
version (not sure which off hand), then you don't need it.  But I don't
think it hurts to have it.

> 2002-10-01  Matthew Wilcox  <willy@debian.org>
> 
> 	* sysdeps/unix/sysv/linux/configure: 
> 	Make 2.4.18 minimum linux kernel for hppa, and add 
> 	libc_cv_gcc_unwind_find_fde=yes.

This log entry is for a generated file, and there is no log entry for the
actual source file.

----- End forwarded message -----
