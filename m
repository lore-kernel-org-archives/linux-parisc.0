From: "Joel Soete" <soete.joel@tiscali.be>
Subject: =?ISO-8859-15?Q?Re=3A=20=5Bparisc=2Dlinux=5D=20mmm=20glibc=20cvs=202004=2010=2001=20=2B=20patch=202004=2009=2030=20failed=09to=20build=3F?=
Date: Tue, 5 Oct 2004 17:26:50 +0200
Message-ID: <41617298000007EF@mail-2-bnl.tiscali.it>
References: <4161760000000049@mail-8-bnl.mail.tiscali.sys>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@parisc-linux.org
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>,
 "Matthew Wilcox" <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4161760000000049@mail-8-bnl.mail.tiscali.sys>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Sorry but I would add some more info:

> 
> >
> > On Fri, Oct 01, 2004 at 04:12:54PM +0100, Matthew Wilcox wrote:
> > > On Fri, Oct 01, 2004 at 05:10:32PM +0200, Joel Soete wrote:
> > > > ../sysdeps/unix/sysv/linux/waitid.c: In function `do_waitid':
> > > > ../sysdeps/unix/sysv/linux/waitid.c:50: error: `NULL' undeclared
(first
> > > > use in this function)
> > > > ../sysdeps/unix/sysv/linux/waitid.c:50: error: (Each undeclared
identifier
> > > > is reported only once
> > > > ../sysdeps/unix/sysv/linux/waitid.c:50: error: for each function
it
> appears
> > > > in.)
> > >
> > > I believe NULL is defined in <stddef.h>
> >
> > Bug upstream. Testing fix.
> >
> I find this stuff in posix/waitpid:
> --- sysdeps/unix/sysv/linux/waitid.c.orig	2004-10-04 19:15:31.615954017=

> +0200
> +++ sysdeps/unix/sysv/linux/waitid.c	2004-10-04 18:07:03.000000000 +020=
0
> @@ -21,6 +21,8 @@
>  #include <sys/wait.h>
>  #include <kernel-features.h>
>  #include <sysdep.h>
> +#define __need_NULL
> +#include <stddef.h>
> 
>  #ifdef __NR_waitid
> 
> =3D=3D=3D=3D=3D=3D=3D=3D=3D><=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 
> That did the trick but not sure it's a fix?
> 
> What do you think?
> 
> Joel
> 
> PS: I didn't reach to complete the today cvs build ...

