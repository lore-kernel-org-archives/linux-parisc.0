From: Jeff Law <law@redhat.com>
Subject: Re: Aw: hppa qemu and string functions
Date: Wed, 9 Nov 2016 08:51:01 -0700
Message-ID: <32965c22-66ed-3012-a392-5a8aba28aa12@redhat.com>
References: <21645bc2-f005-5e60-d26a-41af60e3c035@twiddle.net>
 <trinity-8a5a9da3-1e08-4571-bbfb-b230bd20f15b-1478703076818@3capp-gmx-bs52>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: linux-parisc@vger.kernel.org,
        GNU C Library <libc-alpha@sourceware.org>
To: Helge Deller <deller@gmx.de>, Richard Henderson <rth@twiddle.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <trinity-8a5a9da3-1e08-4571-bbfb-b230bd20f15b-1478703076818@3capp-gmx-bs52>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 11/09/2016 07:51 AM, Helge Deller wrote:
> Hi Richard,
>
>> Off and on, I've been working on a user-only target of hppa to qemu.  It's now
>> about 95% working.  If anyone would like to try it out, it's available at
>>    git://github.com/rth7680/qemu.git tgt-hppa
>
> COOL!
> I'm happy to test, but can you shortly describe the required steps how I can build & test it?
>
> With "user-only target of hppa" I assume this means that I can run hppa binaries
> on e.g. x86-64, similiar to what is described here: https://wiki.debian.org/QemuUserEmulation ?
>
>> While implementing the unit-type instructions, I wondered why no one (outside
>> hp?) had written a version of the string routines utilizing the UXOR insn, with
>> the SomeByteZero and NoByteZero conditions.
>
> Interesting.
> I assume nobody did, because there are a few hppa/linux/glibc users anyway ? :-)
Probably a safe assumption.  I'm pretty sure the hpux string routines 
used uxor.  There was also at least one hpux routine in libc which used 
the branch-in-delay-slot-of-branch trick, but I can't recall why it was 
useful.

jeff

