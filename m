From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] [PATCH] fix wrong cast in unwind_special()
Date: Sun, 29 Jul 2007 19:01:46 +0200
Message-ID: <200707291901.46374.deller__35804.4581175365$1416624422$gmane$org@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@lists.parisc-linux.org
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

fix wrong cast in unwind_special():
arch/parisc/kernel/unwind.c: In function `unwind_special':
arch/parisc/kernel/unwind.c:213: warning: initialization makes pointer from integer without a cast

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/unwind.c b/arch/parisc/kernel/unwind.c
index cf780cb..395433a 100644
--- a/arch/parisc/kernel/unwind.c
+++ b/arch/parisc/kernel/unwind.c
@@ -210,7 +210,7 @@ static int unwind_init(void)
 static int unwind_special(struct unwind_frame_info *info, unsigned long pc, int frame_size)
 {
 	void handle_interruption(int, struct pt_regs *);
-	static unsigned long *hi = (unsigned long)&handle_interruption;
+	static unsigned long *hi = (unsigned long *)&handle_interruption;
 
 	if (pc == get_func_addr(hi)) {
 		struct pt_regs *regs = (struct pt_regs *)(info->sp - frame_size - PT_SZ_ALGN);
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
