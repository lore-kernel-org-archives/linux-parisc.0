From: Helge Deller <deller@gmx.de>
Subject: [PATCH] fs/select: Fix kernel panic due to memory corruption in
 compat_get_fd_set()
Date: Tue, 22 Aug 2017 21:01:37 +0200
Message-ID: <20170822190137.GA14164@p100.box>
References: <E754A6C6-AA72-43F1-A799-E48A2146BF17@bell.net>
 <887D24D5-832C-409A-83AF-646E4937E87E@bell.net>
 <20170820183903.GA23618@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
        John David Anglin <dave.anglin@bell.net>,
        linux-kernel@vger.kernel.org,
        linux-parisc List <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170820183903.GA23618@ls3530.fritz.box>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Dave, can you test this patch?
Helge

------
[PATCH] Fix kernel panic due to memory corruption in compat_get_fd_set()

Dave faced this kernel crash in the select() compat syscall on the
parisc architecture:

 Kernel Fault: Code=26 (Data memory access rights trap) regs=00000002234b84e0 (Addr=0000000000000000)
 CPU: 1 PID: 21167 Comm: polyimport Not tainted 4.13.0-rc5+ #1
 task: 0000000223d74b50 task.stack: 00000002234b8000
 IAOQ[0]: memset+0x68/0xd8
 IAOQ[1]: memset+0x6c/0xd8
 RP(r2): compat_get_fd_set+0x5c/0x78
 Backtrace:
 [<00000000402f316c>] compat_get_fd_set+0x5c/0x78
 [<00000000402f3cac>] compat_core_sys_select+0x1cc/0x300
 [<00000000402f52dc>] compat_SyS_select+0x144/0x1a0
 [<0000000040155fe4>] syscall_exit+0x0/0x14
 Kernel panic - not syncing: Kernel Fault

It seems commit 464d62421cb8 ("select: switch compat_{get,put}_fd_set()
to compat_{get,put}_bitmap()") broke the calculation on how many bytes
need to be zeroed in case of fdset beeing NULL. This leads to memory
overwrites and crashes.

Fixes: 464d62421cb8 ("select: switch compat_{get,put}_fd_set() to compat_{get,put}_bitmap()"
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/fs/select.c b/fs/select.c
index 9d5f15e..c6362e3 100644
--- a/fs/select.c
+++ b/fs/select.c
@@ -1164,11 +1164,7 @@ int compat_get_fd_set(unsigned long nr, compat_ulong_t __user *ufdset,
 	if (ufdset) {
 		return compat_get_bitmap(fdset, ufdset, nr);
 	} else {
-		/* Tricky, must clear full unsigned long in the
-		 * kernel fdset at the end, ALIGN makes sure that
-		 * actually happens.
-		 */
-		memset(fdset, 0, ALIGN(nr, BITS_PER_LONG));
+		zero_fd_set(nr, fdset);
 		return 0;
 	}
 }
