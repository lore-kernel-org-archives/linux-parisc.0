Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.centraltx.com (unknown [64.209.39.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6EFCB482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Jun 2002 19:18:12 -0600 (MDT)
Date: Wed,  5 Jun 2002 20:16:24 -0500
Message-Id: <200206052016.AA1508901426@mail.centraltx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: "marc " <marc@centraltx.com>
Reply-To: <marc@centraltx.com>
To: <parisc-linux@lists.parisc-linux.org>
Subject: [parisc-linux] Building my first kernel
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

I'm trying to build the 2.4.18 kernel, and everything goes great
until I get to the `make bzImage` part and it screams about palo.
I'm assuming I need the palo source. is this right??

-Marc

seki:/usr/src/kernel-source-2.4.18-hppa# make bzImage

.... snip ....

`gcc -print-libgcc-file-name` /usr/src/kernel-source-2.4.18-hppa/arch/parisc/lib
/lib.a /usr/src/kernel-source-2.4.18-hppa/lib/lib.a  \
        --end-group \
        -o vmlinux
nm vmlinux | grep -v '\(compiled\)\|\(\.o$\)\|\( [aUw] \)\|\(\.\.ng$\)\|\(LASH[R
L]DI\)' | sort > System.map
export TOPDIR=`pwd`; \
unset STRIP LDFLAGS CPP CPPFLAGS AFLAGS CFLAGS CC LD; cd ../palo && make lifimag
e
/bin/sh: cd: ../palo: No such file or directory
make: *** [palo] Error 1
seki:/usr/src/kernel-source-2.4.18-hppa#
