From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH 2.6.39-rc3] parsic: Fix futex support
Date: Fri, 22 Jul 2011 17:51:44 -0400
Message-ID: <BLU0-SMTP8777233F78FA13F6037090974E0@phx.gbl>
References: <4E177624.1030500@systemhalted.org> <201107081742.48874.vapier@gentoo.org> <4E1780EE.1010405@systemhalted.org>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Mike Frysinger <vapier@gentoo.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4E1780EE.1010405@systemhalted.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


On 8-Jul-11, at 6:13 PM, Carlos O'Donell wrote:

> On 7/8/2011 5:42 PM, Mike Frysinger wrote:
>> On Friday, July 08, 2011 17:27:00 Carlos O'Donell wrote:
>>> Implements futex op support and makes futex cmpxchg atomic.
>>> Tested on 64-bit SMP kernel running on 2 x PA8700s.
>>
>> seems like all the changes to this func are arch-independent and  
>> could be
>> placed into asm-generic/futex.h.  the current parisc futex.h looks  
>> like a copy
>> of the asm-generic one ...
>> -mike
>
> That's true. I didn't want to rock the boat on this one until
> I hammered out all the userspace testing.


Do you have a userspace patch?  There was the thread stack allocation  
bug and possibly
futex related issues.

I can more or less consistently hpmc my rp3440 running the GCC libgomp  
testsuite with
3.0.0-rc7+.  Unfortunately, it seems hpmcs are somewhat deferred, so  
it's really hard to
to tell what's happening.  Usually, the machine hpmcs in the idle loop.

One instance seemed to have a corrupt user space stack pointer.   
Another instance
seemed to occur with inconsistent space registers in the kernel.   
Often two cpus check
almost simultaneously.  When this happens, both have the same "Assist  
Check" value
(space register).

The "Check Summary" is always 0x8400000000800000.  I think Kyle fixed  
one of these last March.
The cause was missing IPC system calls.  I'm a bit vague regarding  
whether the fix was installed
or not.

Dave
--
John David Anglin	dave.anglin@bell.net



