Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 917E2482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 20 Oct 2001 04:04:04 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: rbradetich@uswest.net (Ryan Bradetich),
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH] The long awaited iotree patch for System Map Firmware
Date: Sat, 20 Oct 2001 12:02:53 +0200
References: <20011019165926.A31233@beavis.ybsoft.com>
In-Reply-To: <20011019165926.A31233@beavis.ybsoft.com>
MIME-Version: 1.0
Message-Id: <20011020100404.917E2482A@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Hi Ryan,

I've tested your patch on my c3k and 715/64 (aka "Snake").
On the c3k all is fine, but on the 715/64 it breaks the current 
inventory function and just needs a small fix to get it working again.

Anyway, here is the bootlog for the 715/64:

Found devices:                                                                 5
1. Mirage Jr GSC Builtin Graphics (10) at 0xf8000000 [1], versions 0x12, 0x0, 0 
2. Mirage Jr Core BA (11) at 0xf0100000 [2], versions 0x28, 0x0, 0x81           
3.  (0) at 0x0 [2/0], versions 0x0, 0x0, 0x0                                    
4. Mirage Jr Core SCSI (10) at 0xf0106000 [2/0/1], versions 0x28, 0x0, 0x82    a
5. Mirage Jr Core LAN (802.3) (10) at 0xf0107000 [2/0/2], versions 0x28, 0x0, 0 
6. Mirage Jr Core RS-232 (10) at 0xf0105000 [2/0/4], versions 0x28, 0x0, 0x8c  4
7. Mirage Jr Core Centronics (10) at 0xf0102000 [2/0/6], versions 0x28, 0x0, 0x 
8. Mirage Jr Audio (10) at 0xf0104000 [2/0/8], versions 0x28, 0x0, 0x7b        3
9. Mirage Jr Core PC Floppy (10) at 0xf010a000 [2/0/10], versions 0x28, 0x0, 0x4
10. Mirage Jr Core PS/2 Port (10) at 0xf0108000 [2/0/11], versions 0x28, 0x0, 04
11. Mirage Jr Core PS/2 Port (10) at 0xf0108100 [2/0/12], versions 0x28, 0x0, 0 
12. Mirage Jr Wax EISA BA (11) at 0xfc000000 [4], versions 0x28, 0x0, 0x90      
13. Mirage Jr Wax BA (11) at 0xf0200000 [5], versions 0x12, 0x0, 0x8e           
14.  (0) at 0x0 [5/0], versions 0x0, 0x0, 0x0                                   
15. Mirage Jr Wax HIL (10) at 0xf0201000 [5/0/1], versions 0x12, 0x0, 0x73      
16. Mirage Jr Wax RS-232 (10) at 0xf0202000 [5/0/2], versions 0x12, 0x0, 0x8c   
17. Mirage Jr (715/64) (0) at 0xfffbe000 [8], versions 0x60a, 0x0, 0x4          
18. Mirage Jr (1) at 0xfffbf000 [9], versions 0x4a, 0x0, 0x9                    
CONFIG_SMP=n  ignoring additional CPUs                                          
Warning : device (0, 0x0, 0x0, 0x0) NOT claimed by CPU                          
CONFIG_SMP=n  ignoring additional CPUs                                          
Warning : device (0, 0x60a, 0x0, 0x4) NOT claimed by CPU
 CPU(s): 1 x PA7100LC (PCX-L) at 64.000000 MHz                                   
Lasi version 0 at 0xf0100000 found.                                             
LED display at f00e0000 registered                                              
Wax at 0xf0200000 found.                                                        
Wax: HIL Keyboard-NMI registered.                                               
Wax EISA Adapter found at 0xfc000000                                           !
busdevice_alloc_irq(0x1003b8c0): No known LASI/ASP/WAX owns device at 0xf020000 
EISA: failed to claim IRQ                                                       
Warning : device (11, 0x28, 0x0, 0x90) NOT claimed by EISA Bus Adapter
.....
As you see, your iotree inserts "phantom" devices on [2/0] an [5/0]. I think both
devices should be pre-initialized by default to type HPHW_FAULTY and to the hpa of the
parent device in the function alloc_tree_node().
The other thing is, that currently no interrupts are found for any devices - I'll investigate that
later but think this shouldn't be so hard to fix either.

Nevertheless I think you should commit your patch. The remaining bugs can be easily 
fixed afterwards.

Greetings,
Helge

On Saturday 20 October 2001 00:59, Ryan Bradetich wrote:
> Hello parisc-linux hackers,
>
> Here is the patch for the I/O Tree for the System Map firmware
> boxes.  I believe the I/O tree for legacy firmware is already in
> the cvs repository, and I need to get access to a PAT firmware
> box to finish the iotree for PAT firmware.
>
>
> Please test this patch out and report any problems.  I would
> like to get this patch committed to the repository so we can
> finally use the multiple IOMMUs present in the ccio boxes,
> etc.
>
>
> I have tested this patch on C200 and K460.
>
> Thanks,
>
> - Ryan
>
> P.S. Thanks to willy for all his help, reviews and general
> rewrite to put this patch in its current state!
