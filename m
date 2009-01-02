From: Ingo Molnar <mingo@elte.hu>
Subject: [PATCH] kbuild: Remove gcc 4.1.0 quirk from init/main.c
Date: Fri, 2 Jan 2009 16:21:24 +0100
Message-ID: <20090102152124.GA19091@elte.hu>
References: <alpine.LFD.2.00.0812310942110.5086@localhost.localdomain> <20081231.141408.60544902.davem@davemloft.net> <20090102115547.GB3027@elte.hu> <200901021443.58769.bzolnier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: David Miller <davem@davemloft.net>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	akpm@linux-foundation.org, rdreier@cisco.com,
	ian.campbell@citrix.com, jeremy.fitzhardinge@citrix.com,
	deller@gmx.de, rusty@rustcorp.com.au, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kyle@mcmartin.ca, randolph@tausq.org,
	sam@ravnborg.org, dave@hiauly1.hia.nrc.ca
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200901021443.58769.bzolnier@gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


* Bartlomiej Zolnierkiewicz <bzolnier@gmail.com> wrote:

> On Friday 02 January 2009, Ingo Molnar wrote:
> > 
> > * David Miller <davem@davemloft.net> wrote:
> > 
> > > From: Linus Torvalds <torvalds@linux-foundation.org>
> > > Date: Wed, 31 Dec 2008 13:22:53 -0800 (PST)
> > > 
> > > > On Wed, 31 Dec 2008, Andrew Morton wrote:
> > > > > 
> > > > > Adrian claimed that it was gcc-4.1.0 and 4.1.1 only.  He proposed
> > > > > banning them: http://lkml.org/lkml/2008/8/5/444
> > > > 
> > > > If it really is just those releases, then yes, considering the number 
> > > > of cases we apparently have, and considering how ugly it is in some 
> > > > cases to move the weak function anywhere else, maybe banning those 
> > > > versions is the proper thing to do.
> > > > 
> > > > It probably won't hurt very many people - yeah, some people will be 
> > > > forced to upgrade, but I have this memory of early 4.1 having had 
> > > > other bugs anyway, so it's probably a good idea.
> > > 
> > > I think this is probably the best way to handle this.
> > 
> > okay - to move this matter from the discussion-space to the 
> > solution-space, how about the patch below? (tested on x86 with a 
> > non-affected compiler version.)
> 
> ...or we can just merge Adrian's patch from June 2008 which also fixes 
> the issue nicely.

didnt know about that patch, but yeah, sure.

> OTOH your patch has an advantage of addressing the problem in the more 
> appropriate place (include/linux/compiler.h) and from what I see allows 
> us to remove previous gcc 4.1.0 check from init/main.c?

Good spotting - find followup cleanup patch below.

	Ingo

------------------->
>From d23cbaaa342e5555a919a543095d656415a55950 Mon Sep 17 00:00:00 2001
From: Ingo Molnar <mingo@elte.hu>
Date: Fri, 2 Jan 2009 16:16:16 +0100
Subject: [PATCH] kbuild: Remove gcc 4.1.0 quirk from init/main.c

Impact: cleanup

We now have a cleaner check for gcc 4.1.0/4.1.1 trouble in
include/linux/compiler.h, so remove the 4.1.0 quirk from
init/main.c.

Reported-by: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Signed-off-by: Ingo Molnar <mingo@elte.hu>
---
 init/main.c |    9 ---------
 1 files changed, 0 insertions(+), 9 deletions(-)

diff --git a/init/main.c b/init/main.c
index 2a7ce0f..5ced153 100644
--- a/init/main.c
+++ b/init/main.c
@@ -75,15 +75,6 @@
 #include <asm/smp.h>
 #endif
 
-/*
- * This is one of the first .c files built. Error out early if we have compiler
- * trouble.
- */
-
-#if __GNUC__ == 4 && __GNUC_MINOR__ == 1 && __GNUC_PATCHLEVEL__ == 0
-#warning gcc-4.1.0 is known to miscompile the kernel.  A different compiler version is recommended.
-#endif
