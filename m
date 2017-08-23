From: Helge Deller <deller@gmx.de>
Subject: [PATCH v2] fs/select: Fix memory corruption in compat_get_fd_set()
Date: Wed, 23 Aug 2017 22:37:00 +0200
Message-ID: <20170823203700.GA29614@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
To: Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, akpm@linux-foundation.org
Return-path: <linux-fsdevel-owner@vger.kernel.org>
List-ID: <linux-fsdevel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Commit 464d62421cb8 ("select: switch compat_{get,put}_fd_set() to
compat_{get,put}_bitmap()") changed the calculation on how many bytes
need to be zeroed when userspace handed over a NULL pointer for a
fdset array in the select syscall.

The calculation was changed in compat_get_fd_set() wrongly from
	memset(fdset, 0, ((nr + 1) & ~1)*sizeof(compat_ulong_t));
to
	memset(fdset, 0, ALIGN(nr, BITS_PER_LONG));

The ALIGN(nr, BITS_PER_LONG) calculates the number of bits which
need to be zeroed in the target fdset array (rounded up to the next
full bits for an unsigned long).
But the memset() call expects the number of bytes to be zeroed.

This leads to clearing more memory than wanted (on the stack area or
even at kmalloc()ed memory areas) and to random kernel crashes as we
have seen them on the parisc platform.

The correct change should have been
	memset(fdset, 0, (ALIGN(nr, BITS_PER_LONG) / BITS_PER_LONG) * BYTES_PER_LONG);
which is the same as can be archieved with a call to
	zero_fd_set(nr, fdset).

Fixes: 464d62421cb8 ("select: switch compat_{get,put}_fd_set() to compat_{get,put}_bitmap()"
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Helge Deller <deller@gmx.de>
---
Changes between v1 and v2 of the patch:
- Rephrased description of the problem

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
