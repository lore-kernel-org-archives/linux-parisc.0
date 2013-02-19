From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: fix error return codes for rt_sigaction and
 rt_sigprocmask
Date: Tue, 19 Feb 2013 21:16:49 +0100
Message-ID: <20130219201649.GA1639@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

commit 38526701a6dd86e1f6bd6f025878f990ecae3c8c
Author: Helge Deller <deller@gmx.de>
Date:   Tue Feb 19 21:11:39 2013 +0100

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/signal32.c b/arch/parisc/kernel/signal32.c
index 5dede04..2ddcabb 100644
--- a/arch/parisc/kernel/signal32.c
+++ b/arch/parisc/kernel/signal32.c
@@ -65,7 +65,7 @@ put_sigset32(compat_sigset_t __user *up, sigset_t *set, size_t sz)
 {
 	compat_sigset_t s;
 
-	if (sz != sizeof *set)
+	if (sz != sizeof(compat_sigset_t))
 		return -EINVAL;
 	sigset_64to32(&s, set);
 
@@ -78,7 +78,7 @@ get_sigset32(compat_sigset_t __user *up, sigset_t *set, size_t sz)
 	compat_sigset_t s;
 	int r;
 
-	if (sz != sizeof *set)
+	if (sz != sizeof(compat_sigset_t))
 		return -EINVAL;
 
 	if ((r = copy_from_user(&s, up, sz)) == 0) {
@@ -94,8 +94,11 @@ int sys32_rt_sigprocmask(int how, compat_sigset_t __user *set, compat_sigset_t _
 	sigset_t old_set, new_set;
 	int ret;
 
-	if (set && get_sigset32(set, &new_set, sigsetsize))
-		return -EFAULT;
+	if (set) {
+		ret = get_sigset32(set, &new_set, sigsetsize);
+		if (ret)
+			return ret;
+	}
 	
 	KERNEL_SYSCALL(ret, sys_rt_sigprocmask, how, set ? (sigset_t __user *)&new_set : NULL,
 				 oset ? (sigset_t __user *)&old_set : NULL, sigsetsize);
@@ -128,6 +131,10 @@ sys32_rt_sigaction(int sig, const struct sigaction32 __user *act, struct sigacti
 	struct k_sigaction new_sa, old_sa;
 	int ret = -EINVAL;
 
+	/* XXX: Don't preclude handling different sized sigset_t's.  */
+	if (sigsetsize != sizeof(compat_sigset_t))
+		return -EINVAL;
+
 	if (act) {
 		if (copy_from_user(&new_sa32.sa, act, sizeof new_sa32.sa))
 			return -EFAULT;
