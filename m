From: =?utf-8?q?S=2E=C3=87a=C4=9Flar=20Onur?= <caglar@pardus.org.tr>
Subject: [PATCH 03/14] arch/parisc/kernel/unaligned.c: Use time_* macros
Date: Thu, 14 Feb 2008 17:36:41 +0200
Message-ID: <1203003412-11594-4-git-send-email-caglar@pardus.org.tr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: linux-parisc@vger.kernel.org,
	=?utf-8?q?S=2E=C3=87a=C4=9Flar=20Onur?= <caglar@pardus.org.tr>
To: linux-kernel@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: y
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The functions time_before, time_before_eq, time_after, and time_after_e=
q are more robust for comparing jiffies against other values.

So following patch implements usage of the time_after() macro, defined =
at linux/jiffies.h, which deals with wrapping correctly

Cc: linux-parisc@vger.kernel.org
Signed-off-by: S.=C3=87a=C4=9Flar Onur <caglar@pardus.org.tr>
---
 arch/parisc/kernel/unaligned.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/parisc/kernel/unaligned.c b/arch/parisc/kernel/unalig=
ned.c
index aebf3c1..19b8a79 100644
--- a/arch/parisc/kernel/unaligned.c
+++ b/arch/parisc/kernel/unaligned.c
@@ -460,7 +460,7 @@ void handle_unaligned(struct pt_regs *regs)
 			goto force_sigbus;
 		}
=20
-		if (unaligned_count > 5 && jiffies - last_time > 5*HZ) {
+		if (unaligned_count > 5 && time_after(jiffies, last_time + 5 * HZ)) =
{
 			unaligned_count =3D 0;
 			last_time =3D jiffies;
 		}
--=20
1.5.3.7
