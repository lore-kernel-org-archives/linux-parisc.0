Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3EAA9484B
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 12 Mar 2004 08:32:39 -0700 (MST)
Date: Fri, 12 Mar 2004 16:32:34 +0100
Message-ID: <404EC1C600002A41@ocpmta1.freegates.net>
In-Reply-To: <20040311184239.GC24266@baldric.uwo.ca>
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

C.,

>> As I foreseen to use this disk to other test on the N4k, I grab the list
>> of packages installed (dpkg --get-selection > mnt/chroot/var/tmp/Selection.doc)
>> and chroot to /mnt/chroot to install previously mentioned pkg list. All
works
>> fine (just 3 pkg failled to install because no /proc available in chroot
>> .
>
>Try binding your chroot if you want to expose your process list to the
>chroot 'mount -o bind /proc /mnt/chroot/proc

That works fine (thanks).
 
[snip]

>That should fix the mmap failures, please check to see if the other two
>failures are timeout related.

I now rebuild a 2.6.4-pa1 with this same libc  and reboot the system with
this kernel (you had right it was still runing an old 2.4.21-pa2 :( ) and
here are the make -k check results:
without TIMEOUTFACTOR:
make[2]: *** [/Develop/parisc-linux/build/glibc/math/test-float.out] Error
1
make[2]: *** [/Develop/parisc-linux/build/glibc/math/test-double.out] Error
1
make[2]: *** [/Develop/parisc-linux/build/glibc/math/test-ifloat.out] Error
1
make[1]: *** [math/tests] Error 2
make[2]: *** [/Develop/parisc-linux/build/glibc/stdlib/tst-strtod.out] Error
1
make[2]: *** [/Develop/parisc-linux/build/glibc/stdlib/bug-strtod.out] Error
1
make[1]: *** [stdlib/tests] Error 2
make[2]: *** [/Develop/parisc-linux/build/glibc/posix/tst-regex] Error 1
make[1]: *** [posix/tests] Error 2
make[2]: *** [/Develop/parisc-linux/build/glibc/linuxthreads/ex10] Error
1
make[2]: *** [/Develop/parisc-linux/build/glibc/linuxthreads/ex11] Error
1
make[1]: *** [linuxthreads/tests] Error 2
make[2]: *** [/Develop/parisc-linux/build/glibc/elf/resolvfail] Error 1
make[2]: *** [/Develop/parisc-linux/build/glibc/elf/tst-tls13.out] Error
1
make[2]: *** [/Develop/parisc-linux/build/glibc/elf/tst-dlmodcount.out] Error
139
make[1]: *** [elf/tests] Error 2
make: *** [check] Error 2

with export TIMEOUTFACTOR=100

make[2]: *** [/Develop/parisc-linux/build/glibc/math/test-float.out] Error
1
make[2]: *** [/Develop/parisc-linux/build/glibc/math/test-double.out] Error
1
make[2]: *** [/Develop/parisc-linux/build/glibc/math/test-ifloat.out] Error
1
make[1]: *** [math/tests] Error 2
make[2]: *** [/Develop/parisc-linux/build/glibc/stdlib/tst-strtod.out] Error
1
make[2]: *** [/Develop/parisc-linux/build/glibc/stdlib/bug-strtod.out] Error
1
make[1]: *** [stdlib/tests] Error 2
make[2]: *** [/Develop/parisc-linux/build/glibc/posix/tst-regex] Error 1
make[1]: *** [posix/tests] Error 2
make[2]: *** [/Develop/parisc-linux/build/glibc/linuxthreads/ex10] Error
1
make[2]: *** [/Develop/parisc-linux/build/glibc/linuxthreads/ex11] Error
1
make[1]: *** [linuxthreads/tests] Error 2
make[2]: *** [/Develop/parisc-linux/build/glibc/elf/resolvfail] Error 1
make[2]: *** [/Develop/parisc-linux/build/glibc/elf/tst-dlmodcount.out] Error
139
make[1]: *** [elf/tests] Error 2
make: *** [check] Error 2

So only [/Develop/parisc-linux/build/glibc/elf/tst-tls13.out] seems to be
related to TIMEOUTFACTOR

hth,
Joel

----------------------------------------------------------------------------------------
Tiscali ADSL: 19,50 €/mois, pendant 3 mois! L'Internet rapide, c'est pour
tout le monde.
http://reg.tiscali.be/default.asp?lg=fr
