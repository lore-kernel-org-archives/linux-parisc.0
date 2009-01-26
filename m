From: Helge Deller <deller@gmx.de>
Subject: parisc: fix 64bit build
Date: Mon, 26 Jan 2009 22:24:38 +0100
Message-ID: <497E2A16.7070606@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc <linux-parisc@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/assembly.h b/arch/parisc/include/asm/assembly.h
index ab7cc37..89fb400 100644
--- a/arch/parisc/include/asm/assembly.h
+++ b/arch/parisc/include/asm/assembly.h
@@ -79,6 +79,7 @@
 
 #include <asm/asm-offsets.h>
 #include <asm/page.h>
+#include <asm/types.h>
 
 #include <asm/asmregs.h>
 
