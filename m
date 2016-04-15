From: Simone Mannori <simone.mannori@gmail.com>
Subject: Re: Kernel for bug hunting
Date: Fri, 15 Apr 2016 16:57:43 +0200
Message-ID: <CACrbsaBDN70Q=JxjpsruVNLgi+X262MEQY+zgy1mdOwVmFZB2A@mail.gmail.com>
References: <CACrbsaA0-h9VYXCcQ8x9C++K-kSFSPiBAHye_Jr=urpASfHe=A@mail.gmail.com>
	<5710A91C.4040609@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave.anglin@bell.net>,
	Riccardo Schiavi <r.schiavi@evidence.eu.com>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5710A91C.4040609@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Helghe,

I'm very sorry to disturb by this "newbie issues" but I still have
errors at compile time

Inside a clean directory I have cloned the repository

git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git

and everythings looks OK.

I have changed directory with to "cd linux-stable/"; then I have
verified the presence of other branches with "git branch -a"; then I
have checkout the branch that you told me using

git checkout -b hppa remotes/origin/linux-4.5.y

Now the situation looks perfect:
simone@blsw:~/kernel/git/linux-stable$ git branch
* hppa
  master

GCC looks good:
simone@blsw:~/kernel/git/linux-stable$ gcc -v
Using built-in specs.
COLLECT_GCC=gcc
COLLECT_LTO_WRAPPER=/usr/lib/gcc/hppa-linux-gnu/4.9/lto-wrapper
Target: hppa-linux-gnu
Configured with: ../src/configure -v --with-pkgversion='Debian
4.9.3-14' --with-bugurl=file:///usr/share/doc/gcc-4.9/README.Bugs
--enable-languages=c,c++,java,d,fortran,objc,obj-c++ --prefix=/usr
--program-suffix=-4.9 --enable-shared --enable-linker-build-id
--libexecdir=/usr/lib --without-included-gettext
--enable-threads=posix --with-gxx-include-dir=/usr/include/c++/4.9
--libdir=/usr/lib --enable-nls --with-sysroot=/ --enable-clocale=gnu
--enable-libstdcxx-debug --enable-libstdcxx-time=yes
--enable-gnu-unique-object --disable-libssp --disable-libitm
--disable-libsanitizer --disable-libquadmath --enable-plugin
--with-system-zlib --disable-browser-plugin --enable-java-awt=gtk
--enable-gtk-cairo
--with-java-home=/usr/lib/jvm/java-1.5.0-gcj-4.9-hppa/jre
--enable-java-home
--with-jvm-root-dir=/usr/lib/jvm/java-1.5.0-gcj-4.9-hppa
--with-jvm-jar-dir=/usr/lib/jvm-exports/java-1.5.0-gcj-4.9-hppa
--with-arch-directory=parisc
--with-ecj-jar=/usr/share/java/eclipse-ecj.jar --enable-objc-gc
--enable-multiarch --disable-libstdcxx-pch --enable-checking=release
--build=hppa-linux-gnu --host=hppa-linux-gnu --target=hppa-linux-gnu
Thread model: posix
gcc version 4.9.3 (Debian 4.9.3-14)

I'm using your .config untouched.

BUT at compile time, I have a long list of errors (please see below
for the details).

Usually, I compile the Linux kernel dowloading the sources looking for
the right tar file.
Probably my git knowledge is too superficial and I'm doing something wrong.

Thanks in advance for you help.

  Simone Mannori - ITALY

//**---------------------------------------------------------------------------------------

In file included from ./arch/parisc/include/asm/bitops.h:211:0,
                 from include/linux/bitops.h:36,
                 from include/linux/kernel.h:10,
                 from ./arch/parisc/include/asm/bug.h:4,
                 from include/linux/bug.h:4,
                 from include/linux/page-flags.h:9,
                 from kernel/bounds.c:9:
