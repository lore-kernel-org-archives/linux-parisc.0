From: Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH] parisc: prefer _THIS_IP_ and _RET_IP_ statement expressions
Date: Wed,  1 Aug 2018 11:22:56 -0700
Message-ID: <20180801182258.17834-1-ndesaulniers@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: natechancellor@gmail.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Pravin Shedge <pravin.shedge4linux@gmail.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: deller@gmx.de, jejb@parisc-linux.org
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

As part of the effort to reduce the code duplication between _THIS_IP_
and current_text_addr(), let's consolidate callers of
current_text_addr() to use _THIS_IP_.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/parisc/kernel/unwind.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/kernel/unwind.c b/arch/parisc/kernel/unwind.c
index 2ef83d78eec4..a4b430f440a9 100644
--- a/arch/parisc/kernel/unwind.c
+++ b/arch/parisc/kernel/unwind.c
@@ -439,8 +439,8 @@ unsigned long return_address(unsigned int level)
 	/* initialize unwind info */
 	asm volatile ("copy %%r30, %0" : "=r"(sp));
 	memset(&r, 0, sizeof(struct pt_regs));
-	r.iaoq[0] = (unsigned long) current_text_addr();
-	r.gr[2] = (unsigned long) __builtin_return_address(0);
+	r.iaoq[0] = _THIS_IP_;
+	r.gr[2] = _RET_IP_;
 	r.gr[30] = sp;
 	unwind_frame_init(&info, current, &r);
 
-- 
2.18.0.597.ga71716f1ad-goog
