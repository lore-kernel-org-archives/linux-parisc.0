From: Helge Deller <deller@gmx.de>
Subject: [PATCH 1/2] module.c: fix module loading failure of large modules
Date: Mon, 29 Dec 2008 15:09:12 +0100
Message-ID: <4958DA08.1080008@gmx.de>
References: <4958D99E.4010201@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040105060008050603090205"
Cc: Helge Deller <deller@gmx.de>
To: linux-parisc@vger.kernel.org,
	Linux Kernel Development <linux-kernel@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>,
	Randolph Chung <randolph@tausq.org>,
	Moritz Muehlenhoff <jmm@
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4958D99E.4010201@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------040105060008050603090205
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

[PATCH 1/2] module.c: fix module loading failure of large modules

When creating the final layout of a kernel module in memory, allow the
module loader to reserve some additional memory behind a given section.
This is currently only needed for the parisc port which needs to put the
stub entries there to fulfill the 17/22bit PCREL relocations with large
kernel modules like xfs.

Signed-off-by: Helge Deller <deller@gmx.de>


--------------040105060008050603090205
Content-Type: text/plain;
 name="modules.patch1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="modules.patch1"

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
diff --git a/kernel/module.c b/kernel/module.c
index 1f4cc00..c7662da 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -1579,12 +1579,16 @@ static int simplify_symbols(Elf_Shdr *sechdrs,
 }
 
 /* Update size with this section: return offset. */
-static long get_offset(unsigned int *size, Elf_Shdr *sechdr)
+static long get_offset(struct module *mod, unsigned int *size,
+		Elf_Shdr *sechdr, unsigned int section)
 {
 	long ret;
 
 	ret = ALIGN(*size, sechdr->sh_addralign ?: 1);
 	*size = ret + sechdr->sh_size;
+#ifdef CONFIG_ARCH_WANTS_STUBS_BEHIND_SECTIONS
+	*size += module_additional_section_size(mod, section);
+#endif
 	return ret;
 }
 
@@ -1622,7 +1626,7 @@ static void layout_sections(struct module *mod,
 			    || strncmp(secstrings + s->sh_name,
 				       ".init", 5) == 0)
 				continue;
-			s->sh_entsize = get_offset(&mod->core_size, s);
+			s->sh_entsize = get_offset(mod, &mod->core_size, s, i);
 			DEBUGP("\t%s\n", secstrings + s->sh_name);
 		}
 		if (m == 0)
@@ -1640,7 +1644,7 @@ static void layout_sections(struct module *mod,
 			    || strncmp(secstrings + s->sh_name,
 				       ".init", 5) != 0)
 				continue;
-			s->sh_entsize = (get_offset(&mod->init_size, s)
+			s->sh_entsize = (get_offset(mod, &mod->init_size, s, i)
 					 | INIT_OFFSET_MASK);
 			DEBUGP("\t%s\n", secstrings + s->sh_name);
 		}

--------------040105060008050603090205--
