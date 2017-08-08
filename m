From: Helge Deller <deller@gmx.de>
Subject: Re: PCI resource problem on C360
Date: Tue, 8 Aug 2017 17:48:33 +0200
Message-ID: <7312dbc6-bfba-a25b-a639-6ff7bad35e11@gmx.de>
References: <20170803140717.GA7380@alpha.franken.de>
 <89A4641B-DE37-41B1-9F9C-B6312F8F0C84@bell.net>
 <4d46bfba-170f-2c79-cf69-45d02ccc5a9f@gmx.de>
 <20170808134012.GA7601@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: linux-parisc@vger.kernel.org
To: Tom Bogendoerfer <tsbogend@alpha.franken.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20170808134012.GA7601@alpha.franken.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 08.08.2017 15:40, Tom Bogendoerfer wrote:
> On Fri, Aug 04, 2017 at 12:45:31AM +0200, Helge Deller wrote:
>> I had lots of such problems when I tried various VGA and other
>> PCI cards in my c3000.
> 
> I know, but the get a MACH64 card up to sync in a B2600, with a small
> change in aty driver. And the change is because Astro/Elroy behave incorrect
> in respect to PCI standards, IMHO. It looks like it colapses multiple PCI
> mem accesses into one access.

Yes, I think that's true.
 
>         aty_st_8(CLOCK_CNTL_ADDR, ((offset << 2) & PLL_ADDR) | PLL_WR_EN, par);
>         /* write the register value */
>         aty_st_8(CLOCK_CNTL_DATA, val & PLL_DATA, par);
>         aty_st_8(CLOCK_CNTL_ADDR, ((offset << 2) & PLL_ADDR) & ~PLL_WR_EN, par);
> 
> B2600 HPMCs in this code sequence, probably because the two accesses
> to CNTL_ADDR end up in just the last access. Placing in aty_ld_8 after
> the first aty_st_8 avoids the problem.

There are quite some comments in drivers/parisc/lba_pci.c regarding this.
Esp. the comment about "Directed" ranges at line 1258 might be interesting
regarding graphic cards.

Sadly I'm no expert in this area at all.

> In a B180 everything is fine,> so Dino doesn't do that. Next testbed is the C360, which shows the PCI
> resourec issue before it even comes to aty drvier.
> 
>> I think HP designed many of the PCI slots for special usage only,
>> e.g. some slots allow PCI graphic cards while others don't.
>>
>> Maybe plug your cards one-by-one into another slot and check again?
> 
> will do that, but what looks strange to me is the fact that ethernet and
> scsi also don't get all resources assigned. This happened without the VGA
> card plugged in, too.

Maybe the drivers of such NIC/SCSI cards don't request all available resources? 

Helge
