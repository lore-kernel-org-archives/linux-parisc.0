From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] parisc, don't claim cpu irqs more than once
Date: Sat, 11 Jun 2011 21:46:41 -0400
Message-ID: <20110612014640.GA19605@hiauly1.hia.nrc.ca>
References: <20110611185524.GA1369@hiauly1.hia.nrc.ca> <1617203.1AoiWjTfrU@donald.sf-tec.de> <20110611205646.GA26431@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	linux-parisc@vger.kernel.org, kyle@mcmartin.ca, deller@gmx.de,
	jejb@parisc-linux.org
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110611205646.GA26431@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 11 Jun 2011, John David Anglin wrote:

> > Shouldn't this be bool then? Now that we have it.
> 
> Yes but I would like to here with this approach is acceptable.  Another
> alternative might be a function init_IRQ_SMP that doesn't call claim_cpu_irqs.

Looking at this a bit more, I believe this change is better.

Signed-off-by: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Cc: Kyle McMartin <kyle@mcmartin.ca>
Cc: Helge Deller <deller@gmx.de>
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>

diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index c0b1aff..0299d63 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -410,11 +410,13 @@ void __init init_IRQ(void)
 {
 	local_irq_disable();	/* PARANOID - should already be disabled */
 	mtctl(~0UL, 23);	/* EIRR : clear all pending external intr */
-	claim_cpu_irqs();
 #ifdef CONFIG_SMP
-	if (!cpu_eiem)
+	if (!cpu_eiem) {
+		claim_cpu_irqs();
 		cpu_eiem = EIEM_MASK(IPI_IRQ) | EIEM_MASK(TIMER_IRQ);
+	}
 #else
+	claim_cpu_irqs();
 	cpu_eiem = EIEM_MASK(TIMER_IRQ);
 #endif
         set_eiem(cpu_eiem);	/* EIEM : enable all external intr */

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
