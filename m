From: Carlos O'Donell <carlos@systemhalted.org>
Subject: [parisc-linux] Next steps? hppa tls toolchain and packaging in
	debian.
Date: Sun, 17 Jul 2005 12:31:40 -0400
Message-ID: <20050717163140.GM5314@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <tausq@debian.org>,
 John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
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


Gentlemen,

We seem to have a working TLS implementation for hppa. What are some of
the next steps we want to take?

a. Submit a plabel 21/14, dir 21/14 patch to debian glibc.
   Submit the same patch to Ubuntu.

b. Submit TLS patch to binutils.

c. Submit OPD patch to binutils.
   - There may still be some issues about this patch with regards
     to the behvious of --export-dynamic.

d. Submit patches to upstream glibc for TLS
   - Linuxthread patches are being handled by drow.
   - Sysdep patches are handled by Roland/Ulrich.
   - Luckily no core changes required.

e. Work at futex implementation.
   - Mockup and test.

f. Work at NPTL implementation
   - Already started thanks to Randolph.

Any extra entries to add to the list?

How do we handle this:

1. Packages built with a newer toolchain can emit OPD's
2. These packages should require a newer glibc.

Can we make debian-binutils depend on a newer libc?
I still don't see how we can stop someone from isntalling a package that
has these relocs but not a new libc?

Cheers,
Carlos.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
