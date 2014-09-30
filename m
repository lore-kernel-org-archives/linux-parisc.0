From: Guenter Roeck <linux@roeck-us.net>
Subject: [RFC PATCH 12/16] unicore32: support poweroff through poweroff handler call chain
Date: Tue, 30 Sep 2014 11:00:52 -0700
Message-ID: <1412100056-15517-13-git-send-email-linux@roeck-us.net>
References: <1412100056-15517-1-git-send-email-linux@roeck-us.net>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org,
	linux-metag@vger.kernel.org, linux-mips@linux-mips.org,
	linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
	xen-devel@lists.xenproject.org, Guenter Roeck <linux@roeck-us.net>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>
To: linux-kernel@vger.kernel.org
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1412100056-15517-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-pm.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The kernel core now supports a poweroff handler call chain
to remove power from the system. Call it if pm_power_off
is set to NULL.

Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/unicore32/kernel/process.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/unicore32/kernel/process.c b/arch/unicore32/kernel/process.c
index b008e99..421fde6 100644
--- a/arch/unicore32/kernel/process.c
+++ b/arch/unicore32/kernel/process.c
@@ -66,6 +66,8 @@ void machine_power_off(void)
 {
 	if (pm_power_off)
 		pm_power_off();
+	else
+		do_kernel_poweroff();
 	machine_halt();
 }
 
-- 
1.9.1

