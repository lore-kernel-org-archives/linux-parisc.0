From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: what's parisc execve_wrapper doing in the end?
Date: Fri, 05 Oct 2012 15:55:36 +0100
Message-ID: <1349448936.3638.64.camel@dabdike.int.hansenpartnership.com>
References: <20121004045150.GH23473@ZenIV.linux.org.uk>
	 <1349343019.2706.3.camel@dabdike.int.hansenpartnership.com>
	 <1349435268.3638.42.camel@dabdike.int.hansenpartnership.com>
	 <1349444664.3638.46.camel@dabdike.int.hansenpartnership.com>
	 <20121005144819.GO23473@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20121005144819.GO23473@ZenIV.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 2012-10-05 at 15:48 +0100, Al Viro wrote:
> On Fri, Oct 05, 2012 at 02:44:24PM +0100, James Bottomley wrote:
> > On Fri, 2012-10-05 at 12:07 +0100, James Bottomley wrote:
> > > I tried out the code at
> > > 
> > > git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal.git
> > > experimental-kernel_thread
> > > 
> > > and it gives me this panic on boot.
> > 
> > OK, found the fix:  the idle thread is a kernel thread, but it doesn't
> > come through kernel_thread().  The fix is to check for it (fortunately
> > it has the signal usp == 0).
> 
> Um...  I see, but I really wonder if that's the right fix.  FWIW, sparc
> will have the same problem...  Hell knows.  OTOH, it's a nice way to
> get of implicit interplay between copy_thread() and idle_regs() - note
> that SMP architectures doing default idle_regs() need to be damn careful
> about what they do in their "is that kernel thread" logics; all-zeros
> pt_regs might give varying results on user_mode(regs) tests, etc.
> Might be better to go for
> 	if (p->flags & PF_KTHREAD) {
> 		if (!usp) {
> 			we are starting an idle thread
> 		} else {
> 			we are setting things up for kernel_thread()
> 		}
> 	} else {
> 		we are forking
> 	}
> kind of logics, looking at regs only in the last case.  And to hell with
> (separate and overridable) idle_regs() once everything goes that way...

But there's not a lot of point.  forking an idle thread actually doesn't
care about any of the register execution setup because it never really
uses it to execute.  That's why it was safe for us to use the user
thread setup ... I suppose the interior of the kernel thread case could
be conditioned on if (usp).


> > I'm now getting as freeing the init memory, which then hangs, so I
> > suspect some type of execve failure trying to start the initrd... I'm
> > debugging.
> 
> What are you using for toolchain, BTW?  With gcc 4.3 / binutils 2.20
> (cross-builds) I'm getting panics from mainline kernel on parisc32 all
> way back to 2.6.28...

My toolchain is

jejb@ion> gcc -v
Using built-in specs.
Target: hppa-linux-gnu
Configured with: ../src/configure -v --with-pkgversion='Debian 4.4.5-8'
--with-bugurl=file:///usr/share/doc/gcc-4.4/README.Bugs
--enable-languages=c,c++,fortran,objc,obj-c++ --prefix=/usr
--program-suffix=-4.4 --enable-shared --enable-multiarch
--enable-linker-build-id --with-system-zlib --libexecdir=/usr/lib
--without-included-gettext --enable-threads=posix
--with-gxx-include-dir=/usr/include/c++/4.4 --libdir=/usr/lib
--enable-nls --enable-clocale=gnu --enable-libstdcxx-debug
--disable-libssp --enable-objc-gc --disable-libstdcxx-pch
--enable-checking=release --build=hppa-linux-gnu --host=hppa-linux-gnu
--target=hppa-linux-gnu
Thread model: posix
gcc version 4.4.5 (Debian 4.4.5-8) 


It's the one that was in debian testing before parisc got dumped

James


