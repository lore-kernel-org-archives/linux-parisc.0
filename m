Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA27140
	for <parisc-linux@puffin.external.hp.com>; Thu, 24 Aug 2000 09:43:04 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 24 Aug 2000 15:42:59 -0000
To: parisc-linux@thepuffingroup.com
Cc: debian-parisc@lists.debian.org
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 24 Aug 2000 11:42:03 -0400
Message-ID: <87hf8ar7hw.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] dpkg and dpkg-dev binary and source tarballs for hppa-linux
List-ID: <linux-parisc.vger.kernel.org>

Hi,

I've got CVS dpkg cross-compiled for PA-RISC.  Have at it:

ftp://puffin.external.hp.com/pub/parisc/binaries/userspace/dpkg-20000824.tar.gz
ftp://puffin.external.hp.com/pub/parisc/binaries/userspace/dpkg-dev-20000824.tar.gz

A tarball of the source is at:

ftp://puffin.external.hp.com/pub/parisc/src/dpkg-src-20000824.tar.gz

We don't have Perl yet (working on that today, maybe, if the kernel
doesn't crash) so most dpkg-dev functionality isn't there, but it's a
start.

The native toolchain is basically working for static binaries, and
shared libraries should work as soon as we resolve some remaining
issues with libgcc.a and PIC/non-PIC linking.  I'll post a tarball for
the native toolchain soon (beware, it's large).

The kernel is not stable enough (VM and exception handling are "not
quite there yet") to really use this stuff though so don't get too
excited :-)

If you're brave, you can use a 2.3.99pre8 kernel with the current
arch/parisc/kernel/{signal.c,entry.S} until we get our really-slow-VM
problems fixed.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
