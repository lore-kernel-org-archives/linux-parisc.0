Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA06306
	for <parisc-linux@puffin.external.hp.com>; Fri, 15 Sep 2000 02:00:24 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 15 Sep 2000 08:00:53 -0000
To: parisc-linux@thepuffingroup.com
Cc: debian-hppa@lists.debian.org
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 15 Sep 2000 04:00:36 -0400
Message-ID: <87r96mgk4b.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Shared native toolchain (and Perl) uploaded, dpkg tarball, Debian packages
List-ID: <linux-parisc.vger.kernel.org>

Well, it had to happen eventually.

I'm pleased to report that I have a working Perl tarball for PA-RISC
Linux, which means that the dpkg-dev programs and other random Debian
bits that are written in Perl are now functional, which means that we
can build Debian packages!

The toolchain and shared C libraries:

ftp://puffin.external.hp.com/pub/parisc/binaries/userspace/gcc-20000914.tgz
ftp://puffin.external.hp.com/pub/parisc/binaries/userspace/binutils-20000914.tgz
ftp://puffin.external.hp.com/pub/parisc/binaries/userspace/glibc-20000914.tgz

Make sure to remove any existing /usr/hppa-linux directory before
untarring the binutils, or you will get "cannot find crt1.o" from when
linking.

Perl (and gdbm, which it requires):

ftp://puffin.external.hp.com/pub/parisc/binaries/userspace/perl-20000914.tgz
ftp://puffin.external.hp.com/pub/parisc/binaries/userspace/gdbm-20000915.tgz

You will need to run 'ln perl5.00503 perl5.005; ln perl5.00503
perl-5.005' after untarring that to satisfy some scripts.

dpkg:

http://puffin.external.hp.com/~dhd/debian-hppa/dpkg-1.7.0_hppa.nondebbin.tar.gz

You'll have to touch /var/lib/dpkg/available and /var/lib/dpkg/status
for dpkg to work.

It of course goes without saying that to have a useful development
environment you need to have a bunch of other stuff, like shellutils,
textutils, ncurses, ash, etc, etc, etc.  We'll be putting together a
new base system tarball shortly.  Until then you're on your own :(

Pending a proper Debian archive on p.e.h.c, I've started collecting
packages at http://puffin.external.hp.com/~dhd/debian-hppa/.  If they
don't install then use dpkg --force-deps.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
