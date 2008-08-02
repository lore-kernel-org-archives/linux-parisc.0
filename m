From: Joel Soete <soete.joel@scarlet.be>
Subject: Re: ccio_mark_invalid(): would it have to clear a bit or byte?
Date: Sat, 02 Aug 2008 07:59:52 +0000
Message-ID: <489413F8.1090502@scarlet.be>
References: <4884A25C.7000902@scarlet.be> <20080801161248.GA22961@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080801161248.GA22961@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



Grant Grundler wrote:
> On Mon, Jul 21, 2008 at 02:51:08PM +0000, Joel Soete wrote:
>> Hello all,
>>
>> given this comment:
>>  * Given a virtual address (vba, arg2) and space id, (sid, arg1),
>>  * load the I/O PDIR entry pointed to by pdir_ptr (arg0). Each IO Pdir
>>  * entry consists of 8 bytes as shown below (MSB == bit 0):
> ...
>> and also this:
>>         while (byte_cnt > 0) {
>>                 /* clear I/O Pdir entry "valid" bit first */
>>                 ((unsigned char *) pdir_ptr)[7] = 0;
>>
>> So if I well understand 'Valid' field of a pdir entry is well of 1 bit but 
>> the code cleanup a all byte?
> 
> That's just a convenient way to clobber the bit we care about.
> The fact that the rest of the pdir remains available is irrelevant
> except for debugging (when we might dump IO Pdir to see the history.)
> 
Ok my worry was because other bits of this bytes was related to DMA behaviour of this U2 (Prefetch, Update, Lock, SafeDMA).

>> Is coding something like:
>> #define PTE_VALID_BIT_MASK      0xfffffffffffffffeULL	
>>
>> 		*pdir_ptr &= PTE_VALID_BIT_MASK;
> 
> That's a load/modify store of a 64-bit value.
> That substantially more instructions than a single byte store.
> 
Agree (but I am looking first to make this driver reliable)

>> wouldn't do better what comment says it does?
> 
> Yes, but the comment is just describing what needs to happen, not exactly how.
> The "entry valid" bit just needs to be cleared and it doesn't matter how.
> 
> hth
> grant
> 
Tx,
	J.

PS:
>> Well a short test seems to help but doesn't fix all issue:
>>
No that doesn't help at all :_(
