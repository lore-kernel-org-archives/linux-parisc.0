From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Fix __ARCH_SI_PREAMBLE_SIZE on parisc
Date: Sun, 10 Jan 2016 09:30:42 +0100
Message-ID: <20160110083042.GA7353@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On a 64bit kernel build the compiler aligns the _sifields union in the
struct siginfo_t on a 64bit address. The __ARCH_SI_PREAMBLE_SIZE define
compensates for this alignment and thus fixes the wait testcase of the
strace package.

The symptoms of a wrong __ARCH_SI_PREAMBLE_SIZE value is that
_sigchld.si_stime variable is missed to be copied and thus after a
copy_siginfo() will have uninitialized values.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org

diff --git a/arch/parisc/include/uapi/asm/siginfo.h b/arch/parisc/include/uapi/asm/siginfo.h
index d703472..1c75565 100644
--- a/arch/parisc/include/uapi/asm/siginfo.h
+++ b/arch/parisc/include/uapi/asm/siginfo.h
@@ -1,6 +1,10 @@
 #ifndef _PARISC_SIGINFO_H
 #define _PARISC_SIGINFO_H
 
+#if defined(__LP64__)
+#define __ARCH_SI_PREAMBLE_SIZE   (4 * sizeof(int))
+#endif
+
 #include <asm-generic/siginfo.h>
 
 #undef NSIGTRAP
