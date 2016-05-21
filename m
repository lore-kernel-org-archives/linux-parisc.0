From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 0210/1529] Fix typo
Date: Sat, 21 May 2016 14:03:32 +0200
Message-ID: <20160521120332.10866-1-andrea.gelmini@gelma.net>
Cc: trivial@kernel.org, jejb@parisc-linux.org, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: andrea.gelmini@gelma.net
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/parisc/math-emu/fpudispatch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/math-emu/fpudispatch.c b/arch/parisc/math-emu/fpudispatch.c
index 673b73e..18df123 100644
--- a/arch/parisc/math-emu/fpudispatch.c
+++ b/arch/parisc/math-emu/fpudispatch.c
@@ -184,7 +184,7 @@ static void parisc_linux_get_fpu_type(u_int fpregs[])
 
 /*
  * this routine will decode the excepting floating point instruction and
- * call the approiate emulation routine.
+ * call the appropriate emulation routine.
  * It is called by decode_fpu with the following parameters:
  * fpudispatch(current_ir, unimplemented_code, 0, &Fpu_register)
  * where current_ir is the instruction to be emulated,
-- 
2.8.2.534.g1f66975

