From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: fix module loading failure of large kernel modules
 (take 4)
Date: Wed, 31 Dec 2008 15:13:56 +0100
Message-ID: <495B7E24.9010802@gmx.de>
References: <4959346E.7060600@gmx.de> <200812310915.41693.rusty@rustcorp.com.au> <495B5806.3080505@gmx.de> <200901010002.41477.rusty@rustcorp.com.au>
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
In-Reply-To: <200901010002.41477.rusty@rustcorp.com.au>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Rusty Russell wrote:
> Not quite what I had in mind... let me show you:
> ...
> Otherwise I'd have called it "arch_module_extra_size()".

Hmm, this needs more thinking then.

So, in summary this would be your proposed change (?):

+/* Bytes needed for a section: default is just the section size. */
+unsigned int __attribute__((weak))
+arch_module_section_size(struct module *mod, Elf_Shdr *sechdrs, unsigned int sec)
+{
+       return sechdrs[sec].sh_size;
+}
+
 /* Update size with this section: return offset. */
-static long get_offset(unsigned int *size, Elf_Shdr *sechdr)
+static long get_offset(struct module *mod, unsigned int *size,
+               Elf_Shdr *sechdr, unsigned int section)
 {
        long ret;

        ret = ALIGN(*size, sechdr->sh_addralign ?: 1);
-       *size = ret + sechdr->sh_size;
+       *size = ret + arch_module_section_size(mod, sechdr, section);
        return ret;
 }


This would mean that I can increase the section size in the arch-specific function
by returning a bigger value than sh_size.
This would give me space at the end of the section, but not at the beginning 
(which is what I need), as sh_entsize (the offset into memory) will stay the 
same as before.
Example: Having an initial value for core_size of zero, the code bits of the 
very first section are still copied into the very first byte in memory, leaving
me no room for the stubs.

The important part of get_offset() is, which value is returned to the caller.
Let's try another example which would work for me:

+static long get_offset(struct module *mod, unsigned int *size,
+               Elf_Shdr *sechdr, unsigned int section)
 {
-       long ret;
+       long ret, sect_size;

+       sect_size = arch_module_section_size(mod, sechdr, section);
+       *size += (sect_size - sechdr->sh_size);
        ret = ALIGN(*size, sechdr->sh_addralign ?: 1);
        *size = ret + sechdr->sh_size;
	return ret;

IMHO, this is hackish and ugly.

A last option for me would be to set core_size to the initial value
of bytes which I would need for section 1 and returning in 
arch_module_section_size() when asked for the size of section 1 the 
sum of sh_size[section 1] + additional_bytes_needed_for_section_2,
and so on...

Any proposals?

Helge
