From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Handle R_PARISC_PCREL32 relocation in kernel modules
Date: Fri, 8 Apr 2016 21:26:16 +0200
Message-ID: <20160408192616.GA4225@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: mpatocka@redhat.com
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Commit 0de7985 (parisc: Use generic extable search and sort routines)
changed the exception tables to use 32bit relative offsets.

With that change, the kernel needs to handle R_PARISC_PCREL32 relocations
which this patch adds.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/module.c b/arch/parisc/kernel/module.c
index b9d75d9..c54cf39 100644
--- a/arch/parisc/kernel/module.c
+++ b/arch/parisc/kernel/module.c
@@ -788,6 +788,10 @@ int apply_relocate_add(Elf_Shdr *sechdrs,
 			CHECK_RELOC(val, 22);
 			*loc = (*loc & ~0x3ff1ffd) | reassemble_22(val);
 			break;
+		case R_PARISC_PCREL32:
+			/* 32-bit PC relative address */
+			*loc = val - dot - 8 + addend;
+			break;
 		case R_PARISC_DIR64:
 			/* 64-bit effective address */
 			*loc64 = val + addend;
