Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id CB2344840
	for <parisc-linux@parisc-linux.org>; Wed, 26 Nov 2003 11:25:35 -0700 (MST)
Date: Wed, 26 Nov 2003 13:19:35 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] gcc-3.3.2 - 64bit failled to build?
Message-ID: <20031126181935.GJ27674@systemhalted>
References: <3FB2652500007F03@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3FB2652500007F03@ocpmta2.freegates.net>
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

On Wed, Nov 26, 2003 at 10:23:45AM +0100, Joel Soete wrote:
> Hi all,
> 
> I am trying to rebuild gcc-3.3.2 64bits following Carlos build xc howto.
> 
> I am using gcc-3.3.2-4 debian pkg src; after the extraction of src with 'dpkg-source
> -x gcc-3.3_3.3.2ds5-4.dsc', then in src tree apply debian patches (and get
> the actual src by the way).
> 
> The build of the tool chain 32bit works fine as well as binutils 64bits but
> the build of the patial gcc 64bit (let say kgcc) with following configure
> options (the same as 32bit but the target 64bits):
> ../src/configure --target=hppa64-linux --host=hppa-linux --prefix=/opt/parisc
> --disable-shared --disable-nls --without-libc --enable-langages=c
> 
> failled with messages:
> 
> /Develop/parisc-linux/build/gcc/gcc/xgcc -B/Develop/parisc-linux/build/gcc/gcc/
> -B/opt/palinux/hppa64-linux/bin/ -B/opt/palinux/hppa64-linux/lib/ -isystem
> /opt/palinux/hppa64-linux/include -O2  -DIN_GCC -DCROSS_COMPILE   -W -Wall
> -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -isystem ./include
>  -fPIC -Dpa64=1 -DELF=1 -g -DHAVE_GTHR_DEFAULT -DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED
> -Dinhibit_libc -I. -I. -I/Develop/parisc-linux/sources/gcc/gcc -I/Develop/parisc-linux/sources/gcc/gcc/.
> -I/Develop/parisc-linux/sources/gcc/gcc/config -I/Develop/parisc-linux/sources/gcc/gcc/../include
> -fexceptions -c /Develop/parisc-linux/sources/gcc/gcc/unwind-dw2.c -o libgcc/./unwind-dw2.o
> In file included from /Develop/parisc-linux/sources/gcc/gcc/unwind-dw2.c:26:
> /Develop/parisc-linux/sources/gcc/gcc/unwind-pe.h: In function `size_of_encoded_value':
> /Develop/parisc-linux/sources/gcc/gcc/unwind-pe.h:76: warning: implicit declaration
> of function `abort'
> In file included from gthr-default.h:1,
>                  from /Develop/parisc-linux/sources/gcc/gcc/gthr.h:98,
>                  from /Develop/parisc-linux/sources/gcc/gcc/unwind-dw2.c:28:
> /Develop/parisc-linux/sources/gcc/gcc/gthr-posix.h:37:21: pthread.h: No such
> file or directory
> /Develop/parisc-linux/sources/gcc/gcc/gthr-posix.h:38:20: unistd.h: No such
> file or directory
> In file included from gthr-default.h:1,
>                  from /Develop/parisc-linux/sources/gcc/gcc/gthr.h:98,
>                  from /Develop/parisc-linux/sources/gcc/gcc/unwind-dw2.c:28:
> [blabla]
> 
> even thought i use --without-libc it seems to look for glibc header: pthread.h
> & unistd.h?
> 
> Any idea?

You need the userspace headers for 64-bits. They don't exist, so I
normally hack them into place. Please try to use Kegel's crosstools and
see if you can get them building our cross-compiler? :)

If you want a quick fix, grab a current debian libc6-dev package, unpack
it using -x and move the /usr/include directory to your
$PREFIX/hppa64-linux directory so that the target headers are there.

c.
