From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] debian hppa touch fails to set atime and mtime
	(5.0.91-2)
Date: Sun, 28 Dec 2003 20:58:00 -0500
Message-ID: <20031229015759.GF27911__10733.4896260456$1416623093$gmane$org@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: 219458@bugs.debian.org, Jeff Bailey <jbailey@nisa.net>
Return-Path: <carlos@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


219458,

hppa does not support utimes, it supports utime. During the last
coreutils build it seems that configure was confused and thought hppa
*had* utimes, but it does not.

http://buildd.debian.org/fetch.php?&pkg=coreutils&ver=5.0.91-2&arch=hppa&stamp=1065315205&file=log&as=raw

--- checkdd.log 2003-12-28 20:45:43.000000000 -0500
+++ check.log   2003-12-28 20:44:08.000000000 -0500
@@ -7,8 +7,7 @@
 checking host system type... hppa-unknown-linux-gnu
 checking for a BSD-compatible install... /usr/bin/install -c
 checking whether build environment is sane... yes
-checking for gawk... no
-checking for mawk... mawk
+checking for gawk... gawk
 checking whether make sets $(MAKE)... yes
 checking for perl5.003 or newer... yes
 checking for hppa-linux-gcc... hppa-linux-gcc
@@ -163,7 +162,7 @@
 checking for library containing opendir... none required
 checking for struct stat.st_blocks... yes
 checking whether stat file-mode macros are broken... no
-checking for nanoseconds member of struct stat.st_mtim... no
+checking for nanoseconds member of struct stat.st_mtim... tv_nsec
 checking for st_dm_mode in struct stat... no
 checking for uid_t in sys/types.h... yes
 checking type of array argument to getgroups... gid_t
@@ -452,9 +451,9 @@
 checking for strcasecmp... yes
 checking for strncasecmp... yes
 checking for struct timespec... yes
-checking for nanoseconds member of struct stat.st_mtim... (cached) no
+checking for nanoseconds member of struct stat.st_mtim... (cached)
tv_nsec
 checking whether nanosleep is declared... (cached) yes
-checking determine whether the utimes function works... yes
+checking determine whether the utimes function works... no
 checking for stdlib.h... (cached) yes
 checking for GNU libc compatible malloc... yes
 checking for stdlib.h... (cached) yes

My local system detects gawk, finds a nanosecond member for stat, but
notices that utimes does *not* work under hppa, and instead uses utime.
The reason for the erroneous detection can only be confirmed by looking
at the config.log.

I tested a coreutils rebuild and it works fine.

Reading specs from /usr/lib/gcc-lib/hppa-linux/3.3.2/specs
Configured with: ../src/configure -v
--enable-languages=c,c++,f77,pascal,objc,ada,treelang --prefix=/usr
--mandir=/usr/share/man --infodir=/usr/share/info
--with-gxx-include-dir=/usr/include/c++/3.3 --enable-shared
--with-system-zlib --enable-nls --without-included-gettext
--enable-__cxa_atexit --enable-sjlj-exceptions --enable-clocale=gnu
--enable-debug --enable-objc-gc hppa-linux
Thread model: posix
gcc version 3.3.2 (Debian)

GNU ld version 2.14.90.0.7 20031029 Debian GNU/Linux

Linux firin 2.4.23-pa2 #5 Mon Dec 8 20:44:10 EST 2003 parisc64 GNU/Linux

I suggest moving this to coreutils and have them rebuild?

Cheers,
Carlos.
