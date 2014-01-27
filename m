From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] parisc64: don't use module_init for non-modular core perf code
Date: Mon, 27 Jan 2014 12:06:57 -0500
Message-ID: <1390842417-23443-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, <linux-parisc@vger.kernel.org>
To: <linux-kernel@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The perf.c code depends on CONFIG_64BIT, so it is either built-in
or absent.  It will never be modular, so using module_init as an
alias for __initcall is rather misleading.

Fix this up now, so that we can relocate module_init from
init.h into module.h in the future.  If we don't do this, we'd
have to add module.h to obviously non-modular code, and that
would be a worse thing.  Aside from it not making sense, it also
causes a ~10% increase in CPP overhead due to module.h having a
large list of headers itself -- for example compare line counts:

 device_initcall() and <linux/init.h>
	20238 arch/parisc/kernel/perf.i

 module_init() and <linux/module.h>
	22194 arch/parisc/kernel/perf.i

Direct use of __initcall is discouraged, vs prioritized ones.
Use of device_initcall is consistent with what __initcall
maps onto, and hence does not change the init order, making the
impact of this change zero.   Should someone with real hardware
for boot testing want to change it later to arch_initcall or
something different, they can do that at a later date.

Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---

[patch will be added to init cleanup series:
   http://git.kernel.org/cgit/linux/kernel/git/paulg/init.git/  ]

 arch/parisc/kernel/perf.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/parisc/kernel/perf.c b/arch/parisc/kernel/perf.c
index ba0c053e25ae..518f4f5f1f43 100644
--- a/arch/parisc/kernel/perf.c
+++ b/arch/parisc/kernel/perf.c
@@ -543,6 +543,7 @@ static int __init perf_init(void)
 
 	return 0;
 }
+device_initcall(perf_init);
 
 /*
  * perf_start_counters(void)
@@ -847,5 +848,3 @@ printk("perf_rdr_write\n");
 	}
 printk("perf_rdr_write done\n");
 }
