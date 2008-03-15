From: rubisher <rubisher@scarlet.be>
Subject: Re: Yet another ccio fix idea?
Date: Sat, 15 Mar 2008 19:32:55 +0000
Message-ID: <47DC2467.3070502@scarlet.be>
References: <JXM1RH$256C92C0CB28292D8C30F2A8EBC987EF@scarlet.be> <20080314060251.GJ24794@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: dave <dave@hiauly1.hia.nrc.ca>,
	"James.Bottomley" <James.Bottomley@HansenPartnership.com>,
	"soete.joel" <soete.joel@scarlet.be>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	kyle <kyle@parisc-linux.org>, matthew <matthew@wil.cx>
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080314060251.GJ24794@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Grant Grundler wrote:
[snip]
>> PS: in this doc feb96a6.pdf (easy to find) it was said:
>> "[snip]
>> Entries in the PA 7200 and PA 8000 caches are stored in lines
>> of 32 bytes.
>> [snip]
>>
>> Because one-word writes occur in the I/O system, for registers,
>> semaphores, or short DMA writes it was necessary that the I/O
>> adapter implement a one-line-deep cache to buffer cache lines,
>> so that these one-word writes could be executed by performing
>> a coherent read private transaction on the Runway bus, obtaining
>> the most recent copy of the cache line, modifying it locally in
>> cache, and finally writing the modified line back to main memory.
> ...
> 
>> 2 thinks:
>>     - it seems to confirm that cache line is well 32bytes wide ;-)
>>
>>     - for 'one word writes...' how should it be implemented?
> 
> "one word writes" refers to DMA writes, not CPU writes.
> 
(tx it's not always easy to follow the master and the slave in this story)

>>       It look like the sba_iommu driver:
>>       "READ_REG(ioc-ioc_ha_IOC_PCOM); /* flush purges */
>>       but without more detailed docs on U2/UTurn ccio, I don't know how to
>>       implement matter, sorry.
> 
> The IOMMU driver programs the IO Pdir with the results of "lci" instruction
> and this should be all the IOMMU needs to coherently read/modify/write
> the cacheline that the "one word" DMA write is targeting. In short,
> it's already implemented or I'd think we'd see much worse problems
> on ccio platforms.
> 
> hth,
> grant
> 
Ok.

Just one thought because in the backport I did on ccio of your job on sba (which seems to works for me as well as previous 
stuff, may be a bit better for system low in ram like my c110), it was one of the matter related to io coherency which I 
didn't reach to backport?

Tx again,
	r.
