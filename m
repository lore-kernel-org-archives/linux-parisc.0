From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] hppa glibc 2.3.3 experimental debs,
	chroot testers wanted.
Date: Thu, 23 Sep 2004 23:35:19 -0400
Message-ID: <20040924033509.GR27033@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Randolph Chung <tausq@debian.org>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


pa,

These packages are an experimental compilation of glibc 2.3.3 upstream
cvs, along with the latest hppa patches.

Differences between this and the debian glibc are many, debian probably
has some generic bug fixes that this does not.

The main reason to test this glibc is:

- Addition of "memory" constraint for inline asm() syscall wrappers.

- Supported framemarker entries for syscall wrappers, allowing gdb
  to make sense of the wrapper.

They add a bunch of other things not present in the debian glibc. Too
many to mention (COPY reloc fixes, LD_PROFILE fix, generic function
descriptors etc).

In summary I *do not* recommend using these .deb's on anything but a
chroot environment. They *are* tested in my chroot environment and they
do not cause any known problems. There might be one regression in 
tst-waitid, cause unknown.

http://www.parisc-linux.org/~carlos/glibc-work/glibc-2.3.3-debs-2004-09-23/

Binary build only. Haven't cleaned up the debian bits to make it
sourcefull.

Cheers,
Carlos.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
