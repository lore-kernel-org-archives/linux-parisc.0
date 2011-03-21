From: Meelis Roos <mroos@linux.ee>
Subject: Re: [PARISC] fix pacache .size with new binutils
Date: Mon, 21 Mar 2011 22:47:15 +0200 (EET)
Message-ID: <alpine.SOC.1.00.1103212243440.27981@math.ut.ee>
References: <alpine.SOC.1.00.1103212212040.27981@math.ut.ee> <1300739513.10634.39.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1300739513.10634.39.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> This won't apply because of upstream changes to the file
> (flush_alias_page got removed) ... does the problem even still exist
> upstream?

Oops, did not try in last 2 days. Upstream has changed and removed this 
function and the problem is gone and the patch collapses to just a 
cleanup - do you want this:

Fix style of flush_user_dcache_range_asm procedure declaration in 
arch/parisc/kernel/pacache.s to be consistent with other assembly 
procedures.

Signed-off-by: Meelis Roos <mroos@linux.ee>

diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index a858236..93ff3d9 100644
--- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -817,10 +817,7 @@ ENTRY(purge_kernel_dcache_page)
 	.procend
 ENDPROC(purge_kernel_dcache_page)
 
-
-	.export flush_user_dcache_range_asm
