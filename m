From: Helge Deller <deller@gmx.de>
Subject: Re: futex wait failure
Date: Sun, 17 Jan 2010 00:17:38 +0100
Message-ID: <4B524912.4070204@gmx.de>
References: <20100108163756.48BDE5183@hiauly1.hia.nrc.ca>	 <4B47A130.8060603@gmx.de> <119aab441001081344j38000314p1931df34149eabd3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab441001081344j38000314p1931df34149eabd3@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 01/08/2010 10:44 PM, Carlos O'Donell wrote:
> On Fri, Jan 8, 2010 at 4:18 PM, Helge Deller<deller@gmx.de>  wrote:
>>> I now think this probably is a glibc bug.  The kernel uses this value
>>> when the CLONE_PARENT_SETTID flag is passed.
>>
>>
>> Maybe we have a futex problem in glibc on hppa?
>> In glibc nptl/pthread_mutex_trylock.c we check the return value of a futex
>> syscall against EWOULDBLOCK.
>> Since on parisc - in contrast to all other architectures - we have
>> EWOULDBLOCK!=EAGAIN, we maybe missed a check?
>
> That's a bug. [...]

Carlos,  Dave,

I'm wondering if we have another bug in glibc...?

When running strace, I noticed that a thread which returns with "return 0",
exits the process on hppa with exit(0):
[pid  1875] write(1, "Thread OK.\n", 11) = 11
[pid  1875] exit(0)

On my x86_64 I see:
[pid  8154] write(1, "Thread OK.\n", 11) = 11
[pid  8154] _exit(0)                    =

In ports/sysdeps/unix/sysv/linux/hppa/clone.S (line 170) I do see:
         /* The call to _exit needs saved r19.  */
         bl      _exit, %rp
         copy    %ret0, %arg0

This coding seems to indicate that we call _exit(), but we aren't (as
you see above in the strace).
So I'm wondering if the "bl _exit,%rp" needs changing.
Something with HIDDEN_JUMPTARGET(_exit) or similar, so that
_exit() instead of exit() is called?

Actually I did tested this with the minifail test program, and changed
thread_run() to call _exit(0) at the end instead of "return 0":
void* thread_run(void* arg) {
	...
/*	return (void *)&status;  */
         _exit(0);
}
With strace I then suddenly got exit_group() which seems more correct:
[pid  1910] write(1, "Thread OK.\n", 11) = 11
[pid  1910] exit_group(0)               = ?

Helge
