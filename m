Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE00045aedab24-CM.cpe.net.cable.rogers.com [24.112.227.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6E379482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 23 Mar 2003 20:10:06 -0700 (MST)
Date: Sun, 23 Mar 2003 22:10:32 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: debian-glibc@lists.debian.org,
	parisc-linux@lists.parisc-linux.org
Message-ID: <20030324031032.GA27086@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [Preliminary] HPPA Patches for glibc 2.3.2
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

Hackers,

The following is the set of preliminary patches allows HPPA to build a
semi-functional 32-bit GLibc (against upstream CVS head as of today).

http://www.baldric.uwo.ca/~carlos/glibc-2.3.2-patches.tar.gz

I'm almost certain that I _don't_ have the sysdep-cancel code correctly
implemented, but I'll have another go when I get some more free time.

Please do not commit this to the CVS, this is purely experimental for
anyone who wants to try building upstream source + patches for HPPA. I
can think of atleast 2 people who might, so I'm providing these patches
as a snapshot of my current work.

Comments on sysdep-cancel.h changes are more than welcome since it has
to be wrong because the tst-cancel* failures are blatent (and my PA
assembly prolly has a bug).

Cheers,
Carlos.
