From: Julia Lawall <julia@diku.dk>
Subject: [PATCH] arch/parisc: correct use of SHF_ALLOC
Date: Tue, 4 Aug 2009 22:27:07 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0908042226231.3737@ask.diku.dk>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
To: Helge Deller <deller@gmx.de>, Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Julia Lawall <julia@diku.dk>

SHF_ALLOC is suitable for testing against the sh_flags field, not the
sh_type field.

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/parisc/kernel/module.c         |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/parisc/kernel/module.c b/arch/parisc/kernel/module.c
index ef5caf2..c904817 100644
--- a/arch/parisc/kernel/module.c
+++ b/arch/parisc/kernel/module.c
@@ -853,7 +853,7 @@ int module_finalize(const Elf_Ehdr *hdr,
 	 * ourselves */
 	for (i = 1; i < hdr->e_shnum; i++) {
 		if(sechdrs[i].sh_type == SHT_SYMTAB
-		   && (sechdrs[i].sh_type & SHF_ALLOC)) {
+		   && (sechdrs[i].sh_flags & SHF_ALLOC)) {
 			int strindex = sechdrs[i].sh_link;
 			/* FIXME: AWFUL HACK
 			 * The cast is to drop the const from
