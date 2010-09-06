From: Christian Dietrich <qy03fugy@stud.informatik.uni-erlangen.de>
Subject: [PATCH 03/14] arch/parisc: Removing undead ifdef CONFIG_PA20
Date: Mon, 6 Sep 2010 16:36:06 +0200
Message-ID: <27caeba6c5aeb0e5fffb339479ad1c87a1ec7ca3.1283782701.git.qy03fugy@stud.informatik.uni-erlangen.de>
References: <cover.1283782698.git.qy03fugy@stud.informatik.uni-erlangen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: vamos-dev@i4.informatik.uni-erlangen.de
To: Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Akinobu Mita <akinobu.mita@gmail.com>,
	linux-parisc@vger.kernel.org, li
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1283782698.git.qy03fugy@stud.informatik.uni-erlangen.de>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The CONFIG_PA20 ifdef isn't necessary at this point, because it is
checked in an outer ifdef level already and has no effect here.

Signed-off-by: Christian Dietrich <qy03fugy@stud.informatik.uni-erlangen.de>
---
 arch/parisc/kernel/unaligned.c |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/kernel/unaligned.c b/arch/parisc/kernel/unaligned.c
index 92d977b..234e368 100644
--- a/arch/parisc/kernel/unaligned.c
+++ b/arch/parisc/kernel/unaligned.c
@@ -619,15 +619,12 @@ void handle_unaligned(struct pt_regs *regs)
 		flop=1;
 		ret = emulate_std(regs, R2(regs->iir),1);
 		break;
-
-#ifdef CONFIG_PA20
 	case OPCODE_LDD_L:
 		ret = emulate_ldd(regs, R2(regs->iir),0);
 		break;
 	case OPCODE_STD_L:
 		ret = emulate_std(regs, R2(regs->iir),0);
 		break;
-#endif
 	}
 #endif
 	switch (regs->iir & OPCODE3_MASK)
-- 
1.7.0.4
