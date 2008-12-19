From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when
Date: Fri, 19 Dec 2008 11:23:39 -0500
Message-ID: <119aab440812190823g326868a8p4953cc4a92751a32@mail.gmail.com>
References: <119aab440812190725r4e222233r7e3115b1db9ed919@mail.gmail.com>
	 <20081219161330.04BE04EF8@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: kyle@infradead.org, deller@gmx.de, linux-parisc@vger.kernel.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081219161330.04BE04EF8@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Dec 19, 2008 at 11:13 AM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> > For future reference, in mmu_context.h. Bloody tricky mtctl() macro
>> > doesn't take a prefix, just the numeric cr #.
>>
>> Evil.
>
> If this is a problem with the WD bit, the problem is likely here:
>
>        mtctl(context >> (SPACEID_SHIFT - 1),8);
>
> It's possible this might set the WD bit depending on the alignment
> of context and the value of SPACEID_SHIFT on your machine.  If you
> can duplicate, maybe add a BUG_ON.  On hppa64, all structs are passed
> by value, so the alignment of context  may only be BIGGEST_ALIGNMENT.

The value of context is a space id (the value returned by alloc_sid())
and is not related to any alignment?

Cheers,
Carlos.
