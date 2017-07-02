From: Helge Deller <deller@gmx.de>
Subject: [PATCH v2] mm: Fix overflow check in expand_upwards()
Date: Sun, 2 Jul 2017 21:24:52 +0200
Message-ID: <20170702192452.GA11868@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Cc: =?iso-8859-15?Q?J=F6rn?= Engel <joern@purestorage.com>,
        linux-parisc@vger.kernel.org
To: Hugh Dickins <hughd@google.com>, linux-kernel@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Jörn Engel noticed that the expand_upwards() function might not return -ENOMEM
in case the requested address is (unsigned long)-PAGE_SIZE and if the
architecture didn't defined TASK_SIZE as multiple of PAGE_SIZE.

Affected architectures are arm, frv, m68k, blackfin, h8300 and xtensa which all
define TASK_SIZE as 0xffffffff, but since none of those have an upwards-growing
stack we currently have no actual issue.

Nevertheless let's fix this just in case any of the architectures with an
upward-growing stack (currently parisc, metag and partly ia64) define TASK_SIZE
similar.

Reported-by: Jörn Engel <joern@purestorage.com>
Fixes: bd726c90b6b8 ("Allow stack to grow up to address space limit")
Cc: stable@vger.kernel.org
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/mm/mmap.c b/mm/mmap.c
index a5e3dcd..cc2fc8a 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2232,7 +2232,7 @@ int expand_upwards(struct vm_area_struct *vma, unsigned long address)
 
 	/* Guard against exceeding limits of the address space. */
 	address &= PAGE_MASK;
-	if (address >= TASK_SIZE)
+	if (address >= (TASK_SIZE & PAGE_MASK))
 		return -ENOMEM;
 	address += PAGE_SIZE;
 
