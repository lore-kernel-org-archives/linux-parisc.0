From: Carlos O'Donell <carlos@systemhalted.org>
Subject: [parisc-linux] [Announce] NPTL for hppa (a.k.a. How to become a
	sexy hacker)
Date: Wed, 3 Aug 2005 00:23:35 -0400
Message-ID: <20050803042330.GL9703@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Randolph Chung <tausq@debian.org>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


parisc,

===== NPTL on hppa-linux (alpha release) =====

We have recently checked in all the glibc NPTL pieces required to get
threading working for hppa. This has been a lot of fun.  Randolph Chung
and John David Anglin deserve a lot of credit.  The entire toolchain
required TLS support and more bug fixes that I can count.

The rest of the pa team deserves credit too, especially for the tactical
use of cluebats (willy, jejb) for all the bad kernel code I wrote.
Without granta-claus nothing is possible, and somewhere in France we've
lost a good hacker ... he's probably playing on his PSP.

This initial NPTL port is made possible by using scalar lock words and
the light-weight-syscall mechanism for "compare and swap." It is not
implemented using LDCW. The sheer amount of code that has to be audited
and changed, including core algorithms is too much work for me
currently. Even the spinlocks are using LWS CAS.

This is a first cut and it needs more debugging to get the regressions
down.

===== NPTL Build Recipe =====

You might be wondering, how can I help? The first step is to follow the
22 step recipe to build your own TLS enabled NPTL threaded toolchain.
Following that you can post a link to your logs that resulted from the
compilation.

Minimum Requirements:
----------------------
You need a machine running the latest kernel from cvs.parisc-linux.org.
You need ~2.5GB of free drive space.
Make sure you don't have a ~/.tls-tools that overrides your options.
Please post a link to your tar.gz'd logs so we can see the tests results.
Please post how long it took to complete? :) 

---
#!/bin/bash
date
mkdir tls-toolchain-hppa
cd tls-toolchain-hppa
mkdir src
mkdir build
mkdir install
export CVSROOT=:pserver:anonymous@cvs.parisc-linux.org:/var/cvs
export BASE=`pwd`
export SRC=$BASE/src
export BUILD=$BASE/build
export PINSTALL=$BASE/install
cd $SRC
ln -s glibc glibc-nptl
cvs co build-tools
cd $BASE
cp $SRC/build-tools/build-tls-tools .
TOOLS="binutils gcc" STAGES="checkout configure build check install" ./build-tls-tools
TOOLS="glibc" STAGES="checkout configure build check" ./build-tls-tools
TOOLS="glibc-nptl" STAGES="configure build check" ./build-tls-tools
cd $BUILD
# Post a link to your logs on the parisc-linux mailing list.
tar zcvf logs-YOURNAME-YY-MM-DD.tar.gz logs/
date
---

===== NPTL Debugging Help =====

If you think you're a multi-threaded programming hot-shot then perhaps
you can help debug our NPTL threading implementation! You'll see the
internals of NPTL and learn how an enterprise ready threading library is
built!

You can start by examining the errors in glibc-nptl.check* and try to
figure out why the test is failing, what is the correct behaviour, and
what might be the fix. Correctness is usually measured against POSIX or
SuSv.

Error listing:  
(cd $BUILD; grep 'Error' glibc-nptl.check*;)

The best debugging technique IMO is to relink the test in a local
directory and use 'rpath' instead of 'rpath-link'. The test can then be
run directly, instead of through ld.so.1, and gdb can be used.

===== NPTL TODO =====

* Reduce NPTL glibc testsuite bug count to below 20. (Critical)
* Fixing or identifying problem areas for NPTL glibc testsuite bugs
* Develop and run LWS CAS test on SMP systems to measure scalability
  and correctness.
- Identify what is required for backwards compat with linuxthreads
- Enabling debian-glibc NPTL builds and testing.
- Distro plan for transition to NPTL threading (Gentoo, Debian,
  Ubuntu... whoe else?).
- What unwind support is required to have a working syscall cancellation
  mechanism.
- Merge code upstream for binutils and glibc.
- Merge upstream back into our CVS.
- Become a sexy hacker.

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
