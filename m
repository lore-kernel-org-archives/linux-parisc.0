From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] [Status] hppa's userspace in 2004 (looking back)
Date: Mon, 12 Jan 2004 18:51:21 +0100
Message-ID: <3FFB28C900003B90__22592.6059451469$1416623125$gmane$org@ocpmta1.freegates.net>
References: <3FFF10F3.2060408@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Return-Path: <soete.joel@tiscali.be>
In-Reply-To: <3FFF10F3.2060408@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi Carlos,

Here is finaly the pb I encounter when I try to rebuild the toolchain with
gcc-snapshot at the time of glibc build:
[snip]
/Develop/parisc-linux/xc/bin/hppa-linux-gcc -nostdlib -nostartfiles -o /Develop/parisc-linux/build/glibc/iconv/iconvconfig
 -Wl,-dynamic-linker=/opt/palinux/hppa-linux/lib/ld.so.1    /Develop/parisc-linux/build/glibc/csu/crt1.o
/Develop/parisc-linux/build/glibc/csu/crti.o `/Develop/parisc-linux/xc/bin/hppa-linux-gcc
--print-file-name=crtbegin.o` /Develop/parisc-linux/build/glibc/iconv/iconvconfig.o
/Develop/parisc-linux/build/glibc/iconv/strtab.o /Develop/parisc-linux/build/glibc/iconv/xmalloc.o
/Develop/parisc-linux/build/glibc/iconv/hash-string.o  -Wl,-rpath-link=/Develop/parisc-linux/build/glibc:/Develop/parisc-linux/build/glibc/math:/Develop/parisc-linux/build/glibc/elf:/Develop/parisc-linux/build/glibc/dlfcn:/Develop/parisc-linux/build/gl
ibc/nss:/Develop/parisc-linux/build/glibc/nis:/Develop/parisc-linux/build/glibc/rt:/Develop/parisc-linux/build/glibc/resolv:/Develop/parisc-linux/build/glibc/crypt:/Develop/parisc-linux/build/glibc/linuxthreads
/Develop/parisc-linux/build/glibc/libc.so.6 /Develop/parisc-linux/build/glibc/libc_nonshared.a
-lgcc `/Develop/parisc-linux/xc/bin/hppa-linux-gcc --print-file-name=crtend.o`
/Develop/parisc-linux/build/glibc/csu/crtn.o
/Develop/parisc-linux/build/glibc/elf/ld.so.1: undefined reference to `set_dp'
collect2: ld returned 1 exit status
make[2]: *** [/Develop/parisc-linux/build/glibc/iconv/iconvconfig] Error
1
make[2]: Leaving directory `/Develop/parisc-linux/sources/glibc/iconv'
make[1]: *** [iconv/others] Error 2
make[1]: Leaving directory `/Develop/parisc-linux/sources/glibc'
make: *** [all] Error 2

the glibc src cames from last debian pkg with patches applied and configured
with following options:
# unset LD_LIBRARY_PATH; unset LD_RUN_PATH; export CC=/Develop/parisc-linux/xc/bin/hppa-linux-gcc;
export CLFAGS="-O2 -g";  export PATH="/Develop/parisc-linux/xc/bin:$PATH";
/Develop/parisc-linux/sources/glibc/configure --target=hppa-linux --host=hppa-linux
--build=hppa-linux --prefix=/opt/palinux/hppa-linux --without-cvs --disable-profile
--enable-hacker-mode --enable-add-ons=linuxthreads --with-headers=/Develop/parisc-linux/sources/linux/include


and the gcc-snapshot sources cames from the latest gcc-scnapshot-20040110
debian pkg and the 'preliminary x compiler' is configured with following
options:
# export PATH="/Develop/parisc-linux/xc/bin:$PATH"; /Develop/parisc-linux/sources/gcc/configure
--target=hppa-linux --host=hppa-linux --build=hppa-linux --prefix=/Develop/parisc-linux/xc
--disable-shared --disable-nls --enable-languages=c 

Any idea?

Thanks in advance,
    Joel

>-- Original Message --
>Date: Fri, 09 Jan 2004 20:37:07 +0000
>From: Joel Soete <soete.joel@tiscali.be>
>To: Carlos O'Donell <carlos@baldric.uwo.ca>
>Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
>Subject: Re: [parisc-linux] [Status] hppa's userspace in 2004 (looking back)
>
>
>Joel Soete wrote:
[snip]
> (but I don't much retry because of gnu pserver cvs pb; in the mean time
I
> read that new anonymous access would be with ssh, even though last weekend
> it was not yet operational?) 
[snip]

CVSROOT=":ext:anoncvs@subve
>sions.gnu.org:/cvsroot/gcc"

seems to be operational now with CVS_RSH="ssh"

hth,
	Joel

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listi
>fo/parisc-linux



-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
