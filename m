Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA05242
	for <parisc-linux@puffin.external.hp.com>; Tue, 8 Feb 2000 19:11:21 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.16.124.11])
	by palrel1.hp.com (Postfix) with ESMTP id 22F354C5
	for <parisc-linux@thepuffingroup.com>; Tue,  8 Feb 2000 17:07:15 -0800 (PST)
Message-Id: <200002090108.RAA12200@milano.cup.hp.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] files still needing manual merging 
In-reply-to: Your message of "Wed, 09 Feb 2000 01:41:27 PST."
             <20000209014127.C2377@alpha.franken.de>
Date: Tue, 08 Feb 2000 17:08:07 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Thomas Bogendoerfer wrote:
...
> where I get unresolved symbols:
> 
> ld: Unsatisfied symbols:
>    init_ext2_fs (code)
>    up_read (code)
>    uts_sem (data)
>    get_task_struct (code)
>    up_write (code)
>    pcibios_enable_devicepcibios_enable_device (code)
>    down_write (code)
>    down_read (code)

Thomas,
I probably have to add pcibios_enable_device() to arch/parisc/kernel/pci.c.
I can take care of that ASAP.

Card-mode Dino actually wants this kind of a call if it does
what I think it's supposed to do.

thanks!
grant


Grant Grundler
Unix Development Lab
+1.408.447.7253
