From: Russell King <rmk@arm.linux.org.uk>
Subject: [parisc-linux] [CFT 10/29] Add parisc_bus_type probe and remove
	methods
Date: Thu, 05 Jan 2006 14:34:38 +0000
Message-ID: <20060105142951.13.10__8313.83396075598$1416624581$gmane$org@flint.arm.linux.org.uk>
References: <20060105142951.13.01@flint.arm.linux.org.uk>
Cc: Greg K-H <greg@kroah.com>,
 parisc <parisc-linux@parisc-linux.org>
To: LKML <linux-kernel@vger.kernel.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <20060105142951.13.01@flint.arm.linux.org.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>

---
 arch/parisc/kernel/drivers.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff -up -x BitKeeper -x ChangeSet -x SCCS -x _xlk -x *.orig -x *.rej -x .git linus/arch/parisc/kernel/drivers.c linux/arch/parisc/kernel/drivers.c
--- linus/arch/parisc/kernel/drivers.c	Sun Nov  6 22:14:46 2005
+++ linux/arch/parisc/kernel/drivers.c	Sun Nov 13 16:08:49 2005
@@ -173,8 +173,6 @@ int register_parisc_driver(struct parisc
 	WARN_ON(driver->drv.probe != NULL);
 	WARN_ON(driver->drv.remove != NULL);
 
-	driver->drv.probe = parisc_driver_probe;
-	driver->drv.remove = parisc_driver_remove;
 	driver->drv.name = driver->name;
 
 	return driver_register(&driver->drv);
@@ -570,6 +568,8 @@ struct bus_type parisc_bus_type = {
 	.name = "parisc",
 	.match = parisc_generic_match,
 	.dev_attrs = parisc_device_attrs,
+	.probe = parisc_driver_probe,
+	.remove = parisc_driver_remove,
 };
 
 /**
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
