Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6E2CE4829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 10 Nov 2002 18:05:13 -0700 (MST)
Date: Sun, 10 Nov 2002 20:05:17 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Cc: Randolph Chung <tausq@debian.org>, Jeff Bailey <jbailey@nisa.net>
Message-ID: <20021111010517.GA13575@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] glibc 2.3.1 - It's alive! - patches
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

PA,

These patches apply and build glibc 2.3.1, but we have interesting
testsuite failures :}

In particular ex10 in the linuxthreads testsuite deadlocks and has to be
killed by hand to continue testing.

We also fail a number of "needed" tests in the elf section. These tests
cover the loading of DSO's with dlopen. Wether these are binutils bugs
is yet to be seen.

Lastly, I think that the fp* tests suffer from the printf bug?

Pathes at:
http://www.baldric.uwo.ca/~carlos/upstream-patches.tar.gz

I don't think we are ready to push this into unstable until we iron out
a few more of these bugs :(

c.
