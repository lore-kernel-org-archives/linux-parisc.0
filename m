From: tausq@debian.org
Subject: [parisc-linux] [gcc-3.2.2] hppa64-unknown-linux-gnu fails to bootstrap
Date: Sat, 8 Feb 2003 13:36:03 -0800
Message-ID: <20030208213603.GP11363__23080.1307516687$1416622197$gmane$org@tausq.org>
Reply-To: tausq@debian.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: gcc-gnats@gcc.gnu.org, debian-gcc@lists.debian.org
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

>Submitter-Id:	net
>Originator:	Randolph Chung
>Organization:	Debian
>Confidential:	no
>Synopsis:	[gcc-3.2.2] hppa64-unknown-linux-gnu fails to bootstrap
>Severity:	critical
>Priority:	medium
>Category:	bootstrap
>Class:		sw-bug
>Release:	3.2.2 20030131 (Debian prerelease) (Debian testing/unstable)
>Environment:
System: Linux ios 2.4.20-pa23 #19 SMP Fri Feb 7 22:00:18 PST 2003 parisc64 unknown unknown GNU/Linux
Architecture: parisc64

	<machine, os, target, libraries (multiple lines)>
host: hppa-unknown-linux-gnu
build: hppa-unknown-linux-gnu
target: hppa-unknown-linux-gnu
configured with: ../src/configure -v --enable-languages=c,c++,f77,proto,pascal,objc,ada --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --with-gxx-include-dir=/usr/include/c++/3.2 --enable-shared --with-system-zlib --enable-nls --without-included-gettext --enable-__cxa_atexit --enable-clocale=gnu --enable-objc-gc hppa-linux
>Description:
Building gcc-3.2.2 with:

~/src/gcc-3.2-3.2.2ds8/src/configure --with-gnu-as --with-gnu-ld --disable-shared --disable-nls --disable-threads --prefix=/usr  --host=hppa-linux --target=hppa64-linux --enable-languages=c

and then 'make' 

gives:

/home/tausq/build/gcc-3.2/gcc/xgcc -B/home/tausq/build/gcc-3.2/gcc/ -B/usr/hppa64-linux/bin/ -B/usr/hppa64-linux/lib/ -isystem /usr/hppa64-linux/include -O2  -DIN_GCC -DCROSS_COMPILE   -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -isystem ./include  -fPIC -Dpa64=1 -DELF=1 -g  -DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED -Dinhibit_libc -I. -I. -I/home/tausq/src/gcc-3.2-3.2.2ds8/src/gcc -I/home/tausq/src/gcc-3.2-3.2.2ds8/src/gcc/. -I/home/tausq/src/gcc-3.2-3.2.2ds8/src/gcc/config -I/home/tausq/src/gcc-3.2-3.2.2ds8/src/gcc/../include -fexceptions -c /home/tausq/src/gcc-3.2-3.2.2ds8/src/gcc/unwind-sjlj.c -o libgcc/./unwind-sjlj.o
/home/tausq/src/gcc-3.2-3.2.2ds8/src/gcc/unwind-sjlj.c:56: size of array `data'
is too large
/home/tausq/src/gcc-3.2-3.2.2ds8/src/gcc/unwind-sjlj.c:72: confused by earlier errors, bailing out
make[2]: *** [libgcc/./unwind-sjlj.o] Error 1

The offending line is:
     56   _Unwind_Word data[4];
     
There are also a lot of warnings of the form:
/home/tausq/src/gcc-3.2-3.2.2ds8/src/gcc/unwind-dw2-fde.c:822: warning: integer overflow in expression
    807           _Unwind_Ptr mask;
    [...]
    822             mask = -1;

jda says he sees this with gcc-3.2.3 too.

>How-To-Repeat:
	see above
>Fix:
	
