From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc fix for kernel v4.19
Date: Wed, 17 Oct 2018 08:45:24 +0200
Message-ID: <20181017064524.GA32311@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Greg,

would you please include the trivial patch below for 4.19?
My older cross-compiler didn't complained, so it went unnoticed for me until
now and the faulty code was added during the 4.19 merge window.

It can be pulled from my git tree as well:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.19-3

Fix an unitialized variable usage in the parisc unwind code.

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (1):
      parisc: Fix uninitialized variable usage in unwind.c

 arch/parisc/kernel/unwind.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


----------------------------------------------------------------

From: Helge Deller <deller@gmx.de>
Date: Tue, 16 Oct 2018 08:21:48 +0200
Subject: parisc: Fix uninitialized variable usage in unwind.c

As noticed by Dave Anglin, the last commit introduced a small bug where
the potentially uninitialized r struct is used instead of the regs
pointer as input for unwind_frame_init(). Fix it.

Signed-off-by: Helge Deller <deller@gmx.de>
Reported-by: John David Anglin <dave.anglin@bell.net>

diff --git a/arch/parisc/kernel/unwind.c b/arch/parisc/kernel/unwind.c
index f329b466e68f..2d14f17838d2 100644
--- a/arch/parisc/kernel/unwind.c
+++ b/arch/parisc/kernel/unwind.c
@@ -426,7 +426,7 @@ void unwind_frame_init_task(struct unwind_frame_info *info,
 			r.gr[30] = get_parisc_stackpointer();
 			regs = &r;
 		}
-		unwind_frame_init(info, task, &r);
+		unwind_frame_init(info, task, regs);
 	} else {
 		unwind_frame_init_from_blocked_task(info, task);
 	}
