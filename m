From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Fixes and cleanups in kernel uapi header files
Date: Sun, 8 Nov 2015 20:24:17 +0100
Message-ID: <20151108192417.GA4633@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This patch fixes some bugs and partly cleans up the parisc uapi header
files to what glibc defined:
- compat_semid64_ds was wrong and did not take the endianess into
  account
- ipc64_perm exported userspace types which broke building userspace
  packages on debian (e.g. trinity)
- ipc64_perm needs to use a 32bit mode_t on 64bit kernel
- msqid64_ds and semid64_ds needs unsigned longs for various struct members
- shmid64_ds exported size_t instead of __kernel_size_t

And finally add some compile-time checks for the sizes of those structs
to avoid future breakage.

Runtime-tested with the Linux Test Project (LTP) testsuite.

Cc: <stable@vger.kernel.org> # 3.18+
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/compat.h b/arch/parisc/include/asm/compat.h
index 94710cf..0448a2c 100644
--- a/arch/parisc/include/asm/compat.h
+++ b/arch/parisc/include/asm/compat.h
@@ -206,10 +206,10 @@ struct compat_ipc64_perm {
 
 struct compat_semid64_ds {
 	struct compat_ipc64_perm sem_perm;
-	compat_time_t sem_otime;
 	unsigned int __unused1;
-	compat_time_t sem_ctime;
+	compat_time_t sem_otime;
 	unsigned int __unused2;
+	compat_time_t sem_ctime;
 	compat_ulong_t sem_nsems;
 	compat_ulong_t __unused3;
 	compat_ulong_t __unused4;
diff --git a/arch/parisc/include/uapi/asm/ipcbuf.h b/arch/parisc/include/uapi/asm/ipcbuf.h
index bd956c4..790c411 100644
--- a/arch/parisc/include/uapi/asm/ipcbuf.h
+++ b/arch/parisc/include/uapi/asm/ipcbuf.h
@@ -1,6 +1,9 @@
 #ifndef __PARISC_IPCBUF_H__
 #define __PARISC_IPCBUF_H__
 
+#include <asm/bitsperlong.h>
+#include <linux/posix_types.h>
+
 /*
  * The ipc64_perm structure for PA-RISC is almost identical to
  * kern_ipc_perm as we have always had 32-bit UIDs and GIDs in the kernel.
@@ -10,16 +13,18 @@
 
 struct ipc64_perm
 {
-	key_t           key;
-	uid_t           uid;
-	gid_t           gid;
-	uid_t           cuid;
-	gid_t           cgid;
+	__kernel_key_t		key;
+	__kernel_uid_t		uid;
+	__kernel_gid_t		gid;
+	__kernel_uid_t		cuid;
+	__kernel_gid_t		cgid;
+#if __BITS_PER_LONG != 64
 	unsigned short int	__pad1;
-	mode_t          mode;
+#endif
+	__kernel_mode_t		mode;
 	unsigned short int	__pad2;
 	unsigned short int	seq;
-	unsigned int	__pad3;
+	unsigned int		__pad3;
 	unsigned long long int __unused1;
 	unsigned long long int __unused2;
 };
diff --git a/arch/parisc/include/uapi/asm/msgbuf.h b/arch/parisc/include/uapi/asm/msgbuf.h
index 3421389..2e83ac7 100644
--- a/arch/parisc/include/uapi/asm/msgbuf.h
+++ b/arch/parisc/include/uapi/asm/msgbuf.h
@@ -27,13 +27,13 @@ struct msqid64_ds {
 	unsigned int   __pad3;
 #endif
 	__kernel_time_t msg_ctime;	/* last change time */
-	unsigned int  msg_cbytes;	/* current number of bytes on queue */
-	unsigned int  msg_qnum;	/* number of messages in queue */
-	unsigned int  msg_qbytes;	/* max number of bytes on queue */
+	unsigned long msg_cbytes;	/* current number of bytes on queue */
+	unsigned long msg_qnum;		/* number of messages in queue */
+	unsigned long msg_qbytes;	/* max number of bytes on queue */
 	__kernel_pid_t msg_lspid;	/* pid of last msgsnd */
 	__kernel_pid_t msg_lrpid;	/* last receive pid */
-	unsigned int  __unused1;
-	unsigned int  __unused2;
+	unsigned long __unused1;
+	unsigned long __unused2;
 };
 
 #endif /* _PARISC_MSGBUF_H */
diff --git a/arch/parisc/include/uapi/asm/posix_types.h b/arch/parisc/include/uapi/asm/posix_types.h
index b934425..f3b5f70 100644
--- a/arch/parisc/include/uapi/asm/posix_types.h
+++ b/arch/parisc/include/uapi/asm/posix_types.h
@@ -7,8 +7,10 @@
  * assume GCC is being used.
  */
 
+#ifndef __LP64__
 typedef unsigned short		__kernel_mode_t;
 #define __kernel_mode_t __kernel_mode_t
+#endif
 
 typedef unsigned short		__kernel_ipc_pid_t;
 #define __kernel_ipc_pid_t __kernel_ipc_pid_t
diff --git a/arch/parisc/include/uapi/asm/sembuf.h b/arch/parisc/include/uapi/asm/sembuf.h
index f01d89e..c20971b 100644
--- a/arch/parisc/include/uapi/asm/sembuf.h
+++ b/arch/parisc/include/uapi/asm/sembuf.h
@@ -23,9 +23,9 @@ struct semid64_ds {
 	unsigned int	__pad2;
 #endif
 	__kernel_time_t	sem_ctime;		/* last change time */
-	unsigned int	sem_nsems;		/* no. of semaphores in array */
-	unsigned int	__unused1;
-	unsigned int	__unused2;
+	unsigned long 	sem_nsems;		/* no. of semaphores in array */
+	unsigned long	__unused1;
+	unsigned long	__unused2;
 };
 
 #endif /* _PARISC_SEMBUF_H */
diff --git a/arch/parisc/include/uapi/asm/shmbuf.h b/arch/parisc/include/uapi/asm/shmbuf.h
index 8496c38..750e13e 100644
--- a/arch/parisc/include/uapi/asm/shmbuf.h
+++ b/arch/parisc/include/uapi/asm/shmbuf.h
@@ -30,12 +30,12 @@ struct shmid64_ds {
 #if __BITS_PER_LONG != 64
 	unsigned int		__pad4;
 #endif
-	size_t			shm_segsz;	/* size of segment (bytes) */
+	__kernel_size_t		shm_segsz;	/* size of segment (bytes) */
 	__kernel_pid_t		shm_cpid;	/* pid of creator */
 	__kernel_pid_t		shm_lpid;	/* pid of last operator */
-	unsigned int		shm_nattch;	/* no. of current attaches */
-	unsigned int		__unused1;
-	unsigned int		__unused2;
+	unsigned long		shm_nattch;	/* no. of current attaches */
+	unsigned long		__unused1;
+	unsigned long		__unused2;
 };
 
 struct shminfo64 {
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 0bef864..2fef816 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -23,6 +23,7 @@
 #include <linux/unistd.h>
 #include <linux/nodemask.h>	/* for node_online_map */
 #include <linux/pagemap.h>	/* for release_pages and page_cache_release */
+#include <linux/compat.h>
 
 #include <asm/pgalloc.h>
 #include <asm/pgtable.h>
@@ -30,6 +31,7 @@
 #include <asm/pdc_chassis.h>
 #include <asm/mmzone.h>
 #include <asm/sections.h>
+#include <asm/msgbuf.h>
 
 extern int  data_start;
 extern void parisc_kernel_start(void);	/* Kernel entry point in head.S */
@@ -590,6 +592,20 @@ unsigned long pcxl_dma_start __read_mostly;
 
 void __init mem_init(void)
 {
+	/* Do sanity checks on IPC (compat) structures */
+	BUILD_BUG_ON(sizeof(struct ipc64_perm) != 48);
+#ifndef CONFIG_64BIT
+	BUILD_BUG_ON(sizeof(struct semid64_ds) != 80);
+	BUILD_BUG_ON(sizeof(struct msqid64_ds) != 104);
+	BUILD_BUG_ON(sizeof(struct shmid64_ds) != 104);
+#endif
+#ifdef CONFIG_COMPAT
+	BUILD_BUG_ON(sizeof(struct compat_ipc64_perm) != sizeof(struct ipc64_perm));
+	BUILD_BUG_ON(sizeof(struct compat_semid64_ds) != 80);
+	BUILD_BUG_ON(sizeof(struct compat_msqid64_ds) != 104);
+	BUILD_BUG_ON(sizeof(struct compat_shmid64_ds) != 104);
+#endif
+
 	/* Do sanity checks on page table constants */
 	BUILD_BUG_ON(PTE_ENTRY_SIZE != sizeof(pte_t));
 	BUILD_BUG_ON(PMD_ENTRY_SIZE != sizeof(pmd_t));
