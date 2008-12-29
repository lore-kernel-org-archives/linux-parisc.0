From: Helge Deller <deller@gmx.de>
Subject: [PATCH 1/2] module.c: fix module loading failure of large modules
 (take 2)
Date: Mon, 29 Dec 2008 21:43:12 +0100
Message-ID: <49593660.2010900@gmx.de>
References: <4959346E.7060600@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc <linux-parisc@vger.kernel.org>,
	Linux Kernel Development <linux-kernel@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>,
	Randolph Chung <randolph@tausq.org>,
	Linus <to
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4959346E.7060600@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

[PATCH 1/2] module.c: fix module loading failure of large modules (take 2)

When creating the final layout of a kernel module in memory, allow the
module loader to reserve some additional memory in front of a given section.
This is currently only needed for the parisc port which needs to put the
stub entries there to fulfill the 17/22bit PCREL relocations with large
kernel modules like xfs.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/include/linux/moduleloader.h b/include/linux/moduleloader.h
index eb10339..65fb34c 100644
--- a/include/linux/moduleloader.h
+++ b/include/linux/moduleloader.h
@@ -13,6 +13,9 @@ int module_frob_arch_sections(Elf_Ehdr *hdr,
 			      char *secstrings,
 			      struct module *mod);
 
+unsigned long module_additional_section_size(struct module *mod,
+					     unsigned int section);
+
 /* Allocator used for allocating struct module, core sections and init
    sections.  Returns NULL on failure. */
 void *module_alloc(unsigned long size);
diff --git a/init/Kconfig b/init/Kconfig
index f763762..5383815 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -908,6 +908,9 @@ config MODULE_SRCVERSION_ALL
 	  the version).  With this option, such a "srcversion" field
 	  will be created for all modules.  If unsure, say N.
 
+config HAVE_MODULE_SECTION_STUBS
+	bool
+
 config KMOD
 	def_bool y
 	help
diff --git a/kernel/module.c b/kernel/module.c
index 1f4cc00..4b86308 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -1579,10 +1579,15 @@ static int simplify_symbols(Elf_Shdr *sechdrs,
 }
 
 /* Update size with this section: return offset. */
-static long get_offset(unsigned int *size, Elf_Shdr *sechdr)
+static long get_offset(struct module *mod, unsigned int *size,
+		Elf_Shdr *sechdr, unsigned int section)
 {
 	long ret;
 
+#ifdef CONFIG_HAVE_MODULE_SECTION_STUBS
+	/* allocate some memory for stubs in front of each section */
+	*size += module_additional_section_size(mod, section);
+#endif
 	ret = ALIGN(*size, sechdr->sh_addralign ?: 1);
 	*size = ret + sechdr->sh_size;
 	return ret;
@@ -1622,7 +1627,7 @@ static void layout_sections(struct module *mod,
 			    || strncmp(secstrings + s->sh_name,
 				       ".init", 5) == 0)
 				continue;
-			s->sh_entsize = get_offset(&mod->core_size, s);
+			s->sh_entsize = get_offset(mod, &mod->core_size, s, i);
 			DEBUGP("\t%s\n", secstrings + s->sh_name);
 		}
 		if (m == 0)
@@ -1640,7 +1645,7 @@ static void layout_sections(struct module *mod,
 			    || strncmp(secstrings + s->sh_name,
 				       ".init", 5) != 0)
 				continue;
-			s->sh_entsize = (get_offset(&mod->init_size, s)
+			s->sh_entsize = (get_offset(mod, &mod->init_size, s, i)
 					 | INIT_OFFSET_MASK);
 			DEBUGP("\t%s\n", secstrings + s->sh_name);
 		}
