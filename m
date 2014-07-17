From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Re: Implementing 64bit atomic gcc built-ins
Date: Thu, 17 Jul 2014 10:44:33 +0200
Message-ID: <f6a350becc52f31a47a279ea1c557c54@tuxicoman.be>
References: <e85c925befea4de68fe6f0d292300eee@tuxicoman.be>
 <1405545383.3165.34.camel@dabdike.int.hansenpartnership.com>
 <CAE2sS1i8ncnP135uKo1w6+S_JHV6T6_7mR9Pj-jzt9Wk-s_JQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAE2sS1i8ncnP135uKo1w6+S_JHV6T6_7mR9Pj-jzt9Wk-s_JQw@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2014-07-17 03:52, Carlos O'Donell wrote:
> Userspace algorithms can't expect that a 64-bit write will be atomic
> with respect to a 64-bit atomic operation.
> 
> You must use the atomic operations to both read and write the
> wider-than-natural-width types.
> 

Reviewing HPPA 1.1 specs, I see that the FPU has 64bit registers.
Can't we use those registers to perform 64bit atomic load and store ?

As far as I can see, FLDDX and FSTDX should be able to do the job.
Unless there is something I'm missing about the FPU :)

>> This should mean that a 32 bit kernel has no need at all for the 64 
>> bit
>> ops to be implemented in kernel.
> 
> Has no need, yes, but from the userspace perspective such an operation
> helps write algorithms that take advantage of 64-bits of atomic
> storage without having to deal with signals, interruptions, locking
> semantics etc.
> 
> Particularly when you are porting an algorithm that is already proven
> and uses a 64-bit atomic, having these features means you don't have
> to rewrite all the algorithms during the port.
> 
> Case in point I created LWS CAS to avoid having to rewrite all the
> nptl threading algorithms for hppa based on ldcw.
> 

Just to add up on this, I often use 64 bit __sync_fetch_and_add() for
performance counter in a software I develop. It's really useful if
you don't want to bother with having a lock per performance object.

   Guy

