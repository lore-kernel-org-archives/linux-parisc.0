From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] gcc (3.3.5) causing problems in our latest kernel.
Date: Sun, 3 Apr 2005 23:13:32 +0100
Message-ID: <20050403221332.GC18349@parcelfarce.linux.theplanet.co.uk>
References: <1112564457.5858.7.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1112564457.5858.7.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Apr 03, 2005 at 04:40:57PM -0500, James Bottomley wrote:
> The problem is that the macros depend on clever optimisation using
> sizeof(*ptr) as an argument to an inline function.  The following
> program illustrates the issue:

Perhaps there's a difference between an inline function and a macro
in terms of constant propagation?  If you turn __test_width() into
a macro, it should work (see the implementation of __get_user() in
asm-parisc/uaccess.h)

> extern void bad_function(void);
> 
> static inline void __test_width(char *var, int size) {
> 	switch (size) {	
> 	case 1:
> 	case 2:
> 	case 4:
> 	case 8:
> 		*var++ = 0;
> 		break;
> 	default:
> 		bad_function();
> 	}
> }
> 
> #define test_width(x)	__test_width((char *)(x), sizeof(x))
> 
> main(int argc, char *argv) {
> 	int test;
> 
> 	test_width(&test);
> }
> 
> If I compile this on an ia64 box, everything is fine:
> 
> jejb@titanic> gcc -O2 test.c
> jejb@titanic> gcc -v
> Reading specs from /usr/lib/gcc-lib/ia64-linux/3.3.5/specs
> Configured with: ../src/configure -v --enable-languages=c,c++,java,f77,pascal,objc,ada,treelang --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --with-gxx-include-dir=/usr/include/c++/3.3 --enable-shared --with-system-zlib --enable-nls --without-included-gettext --enable-__cxa_atexit --with-system-libunwind --enable-clocale=gnu --enable-debug --enable-java-gc=boehm --enable-java-awt=xlib --enable-objc-gc ia64-linux
> Thread model: posix
> gcc version 3.3.5 (Debian 1:3.3.5-8)
> 
> But on a parisc system it fails:
> 
> jejb@raven> gcc -O2 test.c
> /tmp/cccwaI1E.o(.text+0x60): In function `main':
> : undefined reference to `bad_function'
> collect2: ld returned 1 exit status
> jejb@raven> gcc -v
> Reading specs from /usr/lib/gcc-lib/hppa-linux/3.3.5/specs
> Configured with: ../src/configure -v --enable-languages=c,c++,java,f77,pascal,objc,ada,treelang --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --with-gxx-include-dir=/usr/include/c++/3.3 --enable-shared --with-system-zlib --enable-nls --without-included-gettext --enable-__cxa_atexit --enable-sjlj-exceptions --enable-clocale=gnu --enable-debug --enable-java-gc=boehm --enable-java-awt=xlib --enable-objc-gc hppa-linux
> Thread model: posix
> gcc version 3.3.5 (Debian 1:3.3.5-5)
> 
> Before I have to tell Dave Miller that his clever trick won't work for
> us, is there a way of fixing it?

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
