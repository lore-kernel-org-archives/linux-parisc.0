From: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Subject: [PATCH] fix backtrace on PA-RISC
Date: Wed, 29 Jun 2011 00:48:19 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1106290043170.32272@artax.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org,
	John David Anglin <dave@hiauly1.hia.nrc.ca>
To: "James E.J. Bottomley" <jejb@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi

This patch fixes frame unwind on PA-RISC.

Prior to the patch, stack backtraces often caused crashes and this 
resulted in recursive page faults.

Mikulas

---

This patch fixes backtrace on PA-RISC

There were several problems:

1) The code that decodes instructions handles instructions that subtract
from the stack pointer incorrectly. If the instruction subtracts the number X
from the stack pointer the code increases the frame size by (0x100000000-X).
This results in invalid accesses to memory and recursive page faults.

2) Becuase gcc reorders blocks, handling instructions that subtract from the
frame pointer is incorrect. For example, this function
"int f(int a)
{
	if (__builtin_expect(a, 1))
		return a;
	g();
	return a;
}"
is compiled in such a way, that the code that decreases the stack pointer for
the first "return a" is placed before the code for "g" call. If we recognize
this decrement, we mistakenly believe that the frame size for the "g" call
is zero.

To fix problems 1) and 2), the patch doesn't recognize instructions that
decrease the stack pointer at all. To further safeguard the unwind code
against nonsense values, we don't allow frame size larger than
Total_frame_size.

3) The backtrace is not locked. If stack dump races with module unload,
invalid table can be accessed.

This patch adds a spinlock when processing module tables.

Note, that for correct backtrace, you need recent binutils.
Binutils 2.18 from Debian 5 produce garbage unwind tables.
Binutils 2.21 work better (it sometimes forgets function frames, but at 
least it doesn't generate garbage).

Signed-off-by: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>

---
 arch/parisc/kernel/unwind.c |   22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

Index: linux-2.6.39-fast/arch/parisc/kernel/unwind.c
===================================================================
--- linux-2.6.39-fast.orig/arch/parisc/kernel/unwind.c	2011-06-28 18:15:14.000000000 +0200
+++ linux-2.6.39-fast/arch/parisc/kernel/unwind.c	2011-06-29 00:24:43.000000000 +0200
@@ -75,7 +75,10 @@ find_unwind_entry(unsigned long addr)
 	if (addr >= kernel_unwind_table.start && 
 	    addr <= kernel_unwind_table.end)
 		e = find_unwind_entry_in_table(&kernel_unwind_table, addr);
-	else 
+	else {
+		unsigned long flags;
+
+		spin_lock_irqsave(&unwind_lock, flags);
 		list_for_each_entry(table, &unwind_tables, list) {
 			if (addr >= table->start && 
 			    addr <= table->end)
@@ -86,6 +89,8 @@ find_unwind_entry(unsigned long addr)
 				break;
 			}
 		}
+		spin_unlock_irqrestore(&unwind_lock, flags);
+	}
 
 	return e;
 }
@@ -305,18 +310,16 @@ static void unwind_frame_regs(struct unw
 
 			insn = *(unsigned int *)npc;
 
-			if ((insn & 0xffffc000) == 0x37de0000 ||
-			    (insn & 0xffe00000) == 0x6fc00000) {
+			if ((insn & 0xffffc001) == 0x37de0000 ||
+			    (insn & 0xffe00001) == 0x6fc00000) {
 				/* ldo X(sp), sp, or stwm X,D(sp) */
-				frame_size += (insn & 0x1 ? -1 << 13 : 0) | 
-					((insn & 0x3fff) >> 1);
+				frame_size += (insn & 0x3fff) >> 1;
 				dbg("analyzing func @ %lx, insn=%08x @ "
 				    "%lx, frame_size = %ld\n", info->ip,
 				    insn, npc, frame_size);
-			} else if ((insn & 0xffe00008) == 0x73c00008) {
+			} else if ((insn & 0xffe00009) == 0x73c00008) {
 				/* std,ma X,D(sp) */
-				frame_size += (insn & 0x1 ? -1 << 13 : 0) | 
-					(((insn >> 4) & 0x3ff) << 3);
+				frame_size += ((insn >> 4) & 0x3ff) << 3;
 				dbg("analyzing func @ %lx, insn=%08x @ "
 				    "%lx, frame_size = %ld\n", info->ip,
 				    insn, npc, frame_size);
@@ -335,6 +338,9 @@ static void unwind_frame_regs(struct unw
 			}
 		}
 
+		if (frame_size > e->Total_frame_size << 3)
+			frame_size = e->Total_frame_size << 3;
+
 		if (!unwind_special(info, e->region_start, frame_size)) {
 			info->prev_sp = info->sp - frame_size;
 			if (e->Millicode)
