Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2A28548F5
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 16 Mar 2004 06:04:37 -0700 (MST)
Date: Tue, 16 Mar 2004 10:43:46 +0100
Message-ID: <40561E710000043C@ocpmta2.freegates.net>
In-Reply-To: <20040315185113.GC660@baldric.uwo.ca>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: =?ISO-8859-1?Q?Re=3A=20=5Bparisc=2Dlinux=5D=20=09RE=3A=20New=20glibc=20patches=202004=2D03=2D08=2C=20fixes=20GLRO=20changes=2E?=
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: James Morrison <ja2morri@csclub.uwaterloo.ca>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hello Carlos,

Sorry for delay,...
>> 
>> On Mon, Mar 15, 2004 at 06:38:46PM +0100, Joel Soete wrote:
>> Hello Jim,
>> 
>> Sorry for confusion but you have definitely right.
>> 
>> [snip]use prefix=/usr and make  install_root=/mnt/chroot install;
>> 
>> This is the right method because if I use prefix=/mnt/chroot and 'make
install',
>> when the install was finished and I tried chroot/mnt/chroot: here was
the
>> error message:
>> chroot /mnt/chroot
>> /bin/bash: error while loading shared libraries: libncurses.so.5: cannot
>> open shared object file: No such file or directory
>> 
>> and strace shows me that it looking for libncurses.so.5 into /mnt/chroot/lib
>> :)
>> 
>> So to launch make -k check in this config, I foreseen to use prefix=/usr
>> and make install_root=/mnt/chroot; then mount -o bind /GlibcSrcFS /mnt/chroot/GlibcSrcFS;
>> chroot /mnt/chroot; and in this env launch the make -k check. Do you know
>> another solution?
>
>That sounds like a perfect solution! :)

but that way I only get know errors ie:
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
make[2]: [/Develop/parisc-linux/build/glibc/posix/annexc.out] Error 1 (ignored)
make[2]: *** [/Develop/parisc-linux/build/glibc/elf/tst-tls13.out] Error
1
make[1]: *** [elf/tests] Error 2
make: *** [check] Error 2

(sorry I forget TIMEOUTFACTOR) :)

Very nice job Carlos.

Just still have to check more X,

Joel


----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr
