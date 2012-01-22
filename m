From: Masanari Iida <standby24x7@gmail.com>
Subject: [PATCH] [trivial] parisc : Fix typo in eisa_enumerator.c
Date: Sun, 22 Jan 2012 21:05:48 +0900
Message-ID: <1327233948-2070-1-git-send-email-standby24x7@gmail.com>
Cc: standby24x7@gmail.com, linux-kernel@vger.kernel.org,
	torivial@kernel.org, kyle@mcmartin.ca
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Correct spelling "confgiuration" to "configuration" in
drivers/parisc/eisa_enumerator.c

Signed-off-by: Masanari Iida <standby24x7@gmail.com>
---
 drivers/parisc/eisa_enumerator.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/parisc/eisa_enumerator.c b/drivers/parisc/eisa_enumerator.c
index caa1531..a656d9e 100644
--- a/drivers/parisc/eisa_enumerator.c
+++ b/drivers/parisc/eisa_enumerator.c
@@ -357,7 +357,7 @@ static int parse_slot_config(int slot,
 		}
 		if (flags & HPEE_FUNCTION_INFO_CFG_FREE_FORM) {
 			/* I have no idea how to handle this */
-			printk("function %d have free-form confgiuration, skipping ",
+			printk("function %d have free-form configuration, skipping ",
 				num_func);
 			pos = p0 + function_len;
 			continue;
-- 
1.7.6.5

