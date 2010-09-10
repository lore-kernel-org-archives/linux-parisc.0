From: Phil Carmody <ext-phil.2.carmody@nokia.com>
Subject: [PATCH 1/1] PARISC: unwind - optimise linked-list searches for modules
Date: Fri, 10 Sep 2010 13:47:59 +0300
Message-ID: <1284115679-23928-1-git-send-email-ext-phil.2.carmody@nokia.com>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: kyle@mcmartin.ca, deller@gmx.de, jejb@parisc-linux.org
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Having many dozens of modules, the searches down the linked
list of sections would dominate the lookup time, dwarfing
any savings from the binary search within the section.

A simple move-to-front optimisation exploits the commonality
of the code paths taken, and in simple real-world tests
on other architectures reduced the number of steps in the
search to barely more than 1.

Signed-off-by: Phil Carmody <ext-phil.2.carmody@nokia.com>
---
 arch/parisc/kernel/unwind.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/arch/parisc/kernel/unwind.c b/arch/parisc/kernel/unwind.c
index d58eac1..76ed62e 100644
--- a/arch/parisc/kernel/unwind.c
+++ b/arch/parisc/kernel/unwind.c
@@ -80,8 +80,11 @@ find_unwind_entry(unsigned long addr)
 			if (addr >= table->start && 
 			    addr <= table->end)
 				e = find_unwind_entry_in_table(table, addr);
-			if (e)
+			if (e) {
+				/* Move-to-front to exploit common traces */
+				list_move(&table->list, &unwind_tables);
 				break;
+			}
 		}
 
 	return e;
-- 
1.5.6.5
