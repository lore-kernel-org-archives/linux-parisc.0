Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from duck.doc.ic.ac.uk (duck.doc.ic.ac.uk [146.169.1.46])
	by dsl2.external.hp.com (Postfix) with ESMTP id D2079482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 28 Mar 2001 05:32:49 -0700 (MST)
Received: from sytry.doc.ic.ac.uk ([146.169.5.24] ident=root)
	by duck.doc.ic.ac.uk with esmtp (Exim 3.16 #7)
	id 14iF84-000234-00
	for parisc-linux@lists.parisc-linux.org; Wed, 28 Mar 2001 13:32:48 +0100
To: parisc-linux@lists.parisc-linux.org
From: David Wragg <dpw@doc.ic.ac.uk>
Date: 28 Mar 2001 12:32:44 +0000
Message-ID: <y7rk85a9iqb.fsf@sytry.doc.ic.ac.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: dpw@sytry.doc.ic.ac.uk
Subject: [parisc-linux] problem building glibc from cvs
List-ID: <linux-parisc.vger.kernel.org>

Hi,

Yesterday I tried to build the toolchain, glibc and kernel following
the instructions at <http://www.parisc-linux.org/kernel/>.  The build
host is linux-i386 (RedHat 7.0 with gcc updates applied).  I got the
modules out of CVS, and the builds of binutils and gcc went fine, as
did the kernel preparation step.  But the glibc build failed with this
error from gcc:

../sysdeps/unix/sysv/linux/hppa/sysdep.c:35: Internal compiler error in make_dec
l_rtl, at varasm.c:597
Please submit a full bug report, with preprocessed source if appropriate.
See <URL:http://www.gnu.org/software/gcc/bugs.html> for instructions.


This happens early in the glibc build process; I think it occurs at
the first use of weak_alias encountered.  The compiler being used is
definitely hppa-linux-gcc.

Does anyone else have this problem, or am I missing something?

(This is my first play with Linux/PARISC, but I'm familiar with
building the toolchain, glibc, and the kernel on other platforms).


Dave
