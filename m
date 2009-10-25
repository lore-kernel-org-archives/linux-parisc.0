From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: add CALLER_ADDR{0-6} macros
Date: Sun, 25 Oct 2009 22:48:36 +0100
Message-ID: <20091025214836.GA15038@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>,
	Randolph Chung <tausq@debian.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>


diff --git a/arch/parisc/include/asm/ftrace.h b/arch/parisc/include/asm/ftrace.h
index 2fa05dd..72c0faf 100644
--- a/arch/parisc/include/asm/ftrace.h
+++ b/arch/parisc/include/asm/ftrace.h
@@ -20,6 +20,20 @@ struct ftrace_ret_stack {
  * Defined in entry.S
  */
 extern void return_to_handler(void);
+
+
+extern unsigned long return_address(unsigned int);
+
+#define HAVE_ARCH_CALLER_ADDR
+
+#define CALLER_ADDR0 ((unsigned long)__builtin_return_address(0))
+#define CALLER_ADDR1 return_address(1)
+#define CALLER_ADDR2 return_address(2)
+#define CALLER_ADDR3 return_address(3)
+#define CALLER_ADDR4 return_address(4)
+#define CALLER_ADDR5 return_address(5)
+#define CALLER_ADDR6 return_address(6)
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_PARISC_FTRACE_H */
diff --git a/arch/parisc/kernel/unwind.c b/arch/parisc/kernel/unwind.c
index 69dad5a..6c631bf 100644
--- a/arch/parisc/kernel/unwind.c
+++ b/arch/parisc/kernel/unwind.c
@@ -417,3 +429,31 @@ int unwind_to_user(struct unwind_frame_info *info)
 
 	return ret;
 }
+
+unsigned long return_address(unsigned int level)
+{
+	struct unwind_frame_info info;
+	struct pt_regs r;
+	unsigned long sp;
+
+	/* initialize unwind info */
+	asm volatile ("copy %%r30, %0" : "=r"(sp));
+	memset(&r, 0, sizeof(struct pt_regs));
+	r.iaoq[0] = (unsigned long) current_text_addr();
+	r.gr[2] = (unsigned long) __builtin_return_address(0);
+	r.gr[30] = sp;
+	unwind_frame_init(&info, current, &r);
+
+	/* unwind stack */
+	++level;
+	do {
+		if (unwind_once(&info) < 0 || info.ip == 0)
+			return 0;
+		if (!__kernel_text_address(info.ip)) {
+			return 0;
+		}
+	} while (info.ip && level--);
+
+	return info.ip;
+}
+
