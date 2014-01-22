From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: report inequivalent aliases only for writeable
 mappings
Date: Wed, 22 Jan 2014 16:45:07 -0500
Message-ID: <BLU0-SMTP653E849DC18BBE6054E93597A70@phx.gbl>
References: <alpine.LRH.2.02.1401221402190.12739@file01.intranet.prod.int.rdu2.redhat.com>  <1390418695.2372.86.camel@dabdike.int.hansenpartnership.com>  <alpine.LRH.2.02.1401221535290.25455@file01.intranet.prod.int.rdu2.redhat.com> <1390424223.2372.100.camel@dabdike.int.hansenpartnership.com> <alpine.LRH.2.02.1401221629520.1498@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: Mikulas Patocka <mpatocka@redhat.com>,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.02.1401221629520.1498@file01.intranet.prod.int.rdu2.redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 1/22/2014 4:31 PM, Mikulas Patocka wrote:
>
> On Wed, 22 Jan 2014, James Bottomley wrote:
>
>> On Wed, 2014-01-22 at 15:39 -0500, Mikulas Patocka wrote:
>>> On Wed, 22 Jan 2014, James Bottomley wrote:
>>>
>>>> On Wed, 2014-01-22 at 14:11 -0500, Mikulas Patocka wrote:
>>>> [no comment on the merits of the patch, just the wording of the change
>>>> log]
>>>>> This patch changes it so that INEQUIVALENT ALIASES are only reported for
>>>>> writeable mappings. PA-RISC specification allows inequivalent aliases for
>>>>> read-only mappings, so there's no need to report them as an error.
>>>> No, it doesn't.  The spec says no inequivalent aliases at all for
>>>> certain types of CPU (that was the cause of the inability to boot on the
>>>> CPU with the combined PIPT/VIPT cache) ... we believe we skirted the
>>>> requirements with some judicious flushing but we can't say it was
>>>> supported by the docs.
>>>>
>>>> James
>>> A citation from Parisc 2.0 specification, Appendix F, section Address
>>> Aliasing:
>>>
>>> "Software is allowed to have any number of read-only non-equivalently
>>> aliased translations to a physical page, as long as there are no other
>>> translations to the page. This is referred to as read-only non-equivalent
>>> aliasing."
>> The kernel alias is read/write.
>>
>> James
> But the kernel alias shouldn't be loaded in the TLB for dynamic libraries
> that are mapped read-only.
The majority messages occur because of a binutils bug that was fixed 
several years ago.
There's a non equivalent mapping between the last code page and the 
start of writable
data in almost every application and shared library in Debian 5. This is 
fixed in the current
Debian unstable and Gentoo.  So, I recommend updating.

When the user aliases are re-enabled, we have the following situation 
when  non equivalent
aliases exist:

"All other uses of non-equivalent aliasing (including simultaneously 
enabling multiple non-equivalently
aliased translations where one or more allow for write access) are 
prohibited, and can cause machine
checks or silent data corruption, including data corruption of unrelated 
memory on unrelated pages."

I'm not sure that we handle correctly handle the case where there are 
only equivalent user aliases.
Calling flush_dcache_page() was a step in this direction but 
unfortunately Helge and I have found
a side effect (zombies run by expect in gcc/gdb testsuites).  I've also 
found another situation where
non equivalent aliases are generated.

I tend to think message should be a debug message.

Dave

-- 
John David Anglin    dave.anglin@bell.net

