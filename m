From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] [patch] unwinder improvements
Date: Tue, 12 Jun 2007 14:27:32 +0800
Message-ID: <466E3CD4.6000509__28332.4412689128$1416624396$gmane$org@tausq.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="------------050403020607080209030200"
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

This is a multi-part message in MIME format.
--------------050403020607080209030200
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


--------------050403020607080209030200
Content-Type: text/plain;
 name="unwind.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="unwind.diff"

- Fix unwind record processing on 64-bit systems - this was affected by the
  PAGE_OFFSET change a few months back
- Add special-case handling for "handle_interruption" so that we can rewind
  past the interruption. This is useful for seeing what caused a BUG() or 
  WARN_ON(); otherwise the unwind stops at the interruption.

Signed-off-by: Randolph Chung <tausq@debian.org>

index e70f57e..e06da53 100644
--- a/arch/parisc/kernel/unwind.c
+++ b/arch/parisc/kernel/unwind.c
@@ -16,16 +16,20 @@
 
 #include <asm/uaccess.h>
 #include <asm/assembly.h>
+#include <asm/asm-offsets.h>
+#include <asm/ptrace.h>
 
 #include <asm/unwind.h>
 
 /* #define DEBUG 1 */
 #ifdef DEBUG
 #define dbg(x...) printk(x)
 #else
 #define dbg(x...)
 #endif
 
+#define KERNEL_START (KERNEL_BINARY_TEXT_START - 0x1000)
+
 extern struct unwind_table_entry __start___unwind[];
 extern struct unwind_table_entry __stop___unwind[];
 
@@ -197,6 +201,29 @@ static int unwind_init(void)
 	return 0;
 }
 
+#ifdef CONFIG_64BIT
+#define get_func_addr(fptr) fptr[2]
+#else
+#define get_func_addr(fptr) fptr[0]
+#endif
+
+static int unwind_special(struct unwind_frame_info *info, unsigned long pc, int frame_size)
+{
+	void handle_interruption(int, struct pt_regs *);
+	static unsigned long *hi = (unsigned long)&handle_interruption;
+
+	if (pc == get_func_addr(hi)) {
+		struct pt_regs *regs = (struct pt_regs *)(info->sp - frame_size - PT_SZ_ALGN);
+		dbg("Unwinding through handle_interruption()\n");
+		info->prev_sp = regs->gr[30];
+		info->prev_ip = regs->iaoq[0];
+
+		return 1;
+	}
+
+	return 0;
+}
+
 static void unwind_frame_regs(struct unwind_frame_info *info)
 {
 	const struct unwind_table_entry *e;
@@ -310,13 +337,15 @@ static void unwind_frame_regs(struct unwind_frame_info *info)
 			}
 		}
 
-		info->prev_sp = info->sp - frame_size;
-		if (e->Millicode)
-			info->rp = info->r31;
-		else if (rpoffset)
-			info->rp = *(unsigned long *)(info->prev_sp - rpoffset);
-		info->prev_ip = info->rp;
-		info->rp = 0;
+		if (!unwind_special(info, e->region_start, frame_size)) {
+			info->prev_sp = info->sp - frame_size;
+			if (e->Millicode)
+				info->rp = info->r31;
+			else if (rpoffset)
+				info->rp = *(unsigned long *)(info->prev_sp - rpoffset);
+			info->prev_ip = info->rp;
+			info->rp = 0;
+		}
 
 		dbg("analyzing func @ %lx, setting prev_sp=%lx "
 		    "prev_ip=%lx npc=%lx\n", info->ip, info->prev_sp, 
index 7e9afa7..21fbfc5 100644
--- a/include/asm-parisc/system.h
+++ b/include/asm-parisc/system.h
@@ -188,7 +188,6 @@ static inline void set_eiem(unsigned long val)
 # define __lock_aligned __attribute__((__section__(".data.lock_aligned")))
 #endif
 
-#define KERNEL_START (0x10100000 - 0x1000)
 #define arch_align_stack(x) (x)
 
 #endif

--------------050403020607080209030200
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--------------050403020607080209030200--
