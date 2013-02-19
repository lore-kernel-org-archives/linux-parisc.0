From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: convert msgrcv and msgsnd syscalls to use compat
 layer
Date: Tue, 19 Feb 2013 20:55:54 +0100
Message-ID: <20130219195554.GA9688@p100.box>
References: <20130211223436.GA17534@p100.box>
 <CAEdQ38FJUi9mO8UUWcgckaLzMuxsD1e3qTan_E_KVp6hx0eLkg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Matt Turner <mattst88@gmail.com>, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAEdQ38FJUi9mO8UUWcgckaLzMuxsD1e3qTan_E_KVp6hx0eLkg@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

* Matt Turner <mattst88@gmail.com>:
> On Mon, Feb 11, 2013 at 2:34 PM, Helge Deller <deller@gmx.de> wrote:
> > The currently used hand-crufted implementation is partly buggy and returned
>                             ^
> 
> Maybe an apt typo? :)

:-)

Anyway, I missed the dependency on CONFIG_COMPAT and as such the 32bit
build got broken. Here is the updated patch...

Helge


commit 4132dad5ac5df6ae669c70d2a3e5a834a8b8076f
Author: Helge Deller <deller@gmx.de>
Date:   Tue Feb 19 20:47:37 2013 +0100

parisc: convert msgrcv and msgsnd syscalls to use compat layer

Switch over to use the existing compat_* implementation for msgrcv() and
msgsnd().  Existing code was even partly buggy since it returned on some paths
different error codes than the standard.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 3df1c35..af48d26 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -272,6 +272,10 @@ config COMPAT
 	def_bool y
 	depends on 64BIT
 
+config SYSVIPC_COMPAT
+	def_bool y
+	depends on COMPAT && SYSVIPC
+
 config HPUX
 	bool "Support for HP-UX binaries"
 	depends on !64BIT
diff --git a/arch/parisc/include/asm/compat.h b/arch/parisc/include/asm/compat.h
index db7a662..94710cf 100644
--- a/arch/parisc/include/asm/compat.h
+++ b/arch/parisc/include/asm/compat.h
@@ -28,6 +28,7 @@ typedef u16	compat_nlink_t;
 typedef u16	compat_ipc_pid_t;
 typedef s32	compat_daddr_t;
 typedef u32	compat_caddr_t;
+typedef s32	compat_key_t;
 typedef s32	compat_timer_t;
 
 typedef s32	compat_int_t;
@@ -188,6 +189,66 @@ typedef struct compat_siginfo {
 #define COMPAT_OFF_T_MAX	0x7fffffff
 #define COMPAT_LOFF_T_MAX	0x7fffffffffffffffL
 
+struct compat_ipc64_perm {
+	compat_key_t key;
+	__compat_uid_t uid;
+	__compat_gid_t gid;
+	__compat_uid_t cuid;
+	__compat_gid_t cgid;
+	unsigned short int __pad1;
+	compat_mode_t mode;
+	unsigned short int __pad2;
+	unsigned short int seq;
+	unsigned int __pad3;
+	unsigned long __unused1;	/* yes they really are 64bit pads */
+	unsigned long __unused2;
+};
+
+struct compat_semid64_ds {
+	struct compat_ipc64_perm sem_perm;
+	compat_time_t sem_otime;
+	unsigned int __unused1;
+	compat_time_t sem_ctime;
+	unsigned int __unused2;
+	compat_ulong_t sem_nsems;
+	compat_ulong_t __unused3;
+	compat_ulong_t __unused4;
+};
+
+struct compat_msqid64_ds {
+	struct compat_ipc64_perm msg_perm;
+	unsigned int __unused1;
+	compat_time_t msg_stime;
+	unsigned int __unused2;
+	compat_time_t msg_rtime;
+	unsigned int __unused3;
+	compat_time_t msg_ctime;
+	compat_ulong_t msg_cbytes;
+	compat_ulong_t msg_qnum;
+	compat_ulong_t msg_qbytes;
+	compat_pid_t msg_lspid;
+	compat_pid_t msg_lrpid;
+	compat_ulong_t __unused4;
+	compat_ulong_t __unused5;
+};
+
+struct compat_shmid64_ds {
+	struct compat_ipc64_perm shm_perm;
+	unsigned int __unused1;
+	compat_time_t shm_atime;
+	unsigned int __unused2;
+	compat_time_t shm_dtime;
+	unsigned int __unused3;
+	compat_time_t shm_ctime;
+	unsigned int __unused4;
+	compat_size_t shm_segsz;
+	compat_pid_t shm_cpid;
+	compat_pid_t shm_lpid;
+	compat_ulong_t shm_nattch;
+	compat_ulong_t __unused5;
+	compat_ulong_t __unused6;
+};
+
 /*
  * A pointer passed in from user mode. This should not
  * be used for syscall parameters, just declare them
diff --git a/arch/parisc/kernel/sys_parisc32.c b/arch/parisc/kernel/sys_parisc32.c
index 9cfdaa1..cee60f7 100644
--- a/arch/parisc/kernel/sys_parisc32.c
+++ b/arch/parisc/kernel/sys_parisc32.c
@@ -21,7 +21,6 @@
 #include <linux/time.h>
 #include <linux/smp.h>
 #include <linux/sem.h>
-#include <linux/msg.h>
 #include <linux/shm.h>
 #include <linux/slab.h>
 #include <linux/uio.h>
@@ -73,63 +72,6 @@ asmlinkage long sys32_sched_rr_get_interval(pid_t pid,
 	return ret;
 }
 
-struct msgbuf32 {
-    int mtype;
-    char mtext[1];
-};
-
-asmlinkage long sys32_msgsnd(int msqid,
-				struct msgbuf32 __user *umsgp32,
-				size_t msgsz, int msgflg)
-{
-	struct msgbuf *mb;
-	struct msgbuf32 mb32;
-	int err;
-
-	if ((mb = kmalloc(msgsz + sizeof *mb + 4, GFP_KERNEL)) == NULL)
-		return -ENOMEM;
-
-	err = get_user(mb32.mtype, &umsgp32->mtype);
-	mb->mtype = mb32.mtype;
-	err |= copy_from_user(mb->mtext, &umsgp32->mtext, msgsz);
-
-	if (err)
-		err = -EFAULT;
-	else
-		KERNEL_SYSCALL(err, sys_msgsnd, msqid, (struct msgbuf __user *)mb, msgsz, msgflg);
-
-	kfree(mb);
-	return err;
-}
-
-asmlinkage long sys32_msgrcv(int msqid,
-				struct msgbuf32 __user *umsgp32,
-				size_t msgsz, long msgtyp, int msgflg)
-{
-	struct msgbuf *mb;
-	struct msgbuf32 mb32;
-	int err, len;
-
-	if ((mb = kmalloc(msgsz + sizeof *mb + 4, GFP_KERNEL)) == NULL)
-		return -ENOMEM;
-
-	KERNEL_SYSCALL(err, sys_msgrcv, msqid, (struct msgbuf __user *)mb, msgsz, msgtyp, msgflg);
-
-	if (err >= 0) {
-		len = err;
-		mb32.mtype = mb->mtype;
-		err = put_user(mb32.mtype, &umsgp32->mtype);
-		err |= copy_to_user(&umsgp32->mtext, mb->mtext, len);
-		if (err)
-			err = -EFAULT;
-		else
-			err = len;
-	}
-
-	kfree(mb);
-	return err;
-}
