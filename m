From: Helge Deller <deller@gmx.de>
Subject: [PATCH 6/7] parisc: add parameter to read_cr16()]
Date: Fri, 01 May 2009 00:43:46 +0200
Message-ID: <49FA29A2.9040701@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: linux-parisc <linux-parisc@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>, Coly Li <coly.li@suse.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Forwarded to parisc mailing list (and patchwork).
Patch is good.

Signed-off-by: Helge Deller <deller@gmx.de>

-------- Original Message --------
Subject: [PATCH 6/7] parisc: add parameter to read_cr16()
Date: Thu, 23 Apr 2009 03:06:22 +0800
From: Coly Li <coly.li@suse.de>
Reply-To: coly.li@suse.de
Organization: SuSE Labs
To: LKML <linux-kernel@vger.kernel.org>
CC: Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@elte.hu>

This patch modifies parameter of au1x_counter1_read() from 'void' to 'struct
clocksource *cs', which fixes compile warning for incompatible parameter type.

Signed-off-by: Coly Li <coly.li@suse.de>
Cc: Helge Deller <deller@gmx.de>
Cc: Ingo Molnar <mingo@elte.hu>
---
 arch/parisc/kernel/time.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index d4dd056..d97d07f 100644
--- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -173,7 +173,7 @@ EXPORT_SYMBOL(profile_pc);

 /* clock source code */

-static cycle_t read_cr16(void)
+static cycle_t read_cr16(struct clocksource *cs)
 {
 	return get_cycles();
 }

-- 
Coly Li
SuSE Labs



