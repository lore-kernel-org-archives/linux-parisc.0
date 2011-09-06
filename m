From: "Rolf Eike Beer" <eike-kernel@sf-tec.de>
Subject: Re: Boot failure with 3.0.3: swapper (pid 0): Protection id trap
 (code 7)
Date: Tue, 6 Sep 2011 17:06:12 +0200
Message-ID: <ae22ebda7a73aae9b33643aac9064ed0.squirrel@webmail.sf-mail.de>
References: <201108191958.35802.eike-kernel@sf-tec.de>
    <a53708ae6c6247c7ce45d4e5b8131ea7.squirrel@webmail.sf-mail.de>
    <20110831154820.GH22818@bombadil.infradead.org>
    <20110831160419.GI22818@bombadil.infradead.org>
    <65eae6bb26716d64e7f5959302b26fa9.squirrel@webmail.sf-mail.de>
    <74797e028a4c070f42df834f9b0b0079.squirrel@webmail.sf-mail.de>
    <20110906134611.GA25825@bombadil.infradead.org>
    <20110906140029.GB25825@bombadil.infradead.org>
    <4E66310C.1050201@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4E66310C.1050201@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On 9/6/2011 10:00 AM, Kyle McMartin wrote:
>> On Tue, Sep 06, 2011 at 09:46:11AM -0400, Kyle McMartin wrote:
>>>>>> I suspect bootmem changes have broken somewhere on 32-bit... try
>>>>>> inserting a few printk between each of the function calls at the
>>>>>> start
>>>>>> of paging_init to try to narrow down exactly where it fails.
>>>>> It's flush_cache_all_local() that fails.
>>>> 2.6.39.4 works.
>>>>
>>> Well... that's weird.
>>>
>>     0:	43 ff ff 40 	ldb 7fa0(r31),r31
>>
>> Is the faulting insn, and %r31 is 00000000... so
>> we're looking at 32672, which looks suspiciously like
>> a negative offset from 32768.
>>
>> Looks like it's a null pointer dereference, there shouldn't be anything
>> useful at this address, if I remember our address space map correctly.
> The fault was code 7.  Also, I don't think this instruction is in
> flush_cache_all_local
> (at least I don't see it in 64-bit kernel).  So, I think the problem is
> in setting up the address
> space map.
>
> In my testing with 64-bit kernels, I have noticed that the first call to
> flush_cache_range
> doesn't have a range consistent with our 32-bit user address space.

This is a 32 bit kernel.

Eike
