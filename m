From: Helge Deller <deller@gmx.de>
Subject: [PATCH] modules: don't export section names of empty sections via
	sysfs
Date: Thu, 3 Dec 2009 00:29:15 +0100
Message-ID: <20091202232915.GA2251@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	kyle@mcmartin.ca, rusty@rustcorp.com.au, akpm@linux-foundation.org,
	James.Bottomley@HansenPartnership.com, roland@redhat.com
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

[PATCH] modules: don't export section names of empty sections via sysfs

On the parisc architecture we face for each and every loaded kernel module
this kernel "badness warning":
  sysfs: cannot create duplicate filename '/module/ac97_bus/sections/.text'
  Badness at fs/sysfs/dir.c:487

Reason for that is, that on parisc all kernel modules do have multiple
.text sections due to the usage of the -ffunction-sections compiler flag
which is needed to reach all jump targets on this platform.

An objdump on such a kernel module gives:
Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .note.gnu.build-id 00000024  00000000  00000000  00000034  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, DATA            
  1 .text         00000000  00000000  00000000  00000058  2**0     
                  CONTENTS, ALLOC, LOAD, READONLY, CODE            
  2 .text.ac97_bus_match 0000001c  00000000  00000000  00000058  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, CODE              
  3 .text         00000000  00000000  00000000  000000d4  2**0       
                  CONTENTS, ALLOC, LOAD, READONLY, CODE              
...
Since the .text sections are empty (size of 0 bytes) and won't be
loaded by the kernel module loader anyway, I don't see a reason
why such sections need to be listed under 
/sys/module/<module_name>/sections/<section_name> either.

The attached patch does solve this issue by not exporting section
names which are empty.

This fixes bugzilla http://bugzilla.kernel.org/show_bug.cgi?id=14703

Signed-off-by: Helge Deller <deller@gmx.de>
CC: rusty@rustcorp.com.au
CC: akpm@linux-foundation.org
CC: James.Bottomley@HansenPartnership.com
CC: roland@redhat.com
CC: dave@hiauly1.hia.nrc.ca

diff --git a/kernel/module.c b/kernel/module.c
index 8b7d880..5842a71 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -1187,7 +1187,8 @@ static void add_sect_attrs(struct module *mod, unsigned int nsect,
 
 	/* Count loaded sections and allocate structures */
 	for (i = 0; i < nsect; i++)
-		if (sechdrs[i].sh_flags & SHF_ALLOC)
+		if (sechdrs[i].sh_flags & SHF_ALLOC
+		    && sechdrs[i].sh_size)
 			nloaded++;
 	size[0] = ALIGN(sizeof(*sect_attrs)
 			+ nloaded * sizeof(sect_attrs->attrs[0]),
@@ -1207,6 +1208,8 @@ static void add_sect_attrs(struct module *mod, unsigned int nsect,
 	for (i = 0; i < nsect; i++) {
 		if (! (sechdrs[i].sh_flags & SHF_ALLOC))
 			continue;
+		if (!sechdrs[i].sh_size)
+			continue;
 		sattr->address = sechdrs[i].sh_addr;
 		sattr->name = kstrdup(secstrings + sechdrs[i].sh_name,
 					GFP_KERNEL);
