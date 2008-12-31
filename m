From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH] parisc: fix module loading failure of large kernel modules (take 4)
Date: Thu, 1 Jan 2009 00:02:40 +1030
Message-ID: <200901010002.41477.rusty@rustcorp.com.au>
References: <4959346E.7060600@gmx.de> <200812310915.41693.rusty@rustcorp.com.au> <495B5806.3080505@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: "linux-parisc" <linux-parisc@vger.kernel.org>,
	Linux Kernel Development <linux-kernel@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>,
	Randolph Chung <randolph@tausq.org>,
	Linus <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <495B5806.3080505@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wednesday 31 December 2008 22:01:18 Helge Deller wrote:
> +/* Additional bytes needed by arch in front of individual sections */
> +unsigned int arch_module_section_size(struct module *mod,
> +				      unsigned int section);
> +
...
> +/* Additional bytes needed by arch in front of individual sections */
> +unsigned int __attribute__ ((weak)) arch_module_section_size(
> +		struct module *mod, unsigned int section)
> +{
> +	/* default implementation just returns zero */
> +	return 0;
> +}

Not quite what I had in mind... let me show you:

/* Bytes needed for a section: default is just the section size. */
unsigned int __attribute__((weak))
arch_module_section_size(struct module *mod, Elf_Shdr *sechdrs, unsigned int sec)
{
	return sechdrs[sec].sh_size;
}

Otherwise I'd have called it "arch_module_extra_size()".

Cheers,
Rusty.
