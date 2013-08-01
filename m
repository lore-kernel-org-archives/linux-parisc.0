From: John David Anglin <dave.anglin@bell.net>
Subject: Re: New Debian Kernel Packages
Date: Thu, 1 Aug 2013 19:29:51 -0400
Message-ID: <BLU0-SMTP522B87E60AD62629BDAFE097500@phx.gbl>
References: <BLU0-SMTP89A9F5D677CA80946A5DB097550@phx.gbl> <51FADF39.4020505@gmx.de> <BLU0-SMTP3529F28468423082C0A26797500@phx.gbl> <1375397525.2070.17.camel@dabdike>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Helge Deller <deller@gmx.de>,
	Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1375397525.2070.17.camel@dabdike>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 1-Aug-13, at 6:52 PM, James Bottomley wrote:

> On Thu, 2013-08-01 at 18:39 -0400, John David Anglin wrote:
>> On 1-Aug-13, at 6:20 PM, Helge Deller wrote:
>>
>>> Hi Dave,
>>>
>>> On 07/30/2013 12:46 AM, John David Anglin wrote:
>>>> The following kernel packages are now in the parisc-linux.org
>>>> archive:
>>>>
>>>> linux-image-3.10-1-parisc-smp_3.10.3-1_hppa.deb
>>>> linux-image-3.10-1-parisc64-smp_3.10.3-1_hppa.deb
>>>> linux-image-3.10-1-parisc64_3.10.3-1_hppa.deb
>>>> linux-image-3.10-1-parisc_3.10.3-1_hppa.deb
>>>
>>> That's fantastic!
>>> This brings us one big step further to being able to build a real
>>> debian-unstable-installer boot CD.
>>>
>>> I'm still hoping the C8000 patches I pushed for inclusion into 3.11
>>> will then
>>> show up in stable 3.10 series soon as well. If that happens we will
>>> have a kernel
>>> which should boot on all machines - including the c8000.
>>
>>
>> I have bootstrap tested the linux-image-3.10-1-parisc64-
>> smp_3.10.3-1_hppa.deb package.  We'll
>> have to see if 3.10 will be the Debian choice for the next release.
>>
>> As I mentioned in private, I have found that flush_cache_all() is the
>> principal problem causing random
>> segmentation faults on SMP systems.
>
> That would tend to indicate the architectural flush code is wrong: it
> isn't flushing all as it should be.


That thought had occurred to me.  It's also possible that it doesn't  
work
properly with the L3 added in the PA8800/PA8900 systems.

What seems to work is flushing all the user mappings.

I should note that I have also seen corruption of space register %sr1
(added checks in the routines that use pa_memcpy).  I think the only
way that can happen is kernel stack corruption.  Probably, this is also
caused by flush_cache_all.  I know this issue has been around for
a long time.

I'll look at the flush code again.

Dave
--
John David Anglin	dave.anglin@bell.net



