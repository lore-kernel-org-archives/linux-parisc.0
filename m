From: Arnd Bergmann <arnd@arndb.de>
Subject: [RFC] parisc64: change __kernel_suseconds_t to match glibc
Date: Thu, 13 Sep 2018 17:59:50 +0200
Message-ID: <20180913160010.905798-1-arnd@arndb.de>
Cc: y2038@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: "James E.J. Bottomley" <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

There are only two 64-bit architecture ports that have a 32-bit
suseconds_t: sparc64 and parisc64. I've encountered a number of problems
with this, while trying to get a proper 64-bit time_t working on 32-bit
architectures. Having a 32-bit suseconds_t combined with a 64-bit time_t
means that we get extra padding in data structures that may leak kernel
stack data to user space, and it breaks all code that assumes that
timespec and timeval have the same layout.

While we can't change sparc64, it seems that glibc on parisc64 has always
set suseconds_t to 'long', and the current version would give incorrect
results for gettimeofday() and many other interfaces: timestamps passed
from user space into the kernel result in tv_usec being always zero
(the lower bits contain the intended value but are ignored) while data
passed from the kernel to user space contains either zeroes or random
data in tv_usec.

Based on that, it seems best to change the user API in the kernel in
an incompatible way to match what glibc expects.

Note that the distros I could find (gentoo and debian) all just
have 32-bit user space, which does not suffer from this problem.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/parisc/include/uapi/asm/posix_types.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/parisc/include/uapi/asm/posix_types.h b/arch/parisc/include/uapi/asm/posix_types.h
index 2785632c85e7..8dce56f5dcee 100644
--- a/arch/parisc/include/uapi/asm/posix_types.h
+++ b/arch/parisc/include/uapi/asm/posix_types.h
@@ -16,9 +16,6 @@ typedef unsigned short		__kernel_mode_t;
 typedef unsigned short		__kernel_ipc_pid_t;
 #define __kernel_ipc_pid_t __kernel_ipc_pid_t
 
-typedef int			__kernel_suseconds_t;
-#define __kernel_suseconds_t __kernel_suseconds_t
-
 typedef long long		__kernel_off64_t;
 typedef unsigned long long	__kernel_ino64_t;
 
-- 
2.18.0
