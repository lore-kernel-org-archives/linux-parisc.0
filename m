Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id FAA25595
	for <parisc-linux@puffin.external.hp.com>; Wed, 13 Dec 2000 05:29:40 -0700
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel1.hp.com (Postfix) with ESMTP id B249581A
	for <parisc-linux@puffin.external.hp.com>; Wed, 13 Dec 2000 07:32:27 -0500 (EST)
Date: Wed, 13 Dec 2000 05:31:11 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200012131231.FAA18919@udlkern.fc.hp.com>
To: debackex@esiee.fr, parisc-linux@puffin.external.hp.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] STI Rom address location
List-ID: <linux-parisc.vger.kernel.org>

> Hi Matt, and Hi STI god ;-)

Matt forwarded this to me, although I am not the "STI god" that he
mentioned. However, I do know the answer to the problem you are having,
since at one time I worked on the graphics driver for HP-UX. I am
sending this to parisc-linux also, since I believe the answer is probably
of interest to others, and it may be worthwhile discussing the appropriate
solution to finding the STI rom in this case.

> i can't find the sti rom on my B132/B180
>
> well, unlike the 712,715 and 725, the address is not in the pdc.
> I tested it: PAGE0->0x604 == NULL
>
> for sgc and gsc based graphic cards, the sti rom has to be available at
> the base hpa, which can be one of those addresses: 0xf4000000,
> 0xf6000000, 0xf8000000, or 0xfa000000.
>

With one exception, the sti rom for non PCI graphics cards can be found at
the base hpa (note that for HP PCI graphics cards, the sti rom can be
found in the extension rom).  The one exception is for "Artist" graphics
hardware.  Artist graphic hardware has a sversion of 0x85, and can be
found in a quite a few machines that were made in the Gecko -> B180
timeframe (you can look them up in the hardware database in hardware.c).

Artist graphics hardware was a low cost graphics solution, and the hardware
folks decided not to have a separate rom for sti. Instead, the sti code
was placed into the system's pdc firmware. On the first machines to have
Artist hardware, e.g. Gecko, the address of the sti "rom" was stored at
location 0x604 on the zero page. This was considered a hack, and another
architected solution was designed. Newer machines implement the
PDC_SYSTEM_MAP pdc call. In most cases, each fixed module has one
entry in the system map, however this is not always the case. There is
provision for modules that have discontiguous address ranges. The first
system map entry will be for the hpa. If there are additional address
ranges the "add_addrs" field in "struct pdc_system_map" will be non-zero.
The "add_addrs" field will be non-zero for each entry except for the
last one, where the "add_addrs" field will be zero. For Artist graphics,
the first entry will contain the hpa in the mod_addr field. IF the
add_addrs field is non-zero, THEN the second entry (i.e. the result
from a call to PDC_SYSTEM_MAP with the next index value) will contain the
address of the sti rom in the mod_addr field.

Note that address 0x604 on page zero is not reserved specifically for the
Artist graphics sti rom address.  You should only check the contents at
0x604 if the above check fails, i.e. if PDC_SYSTEM_MAP is not implemented,
or the add_addrs field for the entry containing the hpa of the Artist
hardware is zero.

Here is some pseudo code for the proper algorithm for finding the sti-rom
for non PCI graphics cards:

    IF sversion != 0x85:
	Use base hpa
    ELSE:
	IF PDC_SYSTEM_MAP pdc call is implemented, and add_addrs field
	of entry containing hpa of artist graphics hardware is
	non zero:

	    Use mod_addr field from next index in system map.
	ELSE:
	    Use address stored at location 0x604 on page zero.

Anyway, our current implementation doesn't appear to handle multiple
entries for the same module in the system map, i.e. it calls
register_module for every entry, and just silently drops entries that
pdc_iodc_read doesn't acknowledge as a hardware device. So, some
rearchitecting should be done to correctly support this. For a quick
hack you can probably write your own loop calling pdc_system_map_find_mods
(see code in do_newer_workstation_inventory).

John Marvin
jsm@fc.hp.com
