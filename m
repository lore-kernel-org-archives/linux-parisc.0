From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: fix personality on 32bit kernel
Date: Sun, 10 Feb 2013 00:11:46 +0100
Message-ID: <20130209231146.GA23219@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Process personality is stored together with other flags like UNAME26 in
an integer variable.  Overwriting this value with PER_LINUX drops all
other existing flags and as such broke tools like the uname26 tool.

Actually this was only broken on 32bit kernels, since for 32bit-ELF
binaries on 64-bit kernels the SET_PERSONALITY macro from
arch/parisc/kernel/binfmt_elf32.c is used which does not modifies the
personality value at all (which is wrong as long as we don't run HPUX
binaries or similiar).

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/elf.h b/arch/parisc/include/asm/elf.h
index 19f6cb1..ad2b503 100644
--- a/arch/parisc/include/asm/elf.h
+++ b/arch/parisc/include/asm/elf.h
@@ -247,7 +247,7 @@ typedef unsigned long elf_greg_t;
 #define ELF_PLATFORM  ("PARISC\0")
 
 #define SET_PERSONALITY(ex) \
-	current->personality = PER_LINUX; \
+	set_personality((current->personality & ~PER_MASK) | PER_LINUX); \
 	current->thread.map_base = DEFAULT_MAP_BASE; \
 	current->thread.task_size = DEFAULT_TASK_SIZE \
 
