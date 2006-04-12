From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: [parisc-linux] Build failures close in at the cusp of being done.
Date: Wed, 12 Apr 2006 10:15:05 -0400
Message-ID: <119aab440604120715k57ee6eb1r403b142cd33ecb26@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
To: "Randolph Chung" <randolph@tausq.org>,
 "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
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

1. Checkout mainline binutils.
2. Merge our tls patches locally.
3. Checkout mainline gcc.
4. Checkout libc, libc-port, linuxthreads.
5. Merge our TLS patches into binutils locally (only tls, not opd).
6. Build and install binutils.
7. Build and install gcc with the newly installed binutils.
8. Build glibc with the newly installed binutils and gcc.

We are getting close!
~~~~~~~~~~~~~~~~~~~~~
/home/carlos/fsrc/glibc-work/builds/libc/libc_pic.os: In function `__getcwd=
':
../sysdeps/unix/sysv/linux/getcwd.c:90: undefined reference to `MAX'
/home/carlos/fsrc/glibc-work/builds/libc/libc_pic.os: In function `inet_nto=
a':
/mnt/flaire/src/glibc-work/src/libc/inet/inet_ntoa.c:35: undefined
reference to `__tls_get_addr'
collect2: ld returned 1 exit status
make[1]: *** [/home/carlos/fsrc/glibc-work/builds/libc/libc.so] Error 1
make[1]: Leaving directory `/mnt/flaire/src/glibc-work/src/libc'
make: *** [all] Error 2
~~~~~~~~~~~~~~~~~~~~~

I double checked we had a __tls_get_addr definition for our
libc-tls.c, but it looks like the function might be miscompiled. Any
hints are appreciated. I'm utterly puzzled by the missing definition
of MAX, which should be a macro. It looks like I missed some implied
includes.

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
