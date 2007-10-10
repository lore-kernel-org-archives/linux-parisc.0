From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] parisc arch makefile clean-up needed [Was:
	cleaning up "make headers_install" for various architectures]
Date: Wed, 10 Oct 2007 13:10:21 -0600
Message-ID: <20071010191020.GD2730__24983.1842062578$1416624447$gmane$org@parisc-linux.org>
References: <20071010184225.GA2470@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org
To: Sam Ravnborg <sam@ravnborg.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20071010184225.GA2470@uranus.ravnborg.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Oct 10, 2007 at 08:42:25PM +0200, Sam Ravnborg wrote:
> parisc arch Makefile needs some love and care...
> 
> The logic selecting CROSS_COMPILE seems fishy and wrong -
> the error reported by rday is obvious in this respect.

He doesn't have a compiler installed that can target parisc.  It doesn't
seem obvious to me that this should work.

> FINAL_LD is unused - kill it.

OK.

> Building with oldpalo has been broken for a loong time - time to kill it?
> Hint - the "cd ../palo" is not working as expected.
> And use of TOPDIR is deprecated.

OK, killed.  I don't think anyone still uses that.

> The libs-y assignment should learn from the other architectures how to
> get the gcc lib filename:
> $(shell $(CC) $(CFLAGS) -print-libgcc-file-name)

Actually, this looks utterly unstandardised:

arch/cris/Makefile:LIBGCC = $(shell $(CC) $(CFLAGS) -print-file-name=libgcc.a)
arch/h8300/Makefile:LIBGCC := $(shell $(CROSS-COMPILE)$(CC) $(CFLAGS) -print-libgcc-file-name)
arch/m32r/Makefile:LIBGCC       := $(shell $(CC) $(CFLAGS) -print-libgcc-file-name)
arch/parisc/Makefile:libs-y     += arch/parisc/lib/ `$(CC) -print-libgcc-file-name`
arch/sh64/Makefile:LIBGCC := $(shell $(CC) $(CFLAGS) -print-libgcc-file-name)
arch/sh/Makefile:LIBGCC := $(shell $(CC) $(CFLAGS) -print-libgcc-file-name)
arch/xtensa/Makefile:LIBGCC := $(shell $(CC) $(CFLAGS) -print-libgcc-file-name)

How about we set it in the main Makefile, or one of the ones in
scripts/?  That way we don't have to learn why $(shell $(CC) $(CFLAGS)
-print-libgcc-file-name) is superior to `$(CC) -print-libgcc-file-name`

> 
> And this snippet is also wrong:
> PALO := $(shell if which palo; then : ; \
> 	elif [ -x /sbin/palo ]; then echo /sbin/palo; \
> 	fi)
> 
> palo: vmlinux
> 	@if [ -x $PALO ]; then \
> 
> 
> Make does not export variables so $PALO is not the same as $(PALO).
> The latter should be used.

Huh.  Looks like the sense of the test is reversed too.  That should
probably be:

	@if [ ! -x $(PALO) ]; then \

> I did not supply a patch because I do not fully understand the
> logic behind setting CROSS_COMPILE and 64BIT or not.
> But I will be happy to review a patch to fix the issues in the
> parisc Makefile.

One issue is that we don't have native 64-bit userspace on parisc.
And we don't have a toolchain that you can pass -m32/-m64 to; you have
to explicitly build a hppa64-linux-gnu toolchain.  Another thing we try
and make user-friendly is that if you're building the parisc kernel on
a non-parisc machine, you need to use a cross-compiler, so we autodetect
that case for you.

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
