From: "Rolf Eike Beer" <eike-kernel@sf-tec.de>
Subject: Re: Boot failure with 3.0.3: swapper (pid 0): Protection id trap
 (code 7)
Date: Tue, 6 Sep 2011 09:40:13 +0200
Message-ID: <74797e028a4c070f42df834f9b0b0079.squirrel@webmail.sf-mail.de>
References: <201108191958.35802.eike-kernel@sf-tec.de>
    <a53708ae6c6247c7ce45d4e5b8131ea7.squirrel@webmail.sf-mail.de>
    <20110831154820.GH22818@bombadil.infradead.org>
    <20110831160419.GI22818@bombadil.infradead.org>
    <65eae6bb26716d64e7f5959302b26fa9.squirrel@webmail.sf-mail.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <65eae6bb26716d64e7f5959302b26fa9.squirrel@webmail.sf-mail.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

>> On Wed, Aug 31, 2011 at 11:48:20AM -0400, Kyle McMartin wrote:
>>> Attach .config?
>>>
>>
>> I suspect bootmem changes have broken somewhere on 32-bit... try
>> inserting a few printk between each of the function calls at the start
>> of paging_init to try to narrow down exactly where it fails.
>
> It's flush_cache_all_local() that fails.

2.6.39.4 works.

Eike
