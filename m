From: Helge Deller <deller@gmx.de>
Subject: Re: Questions about hppa *context functions.
Date: Sun, 31 Jan 2010 21:47:43 +0100
Message-ID: <4B65EC6F.9020205@gmx.de>
References: <119aab441001310825x6fa7254u85c00dc1b0588950@mail.gmail.com> <119aab441001311215p6c13d7a7tcee4747393b1efbe@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	libc-ports@sourceware.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab441001311215p6c13d7a7tcee4747393b1efbe@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 01/31/2010 09:15 PM, Carlos O'Donell wrote:
> On Sun, Jan 31, 2010 at 11:25 AM, Carlos O'Donell
> <carlos@systemhalted.org>  wrote:
>> Helge,
>>
>> On December 15th, 2009 an additional *context test was added to glibc,
>> see stdlib/tst-makecontext3.c.
>>
>> This test fails on hppa with:
>> ~~~
>> makecontext: does not know how to handle more than 8 arguments
>> ~~~
>
> New patch attached with additional changes:
> * Align the incoming stack to 64-bytes.
> * Adjust for frame.
> * Adjust saved stack pointer.
>
> The following patch allows the new test to pass for the 32-bit runtime.
>
> I can't guarantee this works for a 64-bit runtime.
>
> Helge, can you comment on the attached patch?

Carlos,

thanks a lot for your work!

First of all, if it works, I'm fine with it.

One minor question:
I'm used to test sizeof long instead of sizeof int to check for 32/64bit.
You changed it to "(sizeof(unsigned int) == 8)".
I always thought a long is usually the type of a register, while an int can be anything.

> 1. Why limit the number of input arguments to 8?

I didn't had real reasons.
At some point I read that software usually should not rely on the fact that the
*context funtions  can handle more than 4 arguments. To be on the safe side, software
should better hand over a pointer to a struct in one of the first 4 arguments.
But with your patch, which extends it for parisc to more than 8 arguments, it's even better :-)

> 2. It doesn't appear that the current implementation transfers
> ucp->uc_stack.ss_sp to the stack pointer when makecontext() is called.

You seem to have fixed this in your patch.

> 3. POSIX says that all the arguments must be of type int, but in a
> comment you write "XXX: This implementation only handles integer
> arguments."
> Is there any reason this comment should stay there?

Yep. Just drop it.


Again, I didn't tested you patch, but just by looking at it, it seems OK.

Thanks,
Helge
