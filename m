From: Meelis Roos <mroos@linux.ee>
Subject: [PARISC] fix pacache .size with new binutils
Date: Mon, 21 Mar 2011 22:18:56 +0200 (EET)
Message-ID: <alpine.SOC.1.00.1103212212040.27981@math.ut.ee>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Currently, 2.6.38 compile fails on parisc64 because binutils complains 
that .size expression does not evaluate to a constant. The problem is 
confusion between flush_alias_page and flush_user_dcache_range_asm.

This patch fixes pacache.s compilation by adding ENDPROC to flush_alias 
page and ENTRY and correct ENDPROC to flush_user_dcache_range_asm.

Signed-off-by: Meelis Roos <mroos@linux.ee>

diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index 09b77b2..f3d7da6 100644
--- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -842,11 +842,10 @@ ENTRY(flush_alias_page)
 	.exit
 
 	.procend
+ENDPROC(flush_alias_page)
 #endif
 
-	.export flush_user_dcache_range_asm
