From: Helge Deller <deller@gmx.de>
Subject: parisc: fix redefinition of SET_PERSONALITY
Date: Sat, 2 Mar 2013 20:40:53 +0100
Message-ID: <20130302194053.GA873@p100.box>
References: <20130227221137.GA2806@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130227221137.GA2806@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

commit cf8e18ea2f8be26e8f9e44ed677d25f558ca301a
Author: Helge Deller <deller@gmx.de>
Date:   Sat Mar 2 20:15:28 2013 +0100

commit e72837e3e7bae3f182c4ac63c9424e86f1158dd0 introduced
a default SET_PERSONALITY() in include/linux/elf.h.
This breaks with our own SET_PERSONALITY define for
32bit userspace on 64bit kernel.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/binfmt_elf32.c b/arch/parisc/kernel/binfmt_elf32.c
index f61692d..00dc66f 100644
--- a/arch/parisc/kernel/binfmt_elf32.c
+++ b/arch/parisc/kernel/binfmt_elf32.c
@@ -85,6 +85,7 @@ struct elf_prpsinfo32
  * could set a processor dependent flag in the thread_struct.
  */
 
+#undef SET_PERSONALITY
 #define SET_PERSONALITY(ex) \
 	set_thread_flag(TIF_32BIT); \
 	current->thread.map_base = DEFAULT_MAP_BASE32; \
