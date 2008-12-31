From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: fix module loading failure of large kernel modules
 (take 4)
Date: Wed, 31 Dec 2008 12:31:18 +0100
Message-ID: <495B5806.3080505@gmx.de>
References: <4959346E.7060600@gmx.de> <200812310915.41693.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	Linux Kernel Development <linux-kernel@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>,
	Randolph Chung <randolph@tausq.org>,
	Linus <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>
To: Rusty Russell <rusty@rustcorp.com.au>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200812310915.41693.rusty@rustcorp.com.au>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

[PATCH 1/2] module.c: fix module loading failure of large kernel modules

When creating the final layout of a kernel module in memory, allow the
module loader to reserve some additional memory in front of a given section.
This is currently only needed for the parisc port which needs to put the
stub entries there to fulfill the 17/22bit PCREL relocations with large
kernel modules like xfs.

Differences of this patch to previous versions:
- added weak funtion arch_module_section_size()
- no kernel config options needed
- no overloading of sh_entsize

Signed-off-by: Helge Deller <deller@gmx.de>

diffstat:
 include/linux/moduleloader.h |    4 ++++
 kernel/module.c              |   16 +++++++++++++---
 2 files changed, 17 insertions(+), 3 deletions(-)


diff --git a/include/linux/moduleloader.h b/include/linux/moduleloader.h
index eb10339..f2b1b62 100644
--- a/include/linux/moduleloader.h
+++ b/include/linux/moduleloader.h
@@ -13,6 +13,10 @@ int module_frob_arch_sections(Elf_Ehdr *hdr,
 			      char *secstrings,
 			      struct module *mod);
 
+/* Additional bytes needed by arch in front of individual sections */
+unsigned int arch_module_section_size(struct module *mod,
+				      unsigned int section);
+
 /* Allocator used for allocating struct module, core sections and init
    sections.  Returns NULL on failure. */
 void *module_alloc(unsigned long size);
diff --git a/kernel/module.c b/kernel/module.c
index 1f4cc00..5b91b17 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -1578,11 +1578,21 @@ static int simplify_symbols(Elf_Shdr *sechdrs,
 	return ret;
 }
 
+/* Additional bytes needed by arch in front of individual sections */
+unsigned int __attribute__ ((weak)) arch_module_section_size(
+		struct module *mod, unsigned int section)
+{
+	/* default implementation just returns zero */
+	return 0;
+}
+
 /* Update size with this section: return offset. */
-static long get_offset(unsigned int *size, Elf_Shdr *sechdr)
+static long get_offset(struct module *mod, unsigned int *size,
+		Elf_Shdr *sechdr, unsigned int section)
 {
 	long ret;
 
+	*size += arch_module_section_size(mod, section);
 	ret = ALIGN(*size, sechdr->sh_addralign ?: 1);
 	*size = ret + sechdr->sh_size;
 	return ret;
@@ -1622,7 +1632,7 @@ static void layout_sections(struct module *mod,
 			    || strncmp(secstrings + s->sh_name,
 				       ".init", 5) == 0)
 				continue;
-			s->sh_entsize = get_offset(&mod->core_size, s);
+			s->sh_entsize = get_offset(mod, &mod->core_size, s, i);
 			DEBUGP("\t%s\n", secstrings + s->sh_name);
 		}
 		if (m == 0)
@@ -1640,7 +1650,7 @@ static void layout_sections(struct module *mod,
 			    || strncmp(secstrings + s->sh_name,
 				       ".init", 5) != 0)
 				continue;
-			s->sh_entsize = (get_offset(&mod->init_size, s)
+			s->sh_entsize = (get_offset(mod, &mod->init_size, s, i)
 					 | INIT_OFFSET_MASK);
 			DEBUGP("\t%s\n", secstrings + s->sh_name);
 		}
