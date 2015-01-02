From: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Subject: [PATCH] arch: parisc: kernel: smp:  Remove unused function
Date: Fri,  2 Jan 2015 21:34:21 +0100
Message-ID: <1420230861-2548-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Cc: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: "James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Remove the function smp_send_start() that is not used anywhere.

This was partially found by using a static code analysis program called cppcheck.

Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
---
 arch/parisc/kernel/smp.c |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index ceda229..52e8597 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -230,9 +230,6 @@ send_IPI_allbutself(enum ipi_message_type op)
 inline void 
 smp_send_stop(void)	{ send_IPI_allbutself(IPI_CPU_STOP); }
 
-static inline void
-smp_send_start(void)	{ send_IPI_allbutself(IPI_CPU_START); }
