From: Roland McGrath <roland@redhat.com>
Subject: [PATCH] Revert "parisc: HAVE_ARCH_TRACEHOOK"
Date: Mon, 22 Feb 2010 10:48:57 -0800 (PST)
Message-ID: <20100222184857.AA88C64C@magilla.sf.frob.com>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The following changes since commit 627fa177a1502ad24390d945851209ac022f3a36:
  Linus Torvalds (1):
        Merge branch 'for-linus' of git://git.kernel.org/.../dtor/input

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/frob/linux-2.6-roland.git parisc/tracehook

Roland McGrath (1):
      Revert "parisc: HAVE_ARCH_TRACEHOOK"

 arch/parisc/Kconfig |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)


Thanks,
Roland

---

[PATCH] Revert "parisc: HAVE_ARCH_TRACEHOOK"

This reverts commit 81bf550d9cdfe0325eb1504b06c9f6511b442c1a.

HAVE_ARCH_TRACEHOOK requires defining the user_regset interfaces,
including task_user_regset_view().  parisc doesn't do that yet,
so don't lie about it.

Signed-off-by: Roland McGrath <roland@redhat.com>
---
 arch/parisc/Kconfig |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 524d935..f388dc6 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -18,7 +18,6 @@ config PARISC
 	select BUG
 	select HAVE_PERF_EVENTS
 	select GENERIC_ATOMIC64 if !64BIT
-	select HAVE_ARCH_TRACEHOOK
 	help
 	  The PA-RISC microprocessor is designed by Hewlett-Packard and used
 	  in many of their workstations & servers (HP9000 700 and 800 series,
