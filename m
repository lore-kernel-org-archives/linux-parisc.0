From: John David Anglin <dave.anglin@bell.net>
Subject: [PATC] parisc: Remove IRQF_DISABLED
Date: Sun, 13 Jan 2013 16:57:55 -0500
Message-ID: <BLU0-SMTP215580C9DC496C96650B2B972F0@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-33--297529737"
Cc: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-33--297529737
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

This patch removes IRQF_DISABLED from irq.c.  See comment in  
interrupt.h:

  * IRQF_DISABLED - keep irqs disabled when calling the action handler.
  *                 DEPRECATED. This flag is a NOOP and scheduled to  
be removed

Signed-off-by: John David Anglin <dave.anglin@bell.net>


--Apple-Mail-33--297529737
Content-Disposition: attachment; filename="irq.c.d.txt"
Content-Type: text/plain; x-unix-mode=0644; name="irq.c.d.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index 0299d63..8094d3e 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -379,14 +379,14 @@ void do_cpu_irq_mask(struct pt_regs *regs)
 static struct irqaction timer_action = {
 	.handler = timer_interrupt,
 	.name = "timer",
-	.flags = IRQF_DISABLED | IRQF_TIMER | IRQF_PERCPU | IRQF_IRQPOLL,
+	.flags = IRQF_TIMER | IRQF_PERCPU | IRQF_IRQPOLL,
 };
 
 #ifdef CONFIG_SMP
 static struct irqaction ipi_action = {
 	.handler = ipi_interrupt,
 	.name = "IPI",
-	.flags = IRQF_DISABLED | IRQF_PERCPU,
+	.flags = IRQF_PERCPU,
 };
 #endif
 

--Apple-Mail-33--297529737
Content-Type: text/plain; charset="US-ASCII"; format=flowed
Content-Transfer-Encoding: 7bit



Dave
--
John David Anglin	dave.anglin@bell.net


--Apple-Mail-33--297529737--
