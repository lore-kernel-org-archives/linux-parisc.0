From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: wire up sys_recvmmsg
Date: Tue, 22 Dec 2009 23:50:33 +0100
Message-ID: <20091222225033.GA6996@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/unistd.h b/arch/parisc/include/asm/unistd.h
index cda1583..ee63634 100644
--- a/arch/parisc/include/asm/unistd.h
+++ b/arch/parisc/include/asm/unistd.h
@@ -811,8 +811,9 @@
 #define __NR_pwritev		(__NR_Linux + 316)
 #define __NR_rt_tgsigqueueinfo	(__NR_Linux + 317)
 #define __NR_perf_event_open	(__NR_Linux + 318)
+#define __NR_recvmmsg		(__NR_Linux + 319)
 
-#define __NR_Linux_syscalls	(__NR_perf_event_open + 1)
+#define __NR_Linux_syscalls	(__NR_recvmmsg + 1)
 
 
 #define __IGNORE_select		/* newselect */
diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
index 01c4fcf..a0c54cf 100644
--- a/arch/parisc/kernel/syscall_table.S
+++ b/arch/parisc/kernel/syscall_table.S
@@ -417,6 +417,7 @@
 	ENTRY_COMP(pwritev)
 	ENTRY_COMP(rt_tgsigqueueinfo)
 	ENTRY_SAME(perf_event_open)
+	ENTRY_COMP(recvmmsg)
 
 	/* Nothing yet */
 
