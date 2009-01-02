From: Ingo Molnar <mingo@elte.hu>
Subject: [PATCH] Disallow gcc versions 3.{0,1}
Date: Fri, 2 Jan 2009 18:54:58 +0100
Message-ID: <20090102175458.GA29512@elte.hu>
References: <alpine.LFD.2.00.0812310942110.5086@localhost.localdomain> <20081231105425.9ccac21d.akpm@linux-foundation.org> <alpine.LFD.2.00.0812311318420.5086@localhost.localdomain> <20081231.141408.60544902.davem@davemloft.net> <20090102115547.GB3027@elte.hu> <alpine.LFD.2.00.0901020844070.5086@localhost.localdomain> <alpine.LFD.2.00.0901020933370.5086@localhost.localdomain> <20090102174641.GA27287@elte.hu>
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
In-Reply-To: <20090102174641.GA27287@elte.hu>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


* Ingo Molnar <mingo@elte.hu> wrote:

> > And it all looks more logical too, imho.
> 
> yeah, agreed, much cleaner.
> 
> The gcc3 check for gcc 3.0 and 3.1 can be pushed into gcc3 as well - not 
> sure whether you fixed that. (i fixed it in the patch i just sent - but 
> i didnt notice the gcc5 mess in gcc4.h that you fixed)

ok, i see them now:

 f9d1425: Disallow gcc versions 4.1.{0,1}
 f153b82: Sanitize gcc version header includes

agreed, much cleaner.

One small issue - i think this now allows gcc 3.0 and 3.1 again - which we 
didnt before. Dont we need the patch below - am i missing something?

	Ingo

------------------->
>From 1458f25412a838968e845ec0bc1b18db70cba7cd Mon Sep 17 00:00:00 2001
From: Ingo Molnar <mingo@elte.hu>
Date: Fri, 2 Jan 2009 18:53:14 +0100
Subject: [PATCH] Disallow gcc versions 3.{0,1}

GCC 3.0 and 3.1 are too old to build a working kernel.

Signed-off-by: Ingo Molnar <mingo@elte.hu>
---
 include/linux/compiler-gcc3.h |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/include/linux/compiler-gcc3.h b/include/linux/compiler-gcc3.h
index 2befe65..8005eff 100644
--- a/include/linux/compiler-gcc3.h
+++ b/include/linux/compiler-gcc3.h
@@ -2,6 +2,10 @@
 #error "Please don't include <linux/compiler-gcc3.h> directly, include <linux/compiler.h> instead."
 #endif
 
+#if __GNUC_MINOR__ < 2
+# error Sorry, your compiler is too old - please upgrade it.
+#endif
+
 #if __GNUC_MINOR__ >= 3
 # define __used			__attribute__((__used__))
 #else
