Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 29279484B
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 12 Mar 2004 10:33:16 -0700 (MST)
Date: Fri, 12 Mar 2004 18:33:11 +0100
Message-ID: <404EC1C600002B98@ocpmta1.freegates.net>
In-Reply-To: <20040312164116.GI24266@baldric.uwo.ca>
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

Hi C.,

Ok I just mentioned know error to be complete :)

>> make[1]: *** [stdlib/tests] Error 2
>> make[2]: *** [/Develop/parisc-linux/build/glibc/posix/tst-regex] Error
1
>
>I haven't seen this one before, what's the problem with the rest?
>
>> make[1]: *** [posix/tests] Error 2
>> make[2]: *** [/Develop/parisc-linux/build/glibc/linuxthreads/ex10] Error
1
>> make[2]: *** [/Develop/parisc-linux/build/glibc/linuxthreads/ex11] Error
1
>
>These are new, usually means the compiler optimized something that it
>shouldn't have optimized. Can you see what the error is? e.g. Look at
>the out file.
>
>> make[1]: *** [linuxthreads/tests] Error 2
>> make[2]: *** [/Develop/parisc-linux/build/glibc/elf/resolvfail] Error
1
>
>That's bad.
>

Hmmm all output files realted to Error1 was empty because of:
hppa-linux-gcc -nostdlib -nostartfiles -o /Develop/parisc-linux/build/glibc/posix/tst-regex
 -Wl,-dynamic-linker=/lib/ld.so.1
/Develop/parisc-linux/build/glibc/csu/crt1.o /Develop/parisc-linux/build/glibc/csu/crti.o
`hppa-linux-gcc --print-file-name=crtbegin.o` /Develop/parisc-linux/build/glibc/posix/tst-regex.o
/Develop/parisc-linux/build/glibc/rt/librt.so  -Wl,-rpath-link=/Develop/parisc-linux/build/glibc:/Develop/parisc-linux/build/glibc/math:/Develop/parisc-linux/build/glibc/elf:/Develop/parisc-linux/build/glibc/dlfcn:/Develop/parisc-linux/build/glibc/nss:
/Develop/parisc-linux/build/glibc/nis:/Develop/parisc-linux/build/glibc/rt:/Develop/parisc-linux/build/glibc/resolv:/Develop/parisc-linux/build/glibc/crypt:/Develop/parisc-linux/build/glibc/linuxthreads
/Develop/parisc-linux/build/glibc/libc.so.6 /Develop/parisc-linux/build/glibc/libc_nonshared.a
-lgcc `hppa-linux-gcc --print-file-name=crtend.o` /Develop/parisc-linux/build/glibc/csu/crtn.o
/Develop/parisc-linux/build/glibc/rt/librt.so: undefined reference to `pthread_create'
/Develop/parisc-linux/build/glibc/rt/librt.so: undefined reference to `_pthread_cleanup_pop'
/Develop/parisc-linux/build/glibc/rt/librt.so: undefined reference to `pthread_once'
/Develop/parisc-linux/build/glibc/rt/librt.so: undefined reference to `_pthread_cleanup_push'
/Develop/parisc-linux/build/glibc/rt/librt.so: undefined reference to `pthread_atfork'
collect2: ld returned 1 exit status
make[2]: *** [/Develop/parisc-linux/build/glibc/posix/tst-regex] Error 1

hppa-linux-gcc -nostdlib -nostartfiles -o /Develop/parisc-linux/build/glibc/linuxthreads/ex10
 -Wl,-dynamic-linker=/lib/ld.so.1
  /Develop/parisc-linux/build/glibc/csu/crt1.o /Develop/parisc-linux/build/glibc/csu/crti.o
`hppa-linux-gcc --print-file-name=crtbegin.o` /Develop/parisc-linux/build/glibc/linuxthreads/ex10.o
/Develop/parisc-linux/build/glibc/linuxthreads/libpthread.so /Develop/parisc-linux/build/glibc/linuxthreads/libpthread_nonshared.a
/Develop/parisc-linux/build/glibc/rt/librt.so  -Wl,-rpath-link=/Develop/parisc-linux/build/glibc:/Develop/parisc-linux/build/glibc/math:/Develop/parisc-linux/build/glibc/elf:/Develop/parisc-linux/build/glibc/dlfcn:/Develop/parisc-linux/build/glibc/nss:
/Develop/parisc-linux/build/glibc/nis:/Develop/parisc-linux/build/glibc/rt:/Develop/parisc-linux/build/glibc/resolv:/Develop/parisc-linux/build/glibc/crypt:/Develop/parisc-linux/build/glibc/linuxthreads
/Develop/parisc-linux/build/glibc/libc.so.6 /Develop/parisc-linux/build/glibc/libc_nonshared.a
-lgcc `hppa-linux-gcc --print-file-name=crtend.o` /Develop/parisc-linux/build/glibc/csu/crtn.o
/Develop/parisc-linux/build/glibc/rt/librt.so: undefined reference to `pthread_atfork'
collect2: ld returned 1 exit status
make[2]: *** [/Develop/parisc-linux/build/glibc/linuxthreads/ex10] Error
1