Well for remind that was cvs 2004-10-04 and it failed to build :((
"hppa-linux-gcc -nostdlib -nostartfiles -o /Develop/parisc-linux/build/gl=
ibc/nscd/nscd
 -Wl,-dynamic-linker=3D/lib/ld.so.1     /Develop/parisc-linux/build/glibc=
/csu/crt1.o
/Develop/parisc-linux/build/glibc/csu/crti.o `hppa-linux-gcc --print-file=
-name=3Dcrtbegin.o`
/Develop/parisc-linux/build/glibc/nscd/nscd.o /Develop/parisc-linux/build=
/glibc/nscd/connections.o
/Develop/parisc-linux/build/glibc/nscd/pwdcache.o /Develop/parisc-linux/b=
uild/glibc/nscd/getpwnam_r.o
/Develop/parisc-linux/build/glibc/nscd/getpwuid_r.o /Develop/parisc-linux=
/build/glibc/nscd/grpcache.o
/Develop/parisc-linux/build/glibc/nscd/getgrnam_r.o /Develop/parisc-linux=
/build/glibc/nscd/getgrgid_r.o
/Develop/parisc-linux/build/glibc/nscd/hstcache.o /Develop/parisc-linux/b=
uild/glibc/nscd/gethstbyad_r.o
/Develop/parisc-linux/build/glibc/nscd/gethstbynm2_r.o /Develop/parisc-li=
nux/build/glibc/nscd/dbg_log.o
/Develop/parisc-linux/build/glibc/nscd/nscd_conf.o /Develop/parisc-linux/=
build/glibc/nscd/nscd_stat.o
/Develop/parisc-linux/build/glibc/nscd/cache.o /Develop/parisc-linux/buil=
d/glibc/nscd/mem.o
/Develop/parisc-linux/build/glibc/nscd/nscd_setup_thread.o /Develop/paris=
c-linux/build/glibc/nscd/xmalloc.o
/Develop/parisc-linux/build/glibc/nscd/xstrdup.o /Develop/parisc-linux/bu=
ild/glibc/nscd/aicache.o
/Develop/parisc-linux/build/glibc/nscd/initgrcache.o /Develop/parisc-linu=
x/build/glibc/rt/librt.so
/Develop/parisc-linux/build/glibc/linuxthreads/libpthread_nonshared.a /De=
velop/parisc-linux/build/glibc/linuxthreads/libpthread.so
/Develop/parisc-linux/build/glibc/nis/libnsl.so  -Wl,-rpath-link=3D/Devel=
op/parisc-linux/build/glibc:/Develop/parisc-linux/build/glibc/math:/Devel=
op/parisc-linux/build/glibc/elf:/Develop/parisc-linux/build/glibc/dlfcn:/=
Develop/parisc-linux/build/glibc/nss:/Develop/parisc-linux/build/glibc/ni=
s:/Develop/parisc-linux/build/glibc/rt:/Develop/parisc-linux/build/glibc/=
resolv:/Develop/parisc-linux/build/glibc/crypt:/Develop/parisc-linux/buil=
d/glibc/linuxthreads
/Develop/parisc-linux/build/glibc/libc.so.6 /Develop/parisc-linux/build/g=
libc/libc_nonshared.a
-lgcc `hppa-linux-gcc --print-file-name=3Dcrtend.o` /Develop/parisc-linux=
/build/glibc/csu/crtn.o
/Develop/parisc-linux/build/glibc/nscd/connections.o(.text+0x2550): In fu=
nction
`start_threads':
/Develop/parisc-linux/sources/glibc-2.3.3-hppa-20041004/nscd/connections.=
c:1507:
undefined reference to `pthread_condattr_setclock'
collect2: ld returned 1 exit status
make[2]: *** [/Develop/parisc-linux/build/glibc/nscd/nscd] Error 1
make[2]: Leaving directory `/Develop/parisc-linux/sources/glibc-2.3.3-hpp=
a-20041004/nscd'
make[1]: *** [nscd/others] Error 2
make[1]: Leaving directory `/Develop/parisc-linux/sources/glibc-2.3.3-hpp=
a-20041004'
make: *** [all] Error 2
"

a consequence of:
hppa-linux-gcc connections.c -c -std=3Dgnu99 -O2 -Wall -Winline -Wstrict-=
prototypes
-Wwrite-strings -g   -DHAVE_EPOLL   -I../include -I. -I/Develop/parisc-li=
nux/build/glibc/nscd
-I.. -I../libio  -I/Develop/parisc-linux/build/glibc -I../sysdeps/hppa/el=
f
-I../linuxthreads/sysdeps/unix/sysv/linux/hppa -I../linuxthreads/sysdeps/=
unix/sysv/linux
-I../linuxthreads/sysdeps/pthread -I../sysdeps/pthread -I../linuxthreads/=
sysdeps/unix/sysv
-I../linuxthreads/sysdeps/unix -I../linuxthreads/sysdeps/hppa -I../sysdep=
s/unix/sysv/linux/hppa
-I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/common -I=
.../sysdeps/unix/mman
-I../sysdeps/unix/inet -I../sysdeps/unix/sysv -I../sysdeps/unix -I../sysd=
eps/posix
-I../sysdeps/hppa/hppa1.1 -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/f=
lt-32
-I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754/ldbl-128 -I../sysdeps/hp=
pa/fpu
-I../sysdeps/hppa -I../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysd=
eps/generic
-nostdinc -isystem /usr/lib/gcc-lib/hppa-linux/3.3.4/include -isystem /De=
velop/parisc-linux/sources/linux/include
-D_LIBC_REENTRANT -include ../include/libc-symbols.h   -DNOT_IN_libc=3D1 =

  -o /Develop/parisc-linux/build/glibc/nscd/connections.o -MD -MP -MF /De=
velop/parisc-linux/build/glibc/nscd/connections.o.dt
-MT /Develop/parisc-linux/build/glibc/nscd/connections.o
connections.c: In function `start_threads':
connections.c:1462: warning: implicit declaration of function `pthread_co=
ndattr_setclock'

And pthread_condattr_setclock afaik is only in nptl while am i going to
build with linuxthreads only:
the configure cmdline being "../../sources/glibc/configure --target=3Dhpp=
a-linux
--host=3Dhppa-linux --build=3Dhppa-linux --prefix=3D/usr --without-cvs --=
enable-hacker-mode
--enable-add-ons=3Dlinuxthreads --enable-profile --with-headers=3D/Develo=
p/parisc-linux/sources/linux/include"

Any idea?

Thanks,
    Joel
 

-------------------------------------------------------------------------=
--
Tiscali ADSL GO, 29,50 Euro/mois pendant toute une ann=E9e, profitez-en..=
..
http://reg.tiscali.be/adsl/welcome.asp?lg=3DFR




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
