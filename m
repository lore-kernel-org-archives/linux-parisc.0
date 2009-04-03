From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH] stifb: should depend on STI_CONSOLE
Date: Fri, 3 Apr 2009 17:33:32 +0400
Message-ID: <20090403133332.GA29437@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: kyle@mcmartin.ca, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Fix this build error when CONFIG_STI_CONSOLE is not set
drivers/video/stifb.c:1337: undefined reference to `sti_get_rom'

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

 drivers/video/Kconfig |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index ffe2f27..cfb2014 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -616,6 +616,8 @@ config FB_STI
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select STI_CONSOLE
+	select VT
 	default y
 	---help---
 	  STI refers to the HP "Standard Text Interface" which is a set of
