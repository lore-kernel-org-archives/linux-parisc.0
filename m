Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 353C7482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 29 Jan 2003 00:59:08 -0700 (MST)
Date: Tue, 28 Jan 2003 23:54:11 -0800
From: tausq@debian.org
To: gcc-gnats@gcc.gnu.org, debian-gcc@lists.debian.org
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20030129075411.GF20940@tausq.org>
Reply-To: tausq@debian.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [hppa-linux, gcc-3.2 regression] cc1 segmentation fault at -O2
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
>Synopsis:	cc1 segfaults @ -O2 when building a simple function
>Severity:	serious
>Priority:	medium
>Category:	optimization
>Class:		ice-on-legal-code
>Release:	3.2.2 20030124 (Debian prerelease) (Debian testing/unstable)
>Environment:
System: Linux legolas 2.4.20-pa18 #110 Mon Jan 27 23:44:18 PST 2003 parisc unknown unknown GNU/Linux
Architecture: parisc

	<machine, os, target, libraries (multiple lines)>
host: hppa-unknown-linux-gnu
build: hppa-unknown-linux-gnu
target: hppa-unknown-linux-gnu
configured with: ../src/configure -v --enable-languages=c,c++,f77,proto,pascal,objc,ada --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --with-gxx-include-dir=/usr/include/c++/3.2 --enable-shared --with-system-zlib --enable-nls --without-included-gettext --enable-__cxa_atexit --enable-clocale=gnu --enable-objc-gc hppa-linux
>Description:
	Self-explanatory. Compiles fine with gcc-3.0.4 and gcc-3.3 (20030118)

>How-To-Repeat:
	Compile this function with gcc -O2 -c
	(simplied from a failure in building lcdproc)

void foo(int len)
{
	while (len >= 8) len -= 8;
	if(!len) return;
}

>Fix:
	none
