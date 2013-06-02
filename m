From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: Use unshadowed index register for flush instructions in flush_dcache_page_asm and flush_icache_page_asm
Date: Sun, 2 Jun 2013 14:06:12 -0400
Message-ID: <BLU0-SMTP782D88BCF628E3B517BAAA979C0@phx.gbl>
References: <BLU0-SMTP62E4CC425407D88FFC0DF3979C0@phx.gbl> <1370191421.1977.6.camel@dabdike.int.hansenpartnership.com> <BLU0-SMTP534874204161B3ACF5D2E4979C0@phx.gbl> <1370194458.1977.16.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: linux-parisc List <linux-parisc@vger.kernel.org>,
	Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1370194458.1977.16.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2-Jun-13, at 1:34 PM, James Bottomley wrote:

> On Sun, 2013-06-02 at 13:16 -0400, John David Anglin wrote:
>> On 2-Jun-13, at 12:43 PM, James Bottomley wrote:
>>
>>> On Sun, 2013-06-02 at 12:21 -0400, John David Anglin wrote:
>>>> The comment at the start of pacache.S states that the base and  
>>>> index
>>>> registers used for
>>>> fdc,fic, and pdc instructions should not use shadowed registers.
>>>> Although this is probably
>>>> unnecessary for tmpalias flushes, there is also no reason not to
>>>> comply.  The same
>>>> index register (%r23) is used as in other routines.
>>>
>>> Please don't do this, it's a misinterpretation of the comment.
>>
>> I don't think so.  See the discussion around cases 16 and 17 in
>> handle_interruption.
>
> Please be clearer: I don't understand what you think the problem  
> is.  16
> and 17 are the non access TLB traps which we can't get into in the
> tmpalias code.
>
> The way we handle tlb misses (for both NA, D and I types) within the
> tmpalias region is in the do_alias macro of the interruption handler.
> We never go through to the fault handler.
>
>>>
>>> What the comment is trying to say is that we use unshadowed
>>> registers to
>>> pass information to the tmpalias handler in our tlb insertion
>>> interruption.  It's the do_alias macro in entry.S.  The only actual
>>> unshadowed registers it uses are %r23 and %r26.  Apart from these
>>> having
>>> to have specific values, the rest of the routine is free to use any
>>> other registers (either shadowed or unshadowed) as it sees fit.
>>>
>>> If the comment is unclear, perhaps it needs fixing?
>>
>>
>> %r23 is only used by the do_alias macro for interruptions in the
>> 'from' region.
>> See this hunk:
>>
>> #ifdef CONFIG_64BIT
>>         extrd,u,*=      \va,41,1,%r0
>> #else
>>         extrw,u,=       \va,9,1,%r0
>> #endif
>>         or,COND(tr)     %r23,%r0,\pte
>>         or              %r26,%r0,\pte
>>
>> The extract instruction tests whether the interruption was in the  
>> 'to'
>> tmpalias
>> region.  If it is in the 'to' region, the instruction following using
>> %r23 is nullified.
>>
>> So, %r23 can be used for the index register in these two functions
>> which don't
>> use the 'from' tmpalias region.
>
> It can, but it's dangerous and confusing to use it because we've
> specifically called out that it has a special meaning in the vario0us
> comments.  Using it for a different purpose from what we stated in the
> comments within the code needlessly confuses the reader who comes  
> after
> us.


I don't think it's dangerous.  %r23 is a call clobbered register in  
these functions.
It can be anything on entry to these functions and it is not  
initialized.

We could use %r31 instead if you want to keep %r23 for tmpalias use.

The issue is the inconsistency between the initial comment which  
applies to the
fault handler and the tmpalias routines that have different rules for  
non access
faults.

Helge originally pointed out the issue.

Dave
--
John David Anglin	dave.anglin@bell.net



