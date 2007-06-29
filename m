From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] -pie is broken on hppa
Date: Fri, 29 Jun 2007 03:29:12 -0400
Message-ID: <20070629072912.GC9495__5580.75809753991$1416624401$gmane$org@fattire.cabal.ca>
References: <20070604014313.GB2075@fattire.cabal.ca>
	<200706040147.l541lAP3022868@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: matthew@wil.cx,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200706040147.l541lAP3022868@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jun 03, 2007 at 09:47:10PM -0400, John David Anglin wrote:
> > I don't suppose you could strace in a chroot with a older working glibc
> > and see what syscalls are there?
> 
> Probably, I won't have time until next weekend.
>

Could you try this patch?

Thanks,
	Kyle M.

>>>From 0deea67e075b5152d427426583500b8d9cf0a56c Mon Sep 17 00:00:00 2001
From: Kyle McMartin <kyle@parisc-linux.org>
Date: Fri, 29 Jun 2007 03:38:10 -0400
Subject: [PARISC] Use compat_sys_getdents

Switch to using the generic compat_sys_getdents instead of a
homebrew one.

Signed-off-by: Kyle McMartin <kyle@parisc-linux.org>
---
 arch/parisc/kernel/sys_parisc32.c  |  141 ------------------------------------
 arch/parisc/kernel/syscall_table.S |    4 +-
 2 files changed, 1 insertions(+), 144 deletions(-)

diff --git a/arch/parisc/kernel/sys_parisc32.c b/arch/parisc/kernel/sys_parisc32.c
index bb23ff7..2989c66 100644
--- a/arch/parisc/kernel/sys_parisc32.c
+++ b/arch/parisc/kernel/sys_parisc32.c
@@ -285,147 +285,6 @@ int cp_compat_stat(struct kstat *stat, struct compat_stat __user *statbuf)
 	return err;
 }
 
-struct linux32_dirent {
-	u32		d_ino;
-	compat_off_t	d_off;
-	u16		d_reclen;
-	char		d_name[1];
-};
-
-struct old_linux32_dirent {
-	u32	d_ino;
-	u32	d_offset;
-	u16	d_namlen;
-	char	d_name[1];
-};
-
-struct getdents32_callback {
-	struct linux32_dirent __user * current_dir;
-	struct linux32_dirent __user * previous;
-	int count;
-	int error;
-};
-
-struct readdir32_callback {
-	struct old_linux32_dirent __user * dirent;
-	int count;
-};
-
-#define NAME_OFFSET(de) ((int) ((de)->d_name - (char __user *) (de)))
-static int filldir32 (void *__buf, const char *name, int namlen,
-			loff_t offset, u64 ino, unsigned int d_type)
-{
-	struct linux32_dirent __user * dirent;
-	struct getdents32_callback * buf = (struct getdents32_callback *) __buf;
-	int reclen = ALIGN(NAME_OFFSET(dirent) + namlen + 1, 4);
-	u32 d_ino;
-
-	buf->error = -EINVAL;	/* only used if we fail.. */
-	if (reclen > buf->count)
-		return -EINVAL;
-	d_ino = ino;
-	if (sizeof(d_ino) < sizeof(ino) && d_ino != ino)
-		return -EOVERFLOW;
-	dirent = buf->previous;
-	if (dirent)
-		put_user(offset, &dirent->d_off);
-	dirent = buf->current_dir;
-	buf->previous = dirent;
-	put_user(d_ino, &dirent->d_ino);
-	put_user(reclen, &dirent->d_reclen);
-	copy_to_user(dirent->d_name, name, namlen);
-	put_user(0, dirent->d_name + namlen);
-	dirent = ((void __user *)dirent) + reclen;
-	buf->current_dir = dirent;
-	buf->count -= reclen;
-	return 0;
-}
-
-asmlinkage long
-sys32_getdents (unsigned int fd, void __user * dirent, unsigned int count)
-{
-	struct file * file;
-	struct linux32_dirent __user * lastdirent;
-	struct getdents32_callback buf;
-	int error;
-
-	error = -EFAULT;
-	if (!access_ok(VERIFY_WRITE, dirent, count))
-		goto out;
-
-	error = -EBADF;
-	file = fget(fd);
-	if (!file)
-		goto out;
-
-	buf.current_dir = (struct linux32_dirent __user *) dirent;
-	buf.previous = NULL;
-	buf.count = count;
-	buf.error = 0;
-
-	error = vfs_readdir(file, filldir32, &buf);
-	if (error < 0)
-		goto out_putf;
-	error = buf.error;
-	lastdirent = buf.previous;
-	if (lastdirent) {
-		if (put_user(file->f_pos, &lastdirent->d_off))
-			error = -EFAULT;
-		else
-			error = count - buf.count;
-	}
-
-out_putf:
-	fput(file);
-out:
-	return error;
-}
-
-static int fillonedir32(void * __buf, const char * name, int namlen,
-			loff_t offset, u64 ino, unsigned int d_type)
-{
-	struct readdir32_callback * buf = (struct readdir32_callback *) __buf;
-	struct old_linux32_dirent __user * dirent;
-	u32 d_ino;
-
-	if (buf->count)
-		return -EINVAL;
-	d_ino = ino;
-	if (sizeof(d_ino) < sizeof(ino) && d_ino != ino)
-		return -EOVERFLOW;
-	buf->count++;
-	dirent = buf->dirent;
-	put_user(d_ino, &dirent->d_ino);
-	put_user(offset, &dirent->d_offset);
-	put_user(namlen, &dirent->d_namlen);
-	copy_to_user(dirent->d_name, name, namlen);
-	put_user(0, dirent->d_name + namlen);
-	return 0;
-}
-
-asmlinkage long
-sys32_readdir (unsigned int fd, void __user * dirent, unsigned int count)
-{
-	int error;
-	struct file * file;
-	struct readdir32_callback buf;
-
-	error = -EBADF;
-	file = fget(fd);
-	if (!file)
-		goto out;
-
-	buf.count = 0;
-	buf.dirent = dirent;
-
-	error = vfs_readdir(file, fillonedir32, &buf);
-	if (error >= 0)
-		error = buf.count;
-	fput(file);
-out:
-	return error;
-}
