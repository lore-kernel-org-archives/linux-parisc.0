Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9190D4829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  8 Feb 2003 23:23:14 -0700 (MST)
Date: Sat, 8 Feb 2003 21:43:04 -0800
From: Randolph Chung <tausq@debian.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030209054304.GN8919@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] gcc-3.2.3-based hppa->hppa64 crosscompiler uploaded
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

I just uploaded a gcc-3.2.3 (cvs) based hppa->hppa64 cross compiler to 
ftp://ftp.parisc-linux.org/unofficial-debs/gcc-hppa64_3.2.3-0.1_hppa.deb

Unfortunately gcc-3.2.3 is not able to build itself, so this is actually
built via gcc-3.3 :-)

This package also contains a recent binutils including Grant/Dave's
ordered store patch.

As a test, I've built and am running:

Linux version 2.4.20-pa24 (tausq@ios) (gcc version 3.2.3 20030208 (prerelease)) #27 SMP Sat Feb 8 21:48:37 PST 2003

on an A500.

As a reminder: 64-bit compilers are only meant for building kernels, we
do not yet have 64-bit userspace support.

Enjoy :)
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
