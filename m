From: Helge Deller <deller@gmx.de>
Subject: Re: Out of order unwind entry warning
Date: Sat, 7 Nov 2009 00:07:42 +0100
Message-ID: <20091106230742.GA16061@p100.box>
References: <4AF0A8FB.2000504@gmx.de> <20091104005737.0E4674FB2@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	linux-parisc@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091104005737.0E4674FB2@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Dave,

* John David Anglin <dave@hiauly1.hia.nrc.ca>:
> > >> Relocation section '.rela.PARISC.unwind' at offset 0x9b8 contains 6 entries:
> > >>    Offset     Info    Type            Sym.Value  Sym. Name + Addend
> > >> 00000000  00000231 R_PARISC_SEGREL32 00000000   .exit.text + 0
> > >> 00000004  00000231 R_PARISC_SEGREL32 00000000   .exit.text + 2c
> > >> 00000010  00000331 R_PARISC_SEGREL32 00000000   .init.text + 0
> > >> 00000014  00000331 R_PARISC_SEGREL32 00000000   .init.text + 44
> > >> 00000020  00000431 R_PARISC_SEGREL32 00000000   .text.crc32c + 0
> > >> 00000024  00000431 R_PARISC_SEGREL32 00000000   .text.crc32c + 6c
> > >
> > > That's exactly what I expected.  There's no overlap.  The module
> > > loader needs to sort the unwind entries after doing the relocations.

You were right here.

> > It's already sorting the entries, 

and I was to some degree wrong :-)

The parisc module loader as written by Randolph was sorting the
unwind entries. But I submitted a wrong patch which replaced the
hand-written sort() by the kernel provided sort() function:
http://patchwork.kernel.org/patch/56528/
Due to a bug in the patch a wrong amount of unwind entries were
calculated and as such the sort() function didn't sorted all unwind entries.

Below is an updated patch. With this one, all your binutils changes
work nicely with 32- and 64-bit kernels and modules.

Kyle, I see you applied my original patch into your "next" tree already:
http://git.kernel.org/?p=linux/kernel/git/kyle/parisc-2.6.git;a=commit;h=b8d46862d910c3be7c28c627204da968c174aa9a

Do you want me to send you a new patch against your "next" tree instead?


> > If we change this, don't we require a binutils update then at the same time from the users?
> 
> Don't think fixing the offsets requires a binutils update.  However, the
> change to using section offsets may have made the problem worse.  The binutils
> update only corrected the issue with overloaded symbols.

Yes, a binutils update will just fix user's "out-of-order-unwind-entry"
warnings.

Thanks!

Helge




PATCH: parisc: use sort() instead of home-made implementation (v2)

Signed-off-by: Helge Deller <deller@gmx.de>


diff --git a/arch/parisc/kernel/unwind.c b/arch/parisc/kernel/unwind.c
index 69dad5a..9dbefa8 100644
--- a/arch/parisc/kernel/unwind.c
+++ b/arch/parisc/kernel/unwind.c
@@ -13,6 +13,7 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/kallsyms.h>
+#include <linux/sort.h>
 
 #include <asm/uaccess.h>
 #include <asm/assembly.h>
@@ -115,24 +116,18 @@ unwind_table_init(struct unwind_table *table, const char *name,
 	}
 }
 
+static int cmp_unwind_table_entry(const void *a, const void *b)
+{
+	return ((const struct unwind_table_entry *)a)->region_start
+	     - ((const struct unwind_table_entry *)b)->region_start;
+}
+
 static void
 unwind_table_sort(struct unwind_table_entry *start,
 		  struct unwind_table_entry *finish)
 {
-	struct unwind_table_entry el, *p, *q;
