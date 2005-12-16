From: Keven Tipping <bytelogix@shaw.ca>
Subject: Re: [parisc-linux] Gentoo & PARisc Kernel broken?
Date: Fri, 16 Dec 2005 13:34:14 -0700
Message-ID: <9cd1679d03d0.9d03d09cd167@shaw.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Greetings to all!

Thanks for your help.

Managed to fix the problem, turns out that /etc/inittab wasn't point to ttyB0. It was pointing to ttyS0 instead.

I'm not sure why that caused the kernel to panic on the first sign of input from the serial console when it hanged (in reality Agetty just hadn't been spawned on the ttyB0 interface), but anyways, the machine seems to be operating properly now as the login pops up right after the last bootup line ("Mounting network filesystems... [OK]").

Thanks!
Keven Tipping

----- Original Message -----
From: Grant Grundler <grundler@parisc-linux.org>
Date: Friday, December 16, 2005 0:51 am
Subject: Re: [parisc-linux] Gentoo & PARisc Kernel broken?

> On Thu, Dec 15, 2005 at 10:58:42PM -0700, Keven Tipping wrote:
> > Greetings to all!
> > 
> > I have a K370 here, all reasonable attempts to boot it have 
> failed miserably.
> > The only thing that boots is the Gentoo 2005 Live CD and I have 
> no clue why :(.
> > 
> > Here is the bootup log.
> ...
> > 12. HP HSC-PCI Cards at 0xf1808000 [10/8] { 4, 0x0, 0x004, 
> 0x0009d }
> > 13. Gecko BOA BC GSC+ Port at 0xf1810000 [10/16] { 7, 0x0, 
> 0x500, 0x0000c }
> > 14. Gecko BOA BC HP-PB Port at 0xf1a3c000 [10/16/60] { 7, 0x0, 
> 0x103, 0x0000c }
> > 15. U2-IOA BC GSC+ Port at 0xf183f000 [10/63] { 7, 0x1, 0x501, 
> 0x0000c }
> > 16. U2-IOA BC Runway Port at 0xfff88000 [8] { 12, 0xf, 0x580, 
> 0x0000b }
> > 17. Shrike Add-on FW-SCSI at 0xf1008000 [8/8] { 4, 0x1, 0x014, 
> 0x00089 }
> > 18. HP HSC-PCI Cards at 0xf100c000 [8/12] { 4, 0x0, 0x004, 
> 0x0009d }
> 
> My first guess was the "HSC-PCI" cards are the root of some new 
> problem...
> ...
> > Found GeckoBoa at 0xf1804000
> > Found GeckoBoa at 0xf1810000
> > Dino version 3.x (card mode) found at 0xf100c000
> > Dino version 3.x (card mode) found at 0xf1808000
> 
> which are better known as "Card Mode Dino". But I don't think
> that's the case since I never saw evidence of tulip getting loaded
> nor any problem with configuring LAN.
> 
> 
> >  * Calculating module dependencies ...                           
>         [ ok ]
> >  * Using /etc/modules.autoload.d/kernel-2.6 as config:
> >  *   Loading module lasi_82596 ...                               
>         [ ok ]
> 
> Note that this LAN driver worked fine. Firmware programs
> the MMIO address range for this card.
> Any reason why tulip driver didn't get auto-loaded here?
> 
> ...
> >  *   Bringing up eth0
> >  *     10.0.1.202
> 
> Which I expect to be the LASI NIC.
> 
> ...
> >  * Mounting network filesystems ...                              
>         [ ok ]
> > Kernel panic - not syncing: Kernel Fault
> > 
> > What happens here is that it sticks at "Mounting Network 
> Filesystems".> If I press any key on my Serial console here, then 
> it goes off and panics.
> 
> Which suggests it's a problem with the Mux Driver somehow.
> I expect a "login:" prompt to be the next output.
> 
> At one point there were issues with MUX driver keyboard input.
> Maybe those issues have resurfaced in a new way now.
> 
> ...
> > I'm not sure whats wrong here, and rebooting this beast is a 
> very long
> > process (20 minutes each time).
> > 
> > Does anyone have any ideas?
> ...
> > I'd really like to run Linux on this mammoth somehow, but I've tried
> > everything I can think of with no sucssess (except the Gentoo 
> Live CD,
> > but that doesn't really do anything other then let me setup the 
> system> and compile a kernel).
> 
> Start comparing the Gentoo Live CD kernel with the nearest revision
> from debian or otherwise that fails.  MUX driver and serial support
> in particular.
> 
> hth,
> grant
> 

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