hppa-linux-gcc -nostdlib -nostartfiles -o /Develop/parisc-linux/build/glibc/linuxthreads/ex11
 -Wl,-dynamic-linker=/lib/ld.so.1
  /Develop/parisc-linux/build/glibc/csu/crt1.o /Develop/parisc-linux/build/glibc/csu/crti.o
`hppa-linux-gcc --print-file-name=crtbegin.o` /Develop/parisc-linux/build/glibc/linuxthreads/ex11.o
/Develop/parisc-linux/build/glibc/linuxthreads/libpthread.so /Develop/parisc-linux/build/glibc/linuxthreads/libpthread_nonshared.a
/Develop/parisc-linux/build/glibc/rt/librt.so  -Wl,-rpath-link=/Develop/parisc-linux/build/glibc:/Develop/parisc-linux/build/glibc/math:/Develop/parisc-linux/build/glibc/elf:/Develop/parisc-linux/build/glibc/dlfcn:/Develop/parisc-linux/build/glibc/nss:
/Develop/parisc-linux/build/glibc/nis:/Develop/parisc-linux/build/glibc/rt:/Develop/parisc-linux/build/glibc/resolv:/Develop/parisc-linux/build/glibc/crypt:/Develop/parisc-linux/build/glibc/linuxthreads
/Develop/parisc-linux/build/glibc/libc.so.6 /Develop/parisc-linux/build/glibc/libc_nonshared.a
-lgcc `hppa-linux-gcc --print-file-name=crtend.o` /Develop/parisc-linux/build/glibc/csu/crtn.o
/Develop/parisc-linux/build/glibc/rt/librt.so: undefined reference to `pthread_atfork'
collect2: ld returned 1 exit status
make[2]: *** [/Develop/parisc-linux/build/glibc/linuxthreads/ex11] Error
1

hppa-linux-gcc -nostdlib -nostartfiles -o /Develop/parisc-linux/build/glibc/elf/resolvfail
 -Wl,-dynamic-linker=/lib/ld.so.1     /Develop/parisc-linux/build/glibc/csu/crt1.o
/Develop/parisc-linux/build/glibc/csu/crti.o `hppa-linux-gcc --print-file-name=crtbegin.o`
/Develop/parisc-linux/build/glibc/elf/resolvfail.o /Develop/parisc-linux/build/glibc/dlfcn/libdl.so.2
/Develop/parisc-linux/build/glibc/linuxthreads/libpthread_nonshared.a /Develop/parisc-linux/build/glibc/linuxthreads/libpthread.so
 -Wl,-rpath-link=/Develop/parisc-linux/build/glibc:/Develop/parisc-linux/build/glibc/math:/Develop/parisc-linux/build/glibc/elf:/Develop/parisc-linux/build/glibc/dlfcn:/Develop/parisc-linux/build/glibc/nss:/Develop/parisc-linux/build/glibc/nis:/Develop
/parisc-linux/build/glibc/rt:/Develop/parisc-linux/build/glibc/resolv:/Develop/parisc-linux/build/glibc/crypt:/Develop/parisc-linux/build/glibc/linuxthreads
/Develop/parisc-linux/build/glibc/libc.so.6 /Develop/parisc-linux/build/glibc/libc_nonshared.a
-lgcc `hppa-linux-gcc --print-file-name=crtend.o` /Develop/parisc-linux/build/glibc/csu/crtn.o
/Develop/parisc-linux/build/glibc/linuxthreads/libpthread.so: undefined reference
to `_h_errno'
/Develop/parisc-linux/build/glibc/linuxthreads/libpthread.so: undefined reference
to `_res'
/Develop/parisc-linux/build/glibc/linuxthreads/libpthread.so: undefined reference
to `_errno'
collect2: ld returned 1 exit status
make[2]: *** [/Develop/parisc-linux/build/glibc/elf/resolvfail] Error 1

