From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: Use unshadowed index register for flush instructions in flush_dcache_page_asm and flush_icache_page_asm
Date: Sun, 2 Jun 2013 13:16:24 -0400
Message-ID: <BLU0-SMTP534874204161B3ACF5D2E4979C0@phx.gbl>
References: <BLU0-SMTP62E4CC425407D88FFC0DF3979C0@phx.gbl> <1370191421.1977.6.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: linux-parisc List <linux-parisc@vger.kernel.org>,
	Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1370191421.1977.6.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2-Jun-13, at 12:43 PM, James Bottomley wrote:

> On Sun, 2013-06-02 at 12:21 -0400, John David Anglin wrote:
>> The comment at the start of pacache.S states that the base and index
>> registers used for
>> fdc,fic, and pdc instructions should not use shadowed registers.
>> Although this is probably
>> unnecessary for tmpalias flushes, there is also no reason not to
>> comply.  The same
>> index register (%r23) is used as in other routines.
>
> Please don't do this, it's a misinterpretation of the comment.

I don't think so.  See the discussion around cases 16 and 17 in  
handle_interruption.

>
> What the comment is trying to say is that we use unshadowed  
> registers to
> pass information to the tmpalias handler in our tlb insertion
> interruption.  It's the do_alias macro in entry.S.  The only actual
> unshadowed registers it uses are %r23 and %r26.  Apart from these  
> having
> to have specific values, the rest of the routine is free to use any
> other registers (either shadowed or unshadowed) as it sees fit.
>
> If the comment is unclear, perhaps it needs fixing?


%r23 is only used by the do_alias macro for interruptions in the  
'from' region.
See this hunk:

#ifdef CONFIG_64BIT
         extrd,u,*=      \va,41,1,%r0
#else
         extrw,u,=       \va,9,1,%r0
#endif
         or,COND(tr)     %r23,%r0,\pte
         or              %r26,%r0,\pte

The extract instruction tests whether the interruption was in the 'to'  
tmpalias
region.  If it is in the 'to' region, the instruction following using  
%r23 is nullified.

So, %r23 can be used for the index register in these two functions  
which don't
use the 'from' tmpalias region.

Dave
--
John David Anglin	dave.anglin@bell.net



