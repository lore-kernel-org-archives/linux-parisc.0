Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from phnxpop4.phnx.uswest.net (phnxpop4.phnx.uswest.net [206.80.192.4])
	by dsl2.external.hp.com (Postfix) with SMTP id BB5764A19
	for <parisc-linux@parisc-linux.org>; Sat, 10 Mar 2001 09:41:18 -0700 (MST)
Date: Sat, 10 Mar 2001 09:39:42 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20010310093942.O18113@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] segfaults with new binutils
List-ID: <linux-parisc.vger.kernel.org>

I'm using binutils from
ftp://puffin.external.hp.com/pub/parisc/binaries/new-debs/debian/
with the corresponding libc6/libc6-dev in that directory, and using the
new gcc-2.97 packages.

Running any of the binaries in the binutils deb gives an immediate
segfault. This includes things like as, ld, etc... obviously this makes
it rather difficult to compile anything.. :-(

I've tried this with both 32-bit and 64-bit kernels built from
yesterday's cvs. Also, at taggart's advice, tried an older 32-bit kernel
built from Feb21 CVS (that was the date of the kernel he was using.) 
This is on a C3k.

strace gives: 
[...]
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\2\205"..., 1024) = 1
024
newfstat(3, {st_mode=S_IFREG|0755, st_size=1281732, ...}) = 0
close(3)                                = 0
munmap(0x4001d000, 7026)                = 0
getpid()                                = 9829
--- SIGSEGV (Segmentation fault) ---
+++ killed by SIGSEGV +++

I rebuilt binutils using an earlier nfsroot (so, older binutils/glibc/gcc 
combo) and the resulting binutils binaries work ok with the new 
os/kernel/libc/gcc combo.

ideas, hints, fixes? :)
randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
