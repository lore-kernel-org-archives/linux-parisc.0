Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 93C024831
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Feb 2003 23:51:31 -0700 (MST)
Date: Wed, 19 Feb 2003 22:42:11 -0800
From: tausq@debian.org
To: gcc-gnats@gcc.gnu.org, debian-gcc@lists.debian.org
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20030220064211.GD11363@tausq.org>
Reply-To: tausq@debian.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [hppa-linux, gcc-3.2 regression] ICE when optimizing inline code
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

>Submitter-Id:	net
>Originator:	Randolph Chung
>Organization:	Debian
>Confidential:	no
>Synopsis:	[hppa-linux, gcc-3.2 regression] ICE when optimizing inline code
>Severity:	serious
>Priority:	medium
>Category:	optimization
>Class:		ice-on-legal-code
>Release:	3.2.3 20030210 (Debian prerelease) (Debian testing/unstable)
>Environment:
System: Linux legolas 2.4.20-pa25 #115 Sun Feb 9 20:54:18 PST 2003 parisc unknown unknown GNU/Linux
Architecture: parisc

	<machine, os, target, libraries (multiple lines)>
host: hppa-unknown-linux-gnu
build: hppa-unknown-linux-gnu
target: hppa-unknown-linux-gnu
configured with: ../src/configure -v --enable-languages=c,c++,f77,proto,pascal,objc,ada --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --with-gxx-include-dir=/usr/include/c++/3.2 --enable-shared --with-system-zlib --enable-nls --without-included-gettext --enable-__cxa_atexit --enable-clocale=gnu --enable-objc-gc hppa-linux
>Description:
see below

code works with gcc-3.0 and gcc-3.3 snapshot
also works with gcc-3.2 with -O1

>How-To-Repeat:
-------8< cut here 8<---------
inline int fixfloor (long x) { if (x >= 0) return (x >> 16); else return ~((~x) >> 16); }
inline int fixtoi (long x) { return fixfloor(x) + ((x & 0x8000) >> 15); }
int foo(long x, long y) { return fixtoi(x*y); }
-------8< cut here 8<---------

legolas% gcc-3.2 -O2 -c bug.i
bug.i: In function `foo':
bug.i:3: internal error: Segmentation fault
Please submit a full bug report,
with preprocessed source if appropriate.
See <URL:http://www.gnu.org/software/gcc/bugs.html> for instructions.

>Fix:
	unknown
