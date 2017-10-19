From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: [PATCHv3 2/7] sections: split dereference_function_descriptor()
Date: Thu, 19 Oct 2017 15:45:44 +0900
Message-ID: <20171019064544.GE449@jagdpanzerIV>
References: <20170930025319.987-1-sergey.senozhatsky@gmail.com>
 <20170930025319.987-3-sergey.senozhatsky@gmail.com>
 <20171004090043.GD20084@pathway.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        James Bottomley <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
To: Petr Mladek <pmladek@suse.com>
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <20171004090043.GD20084@pathway.suse.cz>
List-ID: <linux-ia64.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On (10/04/17 11:00), Petr Mladek wrote:
[..]
> >  /* random extra sections (if any).  Override
> > diff --git a/include/linux/moduleloader.h b/include/linux/moduleloader.h
> > index 4d0cb9bba93e..172904e9cded 100644
> > --- a/include/linux/moduleloader.h
> > +++ b/include/linux/moduleloader.h
> > @@ -85,6 +85,10 @@ void module_arch_cleanup(struct module *mod);
> >  /* Any cleanup before freeing mod->module_init */
> >  void module_arch_freeing_init(struct module *mod);
> >  
> > +/* Dereference module function descriptor */
> > +unsigned long dereference_module_function_descriptor(struct module *mod,
> > +						     unsigned long addr);
> > +
> 
> The function is used when the module is already loaded. IMHO,
> include/linux/module.h would be a better place.
> 
> One advantage would be that we could use the same trick
> as in include/asm-generic/sections.h. I mean:
> 
> #define dereference_module_function_descriptor(mod, addr) (addr)
> 
> and redefine it in the three affected
> arch/<arch>/include/asm/module.h headers. Then it might be completely
> optimized out on all architectures.

will take a look.

	-ss
