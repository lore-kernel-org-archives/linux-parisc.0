From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Mon, 8 Dec 2008 19:01:28 -0500
Message-ID: <119aab440812081601n1dd3521kcfc3a9a1cb5d4dfc@mail.gmail.com>
References: <119aab440812081414h2145521axb3bc426db9c776be@mail.gmail.com>
	 <20081208223933.ADCC14EF8@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: deller@gmx.de, linux-parisc@vger.kernel.org,
	grundler@parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081208223933.ADCC14EF8@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Dec 8, 2008 at 5:39 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> Otherwise nothing in glibc should make futex calls.
>>
>> Broken futex calls shouldn't crash the kernel.
>
> The kernel doesn't crash since Helge's stack backtrace fix.  We are
> just getting a lot of segfaults in application code.

Excellent. That is certainly progress.

> I'm fairly certain libc6 in debian testing is still built with linuxthreads.
> I'm not sure libc is actually making futex calls, but one is compiled
> into _dl_fixup.  I suppose I could add a printk in the kernel to see
> if futex's are being used.

Yes, your assembly dump shows a futex syscall in _dl_fixup, and AFAIK
there should not be one there.

I used printk *very* effectively in the kernel/futex.c code to debug
futex issues with the NPTL bringup.

Remember that the futex is essentially the address of the userspace
object, so it's rather easy to trace.

> I'm currently building debian libc6.  In a quick attempt, I wasn't
> successful in building the glibc cvs source.  It pushes hard to get
> you to configure with nptl.  My build with linuxthreads failed with
> a type size problem.
>
> I'll try the testsuite with this build on my current kernel.  If that
> works, I'll flip to 2.6.28.

Thanks, please keep me posted.

Cheers,
Carlos.