>> make [2]: *** [/Develop/parisc-linux/build/glibc/elf/tst-dlmodcount.out]
Error 139
>
>This is worse, the program crashes.
Yes:(
make[2]: *** [/Develop/parisc-linux/build/glibc/elf/tst-dlmodcount.out] Error
139
do_page_fault() pid=9891 command='ld.so.1' type=15 address=0x401aca28
vm_start = 0x40177000, vm_end = 0x4017c000

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000000000001111 Not tainted
r00-03  00000000 41029750 40137993 bff01640
r04-07  40173088 00000000 00000010 00000004
r08-11  41029750 40152edc 40152f1c 40152e30
r12-15  00000000 40152edc 40152ee8 40152e30
r16-19  40152e30 40152edc 40152ec0 40173088
r20-23  00000001 00000001 401aca24 00000001
r24-27  00000001 4102a5d8 41029770 00020ed4
r28-31  00000048 00000049 bff01740 40137993
sr0-3   0000039f 0000039f 00000000 0000039f
sr4-7   0000039f 0000039f 0000039f 0000039f

IASQ: 0000039f 0000039f IAOQ: 4013c65b 4013c65f
 IIR: 0ec81093    ISR: 0000039f  IOR: 401aca28
 CPU:        0   CR30: 14584000 CR31: 1039c000
 ORIG_R28: 00000000
 IAOQ[0]: 0x4013c65b
 IAOQ[1]: 0x4013c65f
 RP(r2): 0x40137993

And here the only difference between this test and previous is the kernel
:(

On Monday (I don't have access to those system during the week-end), I can
try to compile a 2.4.25 and relaunch test. What is your opinion?

{ here are the packages upgraded today:
Get:1 http://ftp.de.debian.org unstable/main dpkg 1.10.20 [1123kB]
Get:2 http://ftp.de.debian.org unstable/main login 1:4.0.3-21 [269kB]
Get:3 http://ftp.de.debian.org unstable/main libncurses5-dev 5.4-2 [1087kB]
Get:4 http://ftp.de.debian.org unstable/main libncurses5 5.4-2 [309kB]
Get:5 http://ftp.de.debian.org unstable/main ncurses-bin 5.4-2 [236kB]
Get:6 http://ftp.de.debian.org unstable/main ncurses-base 5.4-2 [11.1kB]
Get:7 http://ftp.de.debian.org unstable/main debconf-i18n 1.4.16 [63.6kB]
Get:8 http://ftp.de.debian.org unstable/main debconf 1.4.16 [98.5kB]
Get:9 http://ftp.de.debian.org unstable/main dselect 1.10.20 [116kB]
Get:10 http://ftp.de.debian.org unstable/main passwd 1:4.0.3-21 [491kB]
Get:11 http://ftp.de.debian.org unstable/main bc 1.06-13 [69.7kB]
Get:12 http://ftp.de.debian.org unstable/main dc 1.06-13 [60.2kB]
Get:13 http://ftp.de.debian.org unstable/main dpkg-dev 1.10.20 [122kB]
Get:14 http://ftp.de.debian.org unstable/main libncursesw5 5.4-2 [320kB]
Get:15 http://ftp.de.debian.org unstable/main ncurses-term 5.4-2 [279kB]
Get:16 http://ftp.de.debian.org unstable/main base-config 2.15 [261kB]
Get:17 http://ftp.de.debian.org unstable/main debconf-utils 1.4.16 [32.5kB]
Get:18 http://ftp.de.debian.org unstable/main libaudiofile-dev 0.2.6-2 [132kB]
Get:19 http://ftp.de.debian.org unstable/main libaudiofile0 0.2.6-2 [85.5kB]
Get:20 http://ftp.de.debian.org unstable/main libxft2 2.1.2-6 [54.7kB]
Get:21 http://ftp.de.debian.org unstable/main libxml1 1:1.8.17-5 [249kB]
Get:22 http://ftp.de.debian.org unstable/main tasksel 1.45 [130kB]
}

>Yes. tst-tls13 should be the only failure affected by TIMEOUTFACTOR,
>though I wasn't sure about the system you were running so I suggested it.
>
Yes it is a b180 (n4k not anymore available for the moment :( )

hth beter,
Joel



----------------------------------------------------------------------------------------
Tiscali ADSL: 19,50 €/mois, pendant 3 mois! L'Internet rapide, c'est pour
tout le monde.
http://reg.tiscali.be/default.asp?lg=fr
