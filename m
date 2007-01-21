From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [PATCH] fix up our compat semaphore operations
Date: Sun, 21 Jan 2007 00:46:48 -0700
Message-ID: <20070121074648.GA22649__38533.5544743159$1416624266$gmane$org@colo.lackof.org>
References: <1169228395.2781.35.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Parisc List <parisc-linux@lists.parisc-linux.org>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1169228395.2781.35.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Jan 19, 2007 at 11:39:55AM -0600, James Bottomley wrote:
> The controversial change might be to move to the compat_sys calls for
> msgsnd and msgrcv ... it looks to me like the ABI in sys_parisc32.c
> might be different from the one in ipc/compat.c  can someone who has a
> copy of glibc check this?

linking ipc/compat.c requires we first add this bit to arch/parisc/Kconfig:

config SYSVIPC_COMPAT
        bool
        depends on COMPAT && SYSVIPC
        default y

so that ipc/compat.c gets built.
And then add a few missing compat_XXX structs to asm-parisc/compat.h:

compat_key_t		same for all arches (s32)

compat_ipc64_perm	asm-sparc64/compat.h version looks the best to me
			but it has the "ushort" pad fields before the
			field it's padding for.
			I also looked at x86_64, s390, powerpc.

compat_shmid64_ds	Ditto
compat_msqid64_ds	Ditto
compat_semid64_ds	Ditto

Until I can commit the appended diff myself:
Signed-off-by: Grant Grundler <grundler@parisc-linux.org>

thanks,
grant


diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index e18eeec..fcc4c6f 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -242,6 +242,11 @@ config COMPAT
 	def_bool y
 	depends on 64BIT
 
+config SYSVIPC_COMPAT
+	bool
+	depends on COMPAT && SYSVIPC
+	default y
+
 config HPUX
 	bool "Support for HP-UX binaries"
 	depends on !64BIT
diff --git a/include/asm-parisc/compat.h b/include/asm-parisc/compat.h
index fe85790..4b41974 100644
--- a/include/asm-parisc/compat.h
+++ b/include/asm-parisc/compat.h
@@ -27,6 +27,8 @@ typedef u16	compat_nlink_t;
 typedef u16	compat_ipc_pid_t;
 typedef s32	compat_daddr_t;
 typedef u32	compat_caddr_t;
+typedef __kernel_fsid_t compat_fsid_t;
+typedef s32	compat_key_t;
 typedef s32	compat_timer_t;
 
 typedef s32	compat_int_t;
@@ -126,6 +128,68 @@ typedef u32		compat_sigset_word;
 #define COMPAT_OFF_T_MAX	0x7fffffff
 #define COMPAT_LOFF_T_MAX	0x7fffffffffffffffL
 
+
+/* cloned from include/asm-sparc64/compat.h */
+struct compat_ipc64_perm {
+	compat_key_t key;
+	__compat_uid32_t uid;
+	__compat_gid32_t gid;
+	__compat_uid32_t cuid;
+	__compat_gid32_t cgid;
+	unsigned short __pad1;
+	compat_mode_t mode;
+	unsigned short __pad2;
+	unsigned short seq;
+	compat_ulong_t unused1;
+	compat_ulong_t unused2;
+};
+
+struct compat_semid64_ds {
+	struct compat_ipc64_perm sem_perm;
+	unsigned int __unused1;
+	compat_time_t sem_otime;
+	unsigned int __unused2;
+	compat_time_t sem_ctime;
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
+
 /*
  * A pointer passed in from user mode. This should not
  * be used for syscall parameters, just declare them
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
