Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 11 Aug 2003 09:24:42 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] xfree86 4.2.1-9 build problem
Message-ID: <20030811152442.GB20405@dsl2.external.hp.com>
References: <20030811043457.GA5653@dsl2.external.hp.com> <200308111424.h7BEOv14017589@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200308111424.h7BEOv14017589@hiauly1.hia.nrc.ca>
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

On Mon, Aug 11, 2003 at 10:24:57AM -0400, John David Anglin wrote:
> Did you do the build with one of my private builds of GCC?  They were built
> with dwarf2 exception support and don't have these symbols in libgcc_s.so.1.

nope.  I used:

grundler@gsyprf11:/usr/src/xfree86-4.2.1/build-tree/xc$ gcc -v
Reading specs from /usr/lib/gcc-lib/hppa-linux/3.3.1/specs
Configured with: ../src/configure -v --enable-languages=c,c++,f77,pascal,objc,ada,treelang --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --with-gxx-include-dir=/usr/include/c++/3.3 --enable-shared --with-system-zlib --enable-nls --without-included-gettext --enable-__cxa_atexit --enable-sjlj-exceptions --enable-clocale=gnu --enable-debug --enable-objc-gc hppa-linux
Thread model: posix
gcc version 3.3.1 20030626 (Debian prerelease)


I upgraded to gcc-3.3/unstable and got the same result when attempting
to build glxinfo by hand.

grant
