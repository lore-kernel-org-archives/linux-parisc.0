From: Amanieu d'Antras <amanieu@gmail.com>
Subject: [PATCH v2 09/20] parisc: Use generic compat_siginfo_t
Date: Thu,  5 Nov 2015 00:50:28 +0000
Message-ID: <1446684640-4112-10-git-send-email-amanieu@gmail.com>
References: <1446684640-4112-1-git-send-email-amanieu@gmail.com>
Cc: Oleg Nesterov <oleg@redhat.com>,
	Amanieu d'Antras <amanieu@gmail.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446684640-4112-1-git-send-email-amanieu@gmail.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Amanieu d'Antras <amanieu@gmail.com>
---
 arch/parisc/include/asm/compat.h | 53 ----------------------------------------
 1 file changed, 53 deletions(-)

diff --git a/arch/parisc/include/asm/compat.h b/arch/parisc/include/asm/compat.h
index 46a0a8a..6c80ae2 100644
--- a/arch/parisc/include/asm/compat.h
+++ b/arch/parisc/include/asm/compat.h
@@ -134,62 +134,9 @@ typedef union compat_sigval {
 	compat_uptr_t	sival_ptr;
 } compat_sigval_t;
 
-#define HAVE_ARCH_COMPAT_SIGINFO_T
 #define HAVE_ARCH_COPY_SIGINFO_TO_USER32
 #define HAVE_ARCH_COPY_SIGINFO_FROM_USER32
 
-typedef struct compat_siginfo {
-	int si_signo;
-	int si_errno;
-	int si_code;
-
-	union {
-		int _pad[128/sizeof(int) - 3];
-
-		/* kill() */
-		struct {
-			unsigned int _pid;      /* sender's pid */
-			unsigned int _uid;      /* sender's uid */
-		} _kill;
-
-		/* POSIX.1b timers */
-		struct {
-			compat_timer_t _tid;            /* timer id */
-			int _overrun;           /* overrun count */
-			char _pad[sizeof(unsigned int) - sizeof(int)];
-			compat_sigval_t _sigval;        /* same as below */
-			int _sys_private;       /* not to be passed to user */
-		} _timer;
-
-		/* POSIX.1b signals */
-		struct {
-			unsigned int _pid;      /* sender's pid */
-			unsigned int _uid;      /* sender's uid */
-			compat_sigval_t _sigval;
-		} _rt;
-
-		/* SIGCHLD */
-		struct {
-			unsigned int _pid;      /* which child */
-			unsigned int _uid;      /* sender's uid */
-			int _status;            /* exit code */
-			compat_clock_t _utime;
-			compat_clock_t _stime;
-		} _sigchld;
-
-		/* SIGILL, SIGFPE, SIGSEGV, SIGBUS */
-		struct {
-			unsigned int _addr;     /* faulting insn/memory ref. */
-		} _sigfault;
-
-		/* SIGPOLL */
-		struct {
-			int _band;      /* POLL_IN, POLL_OUT, POLL_MSG */
-			int _fd;
-		} _sigpoll;
-	} _sifields;
-} compat_siginfo_t;
-
 #define COMPAT_OFF_T_MAX	0x7fffffff
 #define COMPAT_LOFF_T_MAX	0x7fffffffffffffffL
 
-- 
2.6.2
