From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when compiling ruby1.9
Date: Thu, 18 Dec 2008 07:21:01 -0500
Message-ID: <119aab440812180421i5f1238e9vc7cd5bd300ca4016@mail.gmail.com>
References: <4949812D.7080608@gmx.de>
	 <119aab440812171746x5c3ec853x87b7f4a6ca12dba@mail.gmail.com>
	 <20081218023607.GC30438@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: "Helge Deller" <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: "Kyle McMartin" <kyle@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081218023607.GC30438@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Dec 17, 2008 at 9:36 PM, Kyle McMartin <kyle@infradead.org> wrote:
> On Wed, Dec 17, 2008 at 08:46:30PM -0500, Carlos O'Donell wrote:
>> On Wed, Dec 17, 2008 at 5:46 PM, Helge Deller <deller@gmx.de> wrote:
>> > The attached patch simply adds the lookup for a fixup handler when trap
>> > #27 (protection id trap) happens in kernel space. This was missing in
>> > the code path for trap #27 which is why the kernel then called
>> > die_if_kernel() and crashed.
>> >
>> > Even with this patch ruby1.9 may fail to compile, but at least the
>> > kernel crashes are gone.
>> >
>> > Any feedback welcome.
>>
>> Can we avoid copying code from do_page_fault and just call do_page_fault?
>>
>> Shouldn't a data protection id trap on a userspace address cause
>> do_page_fault to be called which triggers the lookup and transfer to
>> the exception table location?
>>
>
> Yes, it could just fall through in this case, but I don't think that's
> necessarily correct either.

Shouldn't it always be wrong to call die_if_kernel on protection id
trap without searching the exception tables? This is exactly what
happens in the case of trap 27.

>> I remember testing this for the compare-and-swap kernel LWS, in
>> particular calling with an invalid address, where the kernel must load
>> a userspace address, possibly fault, and jump to the exception
>> location to return EFAULT as the error for the compare-and-swap.
>
> Indeed, there's something more sinister going on.

It might be that a different fault is generated?

I ran my test-lws program again this morning and it correctly returns
EFAULT which means the exception handling should be working, *but* I
don't know which trap was generated.

The ldw could have generated a data tlb miss fault/data page fault
trap, and that is correctly handled.

A data address memory protection id trap only happens if:
- PSW P-bit is 1.
- Prot. ID check fails? (What memory has prot id checks on it?)
- One of load/Store/Ldcw/cache purge references the memory.

Cheers,
Carlos.
