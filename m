From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: [parisc-linux] [PATCH] fix up our compat semaphore operations
Date: Fri, 19 Jan 2007 11:39:55 -0600
Message-ID: <1169228395.2781.35.camel__19573.0124520653$1416624266$gmane$org@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain
To: Parisc List <parisc-linux@lists.parisc-linux.org>
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

Some of this is simply obvious:  we don't do compat for things like
shmat, which we should given that they're using unsigned long arguments.
The controversial change might be to move to the compat_sys calls for
msgsnd and msgrcv ... it looks to me like the ABI in sys_parisc32.c
might be different from the one in ipc/compat.c  can someone who has a
copy of glibc check this?

Thanks,

James

Index: linux-2.6/arch/parisc/kernel/sys_parisc32.c
===================================================================
--- linux-2.6.orig/arch/parisc/kernel/sys_parisc32.c	2006-06-23 10:06:57.000000000 -0500
+++ linux-2.6/arch/parisc/kernel/sys_parisc32.c	2007-01-18 16:16:53.000000000 -0600
@@ -475,58 +475,6 @@
     char mtext[1];
 };
 
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
-
 asmlinkage int sys32_sendfile(int out_fd, int in_fd, compat_off_t __user *offset, s32 count)
 {
         mm_segment_t old_fs = get_fs();
@@ -639,21 +587,6 @@
 	return sys_lseek(fd, offset, origin);
 }
 
-asmlinkage long sys32_semctl(int semid, int semnum, int cmd, union semun arg)
-{
-        union semun u;
-	
-        if (cmd == SETVAL) {
-                /* Ugh.  arg is a union of int,ptr,ptr,ptr, so is 8 bytes.
-                 * The int should be in the first 4, but our argument
-                 * frobbing has left it in the last 4.
-                 */
-                u.val = *((int *)&arg + 1);
-                return sys_semctl (semid, semnum, cmd, u);
-	}
-	return sys_semctl (semid, semnum, cmd, arg);
-}
-
 long sys32_lookup_dcookie(u32 cookie_high, u32 cookie_low, char __user *buf,
 			  size_t len)
 {
Index: linux-2.6/arch/parisc/kernel/syscall_table.S
===================================================================
--- linux-2.6.orig/arch/parisc/kernel/syscall_table.S	2006-06-23 10:06:57.000000000 -0500
+++ linux-2.6/arch/parisc/kernel/syscall_table.S	2007-01-18 16:16:53.000000000 -0600
@@ -292,15 +292,15 @@
 	ENTRY_COMP(recvmsg)
 	ENTRY_SAME(semop)		/* 185 */
 	ENTRY_SAME(semget)
-	ENTRY_DIFF(semctl)
-	ENTRY_DIFF(msgsnd)
-	ENTRY_DIFF(msgrcv)
+	ENTRY_COMP(semctl)
+	ENTRY_COMP(msgsnd)
+	ENTRY_COMP(msgrcv)
 	ENTRY_SAME(msgget)		/* 190 */
 	ENTRY_SAME(msgctl)
-	ENTRY_SAME(shmat)
+	ENTRY_COMP(shmat)
 	ENTRY_SAME(shmdt)
 	ENTRY_SAME(shmget)
-	ENTRY_SAME(shmctl)		/* 195 */
+	ENTRY_COMP(shmctl)		/* 195 */
 	ENTRY_SAME(ni_syscall)		/* streams1 */
 	ENTRY_SAME(ni_syscall)		/* streams2 */
 	ENTRY_SAME(lstat64)
@@ -333,13 +333,13 @@
 	ENTRY_SAME(epoll_ctl)		/* 225 */
 	ENTRY_SAME(epoll_wait)
  	ENTRY_SAME(remap_file_pages)
-	ENTRY_SAME(semtimedop)
-	ENTRY_SAME(mq_open)
+	ENTRY_COMP(semtimedop)
+	ENTRY_COMP(mq_open)
 	ENTRY_SAME(mq_unlink)		/* 230 */
-	ENTRY_SAME(mq_timedsend)
-	ENTRY_SAME(mq_timedreceive)
-	ENTRY_SAME(mq_notify)
-	ENTRY_SAME(mq_getsetattr)
+	ENTRY_COMP(mq_timedsend)
+	ENTRY_COMP(mq_timedreceive)
+	ENTRY_COMP(mq_notify)
+	ENTRY_COMP(mq_getsetattr)
 	ENTRY_COMP(waitid)		/* 235 */
 	ENTRY_OURS(fadvise64_64)
 	ENTRY_SAME(set_tid_address)


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
