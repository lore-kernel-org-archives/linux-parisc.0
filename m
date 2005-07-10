From: Olaf Hering <olh@suse.de>
Subject: [parisc-linux] [PATCH 5/82] remove linux/version.h include from
	arch/parisc
Date: Sun, 10 Jul 2005 19:35:13 +0000
Message-ID: <39063.433421734$1416624552@news.gmane.org>
References: <20050710193508.0.PmFpst2252.2247.olh@nectarine.suse.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=utf-8
Cc: parisc-linux@parisc-linux.org
To: Andrew Morton <akpm@osdl.org>,
 linux-kernel@vger.kernel.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050710193508.0.PmFpst2252.2247.olh@nectarine.suse.de>  
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


changing CONFIG_LOCALVERSION rebuilds too much, for no appearent reason.

Signed-off-by: Olaf Hering <olh@suse.de>

arch/parisc/kernel/asm-offsets.c |    1 -
1 files changed, 1 deletion(-)

Index: linux-2.6.13-rc2-mm1/arch/parisc/kernel/asm-offsets.c
===================================================================
--- linux-2.6.13-rc2-mm1.orig/arch/parisc/kernel/asm-offsets.c
+++ linux-2.6.13-rc2-mm1/arch/parisc/kernel/asm-offsets.c
@@ -30,7 +30,6 @@
#include <linux/types.h>
#include <linux/sched.h>
#include <linux/thread_info.h>
-#include <linux/version.h>
#include <linux/ptrace.h>
#include <linux/hardirq.h>

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
