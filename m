Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5F75E482F
	for <parisc-linux@parisc-linux.org>; Mon, 26 May 2003 22:58:55 -0600 (MDT)
Date: Mon, 26 May 2003 22:22:51 -0700
From: Randolph Chung <tausq@debian.org>
To: bug-binutils@gnu.org, binutils@sources.redhat.com
Cc: debian-gcc@lists.debian.org, parisc-linux@parisc-linux.org
Message-ID: <20030527052251.GC24873@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [hppa] binutils will not build shared libraries with external deps?
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

Looks like latest binutils CVS (also as of 2.14.90.0.1) cannot build
shared libraries that have external symbols on at least hppa-linux:

tausq@ios:~$ cat blah.c
extern int foo();
int call_foo() { return foo(); }

tausq@ios:~$ gcc -shared -fPIC -o blah.so blah.c
/tmp/ccC3fZeH.o(.text+0x1c): In function `call_foo':
: undefined reference to `foo'

this worked fine on older binutils (e.g. 2.13.90.0.16 worked).

does anyone know what might be broken? this is causing a lot of failures
in the binutils test suite....

thanks,
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
