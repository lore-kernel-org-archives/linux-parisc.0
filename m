Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3730C4840
	for <parisc-linux@parisc-linux.org>; Sun, 23 Nov 2003 10:30:12 -0700 (MST)
Message-ID: <3FC0EEA5.1040009@tiscali.be>
Date: Sun, 23 Nov 2003 17:30:13 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Cc: parisc-linux@parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] Tool chain pb
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi Carlos,

In the hope to rebuild kernel last 2.6(.0-test9-pa6) to test it on the 
b2k and n4k, I try to follow your Build xc howto with new binutils (ie 
2.14.90.0.7-3), glibc (2.3.2.ds1-10) and gcc-3.3 (3.3.2-4) to rebuild 
first 32bit tools.

(Just change a bit the way to apply debian patches in binutils: adopt 
glibc method)

For binutils and partial gcc, all works fine. But for glibc which I try 
to configure as follow:
export PATH=/Sources/parisc-linux/xc/bin:$PATH; \
unset LD_LIBRARY_PATH; unset LD_RUN_PATH; \
export CC=/Sources/parisc-linux/xc/bin/hppa-linux-gcc; \
export CLFAGS="-O2 -g";\
/Sources/parisc-linux/src/glibc/configure --target=hppa-linux \
--host=hppa-linux --prefix=/Sources/parisc-linux/xc/hppa-linux \
--without-cvs --disable-profile --enable-hacker-mode --enable-add-ons \
--with-headers=/Sources/parisc-linux/src/linux/include

failed because:
[...]
checking for long double... yes
checking size of long double... 8
running configure fragment for nptl/sysdeps/pthread
configure: error: compiler support for __thread is required
[...]

What do i wrong?

I try to see how dpkg-buildpackage reconfigure glibc and gcc (respectively):
configure' --prefix=/usr  '--host=hppa-linux' '--build=hppa-linux' \ 
'--prefix=/usr' '--without-cvs' '--enable-add-ons=linuxthreads ' \
'--with-headers=/Develop/parisc-linux/sources/glibc-2.3.2.ds1/debian/include'\
  '--enable-kernel=2.2.0' \
'CPPFLAGS=-isystem \
Develop/parisc-linux/sources/glibc-2.3.2.ds1/debian/include' \
'build_alias=hppa-linux' 'host_alias=hppa-linux' --cache-file=/dev/null\
--srcdir=/Develop/parisc-linux/sources/glibc-2.3.2.ds1/build-tree/glibc-2.3.2/linuxthreads

(for gcc-snapshot!)
../src/configure -v --enable-languages=c,c++,f77,objc,treelang \
--prefix=/usr/lib/gcc-snapshot --enable-shared --with-system-zlib \
--enable-nls --without-included-gettext --enable-__cxa_atexit \
--enable-clocale=gnu \
--enable-libstdcxx-debug --with-cpp-install-dir=bin --disable-werror \
hppa-linux

but I don't see how can I add 'support for __thread' to gcc.

Any idea?

Thanks in advance for attention,
	Joel
