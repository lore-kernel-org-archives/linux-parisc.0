From: Helge Deller <deller@gmx.de>
Subject: [PATCH 14/14] parisc/core: Fix section mismatches
Date: Mon, 21 Aug 2017 22:23:01 +0200
Message-ID: <1503346981-28024-15-git-send-email-deller@gmx.de>
References: <1503346981-28024-1-git-send-email-deller@gmx.de>
Cc: John David Anglin <dave.anglin@bell.net>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1503346981-28024-1-git-send-email-deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/kernel/processor.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/processor.c
index 0ab3277..1dc7f79 100644
--- a/arch/parisc/kernel/processor.c
+++ b/arch/parisc/kernel/processor.c
@@ -89,7 +89,7 @@ init_percpu_prof(unsigned long cpunum)
  * (return 1).  If so, initialize the chip and tell other partners in crime 
  * they have work to do.
  */
-static int processor_probe(struct parisc_device *dev)
+static int __init processor_probe(struct parisc_device *dev)
 {
 	unsigned long txn_addr;
 	unsigned long cpuid;
@@ -414,12 +414,12 @@ show_cpuinfo (struct seq_file *m, void *v)
 	return 0;
 }
 
-static const struct parisc_device_id processor_tbl[] = {
+static const struct parisc_device_id processor_tbl[] __initconst = {
 	{ HPHW_NPROC, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, SVERSION_ANY_ID },
 	{ 0, }
 };
 
-static struct parisc_driver cpu_driver = {
+static struct parisc_driver cpu_driver __refdata = {
 	.name		= "CPU",
 	.id_table	= processor_tbl,
 	.probe		= processor_probe
-- 
2.1.0

