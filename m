Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 23E9A482C
	for <parisc-linux@lists.parisc-linux.org>; Sat, 14 Dec 2002 20:02:32 -0700 (MST)
Message-Id: <200212150302.gBF32OYx002469@hiauly1.hia.nrc.ca>
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Sat, 14 Dec 2002 22:02:23 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: tausq@debian.org, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20021213192039.GB12890@systemhalted> from "Carlos O'Donell" at Dec 13, 2002 02:20:39 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] comparison of function pointers
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

GCC 3.3 and later has a new function __canonicalize_funcptr_for_compare
in libgcc.a for comparing function pointers.  There are routines in glibc
that compare function pointers and therefore depend on the presence
of this function if glibc is built with gcc-3.3 or later.  These
are gconv_open.o, signal.o, sigvec.o, sysv_signal.o, sigset.o, malloc.o
sleep.o, getaddrinfo.o, svc.o, svc_simple.o.

Earlier versions of gcc don't have the function.  Thus, if you try to
use an earlier version of gcc with a library built with gcc-3.3 or later,
the routine won't be present in libgcc.  One solution might be to add
__canonicalize_funcptr_for_compare to glibc.  This might be a good idea
as it depends closely on the implementation of the dynamic linker
interface in glibc for function calls.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
