Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id E0E78482E
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Mar 2003 00:41:38 -0700 (MST)
Date: Mon, 10 Mar 2003 23:37:10 -0800
From: tausq@debian.org
To: gcc-gnats@gcc.gnu.org, debian-gcc@lists.debian.org
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20030311073710.GO11363@tausq.org>
Reply-To: tausq@debian.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [3.3 regression; hppa-linux] ICE when optimizing inline code at -O2
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
>Synopsis:	[3.3 regression] inline optimization ICE 
>Severity:	serious
>Priority:	medium
>Category:	optimization
>Class:		ice-on-legal-code
>Release:	3.3 20030309 (Debian prerelease) (Debian testing/unstable)
>Environment:
System: Linux gsyprf11.external.hp.com 2.4.20-pa18-UP #1 Sat Jan 4 22:06:52 PST 2003 parisc64 unknown unknown GNU/Linux
Architecture: parisc64

	<machine, os, target, libraries (multiple lines)>
host: hppa-unknown-linux-gnu
build: hppa-unknown-linux-gnu
target: hppa-unknown-linux-gnu
configured with: ../src/configure -v --enable-languages=c,c++,f77,objc,ada,treelang --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --with-gxx-include-dir=/usr/include/c++/3.3 --enable-shared --with-system-zlib --enable-nls --without-included-gettext --enable-__cxa_atexit --enable-sjlj-exceptions --enable-clocale=gnu --enable-debug --enable-objc-gc hppa-linux
>Description:
see below; code works with gcc-3.2.3	 
This is extracted from allegro. It is similar but not the same as 
optimization/9768
>How-To-Repeat:
gcc-3.3 -O2 -c bug.c
--------------------8< bug.c 8<-------------------
extern int * allegro_errno;
typedef long fixed;
extern inline int fixfloor (fixed x) { if (x >= 0) return (x >> 16); else return ~((~x) >> 16); }
extern inline int fixtoi (fixed x) { return fixfloor(x) + ((x & 0x8000) >> 15); }
extern inline fixed ftofix (double x) { if (x > 32767.0) { *allegro_errno = 34; return 0x7FFFFFFF; } if (x < -32767.0) { *allegro_errno = 34; return -0x7FFFFFFF; } return (long)(x * 65536.0 + (x < 0 ? -0.5 : 0.5)); }
extern inline double fixtof (fixed x) { return (double)x / 65536.0; }
extern inline fixed fixdiv (fixed x, fixed y) { if (y == 0) { *allegro_errno = 34; return (x < 0) ? -0x7FFFFFFF : 0x7FFFFFFF; } else return ftofix(fixtof(x) / fixtof(y)); }
extern inline fixed itofix (int x) { return x << 16; }

int foo(int n) { return fixtoi(fixdiv(itofix(512), itofix(n))); }
--------------------8< bug.c 8<-------------------
>Fix:
	unknown
