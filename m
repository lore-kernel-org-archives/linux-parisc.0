From: Helge Deller <deller@gmx.de>
Subject: [PATCH - not final!] parisc: fix shmctl(SHM_INFO) breakage on 64bit
 kernel
Date: Fri, 13 Aug 2010 22:49:46 +0200
Message-ID: <20100813204946.GA9437@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I noticed, that shmctl(SHM_INFO) is broken when running on a 64bit
kernel (with 32bit userspace).
I assume we need to enable the IPC compat layer, at least for some
functions.

Below is a preliminary patch - the compat_XXX structures are probably
wrong and need changing. I think I copied them from a little-endian
architecture, while I better should have checked with a big-endian one.
So, please DO NOT apply yet.

And, we need to check the other ipc_compat functions as well...

Signed-off-by: Helge Deller <deller@gmx.de>


diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 05a366a..e2fe95c 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -289,6 +289,10 @@ menu "Executable file formats"
 
 source "fs/Kconfig.binfmt"
 
+config SYSVIPC_COMPAT
+	def_bool y
+	depends on COMPAT && SYSVIPC
+
 endmenu
 
 source "net/Kconfig"
diff --git a/arch/parisc/include/asm/compat.h b/arch/parisc/include/asm/compat.h
index 02b77ba..bbbe256 100644
--- a/arch/parisc/include/asm/compat.h
+++ b/arch/parisc/include/asm/compat.h
@@ -29,6 +29,7 @@ typedef u16	compat_ipc_pid_t;
 typedef s32	compat_daddr_t;
 typedef u32	compat_caddr_t;
 typedef s32	compat_timer_t;
+typedef s32	compat_key_t;
 
 typedef s32	compat_int_t;
 typedef s32	compat_long_t;
@@ -129,6 +130,65 @@ typedef u32		compat_sigset_word;
 #define COMPAT_OFF_T_MAX	0x7fffffff
 #define COMPAT_LOFF_T_MAX	0x7fffffffffffffffL
 
+
+struct compat_ipc64_perm {
+	compat_key_t key;
+	__compat_uid32_t uid;
+	__compat_gid32_t gid;
+	__compat_uid32_t cuid;
+	__compat_gid32_t cgid;
+	unsigned short mode;
+	unsigned short __pad1;
+	unsigned short seq;
+	unsigned short __pad2;
+	compat_ulong_t unused1;
+	compat_ulong_t unused2;
+};
+
+struct compat_semid64_ds {
+	struct compat_ipc64_perm sem_perm;
+	compat_time_t  sem_otime;
+	compat_ulong_t __unused1;
+	compat_time_t  sem_ctime;
+	compat_ulong_t __unused2;
+	compat_ulong_t sem_nsems;
+	compat_ulong_t __unused3;
+	compat_ulong_t __unused4;
+};
+
+struct compat_msqid64_ds {
+	struct compat_ipc64_perm msg_perm;
+	compat_time_t  msg_stime;
+	compat_ulong_t __unused1;
+	compat_time_t  msg_rtime;
+	compat_ulong_t __unused2;
+	compat_time_t  msg_ctime;
+	compat_ulong_t __unused3;
+	compat_ulong_t msg_cbytes;
+	compat_ulong_t msg_qnum;
+	compat_ulong_t msg_qbytes;
+	compat_pid_t   msg_lspid;
+	compat_pid_t   msg_lrpid;
+	compat_ulong_t __unused4;
+	compat_ulong_t __unused5;
+};
+
+struct compat_shmid64_ds {
+	struct compat_ipc64_perm shm_perm;
+	compat_size_t  shm_segsz;
+	compat_time_t  shm_atime;
+	compat_ulong_t __unused1;
+	compat_time_t  shm_dtime;
+	compat_ulong_t __unused2;
+	compat_time_t  shm_ctime;
+	compat_ulong_t __unused3;
+	compat_pid_t   shm_cpid;
+	compat_pid_t   shm_lpid;
+	compat_ulong_t shm_nattch;
+	compat_ulong_t __unused4;
+	compat_ulong_t __unused5;
+};
+
 /*
  * A pointer passed in from user mode. This should not
  * be used for syscall parameters, just declare them
diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
index 3d52c97..5293c90 100644
--- a/arch/parisc/kernel/syscall_table.S
+++ b/arch/parisc/kernel/syscall_table.S
@@ -293,7 +293,7 @@
 	ENTRY_SAME(shmat)
 	ENTRY_SAME(shmdt)
 	ENTRY_SAME(shmget)
-	ENTRY_SAME(shmctl)		/* 195 */
+	ENTRY_COMP(shmctl)		/* 195 */
 	ENTRY_SAME(ni_syscall)		/* streams1 */
 	ENTRY_SAME(ni_syscall)		/* streams2 */
 	ENTRY_SAME(lstat64)
