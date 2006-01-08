From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] [PATCH 2/5] Convert ia64 to use generic
	compat_siginfo_t
Date: Sun, 8 Jan 2006 14:37:59 -0500
Message-ID: <20060108193759.GI3782__45919.290246866$1416623987$gmane$org@tachyon.int.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: carlos@parisc-linux.org,
 willy@parisc-linux.org,
 linux-ia64@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 parisc-linux@lists.parisc-linux.org
To: akpm@osdl.org
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

From: Matthew Wilcox <willy@parisc-linux.org>

Convert arch/ia64 to use generic compat_siginfo_t.

Signed-off-by: Matthew Wilcox <willy@parisc-linux.org>
Signed-off-by: Kyle McMartin <kyle@parisc-linux.org>

---

Tony,

This patch has been sitting in parisc-linux for quite some time. Matthew
has been running that tree on his ia64 machines for a while, but I'm not
sure how much testing the ia32 emulation received.

 arch/ia64/ia32/ia32_signal.c |    1 +
 arch/ia64/ia32/ia32priv.h    |   52 ------------------------------------------
 include/asm-ia64/compat.h    |    3 ++
 3 files changed, 4 insertions(+), 52 deletions(-)

55f9c468f33f732cc60793aaa4a425384254290c
diff --git a/arch/ia64/ia32/ia32_signal.c b/arch/ia64/ia32/ia32_signal.c
index aa891c9..cd76bbb 100644
--- a/arch/ia64/ia32/ia32_signal.c
+++ b/arch/ia64/ia32/ia32_signal.c
@@ -24,6 +24,7 @@
 #include <linux/unistd.h>
 #include <linux/wait.h>
 #include <linux/compat.h>
+#include <linux/compat_siginfo.h>
 
 #include <asm/intrinsics.h>
 #include <asm/uaccess.h>
diff --git a/arch/ia64/ia32/ia32priv.h b/arch/ia64/ia32/ia32priv.h
index 68ceb4e..2bc099c 100644
--- a/arch/ia64/ia32/ia32priv.h
+++ b/arch/ia64/ia32/ia32priv.h
@@ -225,58 +225,6 @@ struct stat64 {
 	unsigned int	st_ino_hi;
 };
 
-typedef struct compat_siginfo {
-	int si_signo;
-	int si_errno;
-	int si_code;
-
-	union {
-		int _pad[((128/sizeof(int)) - 3)];
-
-		/* kill() */
-		struct {
-			unsigned int _pid;	/* sender's pid */
-			unsigned int _uid;	/* sender's uid */
-		} _kill;
-
-		/* POSIX.1b timers */
-		struct {
-			compat_timer_t _tid;		/* timer id */
-			int _overrun;		/* overrun count */
-			char _pad[sizeof(unsigned int) - sizeof(int)];
-			compat_sigval_t _sigval;	/* same as below */
-			int _sys_private;       /* not to be passed to user */
-		} _timer;
-
-		/* POSIX.1b signals */
-		struct {
-			unsigned int _pid;	/* sender's pid */
-			unsigned int _uid;	/* sender's uid */
-			compat_sigval_t _sigval;
-		} _rt;
-
-		/* SIGCHLD */
-		struct {
-			unsigned int _pid;	/* which child */
-			unsigned int _uid;	/* sender's uid */
-			int _status;		/* exit code */
-			compat_clock_t _utime;
-			compat_clock_t _stime;
-		} _sigchld;
-
-		/* SIGILL, SIGFPE, SIGSEGV, SIGBUS */
-		struct {
-			unsigned int _addr;	/* faulting insn/memory ref. */
-		} _sigfault;
-
-		/* SIGPOLL */
-		struct {
-			int _band;	/* POLL_IN, POLL_OUT, POLL_MSG */
-			int _fd;
-		} _sigpoll;
-	} _sifields;
-} compat_siginfo_t;
