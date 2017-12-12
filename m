From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Align os_hpmc_size on word boundry
Date: Tue, 12 Dec 2017 21:25:41 +0100
Message-ID: <20171212202541.GA12709@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The os_hpmc_size variable sometimes wasn't aligned at word boundry and
thus triggered the unaligned fault handler at startup. Fix it by
aligning it properly.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/hpmc.S b/arch/parisc/kernel/hpmc.S
index e3a8e5e4d5de..8d072c44f300 100644
--- a/arch/parisc/kernel/hpmc.S
+++ b/arch/parisc/kernel/hpmc.S
@@ -305,6 +305,7 @@ ENDPROC_CFI(os_hpmc)
 
 
 	__INITRODATA
+	.align 4
 	.export os_hpmc_size
 os_hpmc_size:
 	.word .os_hpmc_end-.os_hpmc
