From: Joel Soete <soete.joel@scarlet.be>
Subject: Yet another ccio fix idea?
Date: Sun, 09 Mar 2008 13:55:15 +0000
Message-ID: <47D3EC43.3070101@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: Kyle McMartin <kyle@parisc-linux.org>,
	Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello Grant,

Always tracking this ccio-dma bug, I figure out this stuff could be helpfull:
--- a/drivers/parisc/ccio-dma.c	2008-03-09 12:55:00.000000000 +0000
+++ b/drivers/parisc/ccio-dma.c	2008-03-09 12:55:21.000000000 +0000
@@ -802,7 +802,7 @@
  			 * Hopefully someone figures out how to patch (NOP) the
  			 * FDC/SYNC out at boot time.
  			 */
-			asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr[7]));
+			asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr));

What's your opinion?

Tx,
	r.
