Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1F27C4878
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 21 Apr 2004 00:15:11 -0600 (MDT)
Date: Wed, 21 Apr 2004 08:15:07 +0200
Message-ID: <40711E5600009DD2@ocpmta1.freegates.net>
In-Reply-To: <20040420193537.GB28094@baldric.uwo.ca>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: =?ISO-8859-1?Q?Re=3A=20=5Bparisc=2Dlinux=5D=20RE=3A=20=5BPATCH=5D=20glibc=2D2=2E3=2E3=20error=20with=20debian=20unstable=09compiler=2E=2E=2E?=
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

 
>> I just complete the 'make -k check' (on chroot disk) which finished with
>> just one more error then well known ones:
>> make[2]: *** [/Develop/parisc-linux/build/glibc/stdio-common/tst-rndseek.out]
>> Error 1
>> make[1]: *** [stdio-common/tests] Error 2
>> 
>> ... And the compile (always in the chroot disk) of the last k-2.6.6-rc1-pa0
>> works still fine and even boot well on a b180.
>
>I'm seeing an extra error with realtime signal delivery tst-timer4, but
>not this error. I'm working on fixing tst-timer4,
:) and I don't see your's (not exactly the same co may be)

# grep Error glibc-2.3.3-20040419_Make-check 
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
make[2]: *** [/Develop/parisc-linux/build/glibc/stdio-common/tst-rndseek.out]
Error 1
make[1]: *** [stdio-common/tests] Error 2
make[2]: [/Develop/parisc-linux/build/glibc/posix/annexc.out] Error 1 (ignored)
make[2]: *** [/Develop/parisc-linux/build/glibc/elf/tst-tls13.out] Error
1
make[1]: *** [elf/tests] Error 2
make: *** [check] Error 2

> can you find out why tst-rndseek fails?
>
>What does tst-rndseek.out say? I don't see this error?
grrr just a time out (I would have to put the 'export TIMEOUTFACTOR=4' in
the root profile on my chroot disk :? )

GCONV_PATH=/Develop/parisc-linux/build/glibc/iconvdata LC_ALL=C   /Develop/parisc-linux/build/glibc/elf/ld.so.1
--library-path /Develop/parisc-linux/build/glibc:/Develop/parisc-linux/build/glibc/math:/Develop/parisc-linux/build/glibc/elf:/Develop/parisc-linux/build/glibc/dlfcn:/Develop/parisc-linux/build/glibc/nss:/Develop/parisc-linux/build/glibc/nis:/Develop/p
arisc-linux/build/glibc/rt:/Develop/parisc-linux/build/glibc/resolv:/Develop/parisc-linux/build/glibc/crypt:/Develop/parisc-linux/build/glibc/linuxthreads
/Develop/parisc-linux/build/glibc/stdio-common/tst-rndseek  > /Develop/parisc-linux/build/glibc/stdio-common/tst-rndseek.out
Timed out: killed the child process

hth,
    Joel


----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr
