From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] fix crash when using XFS on loopback
Date: Sat, 4 Jan 2014 15:31:13 -0500
Message-ID: <BLU0-SMTP1018039B0747722C9B5B22E97B50@phx.gbl>
References: <alpine.LRH.2.02.1401041241590.4648@file01.intranet.prod.int.rdu2.redhat.com> <BLU0-SMTP390C5C965F9A4FB18F1EBE97B50@phx.gbl> <alpine.LRH.2.02.1401041451350.21108@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Andi Kleen <ak@linux.intel.com>,
	Christoph Lameter <cl@linux.com>,
	Pekka Enberg <penberg@iki.fi>, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org
To: Mikulas Patocka <mpatocka@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.02.1401041451350.21108@file01.intranet.prod.int.rdu2.redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 4-Jan-14, at 2:55 PM, Mikulas Patocka wrote:

> On Sat, 4 Jan 2014, John David Anglin wrote:
>
>> On 4-Jan-14, at 12:45 PM, Mikulas Patocka wrote:
>>
>>> * flush_dcache_page asks for the list of userspace mappings,  
>>> however that
>>> page->mapping field is reused by the slab subsystem for a different
>>> purpose. This causes the crash.
>>
>> I'd noticed the other day that the parisc implementation of
>> flush_dcache_page()
>> should return if "!mapping || mapping != page->mapping" is true.   
>> This would
>> have avoided crash.
>>
>> Dave
>
> I think no.
>
> page_mapping returns NULL if the page has only anonymous mapping and  
> it is
> not placed in the swap cache. In this case, you need to flush the  
> kernel
> cache.


The suggestion is to add the "mapping != page->mapping" to the current  
NULL check.
It occurs after the kernel cache flush.

It doesn't seem right to flush the vma mappings associated with swap  
address space
and that appears to be happening with current code.

Dave
--
John David Anglin	dave.anglin@bell.net



