From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: [parisc] [PATCH] timer_interrupt: Fix "SLOW!" warning on rp3440
Date: Sat, 12 Mar 2011 12:08:32 -0500
Message-ID: <20110312170831.GA15698@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The attached change fixes the "SLOW!" timer_interrupt warning that I
occassionally see on my rp3440 (800 MHz).  We need to avoid using the
expensive div/mul method.  I have seen instances where it takes more
than 0x7000 cycles.

Signed-off-by: John David Anglin  <dave.anglin@nrc-cnrc.gc.ca>

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index 05511cc..63071c4 100644
--- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -76,7 +76,7 @@ irqreturn_t __irq_entry timer_interrupt(int irq, void *dev_id)
 
 	cycles_elapsed = now - next_tick;
 
-	if ((cycles_elapsed >> 6) < cpt) {
+	if ((cycles_elapsed >> 7) < cpt) {
 		/* use "cheap" math (add/subtract) instead
 		 * of the more expensive div/mul method
 		 */
