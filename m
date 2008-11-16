From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH/resend] parisc: __kernel_time_t is always long
Date: Sun, 16 Nov 2008 12:04:13 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0811161203140.20437@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, trivial@kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

__kernel_time_t is always long on PA-RISC, irrespective of CONFIG_64BIT,
hence move it out of the #ifdef CONFIG_64BIT / #else / #endif block.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/parisc/include/asm/posix_types.h |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- a/arch/parisc/include/asm/posix_types.h
+++ b/arch/parisc/include/asm/posix_types.h
@@ -24,13 +24,12 @@ typedef int			__kernel_daddr_t;
 typedef unsigned long		__kernel_size_t;
 typedef long			__kernel_ssize_t;
 typedef long			__kernel_ptrdiff_t;
-typedef long			__kernel_time_t;
 #else
 typedef unsigned int		__kernel_size_t;
 typedef int			__kernel_ssize_t;
 typedef int			__kernel_ptrdiff_t;
-typedef long			__kernel_time_t;
 #endif
+typedef long			__kernel_time_t;
 typedef char *			__kernel_caddr_t;
 
 typedef unsigned short		__kernel_uid16_t;

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
