From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Reduce SIGRTMIN from 37 to 32 to behave like other
 Linux architectures
Date: Fri, 10 Oct 2014 22:20:17 +0200
Message-ID: <20141010202017.GA3644@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Carlos O'Donell <carlos@systemhalted.org>,
	John David Anglin <dave.anglin@bell.net>,
	Aaro Koskinen <aaro.koskinen@iki.fi>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This patch reduces the value of SIGRTMIN on PARISC from 37 to 32, thus
increasing the number of available RT signals and bring it in sync with other
Linux architectures.

Historically we wanted to natively support HP-UX 32bit binaries with the
PA-RISC Linux port.  Because of that we carried the various available signals
from HP-UX (e.g. SIGEMT and SIGLOST) and folded them in between the native
Linux signals.  Although this was the right decision at that time, this
required us to increase SIGRTMIN to at least 37 which left us with 27 (64-37)
RT signals.

Those 27 RT signals haven't been a problem in the past, but with the upcoming
importance of systemd we now got the problem that systemd alloctes (hardcoded)
signals up to SIGRTMIN+29 which is beyond our NSIG of 64. Because of that we
have not been able to use systemd on the PARISC Linux port yet.

Of course we could ask the systemd developers to not use those hardcoded
values, but this change is very unlikely, esp. with PA-RISC being a niche
architecture.

The other possibility would be to increase NSIG to e.g. 128, but this would
mean to duplicate most of the existing Linux signal handling code into the
parisc specific Linux kernel tree which would most likely introduce lots of new
bugs beside the code duplication.

The third option is to drop some HP-UX signals and shuffle some other signals
around to bring SIGRTMIN to 32.  This is of course an ABI change, but testing
has shown that existing Linux installations are not visibly affected by this
change - most likely because we move those signals around which are rarely used
and move them to slots which haven't been used in Linux yet. In an existing
installation I was able to exchange either the Linux kernel or glibc (or both)
without affecting the boot process and installed applications.

Dropping the HP-UX signals isn't an issue either, since support for HP-UX was
basically dropped a few months back with Kernel 3.14 in commit
f5a408d53edef3af07ac7697b8bc54a755628450 already, when we changed EWOULDBLOCK
to be equal to EAGAIN.

So, even if this is an ABI change, it's better to change it now and thus bring
PARISC Linux in sync with other architectures to avoid other issues in the
future.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: Carlos O'Donell <carlos@systemhalted.org>
Cc: John David Anglin <dave.anglin@bell.net>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: PARISC Linux Kernel Mailinglist <linux-parisc@vger.kernel.org>


diff --git a/arch/parisc/include/uapi/asm/signal.h b/arch/parisc/include/uapi/asm/signal.h
index f5645d6..10df707 100644
--- a/arch/parisc/include/uapi/asm/signal.h
+++ b/arch/parisc/include/uapi/asm/signal.h
@@ -8,12 +8,12 @@
 #define SIGTRAP		 5
 #define SIGABRT		 6
 #define SIGIOT		 6
-#define SIGEMT		 7
+#define SIGSTKFLT	 7
 #define SIGFPE		 8
 #define SIGKILL		 9
 #define SIGBUS		10
 #define SIGSEGV		11
-#define SIGSYS		12 /* Linux doesn't use this */
+#define SIGXCPU		12
 #define SIGPIPE		13
 #define SIGALRM		14
 #define SIGTERM		15
@@ -32,16 +32,12 @@
 #define SIGTTIN		27
 #define SIGTTOU		28
 #define SIGURG		29
-#define SIGLOST		30 /* Linux doesn't use this either */
-#define	SIGUNUSED	31
-#define SIGRESERVE	SIGUNUSED
