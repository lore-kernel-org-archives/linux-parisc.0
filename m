From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Fwd: [PATCH] parisc: pass through '\t' to early (iodc) console
Date: Sun, 18 Jul 2010 21:07:25 -0400
Message-ID: <20100719010725.GN10884@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This should fix the hang, JDA.

Sorry, looks like Linus missed it when he came back from his
scuba diving trip.

I'll resend it in the morning.

--Kyle

----- Forwarded message from Kyle McMartin <kyle@mcmartin.ca> -----

Date: Mon, 14 Jun 2010 12:02:27 -0400
From: Kyle McMartin <kyle@mcmartin.ca>
To: linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: pass through '\t' to early (iodc) console
Sender: linux-parisc-owner@vger.kernel.org
Message-ID: <20100614160227.GK20317@bombadil.infradead.org>
User-Agent: Mutt/1.5.19 (2009-01-05)

The firmware handles '\t' internally, so stop trying to emulate it
(which, incidentally, had a bug in it.)

Fixes a really weird hang at bootup in rcu_bootup_announce, which,
as far as I can tell, is the first printk in the core kernel to use
a tab as the first character.

Signed-off-by: Kyle McMartin <kyle@parisc-linux.org>
---
 arch/parisc/kernel/firmware.c |   12 ++----------
 1 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index 4c247e0..df971fa 100644
--- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -1123,7 +1123,6 @@ static char __attribute__((aligned(64))) iodc_dbuf[4096];
  */
 int pdc_iodc_print(const unsigned char *str, unsigned count)
 {
-	static int posx;        /* for simple TAB-Simulation... */
 	unsigned int i;
 	unsigned long flags;
 
@@ -1133,19 +1132,12 @@ int pdc_iodc_print(const unsigned char *str, unsigned count)
 			iodc_dbuf[i+0] = '\r';
 			iodc_dbuf[i+1] = '\n';
 			i += 2;
-			posx = 0;
 			goto print;
-		case '\t':
-			while (posx & 7) {
-				iodc_dbuf[i] = ' ';
-				i++, posx++;
-			}
-			break;
 		case '\b':	/* BS */
-			posx -= 2;
+			i--; /* overwrite last */
 		default:
 			iodc_dbuf[i] = str[i];
-			i++, posx++;
+			i++;
 			break;
 		}
 	}
-- 
1.7.0.1

--
To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html


----- End forwarded message -----
