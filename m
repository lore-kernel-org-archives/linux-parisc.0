From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when
Date: Sun, 21 Dec 2008 12:27:42 -0500 (EST)
Message-ID: <20081221172742.C1BB54E99@hiauly1.hia.nrc.ca>
References: <20081221152017.102C84F19@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@infradead.org, deller@gmx.de, linux-parisc@vger.kernel.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081221152017.102C84F19@hiauly1.hia.nrc.ca> from "John David Anglin" at Dec 21, 2008 10:20:16 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> I think the bug may be in flush_user_cache_page_non_current.  It hijacks
> sr3 temporarily and I don't think cr8 is updated when this is done.  The
> switch may need to be atomic.

The following might fix the protection ID bug.

--- cache.c.orig	2008-07-17 21:24:46.000000000 -0400
+++ cache.c	2008-12-21 11:53:54.000000000 -0500
@@ -312,14 +312,14 @@
 
 	/* make us current */
 	mtctl(__pa(vma->vm_mm->pgd), 25);
-	mtsp(vma->vm_mm->context, 3);
+	load_context(vma->vm_mm->context);
 
 	flush_user_dcache_page(vmaddr);
 	if(vma->vm_flags & VM_EXEC)
 		flush_user_icache_page(vmaddr);
 
 	/* put the old current process back */
-	mtsp(space, 3);
+	load_context(space);
 	mtctl(pgd, 25);
 	preempt_enable();
 }

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
