From: Carlos O'Donell <carlos@systemhalted.org>
Subject: [parisc-linux] nptl build failures (so close!)
Date: Tue, 26 Jul 2005 15:45:40 -0400
Message-ID: <20050726194540.GG9703@systemhalted.org>
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


Randolph, Dave,

Any thoughts?

../sysdeps/generic/strtol_l.c: In function '____strtol_l_internal':
../sysdeps/generic/strtol_l.c:483: warning: cast discards qualifiers from pointer target type
../sysdeps/generic/strtol_l.c:497: error: 'ERANGE' undeclared (first use in this function)
../sysdeps/generic/strtol_l.c:497: error: (Each undeclared identifier is reported only once
../sysdeps/generic/strtol_l.c:497: error: for each function it appears in.)
../sysdeps/generic/strtol_l.c:517: warning: cast discards qualifiers from pointer target type
../sysdeps/generic/strtol_l.c:520: warning: cast discards qualifiers from pointer target type
make[2]: *** [/mnt/flaire/src/tls-toolchain-hppa/build/glibc-nptl/stdlib/strtol_l.o] Error 1
make[2]: Leaving directory `/mnt/flaire/src/tls-toolchain-hppa/src/glibc/stdlib'
make[1]: *** [stdlib/subdir_lib] Error 2
make[1]: Leaving directory `/mnt/flaire/src/tls-toolchain-hppa/src/glibc'
make: *** [all] Error 2

I tried to debug a weird header file include problem in the nptl headers
last night, but to no avail. It looks like gcc was reordering the includes
and "lll_lock_t" wasn't included. This time around "ERANGE" is missing, but 
if I trace the headers by hand it should have been included.

This looks like an einvironment problem. No other arches seem to define anything
magical to make this work.

I had a similar problem in nptl/descr.h where lowlevellock.h wasn't being
included until after descr.h was entirely processed. Which made no sense
at all.

c.


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
