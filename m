From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Drop TIF_RESTORE_SIGMASK and switch to generic code
Date: Tue, 27 Dec 2016 18:03:50 +0100
Message-ID: <20161227170350.GA30701@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Commit 7e7814180b33 ("signal: consolidate {TS,TLF}_RESTORE_SIGMASK code")
introduced code with which the "restore sigmask" flag lives in task_struct
instead of ti->flags.
Use it on parisc.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/thread_info.h b/arch/parisc/include/asm/thread_info.h
index 7581330e..88fe0aa 100644
--- a/arch/parisc/include/asm/thread_info.h
+++ b/arch/parisc/include/asm/thread_info.h
@@ -49,7 +49,6 @@ struct thread_info {
 #define TIF_POLLING_NRFLAG	3	/* true if poll_idle() is polling TIF_NEED_RESCHED */
 #define TIF_32BIT               4       /* 32 bit binary */
 #define TIF_MEMDIE		5	/* is terminating due to OOM killer */
-#define TIF_RESTORE_SIGMASK	6	/* restore saved signal mask */
 #define TIF_SYSCALL_AUDIT	7	/* syscall auditing active */
 #define TIF_NOTIFY_RESUME	8	/* callback before returning to user */
 #define TIF_SINGLESTEP		9	/* single stepping? */
