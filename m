From: John David Anglin <dave.anglin@bell.net>
Subject: Re: debian hppa
Date: Thu, 07 Jul 2011 13:26:52 -0400
Message-ID: <4E15EC5C.10702@bell.net>
References: <20110527213516.GH21744@dannf.org> <20110527233738.0B95D4FCB@hiauly1.hia.nrc.ca> <BANLkTi=maOnkCLD9aU=JDYL9257EkpHxnQ@mail.gmail.com> <20110601021049.GB3984@hiauly1.hia.nrc.ca> <BANLkTin2DhKC_ss6UsCPYxmTR-UD=GY0uw@mail.gmail.com> <E1F45BBE-F922-4E1C-9DEC-FAF4BF4B4E26@nrc-cnrc.gc.ca> <CA+DQjFgygVS0YQ_zUfQG=BkTb_zrSN+yYxGyTU6ufC-PV7dBxA@mail.gmail.com> <20110707161810.GC12243@dannf.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: Thibaut VARENE <T-Bone@parisc-linux.org>,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	carlos@systemhalted.org, linux-parisc@vger.kernel.org
To: dann frazier <dannf@dannf.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110707161810.GC12243@dannf.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 7/7/2011 12:18 PM, dann frazier wrote:
> On Thu, Jul 07, 2011 at 05:49:36PM +0200, Thibaut VARENE wrote:
>> On Thu, Jul 7, 2011 at 1:20 AM, John David Anglin
>> <dave.anglin@nrc-cnrc.gc.ca>  wrote:
>>> Hi Thibaut,
>>>
>>> On 13-Jun-11, at 6:19 PM, Thibaut VARENE wrote:
>>>
>>>>> I would say your other machines need updating even if the process is
>>>>> somewhat rocky as that's the only way a broadbased release can be tested.
>>>> Well I can assign one machine (the a500, being easy to reboot/fix as
>>>> it is) to testing kernels, but for a stable kernel suitable for the
>>>> machines I'm e.g. assigning to the GCC Compile Farm[0], what would be
>>>> a good SMP kernel version to choose? I'm looking for the same level of
>>>> hassle-freeness as 2.6.22.19 since these machines are under relatively
>>>> heavy load and I cannot afford to tend to their care on a daily basis
>>>> ;-)
>>> Sorry for the delay in responding.  I think assigning the a500 to the GCC
>>> farm
>>> provides good visibility.  For GCC, the kernel version doesn't matter much.
>>>   The
>>> main issue is stability.
>> OK, so I suppose it's fine to stick with 2.6.22.19? I thought there
>> were issues with un-implemented syscalls and such, so I don't really
>> know...
>>
This comment was specific to building and testing GCC.  It currently 
takes slightly over
24 hours to build and test GCC trunk on my c3750.

> Honestly, the most reliable build machine I've used is my
> C3700. I don't recall ever having any build issues with
> that. Anything it gives up in speed is definitely outweighed by
> having to e.g. retry gcc 5 times before succeeding. By the end of the
> port, I'd normally handbuild new gcc uploads here to avoid thrashing
> on the real buildds. If given the option, I'd recommend 3 of those
> boxes for a buildd ring.
>
Based on my testing, it's no longer necessary to try 5 times before 
succeeding with rp3440.
I agree that the C37XX machines are very stable and don't suffer from 
the SMP/cache
issues present in the servers.  If the ring above could be arranged, 
that would be excellent.

Dave

-- 
John David Anglin    dave.anglin@bell.net

