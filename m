From: Helge Deller <deller@gmx.de>
Subject: [PATCH] fix comment in Light-weight-syscall code
Date: Thu, 10 Jul 2008 22:04:15 +0200
Message-ID: <200807102204.15886.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: linux-parisc@vger.kernel.org,
	"Carlos O'Donell" <carlos@systemhalted.org>
To: kyle@mcmartin.ca
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The comment for the lws-atomic system call userspace helper 
function mentions r22 and r23 as input registers, but I couldn't 
find any usage of those registers in the code.
This patch fixes this and corrects another small typo as well.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index 69b6eeb..ae45262 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -368,11 +368,11 @@ tracesys_sigexit:
 		Light-weight-syscall code
 
 		r20 - lws number
-		r26,r25,r24,r23,r22 - Input registers
+		r26,r25,r24 - Input registers
 		r28 - Function return register
 		r21 - Error code.
 
-		Scracth: Any of the above that aren't being
+		Scratch: Any of the above that aren't being
 		currently used, including r1. 
 
 		Return pointer: r31 (Not usable)

