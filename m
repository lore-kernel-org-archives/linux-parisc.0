From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 10/15] parisc: don't use module_init for non-modular core pdc_cons code
Date: Thu, 28 May 2015 20:48:08 -0400
Message-ID: <1432860493-23831-11-git-send-email-paul.gortmaker@windriver.com>
References: <1432860493-23831-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, <linux-parisc@vger.kernel.org>
To: <linux-kernel@vger.kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432860493-23831-1-git-send-email-paul.gortmaker@windriver.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The pdc_cons.c code is always built in.  It will never be modular,
so using module_init as an alias for __initcall is rather
misleading.

Fix this up now, so that we can relocate module_init from
init.h into module.h in the future.  If we don't do this, we'd
have to add module.h to obviously non-modular code, and that
would be a worse thing.

Direct use of __initcall is discouraged, vs prioritized ones.
Use of device_initcall is consistent with what __initcall
maps onto, and hence does not change the init order, making the
impact of this change zero.   Should someone with real hardware
for boot testing want to change it later to arch_initcall or
something different, they can do that at a later date.

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 arch/parisc/kernel/pdc_cons.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/parisc/kernel/pdc_cons.c b/arch/parisc/kernel/pdc_cons.c
index d5cae55195ec..10a5ae9553fd 100644
--- a/arch/parisc/kernel/pdc_cons.c
+++ b/arch/parisc/kernel/pdc_cons.c
@@ -207,8 +207,7 @@ static int __init pdc_console_tty_driver_init(void)
 
 	return 0;
 }
-
-module_init(pdc_console_tty_driver_init);
+device_initcall(pdc_console_tty_driver_init);
 
 static struct tty_driver * pdc_console_device (struct console *c, int *index)
 {
-- 
2.2.1
