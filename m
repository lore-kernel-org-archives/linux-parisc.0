Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8E16C4866
	for <parisc-linux@lists.parisc-linux.org>;
	Thu,  1 Jan 2004 13:11:17 -0700 (MST)
Date: Thu, 1 Jan 2004 15:03:19 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
Message-ID: <20040101200318.GB7069@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: LaMont Jones <lamont@debian.org>
Subject: [parisc-linux] Using -pg on hppa *is* broken
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


lamont,

I know you were looking for me regarding the use of '-pg' profiling in
debian. It *is* broken, it's fixed on my experimental system thanks to a
few patches from Randolph. I'm currently looking into sprof so I can
profile glibc itself (not working currently).

The main issue was that the 'start' symbol needs to be canonicalized
before passing on to the gmon routines. This requires entry.h to be
modified. What does this *really* mean? It means that in general you
need a gcc-3.3 runtime to have glibc work properly, the good news is
that debian doesn't have to have a gcc-3.3 runtime since __c_f_f_c was
backported for our gcc pacakges. 

I need to coordinate with the debian-glibc people again to resync the
patches required for hppa.

Cheers,
Carlos.
