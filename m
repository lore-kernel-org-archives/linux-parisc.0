From: "Jeff Bailey" <jbailey@raspberryginger.com>
Subject: Re: [parisc-linux] unaligned access using bash on glibc 2.5
Date: Sun, 6 May 2007 09:11:42 -0700
Message-ID: <5b2e36650705060911l27d0ac7co957cefcf40e03ad2__39458.6002840244$1416624355$gmane$org@mail.gmail.com>
References: <119aab440705021021i35132820we4338ae3ca1862cd@mail.gmail.com>
	<200705021815.l42IFqYS018776@hiauly1.hia.nrc.ca>
	<5b2e36650705030552l100c7ecayfc848248aac679c9@mail.gmail.com>
	<119aab440705031658g22e8be87p6b4c477a18501f5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8;
  format=flowed
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org,
 aurelien@aurel32.net
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440705031658g22e8be87p6b4c477a18501f5@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 03/05/07, Carlos O'Donell <carlos@systemhalted.org> wrote:
> On 5/3/07, Jeff Bailey <jbailey@raspberryginger.com> wrote:
> > To work around the gcc pic/tls bug, I'm using this patch:
> > http://people.ubuntu.com/~jbailey/hppa-caller-save-pic-tls.dpatch
> >
> > I thought it would be interesting to compare glibc testsuite failures:
>
> My full list follows, which is smaller than your full list. I am using
> gcc head, and a very recent binutils.
>
> libc/dlfcn/tststatic.out
> libc/dlfcn/tststatic2.out
> libc/nptl/tst-cancel24.o
> libc/nptl/tst-cancelx4.out

> Catch me if you can! :-)

I'm travelling at the moment, so basic troubleshooting is going to be
a bit delayed, just as a quick status report, I'm getting linker
failures in some of the tests.  I've checked that nptl/libpthread.so
has _Unwind_Resume in it, so I'll need to do more hunting this week.

Error message follows in case someone has an obvious "aha":

gcc-4.1 -fno-stack-protector -nostdlib -nostartfiles -o /home/jbailey/Programmin
g/packages/glibc/glibc-2.5/build-tree/hppa-libc/nptl/tst-cancelx4  -Wl,-dynamic-
linker=/lib/ld.so.1   -Wl,-z,combreloc  -Wl,--hash-style=both /home/jbailey/Prog
ramming/packages/glibc/glibc-2.5/build-tree/hppa-libc/csu/crt1.o /home/jbailey/P
rogramming/packages/glibc/glibc-2.5/build-tree/hppa-libc/csu/crti.o `gcc-4.1 -fn
o-stack-protector --print-file-name=crtbegin.o` /home/jbailey/Programming/packag
es/glibc/glibc-2.5/build-tree/hppa-libc/nptl/tst-cancelx4.o /home/jbailey/Progra
mming/packages/glibc/glibc-2.5/build-tree/hppa-libc/nptl/libpthread.so /home/jba
iley/Programming/packages/glibc/glibc-2.5/build-tree/hppa-libc/nptl/libpthread_n
onshared.a  -Wl,-rpath-link=/home/jbailey/Programming/packages/glibc/glibc-2.5/b
uild-tree/hppa-libc:/home/jbailey/Programming/packages/glibc/glibc-2.5/build-tre
e/hppa-libc/math:/home/jbailey/Programming/packages/glibc/glibc-2.5/build-tree/h
ppa-libc/elf:/home/jbailey/Programming/packages/glibc/glibc-2.5/build-tree/hppa-
libc/dlfcn:/home/jbailey/Programming/packages/glibc/glibc-2.5/build-tree/hppa-li
bc/nss:/home/jbailey/Programming/packages/glibc/glibc-2.5/build-tree/hppa-libc/n
is:/home/jbailey/Programming/packages/glibc/glibc-2.5/build-tree/hppa-libc/rt:/h
ome/jbailey/Programming/packages/glibc/glibc-2.5/build-tree/hppa-libc/resolv:/ho
me/jbailey/Programming/packages/glibc/glibc-2.5/build-tree/hppa-libc/crypt:/home
/jbailey/Programming/packages/glibc/glibc-2.5/build-tree/hppa-libc/nptl /home/jb
ailey/Programming/packages/glibc/glibc-2.5/build-tree/hppa-libc/libc.so.6 /home/
jbailey/Programming/packages/glibc/glibc-2.5/build-tree/hppa-libc/libc_nonshared
.a -lgcc `gcc-4.1 -fno-stack-protector --print-file-name=crtend.o` /home/jbailey
/Programming/packages/glibc/glibc-2.5/build-tree/hppa-libc/csu/crtn.o
/home/jbailey/Programming/packages/glibc/glibc-2.5/build-tree/hppa-libc/nptl/tst
-cancelx4.o: In function `tf_accept':
/home/jbailey/Programming/packages/glibc/glibc-2.5/build-tree/glibc-2.5/nptl/tst
-cancel4.c:1000: warning: the use of `mktemp' is dangerous, better use `mkstemp'
/home/jbailey/Programming/packages/glibc/glibc-2.5/build-tree/hppa-libc/nptl/tst
-cancelx4.o: In function `tf_read':
(.text+0xc30): undefined reference to `_Unwind_Resume'
/home/jbailey/Programming/packages/glibc/glibc-2.5/build-tree/hppa-libc/nptl/tst
-cancelx4.o: In function `tf_readv':
(.text+0xd7c): undefined reference to `_Unwind_Resume'
/home/jbailey/Programming/packages/glibc/glibc-2.5/build-tree/hppa-libc/nptl/tst
-cancelx4.o: In function `tf_write':
(.text+0xecc): undefined reference to `_Unwind_Resume'
/home/jbailey/Programming/packages/glibc/glibc-2.5/build-tree/hppa-libc/nptl/tst
-cancelx4.o: In function `tf_writev':
(.text+0x102c): undefined reference to `_Unwind_Resume'
/home/jbailey/Programming/packages/glibc/glibc-2.5/build-tree/hppa-libc/nptl/tst
-cancelx4.o: In function `tf_sleep':
(.text+0x10dc): undefined reference to `_Unwind_Resume'
/home/jbailey/Programming/packages/glibc/glibc-2.5/build-tree/hppa-libc/nptl/tst
-cancelx4.o:(.text+0x118c): more undefined references to `_Unwind_Resume' follow
/home/jbailey/Programming/packages/glibc/glibc-2.5/build-tree/hppa-libc/nptl/tst
-cancelx4.o:(.data+0x3c): undefined reference to `__gcc_personality_v0'
collect2: ld returned 1 exit status
make[3]: *** [/home/jbailey/Programming/packages/glibc/glibc-2.5/build-tree/hppa
-libc/nptl/tst-cancelx4] Error 1

-- 
Jeff Bailey - http://www.raspberryginger.com/jbailey/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
