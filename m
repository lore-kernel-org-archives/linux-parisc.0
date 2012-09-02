From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH] parisc: fix possible memory leak in pat_query_module()
Date: Sun, 2 Sep 2012 22:23:59 +0800
Message-ID: <CAPgLHd-Ewsr7vUC9hrwEd-g4+Py2zMJyb+cr3wiu2+cOanYwOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: yongjun_wei@trendmicro.com.cn, linux-parisc@vger.kernel.org
To: jejb@parisc-linux.org, deller@gmx.de
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

pa_pdc_cell has been allocated in this function and so should be
freed before leaving from the error handling cases.

spatch with a semantic match is used to found this problem.
(http://coccinelle.lip6.fr/)

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 arch/parisc/kernel/inventory.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/parisc/kernel/inventory.c b/arch/parisc/kernel/inventory.c
index 08324aa..3295ef4 100644
--- a/arch/parisc/kernel/inventory.c
+++ b/arch/parisc/kernel/inventory.c
@@ -186,12 +186,14 @@ pat_query_module(ulong pcell_loc, ulong mod_index)
 
 	if (status != PDC_OK) {
 		/* no more cell modules or error */
+		kfree(pa_pdc_cell);
 		return status;
 	}
 
 	temp = pa_pdc_cell->cba;
 	dev = alloc_pa_dev(PAT_GET_CBA(temp), &(pa_pdc_cell->mod_path));
 	if (!dev) {
+		kfree(pa_pdc_cell);
 		return PDC_OK;
 	}
 


