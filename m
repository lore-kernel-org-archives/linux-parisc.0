From: Mikulas Patocka <mpatocka@redhat.com>
Subject: [PATCH] parisc: support R_PARISC_SECREL32 relocation in modules
Date: Tue, 14 Mar 2017 11:47:29 -0400 (EDT)
Message-ID: <alpine.LRH.2.02.1703141146300.25997@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>,
        "James E.J. Bottomley" <jejb@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The parisc kernel doesn't work with CONFIG_MODVERSIONS since the commit
71810db27c1c853b335675bee335d893bc3d324b. It can't load modules with the
error: "module unix: Unknown relocation: 41".

The commit changes __kcrctab from 64-bit valus to 32-bit values. The
assembler generates R_PARISC_SECREL32 secrel relocation for them and the
module loader doesn't support this relocation.

This patch adds the R_PARISC_SECREL32 relocation to the module loader.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org	# v4.10+

---
 arch/parisc/kernel/module.c |    8 ++++++++
 1 file changed, 8 insertions(+)

Index: linux-4.11-rc2/arch/parisc/kernel/module.c
===================================================================
--- linux-4.11-rc2.orig/arch/parisc/kernel/module.c
+++ linux-4.11-rc2/arch/parisc/kernel/module.c
@@ -620,6 +620,10 @@ int apply_relocate_add(Elf_Shdr *sechdrs
 			 */
 			*loc = fsel(val, addend); 
 			break;
+		case R_PARISC_SECREL32:
+			/* 32-bit section relative address. */
+			*loc = fsel(val, addend);
+			break;
 		case R_PARISC_DPREL21L:
 			/* left 21 bit of relative address */
 			val = lrsel(val - dp, addend);
@@ -807,6 +811,10 @@ int apply_relocate_add(Elf_Shdr *sechdrs
 			 */
 			*loc = fsel(val, addend); 
 			break;
+		case R_PARISC_SECREL32:
+			/* 32-bit section relative address. */
+			*loc = fsel(val, addend);
+			break;
 		case R_PARISC_FPTR64:
 			/* 64-bit function address */
 			if(in_local(me, (void *)(val + addend))) {
