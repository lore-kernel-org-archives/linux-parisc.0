Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id B4C2A4A18
	for <parisc-linux@lists.parisc-linux.org>; Fri,  2 Feb 2001 13:29:24 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA10738
	for <parisc-linux@puffin.external.hp.com>; Fri, 2 Feb 2001 13:25:14 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 2 Feb 2001 20:29:21 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14Ompa-00021c-00; Fri, 02 Feb 2001 20:29:18 +0000
Date: Fri, 2 Feb 2001 20:29:18 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] System bus walk patch
Message-ID: <20010202202918.A26452@parcelfarce.linux.theplanet.co.uk>
References: <3A7B1313.C6B5AFFE@uswest.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3A7B1313.C6B5AFFE@uswest.net>; from rbradetich@uswest.net on Fri, Feb 02, 2001 at 01:05:40PM -0700
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Feb 02, 2001 at 01:05:40PM -0700, Ryan Bradetich wrote:
> I would be interested in any feedback, concerns, questions
> anyone has about this patch.

> --- arch/parisc/kernel/inventory.orig	Fri Feb  2 12:46:00 2001
> +++ arch/parisc/kernel/inventory.c	Fri Feb  2 12:37:36 2001
> @@ -171,59 +171,88 @@
>  }
>  #endif /* __LP64__ */
>  
> +#ifdef __LP64__
> +#define FPA 0xFFFFFFFFFFF80000 /* Fixed Physical Address - Location of the Central Bus */
> +#else /* !__LP64__ */
> +#define FPA 0xFFF80000         /* Fixed Physical Address - Location of the Central Bus */
> +#endif /* __LP64__ */

I'm sure there's a way to do this without #ifdef's... something like

#define FPA (unsigned long)-80000

but perhaps that feels obfuscated -- after all we're after an address here.

#define FPA ((unsigned long)(signed int)0xfff80000)

produces the right result (just tested it).  or perhaps we should have
a macro to give us IO space addresses.

most of what i'm about to comment on is just a reindentation to
CodingStyle of preexisting code, yes?

> +		(void) register_pa_dev(hp_device);

unnecessary cast to void.

> +		for (addr_index = 1; addr_index <= module_result.add_addrs; addr_index++) {
> +			status = pdc_system_map_find_addrs(&addr_result, mod_index, addr_index);
> +			if (status == PDC_RET_OK) {
> +				add_pa_dev_addr(hp_device, (unsigned long)addr_result.mod_addr);
> +			} else {
> +				printk("Bad PDC_FIND_ADDRESS status return (%ld) for index %ld\n",
> +				       status, addr_index);
> +				status = PDC_RET_OK; /* reset status for outer loop */
> +			}
> +		}

that's just ugly.  don't reuse the `status' variable.

		for (addr_index = 1; addr_index <= module_result.add_addrs; addr_index++) {
			int mod_status = pdc_system_map_find_addrs(&addr_result, mod_index, addr_index);
			if (mod_status) == PDC_RET_OK) {
				add_pa_dev_addr(hp_device, (unsigned long)addr_result.mod_addr);
			} else {
				printk("Bad PDC_FIND_ADDRESS status return (%ld) for index %ld\n",
					mod_status, addr_index);
			}
		}

-- 
Revolutions do not require corporate support.
