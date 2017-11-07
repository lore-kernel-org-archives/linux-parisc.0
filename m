From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Testing the lws_compare_and_swap_2 syscall
Date: Tue, 7 Nov 2017 16:31:29 -0500
Message-ID: <c7568c02-daba-fdcb-3885-dea2d0746e15@bell.net>
References: <1508874207@msgid.manchmal.in-ulm.de>
 <F232B09A-5367-4A4C-B731-00C63AAB489A@bell.net>
 <1508973952@msgid.manchmal.in-ulm.de>
 <20171106212734.GA29237@ls3530.fritz.box>
 <0746fb62-659b-da79-07a0-5ff469543c09@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>,
        Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>,
        Richard Henderson <rth@twiddle.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <0746fb62-659b-da79-07a0-5ff469543c09@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2017-11-06 5:45 PM, John David Anglin wrote:
> On 2017-11-06 4:27 PM, Helge Deller wrote:
>>       /* Check the validity of the size pointer */
>> -    subi,>>= 4, %r23, %r0
>> -    b,n    lws_exit_nosys
>> +    cmpib,COND(<<),n 3, %r23, lws_exit_nosys
> I don't believe that we want to use COND here (i.e., we want a 32-bit 
> check).  We might not
> need to trim the upper 32-bits r23.
>
> The reason the code uses nullification is the fast path occurs when 
> the "b,n" is nullified.   So we
> avoid the branch prediction penalty.  I'd have to check whether the 
> fast path with the cmpib instruction
> is the taken branch or not.
For cmpib with "<<" condition, the hint for a backward branch is likely 
taken.  The branch to
lws_exit_nosys is backward.

Dave

-- 
John David Anglin  dave.anglin@bell.net

