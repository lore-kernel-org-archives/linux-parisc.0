From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Happy New Year PARISC
Date: Mon, 2 Jan 2012 10:12:53 -0500
Message-ID: <BLU0-SMTP31AEFBE4BAA62F2EED77CE97910@phx.gbl>
References: <BLU0-SMTP8506059BFA40F0B7419F2497900@phx.gbl> <CANEJEGv5jOLEywzj52KVsdQHJmXf5GxWDBaJZNnbfnwhYcR23A@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: linux-parisc List <linux-parisc@vger.kernel.org>
To: Grant Grundler <grantgrundler@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CANEJEGv5jOLEywzj52KVsdQHJmXf5GxWDBaJZNnbfnwhYcR23A@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2-Jan-12, at 1:23 AM, Grant Grundler wrote:

> Well Done!
> That must have been incredibly hard to find. It's a bummer the only
> way we can find those sorts of things is by unraveling crash dumps. :(
>

Sadly, the crash dumps were never very helpful.  The hpmc's arising
from cache corruption were usually significantly deferred.  Often, the
crashes would occur with the processors in the idle loop!  Probably,
HP had a JTAG box or something similar to analyze cache problems.

We have known for some time that non-equivalent aliases are not
supported on PA8800 and PA8900 processors.  I patched binutils
several months ago to fix this problem.  However, the entire runtime
needs to be recompiled to eliminate the problem.

The kernel routine that causes the hpmc's is flush_cache_range.
I wrote a modified version that can check the page mapping, but it
is very slow.  This is a very performance critical function.

Another source of instability was TLB purges.  We put lock/unlock
sequences around all the purges in the C code, but somehow we forgot
to do the same in the assembly code in pacache.S.

I believe that I fixed the COW/minifail bug yesterday.  I now have
copy_user_page doing copies via the temp-alias region.  We also
forgot to purge the TLB entries when we write protected the page
table for COW.  As a result, multithreaded applications could continue
to dirty a page after it was nominally write protected.

There is more to do on this.  I know that clear_user_page and
copy_user_page no longer need the dcache flushes in
kunmap_parisc.  What I'm really hoping is that we will now be
able to change the define for flush_cache_dup_mm to:

#define flush_cache_dup_mm(mm)		do { } while (0)

>> I have started working on setting up magnum for buildd.
>
> If I can download a bunch of .debs, I'd be happy to install and run
> some tests on my j6k.

The .debs can be found in my home directory on dogma.  binutils,
gcc-4.4 and gcc-4.6 can be updated without kernel issues.  I believe
that glibc needs 2.6.26 or later.  Watch out for udev.  Don't update
it until glibc is updated.  It's definitely tricky to do the updates  
by hand.

I'm going to work on the kernel patch some more today.  Hopefully,
it will then be ready for testing on other machines.

Dave
Happy New Year
--
John David Anglin	dave.anglin@bell.net



