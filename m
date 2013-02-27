From: Helge Deller <deller@gmx.de>
Subject: parisc: remove unused variable 'compat_val'
Date: Wed, 27 Feb 2013 23:19:46 +0100
Message-ID: <20130227221946.GA2896@p100.box>
References: <20130227221137.GA2806@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130227221137.GA2806@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

commit db0c2fcccf9ea3dc30f6e3b910bca7f819fb3a21
Author: Helge Deller <deller@gmx.de>
Date:   Wed Feb 27 00:02:31 2013 +0100

parisc: remove unused variable 'compat_val'

clean up after commit 6e26aab98ce8a818fb1ec47f8f727a8480a9011b
(switch to generic sigaltstack)

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
index 98e9e71..940188d 100644
--- a/arch/parisc/kernel/signal.c
+++ b/arch/parisc/kernel/signal.c
@@ -242,7 +242,6 @@ setup_rt_frame(int sig, struct k_sigaction *ka, siginfo_t *info,
 	unsigned long haddr, sigframe_size;
 	int err = 0;
 #ifdef CONFIG_64BIT
-	compat_int_t compat_val;
 	struct compat_rt_sigframe __user * compat_frame;
 	compat_sigset_t compat_set;
 #endif
