Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 086BD482A
	for <parisc-linux@parisc-linux.org>; Wed, 25 Apr 2001 01:52:45 -0600 (MDT)
Received: from ldl.fc.hp.com (ldl.fc.hp.com [15.1.50.190])
	by atlrel2.hp.com (Postfix) with ESMTP id 4352C2887
	for <parisc-linux@parisc-linux.org>; Wed, 25 Apr 2001 03:07:37 -0400 (EDT)
Date: Wed, 25 Apr 2001 01:07:22 -0600
To: parisc-linux@parisc-linux.org
Message-ID: <20010425010722.G1166@zumpano.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: willy@ldl.fc.hp.com (Matthew Wilcox)
Subject: [parisc-linux] glibc 2.2.3
List-ID: <linux-parisc.vger.kernel.org>

i've been merging patches from our glibc tree with upstream CVS (see
http://sources.redhat.com/ml/bug-glibc/2001-04/ for details).  I've ported
most of the remaining changes from our tree into a snapshot of today's
upstream CVS.  The diff is availabe at

ftp://puffin.external.hp.com/pub/parisc/src/libc-2.2.3-A2.diff

it's a mishmash of CVS diffs and diffs against /dev/null (to cope with the
5 new files in our tree).  I'll send some more of this to Ulrich tomorrow.

i haven't actually dared install this libc yet, so if you want to be the
first.... :-)
