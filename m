From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when
Date: Fri, 19 Dec 2008 11:36:33 -0500
Message-ID: <119aab440812190836m2b81b974vbb270d5a5f531baa@mail.gmail.com>
References: <119aab440812190725r4e222233r7e3115b1db9ed919@mail.gmail.com>
	 <20081219161330.04BE04EF8@hiauly1.hia.nrc.ca>
	 <119aab440812190823g326868a8p4953cc4a92751a32@mail.gmail.com>
	 <20081219162843.GA8945@bombadil.infradead.org>
	 <119aab440812190835h7da2192biaa3cb3b44be08038@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: "John David Anglin" <dave@hiauly1.hia.nrc.ca>, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: "Kyle McMartin" <kyle@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440812190835h7da2192biaa3cb3b44be08038@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Dec 19, 2008 at 11:35 AM, Carlos O'Donell
<carlos@systemhalted.org> wrote:
> On Fri, Dec 19, 2008 at 11:28 AM, Kyle McMartin <kyle@infradead.org> wrote:
>> On Fri, Dec 19, 2008 at 11:23:39AM -0500, Carlos O'Donell wrote:
>>> On Fri, Dec 19, 2008 at 11:13 AM, John David Anglin
>>> <dave@hiauly1.hia.nrc.ca> wrote:
>>> >> > For future reference, in mmu_context.h. Bloody tricky mtctl() macro
>>> >> > doesn't take a prefix, just the numeric cr #.
>>> >>
>>> >> Evil.
>>> >
>>> > If this is a problem with the WD bit, the problem is likely here:
>>> >
>>> >        mtctl(context >> (SPACEID_SHIFT - 1),8);
>>> >
>>> > It's possible this might set the WD bit depending on the alignment
>>> > of context and the value of SPACEID_SHIFT on your machine.  If you
>>> > can duplicate, maybe add a BUG_ON.  On hppa64, all structs are passed
>>> > by value, so the alignment of context  may only be BIGGEST_ALIGNMENT.
>>>
>>> The value of context is a space id (the value returned by alloc_sid())
>>> and is not related to any alignment?
>>
>> It's a typedef to an unsigned long. I'm not sure we've seen this on a
>> 64-bit kernel (which is the SPACEID_SHIFT one.)
>>
>> On a 32-bit kernel (where I've been able to reproduce this) we do a
>> leftshift by one, so the WD bit is guaranteed to be 0.
>
> John has a good point though, we might as well assert that?

In alloc_sid() when we allocate the space id?

c.
