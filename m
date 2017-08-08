From: John David Anglin <dave.anglin@bell.net>
Subject: Re: PCI resource problem on C360
Date: Tue, 8 Aug 2017 14:32:23 -0400
Message-ID: <0a29d826-16b9-12aa-c09b-a872f9eccd12@bell.net>
References: <20170803140717.GA7380@alpha.franken.de>
 <89A4641B-DE37-41B1-9F9C-B6312F8F0C84@bell.net>
 <4d46bfba-170f-2c79-cf69-45d02ccc5a9f@gmx.de>
 <20170808134012.GA7601@alpha.franken.de>
 <7312dbc6-bfba-a25b-a639-6ff7bad35e11@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>,
        Tom Bogendoerfer <tsbogend@alpha.franken.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <7312dbc6-bfba-a25b-a639-6ff7bad35e11@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2017-08-08 11:48 AM, Helge Deller wrote:
>> I know, but the get a MACH64 card up to sync in a B2600, with a small
>> change in aty driver. And the change is because Astro/Elroy behave incorrect
>> in respect to PCI standards, IMHO. It looks like it colapses multiple PCI
>> mem accesses into one access.
> Yes, I think that's true.
>   
>>          aty_st_8(CLOCK_CNTL_ADDR, ((offset << 2) & PLL_ADDR) | PLL_WR_EN, par);
>>          /* write the register value */
>>          aty_st_8(CLOCK_CNTL_DATA, val & PLL_DATA, par);
>>          aty_st_8(CLOCK_CNTL_ADDR, ((offset << 2) & PLL_ADDR) & ~PLL_WR_EN, par);
>>
>> B2600 HPMCs in this code sequence, probably because the two accesses
>> to CNTL_ADDR end up in just the last access. Placing in aty_ld_8 after
>> the first aty_st_8 avoids the problem.
> There are quite some comments in drivers/parisc/lba_pci.c regarding this.
> Esp. the comment about "Directed" ranges at line 1258 might be interesting
> regarding graphic cards.

It says:

/************************************
  * LBA register read and write support
  *
  * BE WARNED: register writes are posted.
  *  (ie follow writes which must reach HW with a read)
  */

It seems that aty stores likely need a following read when writes are 
posted.  I would hack
drivers/video/fbdev/aty/aty128fb.c as a test.

Dave

-- 
John David Anglin  dave.anglin@bell.net

