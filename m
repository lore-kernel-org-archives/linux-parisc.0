From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: vmlinux.lds.S: fix linkage of the 64bit SMP debian
 kernel
Date: Fri, 22 Nov 2013 17:29:52 +0100
Message-ID: <20131122162952.GA10699@ls3530.dhcp.wdf.sap.corp>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

When building the 64bit SMP kernel for debian it may happen that it becomes too
big so that functions in the .init.text or .exit.text may not be able to reach
important kernel functions in the .text section. Main reason why this happens
with a 64bit kernel build is that we include the linkage tables (.opd, .plt,
.dlt) in that data section.  Those linkage tables tend to become huge, and
since they are located between the .text and the .init sections the distance
gets too far.

If the linker fails to link vmlinux, it will either crash without any error
message, or it will - with newer linker versions - report the following error:

hppa64-linux-gnu-ld: drivers/built-in.o(.exit.text+0xc4): cannot reach _raw_read_lock
drivers/built-in.o: In function `pdc_stable_exit':
drivers/parisc/pdc_stable.o:(.exit.text+0xc4): relocation truncated to fit: R_PARISC_PCREL22F against symbol `_raw_read_lock' defined in .spinlock.text section in kernel/built-in.o

We have three options to solve this issue:
a) Turn on CONFIG_MLONGCALLS, which will instruct the compiler to use the
   -mlongcall option. But this option will hurt performance.
b) Tell the linker (via vmlinux.lds.S) to move the .init.text and .exit.text
   sections into the normal .text section. Downside here is, that those sections
   will not be discarded at runtime.
c) Move the linkage tables somewhere else. Even if this would be possible I did
   not find a nice solution without any other bad side effects.

Since we are compiling a 64bit kernel which usually runs on machines with lots
of memory, I preferred option b) since performance is usually more imortant than
some lost memory area.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index 4bb095a..f16fa7d 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -67,6 +78,10 @@ SECTIONS
 		*(.fixup)
 		*(.lock.text)		/* out-of-line lock text */
 		*(.gnu.warning)
+#if defined(CONFIG_64BIT) && !defined(CONFIG_MLONGCALLS)
+		INIT_TEXT
+		EXIT_TEXT
+#endif
 	}
 	/* End of text section */
 	_etext = .;
