From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: [PATCH] [parisc] do not install modules when installing kernel
Date: Fri, 01 Mar 2013 23:23:11 +0100
Message-ID: <3763734.hDYRZelWPG@donald.sf-tec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
To: linux-parisc@vger.kernel.org, deller@gmx.de,
	James.Bottomley@hansenpartnership.com
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

PA-RISC is the only arch that installs the modules when installing the =
kernel.

Signed-off-by: Rolf Eike Beer <eike-kernel@sf-tec.de>
---
 arch/parisc/Makefile | 4 +---
 1 Datei ge=E4ndert, 1 Zeile hinzugef=FCgt(+), 3 Zeilen entfernt(-)

diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index ed9a14c..01d95e2 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -113,12 +113,10 @@ palo: vmlinux
 # Shorthands for known targets not supported by parisc, use vmlinux as=
 default
 Image zImage bzImage: vmlinux
=20
-kernel_install: vmlinux
+install: vmlinux
 	sh $(src)/arch/parisc/install.sh \
 			$(KERNELRELEASE) $< System.map "$(INSTALL_PATH)"
=20
-install: kernel_install modules_install
