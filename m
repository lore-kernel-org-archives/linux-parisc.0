Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA21353
	for <parisc-linux@puffin.external.hp.com>; Fri, 15 Sep 2000 19:35:38 -0600
To: David Huggins-Daines <dhd@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com, debian-hppa@lists.debian.org,
        taggart@carmen.fc.hp.com
Subject: New Cross-Compiler, userspace tarballs, and Debian packages (was Re:
 [parisc-linux] Shared native toolchain (and Perl) uploaded, dpkg tarball,
 Debian packages)
In-Reply-To: Message from David Huggins-Daines <dhd@linuxcare.com>
   of "15 Sep 2000 04:00:36 EDT." <87r96mgk4b.fsf@linuxcare.com>
References: <87r96mgk4b.fsf@linuxcare.com> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 15 Sep 2000 19:37:48 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20000916013748.AA92137D06@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

I have put a new LinuxX86 -> hppa/hppa64 cross-compiler tarball at,

ftp://puffin.external.hp.com/pub/parisc/binaries/LinuxX86/xc-20000915.tar.gz

This tarball contains 32 bit binutils, gcc, and glibc and 64 bit binutils and 
gcc. So you can use it to compile both 32 bit userspace apps and 32 bit and 64 
bit kernels.

David Huggins-Daines writes...

> Pending a proper Debian archive on p.e.h.c, I've started collecting
> packages at http://puffin.external.hp.com/~dhd/debian-hppa/.  If they
> don't install then use dpkg --force-deps.

I've created a semi-proper debian archive accessible at,

http://puffin.external.hp.com/debian-hppa
and
ftp://puffin.external.hp.com/pub/debian-hppa

and I have added debs for all the things I've been cross compiling that David 
has not build native debs for.

I have also made the same available as tarballs in,

ftp://puffin.external.hp.com/pub/parisc/binaries/userspace/

Thanks,

-- 
Matt Taggart
taggart@fc.hp.com
