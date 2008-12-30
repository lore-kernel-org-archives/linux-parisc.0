From: Kyle McMartin <kyle@infradead.org>
Subject: Re: [PATCH 1/2] module.c: fix module loading failure of large
	modules (take 2)
Date: Tue, 30 Dec 2008 13:10:32 -0500
Message-ID: <20081230181032.GB15235@bombadil.infradead.org>
References: <4959346E.7060600@gmx.de> <49593660.2010900@gmx.de> <20081230180724.GA15235@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Linux Kernel Development <linux-kernel@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>,
	Randolph Chung <randolph@tausq.org>,
	Linus <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	rusty@rustcorp.com.au
To: Kyle McMartin <kyle@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081230180724.GA15235@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Ugh, I fail at typing, resending for rusty's benefit.

On Tue, Dec 30, 2008 at 01:07:24PM -0500, Kyle McMartin wrote:
> [Adding rusty to CC]
> 
> On Mon, Dec 29, 2008 at 09:43:12PM +0100, Helge Deller wrote:
> > +unsigned long module_additional_section_size(struct module *mod,
> > +					     unsigned int section);
> > +
> 
> I think this would be more palatable as
> 
> #ifdef HAVE_MODULE_SECTION_STUBS
> unsigned long module_additional_section_size(struct module *mod,
> 	unsigned int section);
> #else
> static inline unsigned long module_additional_section_size(struct module *mod,
> 	unsigned int section)
> {
> 	return 0;
> }
> #endif
> 
> and removing the conditional in kernel/module.c, possibly the symbol
> should be "arch_module_a..." just to make it clear to anyone reading.
> 
> Anyway, it's up to rusty.
> 
> Rusty, we'd like to get this patch in, so I can merge the dependent
> parisc-specific patch.
> 
> regards, Kyle
> 
> >  /* Allocator used for allocating struct module, core sections and init
> >     sections.  Returns NULL on failure. */
> >  void *module_alloc(unsigned long size);
> > diff --git a/init/Kconfig b/init/Kconfig
> > index f763762..5383815 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -908,6 +908,9 @@ config MODULE_SRCVERSION_ALL
> >  	  the version).  With this option, such a "srcversion" field
> >  	  will be created for all modules.  If unsure, say N.
> >  
> > +config HAVE_MODULE_SECTION_STUBS
> > +	bool
> > +
> >  config KMOD
> >  	def_bool y
> >  	help
> > diff --git a/kernel/module.c b/kernel/module.c
> > index 1f4cc00..4b86308 100644
> > --- a/kernel/module.c
> > +++ b/kernel/module.c
> > @@ -1579,10 +1579,15 @@ static int simplify_symbols(Elf_Shdr *sechdrs,
> >  }
> >  
> >  /* Update size with this section: return offset. */
> > -static long get_offset(unsigned int *size, Elf_Shdr *sechdr)
> > +static long get_offset(struct module *mod, unsigned int *size,
> > +		Elf_Shdr *sechdr, unsigned int section)
> >  {
> >  	long ret;
> >  
> > +#ifdef CONFIG_HAVE_MODULE_SECTION_STUBS
> > +	/* allocate some memory for stubs in front of each section */
> > +	*size += module_additional_section_size(mod, section);
> > +#endif
> >  	ret = ALIGN(*size, sechdr->sh_addralign ?: 1);
> >  	*size = ret + sechdr->sh_size;
> >  	return ret;
> > @@ -1622,7 +1627,7 @@ static void layout_sections(struct module *mod,
> >  			    || strncmp(secstrings + s->sh_name,
> >  				       ".init", 5) == 0)
> >  				continue;
> > -			s->sh_entsize = get_offset(&mod->core_size, s);
> > +			s->sh_entsize = get_offset(mod, &mod->core_size, s, i);
> >  			DEBUGP("\t%s\n", secstrings + s->sh_name);
> >  		}
> >  		if (m == 0)
> > @@ -1640,7 +1645,7 @@ static void layout_sections(struct module *mod,
> >  			    || strncmp(secstrings + s->sh_name,
> >  				       ".init", 5) != 0)
> >  				continue;
> > -			s->sh_entsize = (get_offset(&mod->init_size, s)
> > +			s->sh_entsize = (get_offset(mod, &mod->init_size, s, i)
> >  					 | INIT_OFFSET_MASK);
> >  			DEBUGP("\t%s\n", secstrings + s->sh_name);
> >  		}
> > 
> 
