Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id D508148A4
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  2 Feb 2004 10:15:11 -0700 (MST)
Date: Mon, 2 Feb 2004 18:15:06 +0100
Message-ID: <400CB8A10000A8EB@ocpmta3.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] [Update] glibc 2.3.2 bug free on hppa.
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi Carlos,

As a first step, I would just like test the toolchain:
I so grab first _manualy_ last binutils and gcc (3.3.3-0pre3) dkpg src and
apply patches (with './debian/rules patch' in the corresponding src pkg
dir)
Then grab upsteam glibc (2.3.3 is it the one I had to consider you spoke
about 2.3.2??) and apply your patches.

every thing works fine until I reach second step of gcc build where configure
failed with following error message:
Configure gcc step2:

Cmd: unset CC; unset CFLAGS;  export PATH="/opt/palinux-3.3.3/bin:$PATH";
/Develop/parisc-linux/sources/gcc/configure --target=hppa-linux --host=hppa-linux
--build=hppa-linux --prefix=/opt/palinux-3.3.3 --enable-shared --disable-nls
--enable-languages=c
Mon Feb 02 16:01:37 UTC 2004:

*** This configuration is not supported
in the following subdirectories:
     target-libffi target-boehm-gc target-zlib target-libjava target-libstdcv3
target-libf2c zlib fastjar target-libobjc
    (Any other directories should still work fine.)
Created "Makefile" in /Develop/parisc-linu
/build/gcc using "mt-frag"
/lib/libc.so.6: undefined reference to `__libc_stack_end@GLIBC_PRIVATE'
/lib/libc.so.6: undefined reference to `_dl_function_address@GLIBC_PRIVATE'
collect2: ld returned 1 exit status
*** The command 'gcc -o conftest -g -O2   conftest.c' failed.
*** You must set the environment variable CC to a working compiler.

I have a look in my /opt/palinux-3.3.3/bin but there is not yet any gcc
at this stage so it will use /usr/bin/gcc may be should I use better the
partial gcc (build during step 1)?

Thanks for all of your help,
    Joel

PS: glibc it self is configure as follow:
Cmd: unset LD_LIBRARY_PATH; unset LD_RUN_PATH; export CC=/Develop/parisc-linux/xc/bin/hppa-linux-gcc;
export CLFAGS="-O2 -g";  export PATH="/Develop/parisc-linux/xc/bin:$PATH";
/Develop/parisc-linux/sources/glibc/configure --target=hppa-linux --host=hppa-linux
--build=hppa-linux --prefix=/opt/palinux-3.3.3/hppa-linux --without-cvs --disable-profile
--enable-hacker-mode --enable-add-ons=linuxthreads --with-headers=/Develop/parisc-linux/sources/linux/include


>-- Original Message --
>Date: Sun, 1 Feb 2004 18:08:45 -0500
>From: Carlos O'Donell <carlos@baldric.uwo.ca>
>To: parisc-linux@lists.parisc-linux.org
>Subject: [parisc-linux] [Up
ate] glibc 2.3.2 bug free on hppa.
>
>
>
pa,

As of today the last glibc bug was fixed:

- Statically linked executable SIGSEGV's when calling dlopen. (FIXED)

As far as I'm concerned glibc has zero bugs, not counting the fact that
we don't 
et have a long double implementation.

I
>know the gentoo crowd is always interested in the lastest set of
patches, so here goes:

http://www.parisc-linux.org/~carlos/glibc-hppa-patches-2004-02-01.tar.gz

At the moment you need a patched gcc in
order to build a correct
userspace, I'm try
>ng to fix this so you don't have to:

http://www.parisc-linux.org/~carlos/gcc-3.3.2-fptr.diff

Lite-Recipe for running test-suite:
(a) Download gcc 3.3.2 source.
(b) Patch with fptr.diff from above.

(c) Build gcc 3.3.2
(d) Download glibc cvs he
>d.
(e) Patch with glibc patches from above.
(f) Build glibc with the gcc from (c).
(g) Run glibc testsuite "make -k check" using gcc from (c).
(h) Look for errors "grep 'Error' test-result.log"

I'
l start focusing most of my time fixing gdb now
>)

Background tasks:

- debian-glibc support.
- Send glibc patches upstream.

I'll be looking for a helper if someone wants to look into new
regressions as they arrive? Usually just building ups
ream with the
above patches, and checking that w
> didn't regress is good enough.
I imagine I could automate that... or rather someone else could? :)

Foreground tasks:

- atomic kernel ops
- review gettimeofday, and possible speedups.
- revie
 time code in the kernel.
* gdb support upstream <
> Highest foreground priority.

Thanks for all the help guys! Randolph for making me read the cffc code
and figure out what I did wrong, that fixed "last_bug-1". Richard had me
thinking about deb
an-installer and what would happen if you ripped out

>the PLT of the executable, this lead me to fix "last_bug." :)

So.... who wants to setup an automated glibc builder? :}

Cheers,
Carlos.


_______________________________________________

parisc-linux mailing list
parisc-linux@lists.parisc-lin
>x.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux





-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
