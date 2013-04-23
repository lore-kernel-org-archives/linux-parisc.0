From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: disable -mlong-calls compiler option for kernel
 modules
Date: Tue, 23 Apr 2013 22:20:11 +0200
Message-ID: <20130423202011.GA7252@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

commit 87622023a2071f81037c92d34ab20ed062e53ea5
Author: Helge Deller <deller@gmx.de>
Date:   Tue Apr 23 15:59:45 2013 +0200

parisc: disable -mlong-calls compiler option for kernel modules

CONFIG_MLONGCALLS was introduced in commit
ec758f98328da3eb933a25dc7a2eed01ef44d849 to overcome linker issues when linking
huge linux kernels (e.g. with many modules linked in).

But in the kernel module loader there is no support yet for the new
relocation types, which is why modules built with -mlong-calls can't be
loaded.
Furthermore, for modules long calls are not really necessary, since we already use
stub sections which resolve long distance calls.

So, let's just disable this compiler option when compiling kernel
modules.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 01d95e2..c9259b5 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -65,8 +65,10 @@ ifndef CONFIG_FUNCTION_TRACER
 endif
 
 # Use long jumps instead of long branches (needed if your linker fails to
-# link a too big vmlinux executable)
-cflags-$(CONFIG_MLONGCALLS)	+= -mlong-calls
+# link a too big vmlinux executable). Not enabled for building modules.
+ifdef CONFIG_MLONGCALLS
+KBUILD_CFLAGS_KERNEL += -mlong-calls
+endif
 
 # select which processor to optimise for
 cflags-$(CONFIG_PA7100)		+= -march=1.1 -mschedule=7100