include/asm-generic/bitops/__fls.h: In function '__fls':
include/asm-generic/bitops/__fls.h:17:2: warning: left shift count >=
width of type
  if (!(word & (~0ul << 32))) {
  ^
include/asm-generic/bitops/__fls.h:19:3: warning: left shift count >=
width of type
   word <<= 32;
   ^
include/asm-generic/bitops/__fls.h:22:2: warning: left shift count >=
width of type
  if (!(word & (~0ul << (BITS_PER_LONG-16)))) {
  ^
include/asm-generic/bitops/__fls.h:26:2: warning: left shift count >=
width of type
  if (!(word & (~0ul << (BITS_PER_LONG-8)))) {
  ^
include/asm-generic/bitops/__fls.h:30:2: warning: left shift count >=
width of type
  if (!(word & (~0ul << (BITS_PER_LONG-4)))) {
  ^
include/asm-generic/bitops/__fls.h:34:2: warning: left shift count >=
width of type
  if (!(word & (~0ul << (BITS_PER_LONG-2)))) {
  ^
include/asm-generic/bitops/__fls.h:38:2: warning: left shift count >=
width of type
  if (!(word & (~0ul << (BITS_PER_LONG-1))))
  ^
  CHK     include/generated/bounds.h
  UPD     include/generated/bounds.h
  CC      arch/parisc/kernel/asm-offsets.s
In file included from ./arch/parisc/include/asm/bitops.h:211:0,
                 from include/linux/bitops.h:36,
                 from include/linux/kernel.h:10,
                 from include/linux/sched.h:17,
                 from arch/parisc/kernel/asm-offsets.c:31:
include/asm-generic/bitops/__fls.h: In function '__fls':
include/asm-generic/bitops/__fls.h:17:2: warning: left shift count >=
width of type
  if (!(word & (~0ul << 32))) {
  ^
include/asm-generic/bitops/__fls.h:19:3: warning: left shift count >=
width of type
   word <<= 32;
   ^
include/asm-generic/bitops/__fls.h:22:2: warning: left shift count >=
width of type
  if (!(word & (~0ul << (BITS_PER_LONG-16)))) {
  ^
include/asm-generic/bitops/__fls.h:26:2: warning: left shift count >=
width of type
  if (!(word & (~0ul << (BITS_PER_LONG-8)))) {
  ^
include/asm-generic/bitops/__fls.h:30:2: warning: left shift count >=
width of type
  if (!(word & (~0ul << (BITS_PER_LONG-4)))) {
  ^
include/asm-generic/bitops/__fls.h:34:2: warning: left shift count >=
width of type
  if (!(word & (~0ul << (BITS_PER_LONG-2)))) {
  ^
include/asm-generic/bitops/__fls.h:38:2: warning: left shift count >=
width of type
  if (!(word & (~0ul << (BITS_PER_LONG-1))))
  ^
In file included from include/linux/ktime.h:297:0,
                 from include/linux/rcupdate.h:47,
                 from include/linux/rbtree.h:34,
                 from include/linux/sched.h:22,
                 from arch/parisc/kernel/asm-offsets.c:31:
include/linux/timekeeping.h: In function 'do_settimeofday':
include/linux/timekeeping.h:51:27: warning: passing argument 1 of
'do_settimeofday64' from incompatible pointer type
  return do_settimeofday64(ts);
                           ^
include/linux/timekeeping.h:13:12: note: expected 'const struct
timespec64 *' but argument is of type 'const struct timespec *'
 extern int do_settimeofday64(const struct timespec64 *ts);
            ^
include/linux/timekeeping.h: In function '__getnstimeofday':
include/linux/timekeeping.h:56:28: warning: passing argument 1 of
'__getnstimeofday64' from incompatible pointer type
  return __getnstimeofday64(ts);
                            ^
include/linux/timekeeping.h:41:12: note: expected 'struct timespec64
*' but argument is of type 'struct timespec *'
 extern int __getnstimeofday64(struct timespec64 *tv);
            ^
include/linux/timekeeping.h: In function 'getnstimeofday':
include/linux/timekeeping.h:61:19: warning: passing argument 1 of
'getnstimeofday64' from incompatible pointer type
  getnstimeofday64(ts);
                   ^
include/linux/timekeeping.h:42:13: note: expected 'struct timespec64
*' but argument is of type 'struct timespec *'
 extern void getnstimeofday64(struct timespec64 *tv);
             ^
include/linux/timekeeping.h: In function 'ktime_get_ts':
include/linux/timekeeping.h:66:17: warning: passing argument 1 of
'ktime_get_ts64' from incompatible pointer type
  ktime_get_ts64(ts);
                 ^
include/linux/timekeeping.h:37:13: note: expected 'struct timespec64
*' but argument is of type 'struct timespec *'
 extern void ktime_get_ts64(struct timespec64 *ts);
             ^
include/linux/timekeeping.h: In function 'ktime_get_real_ts':
include/linux/timekeeping.h:71:19: warning: passing argument 1 of
'getnstimeofday64' from incompatible pointer type
  getnstimeofday64(ts);
                   ^
include/linux/timekeeping.h:42:13: note: expected 'struct timespec64
*' but argument is of type 'struct timespec *'
 extern void getnstimeofday64(struct timespec64 *tv);
             ^
include/linux/timekeeping.h: In function 'getrawmonotonic':
include/linux/timekeeping.h:76:20: warning: passing argument 1 of
'getrawmonotonic64' from incompatible pointer type
  getrawmonotonic64(ts);
                    ^
include/linux/timekeeping.h:36:13: note: expected 'struct timespec64
*' but argument is of type 'struct timespec *'
 extern void getrawmonotonic64(struct timespec64 *ts);
             ^
include/linux/timekeeping.h: In function 'get_monotonic_coarse':
include/linux/timekeeping.h:81:2: error: incompatible types when
returning type 'struct timespec64' but 'struct timespec' was expected
  return get_monotonic_coarse64();
  ^
include/linux/timekeeping.h: In function 'getboottime':
include/linux/timekeeping.h:86:23: warning: passing argument 1 of
'getboottime64' from incompatible pointer type
  return getboottime64(ts);
                       ^
include/linux/timekeeping.h:43:13: note: expected 'struct timespec64
*' but argument is of type 'struct timespec *'
 extern void getboottime64(struct timespec64 *ts);
             ^
arch/parisc/kernel/asm-offsets.c: In function 'main':
arch/parisc/kernel/asm-offsets.c:286:2: warning: right shift count >=
width of type
  DEFINE(ASM_PGD_ENTRY, PAGE_OFFSET >> PGDIR_SHIFT);
  ^
Kbuild:80: recipe for target 'arch/parisc/kernel/asm-offsets.s' failed
make[1]: *** [arch/parisc/kernel/asm-offsets.s] Error 1
Makefile:993: recipe for target 'prepare0' failed
make: *** [prepare0] Error 2









On 15/04/2016, Helge Deller <deller@gmx.de> wrote:
> Hi Simone,
>
> On 15.04.2016 07:04, Simone Mannori wrote:
>> I'm using Debian 8.0 (linux-parisc) on a c8000 and I would like to
>> recompile the Linux kernel for debugging purposes, hoping to find and
>> fix the "[radeon] and [nouveau] passive frame buffer mode".
>>
>> Q1: Which version you suggest? Stable /devevelopment / GIT ?
>
> I'd suggest to use 4.5-stable, or alternatively the debian 4.5.1 kernel
> source.
>
>> Q2: Where I can find it? (www.kernel.org ?)
>
> Yes, either clone linux-4.5.y from
> git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
> (http://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/),
> or run "apt-get	update", "apt-get source linux" on debian.
> For that you need this in /etc/apt/sources.list:
> deb-src http://ftp.debian.org/debian unstable main
>
> Then, run "apt-get build-dep linux" once to get the build-depends.
>
>> Q3: Which GCC version? (4.x ? 5.x ?)
>
> gcc-4.9.
> Get's installed when you run "apt-get build-dep linux".
>
>> Q4: As ".config default", you suggest the Debian 8.0 one or you have a
>> better new one?
>
> The debian one is fine, alternatively you could use the one I'm using
> (attached here).
> "make c8000_defconfig" should work as well.
>
>> You have already suuggested me few [radeon] source files where put my
>> nose and what debugging tools I should use (printk). My actual problem
>> is to find the right kernel/gcc version (I've tried several
>> combinations, but the compilation stops with errors).
>
> Hope the above answers helps.
>
> Helge
>
>
