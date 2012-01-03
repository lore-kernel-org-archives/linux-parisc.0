From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Happy New Year PARISC
Date: Tue, 03 Jan 2012 11:26:52 -0500
Message-ID: <4F032C4C.10805@bell.net>
References: <BLU0-SMTP8506059BFA40F0B7419F2497900@phx.gbl>  <CANEJEGv5jOLEywzj52KVsdQHJmXf5GxWDBaJZNnbfnwhYcR23A@mail.gmail.com>  <BLU0-SMTP31AEFBE4BAA62F2EED77CE97910@phx.gbl>  <BLU0-SMTP20DB85B206E6F015C370CE97910@phx.gbl>  <CADZpyiywh8SL42H9nO=9tMXgiyxL4SfmaX6PcZP5Kwme-Ozxsw@mail.gmail.com>  <4F031B1A.4010908@bell.net> <1325604740.3185.4.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	Grant Grundler <grantgrundler@gmail.com>,
	linux-parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1325604740.3185.4.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 1/3/2012 10:32 AM, James Bottomley wrote:
> On Tue, 2012-01-03 at 10:13 -0500, John David Anglin wrote:
>> On 1/3/2012 6:50 AM, Carlos O'Donell wrote:
>>> On Mon, Jan 2, 2012 at 6:12 PM, John David Anglin<dave.anglin@bell.net>   wrote:
>>>> None of this worked.  Attached patch as it stands.  Comments and testing
>>>> appreciated.
>>> Could you clarify what you mean by "none of this worked?"
>>>
>> I tried eliminating the flushes that occur in kunmap_atomic on PA8800
>> and PA8900
>> after the calls to clear_user_page and copy_user_page by defining
>> clear_user_highpage
>> and copy_user_highpage.  I had thought the flushes weren't necessary.
>> There's something
>> about this that I don't understand.  Why do we need to flush
>> non-equivalent page mappings
>> that aren't used?
> But they are used:  Your work makes sure that all user space mappings
> are equivalent.  However, because of the way Linux sets up kernel
> mappings (from the pfn array and offsets) the user virtual address and
> kernel virtual address almost never are.  kmap is exclusively used so
> the kernel can access a user page, and at that point, we need to flush
> because we've set up an inequivalent alias (even if it's only done for
> read)
>
> kmap/kmap_atomic is used in more than just copy/flush ... or did you
> mean that you removed the kmap calls in copy/flush and the whole thing
> doesn't work (rather than as you imply you removed the flush in kunmap?)
>
I didn't modify kmap/kunmap_atomic.  I wrote versions of 
clear_user_highpage and
copy_user_highpage to replace the default versions in linux/highmem.h.  
I replaced
the kunmap_atomic calls with pagefault_enable to avoid the flush in the 
returns from
clear/copy_user_page (actually, I only used one call to 
pagefault_enable, so maybe
that was the issue).  As far as I could tell, clear/copy_user_page are 
only called via
clear/copy_user_highpage.  The behavior of kmap/kunmap_atomic in other 
situations
shouldn't have changed.

Chapter F makes it clear that *all* inequivalent aliases to a page have 
to be removed
when a write capable translation is enabled (no flush needed).  When a 
write-capable
translation needs to be read through an inequivalent alias, the page is 
supposed to
be flushed, the write-capable translation is supposed to be removed from 
the page
directory and then purged.

That's why I added the purge_tlb_entries calls to set_pte_at and 
ptep_set_wrprotect.
We avoid the flush by doing the `from' read through an equivalent 
mapping.  However,
the inequivalent mapping is still there.  It seems to be necessary to 
purge the TLB
entries prior to clearing/copying.  However, from what I read in Chapter 
F, the purge
is probably insufficient to speculative prevent move in.  If I recall 
correctly, the
kunmap_atomic also generates another TLB purge as well as a flush.

There is a special access type (7) that can be used to prevent read and 
write move in.

Dave

-- 
John David Anglin    dave.anglin@bell.net

