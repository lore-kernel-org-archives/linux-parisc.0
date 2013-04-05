From: Sebastian Wankerl <sisewank@cip.cs.fau.de>
Subject: Re: [PATCH] Add non-zero module sections to sysfs
Date: Fri, 05 Apr 2013 11:40:29 +0200
Message-ID: <515E9C0D.503@cip.cs.fau.de>
References: <1364994499-23708-1-git-send-email-sisewank@cip.cs.fau.de> <87mwtf3ya1.fsf@rustcorp.com.au> <515D4A7F.5070102@cip.cs.fau.de> <87vc81lj7x.fsf@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Philip Kranz <philip.kranz@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	i4passt@lists.informatik.uni-erlangen.de
To: Rusty Russell <rusty@rustcorp.com.au>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <87vc81lj7x.fsf@rustcorp.com.au>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 04/05/13 06:00, Rusty Russell wrote:
> Exactly.  Don't workaround it here, revert it and put the
> duplicate-section-name fixup in parisc where it belongs.
>
> Assuming parisc still produces these dup sections: that patch is 4 years
> old now.
>
> Untested:
>
> diff --git a/arch/parisc/kernel/module.c b/arch/parisc/kernel/module.c
> index 2a625fb..28d32a2 100644
> --- a/arch/parisc/kernel/module.c
> +++ b/arch/parisc/kernel/module.c
> @@ -341,6 +341,11 @@ int module_frob_arch_sections(CONST Elf_Ehdr *hdr,
>  			    ".PARISC.unwind", 14) == 0)
>  			me->arch.unwind_section = i;
>  
> +		/* we produce multiple, empty .text sections, and kallsyms
> +		 * gets upset.  make non-alloc so it doesn't see them. */
> +		if (sechdrs[i].sh_size == 0)
> +			sechdrs[i].sh_flags &= ~SHF_ALLOC;
> +
>  		if (sechdrs[i].sh_type != SHT_RELA)
>  			continue;
We just worked your suggested patch in.

> Why?  Does something refer to this empty section?  Why has noone noticed
> this since 2009?

GDB wants to know all section with attribute ALLOC, regardless whether
they are empty or not. Thus, it is useful if all of them appear in sysfs.
> A zero-length section doesn't change the binary's structure.  You don't
> see non-SHF_ALLOC sections either.

Yes, but they do occupy an index in the section headers of the binary.
GDB needs to know all of them in the right order.
