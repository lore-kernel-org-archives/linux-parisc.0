From: Babu Moger <babu.moger@oracle.com>
Subject: [PATCH 2/2] arch: change default endian for microblaze
Date: Mon, 18 Sep 2017 10:53:29 -0600
Message-ID: <1505753609-602923-3-git-send-email-babu.moger@oracle.com>
References: <1505753609-602923-1-git-send-email-babu.moger@oracle.com>
Cc: sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-parisc@vger.kernel.org, babu.moger@oracle.com
To: monstr@monstr.eu, jejb@parisc-linux.org, deller@gmx.de,
        davem@davemloft.net, akpm@linux-foundation.org
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1505753609-602923-1-git-send-email-babu.moger@oracle.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Fix the default for microblaze. Michal Simek mentioned default for
microblaze should be CPU_LITTLE_ENDIAN.

Fixes : commit 206d3642d8ee ("arch/microblaze: add choice for endianness
	and update Makefile")

Signed-off-by: Babu Moger <babu.moger@oracle.com>
Cc: Michal Simek <monstr@monstr.eu>
---
 arch/microblaze/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/microblaze/Kconfig b/arch/microblaze/Kconfig
index 9d26abd..4f798aa 100644
--- a/arch/microblaze/Kconfig
+++ b/arch/microblaze/Kconfig
@@ -39,7 +39,7 @@ config MICROBLAZE
 # Endianness selection
 choice
 	prompt "Endianness selection"
-	default CPU_BIG_ENDIAN
+	default CPU_LITTLE_ENDIAN
 	help
 	  microblaze architectures can be configured for either little or
 	  big endian formats. Be sure to select the appropriate mode.
-- 
1.7.1
