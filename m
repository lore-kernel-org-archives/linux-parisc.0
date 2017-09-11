From: Helge Deller <deller@gmx.de>
Subject: Re: fs/select.c:991:1: warning: the frame size of 1032 bytes is
 larger than 1024 bytes
Date: Mon, 11 Sep 2017 21:41:43 +0200
Message-ID: <20170911194143.GA17131@ls3530.fritz.box>
References: <alpine.LRH.2.21.1709111719310.23935@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org,
        Linux Kernel list <linux-kernel@vger.kernel.org>
To: Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.21.1709111719310.23935@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

* Meelis Roos <mroos@linux.ee>:
> fs/select.c:991:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> arch/parisc/kernel/inventory.c:359:1: warning: the frame size of 1120 bytes is larger than 1024 bytes [-Wframe-larger-than=]

Meelis, this patch should fix both issues.
Can you test?

Helge

[PATCH] parisc: Fix too large frame size warnings

The parisc architecture requires larger stack frames than most other
architectures on 32-bit kernels.
Increase the default to 1280 bytes for parisc to avoid warnings in
do_sys_poll() and pat_memconfig() functions.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index b19c491cbc4e..2689b7c50c52 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -219,7 +219,8 @@ config FRAME_WARN
 	range 0 8192
 	default 0 if KASAN
 	default 2048 if GCC_PLUGIN_LATENT_ENTROPY
-	default 1024 if !64BIT
+	default 1280 if (!64BIT && PARISC)
+	default 1024 if (!64BIT && !PARISC)
 	default 2048 if 64BIT
 	help
 	  Tell gcc to warn at build time for stack frames larger than this.
