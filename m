Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id NAA30411
	for <parisc-linux@puffin.external.hp.com>; Wed, 13 Dec 2000 13:31:16 -0700
Sender: debackex@esiee.fr
Message-ID: <3A37DE74.38E6D28F@esiee.fr>
Date: Wed, 13 Dec 2000 21:39:16 +0100
From: Xavier Debacker <debackex@esiee.fr>
MIME-Version: 1.0
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] STI Rom address location
References: <200012131231.FAA18919@udlkern.fc.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hi, thanks for your help, but there are still some pbs...

> IF the
> add_addrs field is non-zero, THEN the second entry (i.e. the result
> from a call to PDC_SYSTEM_MAP with the next index value) will contain the
> address of the sti rom in the mod_addr field.
 
> For a quick
> hack you can probably write your own loop calling pdc_system_map_find_mods
> (see code in do_newer_workstation_inventory).

To get familiar with pdc_system_map_find_mods, I modified
do_newer_workstation_inventory (in inventory.c) like this:

printk("a newer box...\n");
for(i=0, status=PDC_RET_OK; status != PDC_RET_NE_PROC &&
                            status != PDC_RET_NE_MOD ;i++) {
	printk("--- %s: index is set to %i\n",__FUNCTION__,i);
        status =
pdc_system_map_find_mods(&module_result,&module_path,i);
        if (status == PDC_RET_OK) {
	        printk("--- %s: mod_addr is 0x%08x, add_addrs is 0x%08x \n",
                
__FUNCTION__,module_result.mod_addr,module_result.add_addrs);
                num++;
                register_module(module_result.mod_addr);
        }
        else printk("--- %s: status returned is not PDC_RET_OK\n");
}


This kernel runs on the B132, dmesg gives me this:

a newer box...
--- do_newer_workstation_inventory: index is set to 0
--- do_newer_workstation_inventory: mod_addr is 0xffc00000, add_addrs is
0x00000000 
[... useless info removed ...]
--- do_newer_workstation_inventory: index is set to 11
--- do_newer_workstation_inventory: mod_addr is 0xf8000000, add_addrs is
0x00000001 
--- do_newer_workstation_inventory: index is set to 12
--- do_newer_workstation_inventory: mod_addr is 0xfff80000, add_addrs is
0x00000001 
--- do_newer_workstation_inventory: index is set to 13
--- do_newer_workstation_inventory: status returned is not PDC_RET_OK
Found devices:
1. Phantom PseudoBC GSC+ Port (7) at 0xffc00000, versions 0x504, 0x0,
0x0, 0x0, 0x0
2. Merlin+ 132 Dino RS-232 (10) at 0xfff83000, versions 0x22, 0x0, 0x8c,
0x0, 0x0
3. Merlin L2+ 132 (9000/778/B132L) (0) at 0xfffbe000, versions 0x503,
0x0, 0x4, 0x0, 0x81
4. Merlin+ L2 132 (1) at 0xfffbf000, versions 0x61, 0x0, 0x9, 0x0, 0x0
5. Merlin+ 132 Core BA (11) at 0xffd00000, versions 0x3e, 0x0, 0x81,
0x0, 0x0
6. Merlin+ 132 Core RS-232 (10) at 0xffd05000, versions 0x3e, 0x0, 0x8c,
0x0, 0x0
7. Merlin+ 132 Core SCSI (10) at 0xffd06000, versions 0x3e, 0x0, 0x82,
0x0, 0x0
8. Merlin+ 132 Core Centronics (10) at 0xffd02000, versions 0x3e, 0x0,
0x74, 0x0, 0x0
9. Merlin+ 132 Core Audio (10) at 0xffd04000, versions 0x3e, 0x4, 0x7b,
0x0, 0x0
10. Merlin+ 132 Core PC Keyboard (10) at 0xffd08000, versions 0x3e, 0x0,
0x84, 0x0, 0x0
11. Merlin+ 132 Core PC Keyboard (10) at 0xffd08100, versions 0x3e, 0x0,
0x84, 0x0, 0x0
12. Gecko GSC Core Graphics (10) at 0xf8000000, versions 0x16, 0x0,
0x85, 0x0, 0x0
13. Dino PCI Bridge (13) at 0xfff80000, versions 0x680, 0x3, 0xa, 0x0,
0x0
That's a total of 13 devices.


As we can see, when mod_addr is 0xf8000000, the add_addrs is not zero,
that's fine with your explanation.
the problem is that when I increment index (i=12) I get a mod_addr that
points to the Dino PCI Bridge, and still not to the STI ROM. I had a
look at 0xfff80000, just to be sure, and it doesn't seem to be my rom
(the 8 first bytes are zeroes).

btw, all info I've found about PDC_SYSTEM_MAP was in pdc.pdf, just
telling about the existence of such a procedure in chapter 2.2, but
there's no more info about it (while ALL other procedures are explained
in this book). This is just to get explained about the
pdc_system_map_find_mods params.


Any idea?

Thanks for your help!
Xavier

ESIEE Team.
