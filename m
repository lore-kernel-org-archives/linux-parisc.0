From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] syscall(2): note parisc handling of aligned register pairs
Date: Sat, 11 Mar 2017 13:04:38 -0800
Message-ID: <20170311210438.4908-1-vapier@gentoo.org>
Cc: linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <linux-man.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

While parisc would normally have the same behavior as ARM/PowerPC,
they decide to write shim syscall stubs to unpack/realign rather
than expose the padding to userspace.

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man2/syscall.2 | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/man2/syscall.2 b/man2/syscall.2
index f8c89b84356d..b55540e039b7 100644
--- a/man2/syscall.2
+++ b/man2/syscall.2
@@ -133,6 +133,10 @@ on PowerPC with the 32-bit ABI, and on Xtensa.
 .\" Mike Frysinger: this issue ends up forcing MIPS
 .\" O32 to take 7 arguments to syscall()
 
+.\" See arch/parisc/kernel/sys_parisc.c.
+Note that while the parisc C ABI also uses aligned register pairs,
+it uses a shim layer to hide the issue from userspace.
+
 The affected system calls are
 .BR fadvise64_64 (2),
 .BR ftruncate64 (2),
-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
