From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH next 2/2] PARISC: iosapic: fix build breakage
Date: Fri, 20 Mar 2009 13:00:11 +0300
Message-ID: <20090320100011.GB26020@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: kyle@mcmartin.ca, linux-parisc@vger.kernel.org,
	linux-next@vger.kernel.org
Return-path: <linux-next-owner@vger.kernel.org>
List-ID: <linux-next.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

drivers/parisc/iosapic.c:717: error: incompatible types in assignment

irq_desc::affinity was changed from cpumask_t to cpumask_var_t in
7f7ace0cda (cpumask: update irq_desc to use cpumask_var_t)

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

 drivers/parisc/iosapic.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/parisc/iosapic.c b/drivers/parisc/iosapic.c
index 501aaf1..73348c4 100644
--- a/drivers/parisc/iosapic.c
+++ b/drivers/parisc/iosapic.c
@@ -714,7 +714,7 @@ static void iosapic_set_affinity_irq(unsigned int irq,
 	if (dest_cpu < 0)
 		return;
 
-	irq_desc[irq].affinity = cpumask_of_cpu(dest_cpu);
+	cpumask_copy(irq_desc[irq].affinity, cpumask_of(dest_cpu));
 	vi->txn_addr = txn_affinity_addr(irq, dest_cpu);
 
 	spin_lock_irqsave(&iosapic_lock, flags);
