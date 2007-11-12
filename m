From: Frank Lichtenheld <frank@lichtenheld.de>
Subject: [parisc-linux] [PATCH] [PARISC] decode_exc: include linux/kernel.h
	for printk
Date: Mon, 12 Nov 2007 11:33:18 +0100
Message-ID: <1194863598-22846-1-git-send-email-frank@lichtenheld.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: Frank Lichtenheld <frank@lichtenheld.de>,
 parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

arch/parisc/math-emu/built-in.o: In function `decode_fpu':
(.text.decode_fpu+0x24c): undefined reference to `printk'

Signed-off-by: Frank Lichtenheld <frank@lichtenheld.de>
---
 arch/parisc/math-emu/decode_exc.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

 Doesn't normally fail, but somehow when playing with randconfig it did.

diff --git a/arch/parisc/math-emu/decode_exc.c b/arch/parisc/math-emu/decode_exc.c
index 66c8a9f..4e65072 100644
--- a/arch/parisc/math-emu/decode_exc.c
+++ b/arch/parisc/math-emu/decode_exc.c
@@ -46,6 +46,7 @@
 #include "dbl_float.h"
 #include "cnv_float.h"
 /* #include "types.h" */
+#include <linux/kernel.h>
 #include <asm/signal.h>
 #include <asm/siginfo.h>
 /* #include <machine/sys/mdep_private.h> */
-- 
1.5.3.4

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
