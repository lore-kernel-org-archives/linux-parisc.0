Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA01616
	for <parisc-linux@puffin.external.hp.com>; Sun, 9 Apr 2000 00:06:10 -0600
From: Bdale Garbee <bdale@gag.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] building a glibc-based tool chain
In-Reply-To: <E12dGfF-00012e-00@endor.fc.hp.com>
Message-Id: <20000409060602.269491E9D6@rover.gag.com>
Date: Sun,  9 Apr 2000 00:06:02 -0600 (MDT)
List-ID: <linux-parisc.vger.kernel.org>

In article <E12dGfF-00012e-00@endor.fc.hp.com> you wrote:

> Well it still doesn't work, but here are some UGLY HACKS I use to
> get a tool chain built using our glibc, which only works on x86 I think.

Well, I was tired of working on my taxes, so I sat down to see what I could 
figure out.  

Attached below is my "Notebook" entry so far for today.  The keys were 
getting limits.h from the kernel tree into the target tree before the gcc 
build, and adding a couple of new options "--with-headers" and "--with-libs" 
to the gcc build.

Using a trivial hello world program in bdale.c, with what I've done, I get:

bdale@chunks:~/puffin/user-space-test-code: hppa1.1-linux-gcc -o bdale bdale.c
/opt/palinux/bin/../lib/gcc-lib/hppa1.1-linux/2.9-hppa-991112/../../../../hppa1.
1-linux/bin/ld: cannot open crtbegin.o: No such file or directory
collect2: ld returned 1 exit status
bdale@chunks:~/puffin/user-space-test-code:

Looking at the gcc source tree, crtbegin.asm is in gcc/config/alpha... on my
Debian box, I see:

bdale@chunks:~/puffin/gcc: find /usr/lib -name crt\*
/usr/lib/gcc-lib/i386-linux/2.95.2/crtbegin.o
/usr/lib/gcc-lib/i386-linux/2.95.2/crtbeginS.o
/usr/lib/gcc-lib/i386-linux/2.95.2/crtend.o
/usr/lib/gcc-lib/i386-linux/2.95.2/crtendS.o
/usr/lib/crt1.o
/usr/lib/crti.o
/usr/lib/crtn.o
bdale@chunks:~/puffin/gcc: 

We have the crt[1in].o in /opt/palinux/lib, but not crtbegin*.  I'm off to
see if I can figure that out now.

Bdale



2000.04.08
- give glibc a shot, using Paul's notes as a starting point, and a different
  prefix (so I don't mess up what I already have)

        mkdir binutils-glibc-build
        cd binutils-glibc-build
                ../binutils/configure --target=hppa1.1-linux --disable-nls \
                        --prefix=/opt/palinux
                make -j4
                sudo make install
        export PATH=/opt/palinux/bin:$PATH

        mkdir glibc-build
        cd glibc-build
                ../glibc/configure --target=hppa1.1-linux --disable-nls \
                  --prefix=/opt/palinux --disable-shared --disable-sanity-checks
                # note - using -j on the following make breaks the build
                make
                ls > nss/makedb
                make
                for n in *
                do
                        touch $n/stubs
                done
                sudo make install


  Now in the top-level makefile in the real glibc source tree, remove
  the dependency like this diff shows (otherwise the manual/ subdir build
  will prevent success).

    diff -r1.1 Makefile
    142c142
    < $(inst_includedir)/gnu/stubs.h: subdir_install
    ---
    > $(inst_includedir)/gnu/stubs.h:  

                sudo make /opt/palinux/include/gnu/stubs.h

  Now remove the #ifdef __USE_UNIX98 and the matching #endif  /* Unix98 */
  from /your/install/directory/include/unistd.h around line 238

        mkdir gcc-glibc-build
        cd gcc-glibc-build
                ../gcc/configure --target=hppa1.1-linux --disable-nls \
                        --prefix=/opt/palinux
                make -j4
                sudo make install

        sudo mv /opt/palinux/lib/gcc*/*/*/include/* /opt/palinux/include
        sudo rmdir /opt/palinux/lib/gcc*/*/*/include/
        sudo ln -s /opt/palinux/include \
                /opt/palinux/lib/gcc-lib/hppa1.1-linux/2.9-hppa-991112/include

                        sort of works, but same problems Paul had...

- try again, after trolling around http://gcc.gnu.org/onlinedocs/

        sudo rm -r /opt/palinux
        cd binutils-glibc-build
                sudo make install
        cd glibc-build
                sudo make install
                        - fails on the texinfo thing at the end, ignoring
        sudo vi /opt/palinux/include/unistd.h           (as above)
        (cd linux-2.3/include ; tar cf - linux/limits.h) | \
                (cd /opt/palinux/include ; sudo tar xvf -)
        cd gcc-glibc-build
                sudo rm -r *
                sudo ../gcc/configure --target=hppa1.1-linux --disable-nls \
                        --prefix=/opt/palinux \
                        --with-headers=/opt/palinux/include \
                        --with-libs=/opt/palinux/lib
                sudo make -j4
                sudo make install
