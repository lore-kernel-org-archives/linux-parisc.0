From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: MAINTAINERS - add sound, video and documentation
 references
Date: Thu, 30 May 2013 15:48:07 +0200
Message-ID: <20130530134807.GA3300@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/MAINTAINERS b/MAINTAINERS
index fd3a495..9fc8e2a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6087,7 +6087,13 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jejb/parisc-2.6.git
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git
 S:	Maintained
 F:	arch/parisc/
+F:	Documentation/parisc/
 F:	drivers/parisc/
+F:	drivers/char/agp/parisc-agp.c
+F:	drivers/video/sti*
+F:	drivers/video/console/sti*
+F:	drivers/video/logo/logo_parisc*
+F:	sound/parisc/
 
 PC87360 HARDWARE MONITORING DRIVER
 M:	Jim Cromie <jim.cromie@gmail.com>
