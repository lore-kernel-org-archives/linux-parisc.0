Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id AAA05474
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Dec 1999 00:16:44 -0700
Received: from localhost (brion@localhost)
	by gizmo.usc.edu (8.9.3/8.9.3) with ESMTP id XAA12364
	for <parisc-linux@thepuffingroup.com>; Tue, 14 Dec 1999 23:18:06 -0800
Date: Tue, 14 Dec 1999 23:18:06 -0800 (PST)
From: Brion Vibber <brion@gizmo.usc.edu>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] cross-compiling the kernel?
In-Reply-To: <99112722352300.00350@beavis>
Message-ID: <Pine.LNX.4.10.9912142308100.12307-100000@gizmo.usc.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

I'm interested in cross-compiling as well... we've got a 735/125 running
only MkLinux, no HPUX, and I can rarely get _anything_ to build right on
it even if I don't mind the slowness.

But we do have some nice fast x86 Linux boxes. I tried to compile the 
binutils out of CVS on one of them, but it crapped out with complaints
about missing SOM stuff, looks like:

gcc -g -O2 -o size size.o bucomm.o version.o filemode.o ../bfd/.libs/libbfd.a ../libiberty/libiberty.a
../bfd/.libs/libbfd.a(targets.o): In function `find_target':
/usr/local/gizmo/brion/src/parisc/binutils-build/bfd/../../
binutils/bfd/targets.c:885: undefined reference to `som_vec'
/usr/local/gizmo/brion/src/parisc/binutils-build/bfd/../../
binutils/bfd/targets.c:885: undefined reference to `som_vec'

Won't be easy to compile a kernel without binutils... Will this have to
wait until the SOM linker is finished, or can I work around that somehow
in the meantime?

-- brion vibber (brion@pobox.com)
