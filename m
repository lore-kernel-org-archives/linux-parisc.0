From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH 2.6.39-rc3] parsic: Fix futex support
Date: Sun, 24 Jul 2011 16:30:21 -0400
Message-ID: <BLU0-SMTP42FD5BABB49DFD947C868E97300@phx.gbl>
References: <4E177624.1030500@systemhalted.org> <201107081742.48874.vapier@gentoo.org> <4E1780EE.1010405@systemhalted.org> <BLU0-SMTP8777233F78FA13F6037090974E0@phx.gbl> <CADZpyixCFm7YUfihEJs+eR+gyUcw+S_ty+v4w2bK2s0jMFwUQg@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Mike Frysinger <vapier@gentoo.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CADZpyixCFm7YUfihEJs+eR+gyUcw+S_ty+v4w2bK2s0jMFwUQg@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


On 24-Jul-11, at 2:42 PM, Carlos O'Donell wrote:

> On Fri, Jul 22, 2011 at 5:51 PM, John David Anglin <dave.anglin@bell.net 
> > wrote:
>> Do you have a userspace patch?  There was the thread stack  
>> allocation bug
>> and possibly futex related issues.
>
> I do have a userspace patch, what would you like the patch against?

The current version is unstable or 2.11.2-10.

>
>> The "Check Summary" is always 0x8400000000800000.  I think Kyle  
>> fixed one of
>> these last March.
>> The cause was missing IPC system calls.  I'm a bit vague regarding  
>> whether
>> the fix was installed
>> or not.
>
> I wouldn't expect a missing syscall to HPMC the machine, it should  
> return ENOSYS
> and userspace should return a failure code... eventually something  
> might fail to
> check the function return and fail.
>
> That's far from an HPMC though.


Yah, I now think it was a matter of luck exposing the missing IPC calls.

I wish we knew how to decode the "Check Summary"  but I haven't found  
any documentation
on the net.  My current theory is the value indicates some kind of  
cache malfunction.  I suspect
that the corruption may occur during range based flushes due code  
containing inequivalent
aliases.  I think 0x2000000000000000 indicates a memory timeout.

I did find a small bug in flush_cache_range (sr3 has wrong type).  If  
I'm correct about the
problem being range based, this bug probably made things better by  
calling flush_cache_all
more frequently.

I have a whole collection of hpmcs and almost all have the same check  
summary.  It very
hard to see much consistency.  Many have hpmc's in the idle loop.  A  
couple have hpmc's
in flush_data_cache.  It's always possible that there is a hardware  
problem, but the problem
occurs so frequently in the libgomp testsuite that I have to think it  
is software triggered.
I haven't been able to trigger by running compilations or tests  
manually.

There must be some interconnection between the cores because a fault  
in one almost triggers
a TOC hpmc in the other.  The "Assist Check" value is a space register  
value and it's probably
the context of the process that caused the cache problem.

I'm currently running a test to check operation using mainly  
flush_instruction_cache and
flush_data_cache (whole cache flushes).  So far, it hasn't hpmc'd in  
the libgomp testsuite,
but it's very slooooow.

I plan to rebuild the main packages used in the libgomp testsuite to  
see if this helps.

Dave
--
John David Anglin	dave.anglin@bell.net



