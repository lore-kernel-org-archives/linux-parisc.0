Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mx04.nexgo.de (mx04.nexgo.de [151.189.8.80])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1FA58482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Sep 2001 11:57:57 -0600 (MDT)
Message-ID: <3B93E0B3.7070700@hrzpub.tu-darmstadt.de>
Date: Mon, 03 Sep 2001 21:57:39 +0200
From: =?ISO-8859-1?Q?R=FCdiger?= Scholz <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel failures
References: <3B8F18EF.9060404@hrzpub.tu-darmstadt.de> <20010831160827.C5126@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:

>On Fri, Aug 31, 2001 at 06:56:15AM +0200, Rüdiger Scholz wrote:
>
>>When I played a little bit  with the kernel, I found some failures.
>>My machine is a 715/100 with a second  Graphics-Card (Coral SGC). If the 
>>
>
>Could you change kernel/printk.c, line 36 from:
>#define DEFAULT_CONSOLE_LOGLEVEL 7 /* anything MORE serious than KERN_DEBUG */
>to:
>#define DEFAULT_CONSOLE_LOGLEVEL 9 /* anything MORE serious than KERN_DEBUG */
>
>This should print out more debug messages and might help diagnose the problem.
>

Nop. It doesn't print any new messages at booting. It 's difficult to 
debug, because I don't know exactly where the kernel crash,  because 
when it crashs GR02 and IAOQ point to parisc_terminate and show_stack.
But looking at the last messages and the source code, the kernel crashs 
when it's calling "sti_dump_rom" in the file 
linux/drivers/video/sticore.c. The last three lines before the kernel 
crashs are:
SNIP---------       
        sticonsole_init: searching for STI ROMs                        
                         
        STI word mode ROM at f0025000, hpa=f4000000                    
                            <--- this is in function sti_read_rom which 
calls sti_dump_rom
        STI word mode ROM, id 2b4ded6d-40a00499, conforms to spec rev. 
8.04           <--- function sti_dump_rom
SNAP--------

And this is the code of function "sti_dump_rom":
SNIP----------
    static void __init
    sti_dump_rom(struct sti_rom *rom)
    {
            printk(KERN_INFO "STI %s mode ROM, id %04x-%04x, conforms to 
spec rev. %d.%02x\n",
                    (rom->type[3] == 1) ? "byte" : "word",
                    rom->graphics_id[0],
                    rom->graphics_id[1],
                    rom->revno[0] >> 4,
                    rom->revno[0] & 0x0f);
            DPRINTK((" supports %d monitors\n", rom->num_mons));
            DPRINTK((" font start %08x\n", rom->font_start));
            DPRINTK((" region list %08x\n", rom->region_list));
            DPRINTK((" init_graph %08x\n", rom->init_graph));
            DPRINTK((" alternate code type %d\n", rom->alt_code_type));
    }
SNAP----------

After the printk("STI word mode..."), I should see messages about 
supported monitors, etc. So here must be the place, where the kernel crashs.


Thanks in advance,

        Rüdiger
