From: Helge Deller <deller@gmx.de>
Subject: Re: [RESEND] [PATCH] convert sticore.c to PCI ROM API
Date: Sun, 08 Jun 2008 18:24:29 +0200
Message-ID: <484C07BD.8090308@gmx.de>
References: <20080605231327.af9cc9e6.krzysztof.h1@poczta.fm>	 <1212704814.4241.37.camel@localhost.localdomain>	 <20080606223507.0daf2b80.krzysztof.h1@poczta.fm> <1212794861.16182.39.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: Krzysztof Helt <krzysztof.h1@poczta.fm>,
	linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1212794861.16182.39.camel@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

James Bottomley wrote:
> On Fri, 2008-06-06 at 22:35 +0200, Krzysztof Helt wrote:
>> On Thu, 05 Jun 2008 17:26:54 -0500
>> James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
>>
>>> I'm really not sure this is such a good idea.  pci_map_rom() can do an
>>> ioremap() on the region.  In that case, gsc_readl which punches through
>>> our virtual memory into physical I/O space will fail.  What assurance do
>>> we have that all STI roms are correctly set up so pci_map_rom() isn't
>>> inclined to ioremap them?
>>>
>> I haven't thought about this. The ROM the Helge tested was obviously
>> set up correctly, otherwise reading the ROM signature would be impossible.
> 
> I suspect Helge only tested GSC based cards, which will work just fine
> because they use the old logic.

No, tested on Tadpole Laptop (7100LC) and c3k with VisEG PCI.
But it's OK that the patch was dropped...

Helge
