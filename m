Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id DAA14706
	for <parisc-linux@puffin.external.hp.com>; Thu, 14 Dec 2000 03:04:07 -0700
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by palrel1.hp.com (Postfix) with ESMTP id F399D10D0
	for <parisc-linux@puffin.external.hp.com>; Thu, 14 Dec 2000 02:06:53 -0800 (PST)
Date: Thu, 14 Dec 2000 03:05:38 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200012141005.DAA10850@udlkern.fc.hp.com>
To: debackex@esiee.fr
Subject: Re: [parisc-linux] STI Rom address location
Cc: parisc-linux@puffin.external.hp.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>


Xavier,

> Hi, thanks for your help, but there are still some pbs...
>
> > IF the
> > add_addrs field is non-zero, THEN the second entry (i.e. the result
> > from a call to PDC_SYSTEM_MAP with the next index value) will contain the
> > address of the sti rom in the mod_addr field.
>

OK, I blew it.  I don't memorize this stuff.  I looked at the HP-UX code
to get this information, but I didn't go deep enough and misread the code.
There is a different call to PDC_SYSTEM_MAP for getting additional ranges.

Rather than trying to write up the explanation for how the
PDC_FIND_ADDRESS argument to PDC_SYSTEM_MAP works, I just decided to add
some support for the call and some debug code to the kernel to show how it
is used (the debug code is inside an #if 0 in inventory.c).  Basically,
the add_addrs field tells you how many additional address ranges there
are, and you need to call PDC_SYSTEM_MAP/PDC_FIND_ADDRESS to get them.
Note that calling PDC_FIND_ADDRESS with an address index of 0 just returns
the first address range that you got from the PDC_FIND_MODULE, so it is
redundant (i.e. you should make the first call with an address index of
1, which is what the debug code does).

You'll probably want to save the information returned from
PDC_FIND_ADDRESS for later.  Note that the register_module() call returns
a pointer to the associated hp_device structure, however we are ignoring
the return in the call in inventory.c.  If you save the return value,
perhaps the hp_device structure should be modified to hold the additional
ranges (or at least just the one additional range for the STI special
case).

...

> btw, all info I've found about PDC_SYSTEM_MAP was in pdc.pdf, just
> telling about the existence of such a procedure in chapter 2.2, but
> there's no more info about it (while ALL other procedures are explained
> in this book). This is just to get explained about the
> pdc_system_map_find_mods params.

I don't have any documentation for PDC_SYSTEM_MAP either. I just used
the HP-UX source for reference.

John Marvin
jsm@fc.hp.com
