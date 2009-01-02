From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] kbuild: Disallow GCC 4.1.0 / 4.1.1
Date: Fri, 2 Jan 2009 18:44:24 +0100
Message-ID: <20090102174424.GA14065@elte.hu>
References: <alpine.LFD.2.00.0812310942110.5086@localhost.localdomain> <20081231105425.9ccac21d.akpm@linux-foundation.org> <alpine.LFD.2.00.0812311318420.5086@localhost.localdomain> <20081231.141408.60544902.davem@davemloft.net> <20090102115547.GB3027@elte.hu> <alpine.LFD.2.00.0901020844070.5086@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: David Miller <davem@davemloft.net>, akpm@linux-foundation.org,
	rdreier@cisco.com, ian.campbell@citrix.com,
	jeremy.fitzhardinge@citrix.com, deller@gmx.de,
	rusty@rustcorp.com.au, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kyle@mcmartin.ca, randolph@tausq.org,
	sam@ravnborg.org, dave@hiauly1.hia.nrc.ca
To: Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.00.0901020844070.5086@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> 
> 
> On Fri, 2 Jan 2009, Ingo Molnar wrote:
> > --- a/include/linux/compiler.h
> > +++ b/include/linux/compiler.h
> > @@ -36,12 +36,25 @@ extern void __chk_io_ptr(const volatile void __iomem *);
> >  
> >  #ifdef __KERNEL__
> >  
> > -#if __GNUC__ >= 4
> > +/*
> > + * GCC 4.1.0 and 4.1.1 has a bug that can miscompile __weak symbols,
> > + * by inlining __weak functions into same-file call sites - breaking the
> > + * kernel if the __weak symbol is overriden later on.
> > + *
> > + * We have not found a clean way to work around this bug on the source
> > + * code level, so we do not allow these compilers (which are quite
> > + * rare these days, have other bugs and are superceded by the 4.1.2
> > + * bugfix release anyway):
> > + */
> > +#define gcc41_inlining_bug \
> > +	(__GNUC__ == 4 && __GNUC_MINOR__ == 1 && __GNUC_PATCHLEVEL__ <= 1)
> > +
> > +#if __GNUC__ >= 4 && !gcc41_inlining_bug
> >  # include <linux/compiler-gcc4.h>
> 
> I think this is wrong.
> 
> Just move the check into <linux/compiler-gcc4.h>
> 
> It makes no sense to do stuff that is specific to gcc4 in the general 
> gcc header file. It seems you did this just in order to re-use a (bad) 
> generic error case.

yeah. I first hacked the generic check then saw how ugly the end result 
was and moved it one level higher. Which was less ugly than where it came 
from and not much worse than the starting point (so it passed my filters) 
but still not clean enough (so it didnt pass your filters).

How about the patch below instead? It cleans up the generic check by 
splitting all the per-major-version checks out into gcc4 and gcc3.

(still untested)

	Ingo

------------->
>From bb951ce0794f0e5974b834eb14e974a0a2c119db Mon Sep 17 00:00:00 2001
From: Ingo Molnar <mingo@elte.hu>
Date: Fri, 2 Jan 2009 12:46:22 +0100
Subject: [PATCH] kbuild: Disallow GCC 4.1.0 / 4.1.1

Impact: fix crashes that can trigger if built with GCC 4.1.0 or 4.1.1

GCC 4.1.0 and 4.1.1 has a bug that can miscompile __weak symbols,
by inlining __weak functions into same-file call sites - breaking the
kernel if the __weak symbol is overriden later on.

In the past we tried to work around this problem by artificially
isolating call site and definition site - but these bugs tend to
pop up regularly:

 43a2563: sparseirq: move __weak symbols into separate compilation unit
 13a0c3c: sparseirq: work around compiler optimizing away __weak functions

And Linus has extended Sparse to report same-file callsites for __weak
symbols - which gave two dozen hits.

We have not found a clean way to work around this bug on the source
code level (noinline and explicit barrier()s are ignored by GCC), so we do
not allow these compilers (which are quite rare these days, have other bugs
and are superceded by the 4.1.2 bugfix release anyway).

Kernel builds under gcc 410 or 411 will now fail with this error message:

  Sorry, GCC 4.1.0/4.1.1 are too buggy to build the kernel - please
  upgrade to 4.1.2 or later versions.

Signed-off-by: Ingo Molnar <mingo@elte.hu>
---
 include/linux/compiler-gcc3.h |    4 ++++
 include/linux/compiler-gcc4.h |   14 ++++++++++++++
 include/linux/compiler.h      |    4 ++--
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/include/linux/compiler-gcc3.h b/include/linux/compiler-gcc3.h
index e5eb795..a929a6d 100644
--- a/include/linux/compiler-gcc3.h
+++ b/include/linux/compiler-gcc3.h
@@ -2,6 +2,10 @@
 #error "Please don't include <linux/compiler-gcc3.h> directly, include <linux/compiler.h> instead."
 #endif
 
+#if __GNUC_MINOR__ < 2
+# error Sorry, your compiler is too old - please upgrade it.
+#endif
+
 /* These definitions are for GCC v3.x.  */
 #include <linux/compiler-gcc.h>
 
diff --git a/include/linux/compiler-gcc4.h b/include/linux/compiler-gcc4.h
index 974f5b7..b1edc9d 100644
--- a/include/linux/compiler-gcc4.h
+++ b/include/linux/compiler-gcc4.h
@@ -2,6 +2,20 @@
 #error "Please don't include <linux/compiler-gcc4.h> directly, include <linux/compiler.h> instead."
 #endif
 
+/*
+ * GCC 4.1.0 and 4.1.1 has a bug that can miscompile __weak symbols,
+ * by inlining __weak functions into same-file call sites - breaking the
+ * kernel if the __weak symbol is overriden later on.
+ *
+ * We have not found a clean way to work around this bug on the source
+ * code level, so we do not allow these compilers (which are quite
+ * rare these days, have other bugs and are superceded by the 4.1.2
+ * bugfix release anyway):
+ */
+#if __GNUC__ == 4 && __GNUC_MINOR__ == 1 && __GNUC_PATCHLEVEL__ <= 1
+# error Sorry, GCC 4.1.0/4.1.1 are too buggy to build the kernel - please upgrade to 4.1.2 or later versions.
+#endif
+
 /* These definitions are for GCC v4.x.  */
 #include <linux/compiler-gcc.h>
 
diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index ea7c6be..18edc7a 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -38,10 +38,10 @@ extern void __chk_io_ptr(const volatile void __iomem *);
 
 #if __GNUC__ >= 4
 # include <linux/compiler-gcc4.h>
-#elif __GNUC__ == 3 && __GNUC_MINOR__ >= 2
+#elif __GNUC__ == 3
 # include <linux/compiler-gcc3.h>
 #else
-# error Sorry, your compiler is too old/not recognized.
+# error Sorry, your compiler is too old or not recognized.
 #endif
 
 #define notrace __attribute__((no_instrument_function))
