From: Joel Soete <soete.joel@scarlet.be>
Subject: Re: kernel fault when booting with dual link network card
Date: Sun, 29 Jun 2008 17:54:15 +0000
Message-ID: <4867CC47.8030307@scarlet.be>
References: <20080629151759.GA7856@spring.luon.net> <1214755234.3405.5.camel@localhost.localdomain> <20080629162220.GL14894@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Sjoerd Simons <sjoerd@luon.net>, linux-parisc@vger.kernel.org
To: Matthew Wilcox <matthew@wil.cx>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080629162220.GL14894@parisc-linux.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



Matthew Wilcox wrote:
> On Sun, Jun 29, 2008 at 11:00:34AM -0500, James Bottomley wrote:
>> On Sun, 2008-06-29 at 16:17 +0100, Sjoerd Simons wrote:
>>> Hi,
>>>
>>>   Kernel 2.6.24 causes the machine to fault when a dual-link network card is
>>>   installed right after loading the tulip module. Output of SER PIM attached.
>> I'm afraid just the hex dump isn't really any use.  To be possibly
>> useful, we need at least the symbolic addresses of IAOQ and %r2.
>> That's:
>>
>> %r2: 0x10245748
>> IAOQ[0]: 0x10252bdc
>> IAOQ[1]: 0x10252be0
>>
>> the I/O module error seems to indicate an incorrect GSC DMA read.
> 
> I don't think it's going to tell us anything useful.  I believe that
> we've not set up the cardmode Dino correctly to respond to iomem space
> and as a result the first access to iomem space will fault.
> 
> Of course, this is a machine with CCIO, so it could be something going
> wrong with the CCIO programming too.

Yes specially if the system low in RAM (e.g. when I have to reduce ram of my c110 from 512M to 64M, it became impossible to 
boot it ;-( .)
After longly thought it was a pb of coherency, I am now convince that's the key pb: my d380 boot fine with 256M but I 
resurrect 'ccio_mem_ratio' which reduce artificially iova_space_size and if I can still boot it, disk's issues occur more 
quickly (a simple tar -xvf of a big file is enough now).
Right now, I reach to put in place many trace_mark() in this driver and thanks to Mathieu Desnoyers's patch and his help, 
it's now possible to me to collect a lot of info without degrading too much system perf. Just need more time to collect 
relevant info and analyze it ;-)

   But I think it's Dino.
> 
hypothesis easy to verify: just remove this card.

hth,
	J.
