From: Helge Deller <deller@gmx.de>
Subject: Re: kernel segv with 2.6.31-rc6 ?
Date: Fri, 27 Nov 2009 23:11:57 +0100
Message-ID: <20091127221156.GA5334@p100.box>
References: <4A89CC4D.5040801@gmx.de> <20090818050637.4C3E74730F@magilla.sf.frob.com> <1250640565.15079.3.camel@mulgrave.site> <200908251707.01610.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Rusty Russell <rusty@rustcorp.com.au>,
	linux-parisc@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	roland@redhat.com, dave
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200908251707.01610.rusty@rustcorp.com.au>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

* Rusty Russell <rusty@rustcorp.com.au>:
> On Wed, 19 Aug 2009 09:39:24 am James Bottomley wrote:
> > Even with the duplicate name, though, the module should be perfectly
> > loadable.
> 
> In a perfect world, yes, but there are places which assume they'll be
> unique and I always thought that reasonable.
> 
> Front of my mind is /sys/module/<MODNAME/sections/ which has one file
> per section.

I just noticed, that on parisc the duplicate sections do have a
size of "0 bytes". Objdump shows that:

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  1 .text         00000000  00000000  00000000  00000058  2**0     
                  CONTENTS, ALLOC, LOAD, READONLY, CODE            
  5 .text         00000000  00000000  00000000  000000d4  2**0       
                  CONTENTS, ALLOC, LOAD, READONLY, CODE    

> Let's figure out how it happened tho; I'd rather fail cleanly than break
> subtly and horribly later...


Since the sections are empty anyway, I don't see any reason
why those section names need to be exported via sysfs.

Let's just drop them, which works for parisc (and should for any
other architecture too).

A patch is attached to
http://bugzilla.kernel.org/show_bug.cgi?id=14703

and here:


[PATCH] modules: don't export section names of empty sections via sysfs

This patch fixes a "Badness at fs/sysfs/dir.c:487" warning on parisc, where
duplicate section names in kernel modules are common.

Signed-off-by: Helge Deller <deller@gmx.de>
CC: rusty@rustcorp.com.au
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
