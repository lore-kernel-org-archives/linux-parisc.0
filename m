From: Helge Deller <deller@gmx.de>
Subject: Re: futex wait failure
Date: Fri, 08 Jan 2010 22:18:40 +0100
Message-ID: <4B47A130.8060603@gmx.de>
References: <20100108163756.48BDE5183@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: dave.anglin@nrc-cnrc.gc.ca, carlos@systemhalted.org,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100108163756.48BDE5183@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 01/08/2010 05:37 PM, John David Anglin wrote:
>>
>> On 01/07/2010 12:33 AM, John David Anglin wrote:
>>>>> clone(Process 1684 attached (waiting for parent)
>>>>> Process 1684 resumed (parent 1683 ready)
>>>>> child_stack=0x4076d040, flags=CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD|CLONE_SYSVSEM|CLONE_SETTLS|CLONE_PARENT_SETTID|CLONE_CHILD_CLEARTID, parent_tidptr=0x40f6c4e8, tls=0x40f6c900, child_tidptr=0x40f6c4e8) = 1684
>>>>
>>>> I noticed the tidptr for the fork may not be correct:
>>>>
>>>> clone(child_stack=0x40e87040, flags=CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD|CLONE_SYSVSEM|CLONE_SETTLS|CLONE_PARENT_SETTID|CLONE_CHILD_CLEARTID, parent_tidptr=0x416864e8, tls=0x41686900, child_tidptr=0x416864e8) = 31613
>>>> clone(child_stack=0, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0x40002028) = 31614
>>>>
>>>> I would have thought the value should have been the same as that in the
>>>> clone from the pthread_create call.
>>>
>>> It's possible that this is done intentionally...  The parent_tidptr
>>> is the one that's wrong in the first clone.
>
> I now think this probably is a glibc bug.  The kernel uses this value
> when the CLONE_PARENT_SETTID flag is passed.


Maybe we have a futex problem in glibc on hppa?
In glibc nptl/pthread_mutex_trylock.c we check the return value of a futex syscall against EWOULDBLOCK.
Since on parisc - in contrast to all other architectures - we have EWOULDBLOCK!=EAGAIN, we maybe missed a check?

Helge
