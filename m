From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 32/66] arch/parisc/include/asm/parport.h: Checkpatch cleanup
Date: Sat, 27 Feb 2010 17:51:13 +0100
Message-ID: <1267289508-31031-33-git-send-email-andrea.gelmini@gelma.net>
References: <1267289508-31031-1-git-send-email-andrea.gelmini@gelma.net>
Cc: Andrea Gelmini <andrea.gelmini@gelma.net>,
	Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1267289508-31031-1-git-send-email-andrea.gelmini@gelma.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

arch/parisc/include/asm/parport.h:1: ERROR: trailing whitespace
arch/parisc/include/asm/parport.h:11: WARNING: space prohibited between function name and open parenthesis '('

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/parisc/include/asm/parport.h |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/include/asm/parport.h b/arch/parisc/include/asm/parport.h
index 00d9cc3..5cbf98b 100644
--- a/arch/parisc/include/asm/parport.h
+++ b/arch/parisc/include/asm/parport.h
@@ -1,4 +1,4 @@
-/* 
+/*
  *
  * parport.h: ia32-compatible parport initialisation
  *
@@ -8,8 +8,7 @@
 #define _ASM_PARPORT_H 1
 
 
-static int __devinit parport_pc_find_nonpci_ports (int autoirq, int autodma)
-{
+static int __devinit parport_pc_find_nonpci_ports (int autoirq, int autodma) {
 	/* nothing ! */
 	return 0;
 }
-- 
1.7.0.90.g251a4

