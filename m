From: John David Anglin <dave.anglin@bell.net>
Subject: Re: TLB Miss Bug?
Date: Sat, 26 Nov 2011 20:54:33 -0500
Message-ID: <BLU0-SMTP69497471F7AC39085A11CC97CD0@phx.gbl>
References: <BLU0-SMTP178D0B9C9992607985308C97CE0@phx.gbl> <1322277527.7362.12.camel@dabdike.cust.hotspot.t-mobile.com> <BLU0-SMTP4684050CC4E337BF49371797CD0@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP4684050CC4E337BF49371797CD0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 26-Nov-11, at 7:35 PM, John David Anglin wrote:

> On 25-Nov-11, at 10:18 PM, James Bottomley wrote:
>
>> I'm still a bit Jetlagged from a customer trip to Germany, but this
>> looks entirely possible: Appendix F says that a later TLB insertion
>> purges an earlier one, so I'd say in a combined I/D TLB inserting
>> consecutive I and D entries purges the I.
>>
>> It looks like a fix might be to insert TLB entries supporting both  
>> data
>> and instruction access in the combined TLB case.
>
> In looking at the code, I couldn't see why the I and D entries would  
> differ.
> Except for the dtlb_check_alias_20w check, the I and D handlers appear
> identical.  Maybe the hardware can't handle this case.
>
> Don't understand this comment:
>
>        /*
>         * I miss is a little different, since we allow users to fault
>         * on the gateway page which is in the kernel address space.
>         */
>
> There is also a typo in this comment:
>
>         * Then incredible subtlety: The access rights are
>         * _PAGE_GATEWAY _PAGE_EXEC _PAGE_READ
>
> I believe the last bit should be _PAGE_WRITE.

I just realized there is a difference.  In the I case, va and spc are  
loaded
from %pcoq and %pcsq, respectively.  In the D case, they are loaded from
%ior and %isr.  I haven't wrapped my head around this but space_adjust
may not be handling the b field correctly (D case)

Dave
--
John David Anglin	dave.anglin@bell.net



