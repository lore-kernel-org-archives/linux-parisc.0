Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7ABF24854
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 10 Mar 2004 07:47:14 -0700 (MST)
Date: Wed, 10 Mar 2004 15:47:09 +0100
Message-ID: <404EC1C600000B2D@ocpmta1.freegates.net>
In-Reply-To: <20040309150318.GD22721@baldric.uwo.ca>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: =?ISO-8859-1?Q?Re=3A=20=5Bparisc=2Dlinux=5D=20=09RE=3A=20New=20glibc=20patches=202004=2D03=2D08=2C=20fixes=20GLRO=20changes=2E?=
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi Carlos,

Here are the news:

(first of all sorry for delay but I have temporarely have to exchange my
N4k for a b180 so it take a bit more time)

The glibc cvs 2.3.3 cvs dated 20040308 + your patch compiles well (just this
time I enable profiling) :).

I also install it on /mnt/chroot (according James method, just to test).

As I foreseen to use this disk to other test on the N4k, I grab the list
of packages installed (dpkg --get-selection > /mnt/chroot/var/tmp/Selection.doc)
and chroot to /mnt/chroot to install previously mentioned pkg list. All works
fine (just 3 pkg failled to install because no /proc available in chroot).

In the same time I drive a make -k check and just get additional Errors:
[...]
make[2]: *** [/Develop/parisc-linux/build/glibc/libio/tst-mmap-eofsync.out]
Error 1
make[2]: *** [/Develop/parisc-linux/build/glibc/libio/tst-mmap-fflushsync.out]
Error 1
make[1]: *** [libio/tests] Error 2
make[2]: [/Develop/parisc-linux/build/glibc/posix/annexc.out] Error 1 (ignored)
make[2]: *** [/Develop/parisc-linux/build/glibc/elf/multiload.o] Error 1
make[2]: *** [/Develop/parisc-linux/build/glibc/elf/origtest.o] Error 1
[...]

I have two hypothesis:
a. it is the first time I added enable-profile;
b. I forget to build first gcc(3.3) tool with your gcc patch (gcc/config/pa/fptr.c)

Now, 2.6.4-rc3-pa0 is just available, I will so try first to build it in
the chroot disk...

hth,
    Joel


----------------------------------------------------------------------------------------
Tiscali ADSL: 19,50 €/mois, pendant 3 mois! L'Internet rapide, c'est pour
tout le monde.
http://reg.tiscali.be/default.asp?lg=fr
