From: Rolf Eike Beer <eike@sf-mail.de>
Subject: [PATCH 2/2] HIL: remove one goto
Date: Mon, 16 Jan 2012 20:13:42 +0100
Message-ID: <1907306.0Ne3j968CE@eto>
References: <6637509.yTD8q5zPsI@eto>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <6637509.yTD8q5zPsI@eto>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

>From 71de9e0407870c980e57335a5bc555f24d90683b Mon Sep 17 00:00:00 2001
From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Date: Mon, 16 Jan 2012 19:44:01 +0100
Subject: [PATCH 2/2] HIL: remove one goto

This goto is only used to skip the next instruction, which can easily be done
without a goto.

Signed-off-by: Rolf Eike Beer <eike-kernel@sf-tec.de>
---
 drivers/input/serio/hil_mlc.c |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/input/serio/hil_mlc.c b/drivers/input/serio/hil_mlc.c
index bfd3865..0280167 100644
--- a/drivers/input/serio/hil_mlc.c
+++ b/drivers/input/serio/hil_mlc.c
@@ -686,13 +686,12 @@ static int hilse_donode(hil_mlc *mlc)
 		write_lock_irqsave(&mlc->lock, flags);
 		pack = node->object.packet;
 	out:
-		if (mlc->istarted)
-			goto out2;
-		/* Prepare to receive input */
-		if ((node + 1)->act & HILSE_IN)
-			hilse_setup_input(mlc, node + 1);
+		if (!mlc->istarted) {
+			/* Prepare to receive input */
+			if ((node + 1)->act & HILSE_IN)
+				hilse_setup_input(mlc, node + 1);
+		}
 
-	out2:
 		write_unlock_irqrestore(&mlc->lock, flags);
 
 		if (down_trylock(&mlc->osem)) {
-- 
1.7.7


