From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Issue booting v2.6.39 .. v3.4-rc6 on hp712/100
Date: Wed, 9 May 2012 22:03:45 -0400
Message-ID: <BLU0-SMTP65CF901B170B044925E85897160@phx.gbl>
References: <4FA9975C.5060708@bergerie> <41786065.U2qKzXR3uX@donald.sf-tec.de> <4FAA9382.7040802@bell.net> <4FAADE2A.9080803@bergerie>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc@vger.kernel.org
To: Vincent <vincent.stehle@laposte.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4FAADE2A.9080803@bergerie>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 9-May-12, at 5:14 PM, Vincent wrote:

> On 05/09/2012 05:55 PM, John David Anglin wrote:
>> Attached is an updated version.   It applies against 3.3.4.
>
> Thanks. It applies on v3.4-rc6 with no issue. However, it crashes at
> boot in flush_dcache_page_asm.


I want to make a general comment.

The hp712/100 is an old machine.  There is no longer ANY support for
parisc open source by HP.  If the parisc user community wants to  
continue
to run current open source software, then it will have to work  
together to
achieve this goal.

In this case, we need to figure out what is wrong with the tmpalias code
on the hp712/100.

Debian dropping hppa after the lenny release was a wake up call.  There
is pressure on other fronts.  See for example the following thread,
http://gcc.gnu.org/ml/gcc/2012-05/msg00093.html

If accepted, it would mean the end of 32-bit GCC development for parisc,
and therefore the end of parisc linux and netbsd systems.  More  
specifically,
it may be reasonable to drop support for PA 1.1 systems.  So, we need
to hear why it is important to continue to try to maintain PA 1.1  
systems.

In general, I have found Debian package maintainers to be supportive
of bug fixes for parisc.  Most packages still support parisc and build  
without
problems but there is some porting work that needs doing.  For example,
mono has seriously rotted.  Without a viable userspace, there's not much
point to maintaining the kernel.

I applaud Mikulas for reviewing Rolf Eike's fixes for 3.4 and posting  
them to the
linux-kernel list.  Maintainers have personal time issues and can't  
always be
available.

I have spent hundreds of hours building packages, working on GCC,
binutils, glibc and kernel bugs over the past year.  I have pushed fixes
upstream and back ported them as quickly as possible because it takes
considerable time before the fixes start to percolate downstream.

I have a project to restart a Debian buildd for parisc and help would be
appreciated.  The key issue is help in reporting and analyzing package
bugs. and informing the appropriate maintainers when there are problems.

I posted a number of kernel work in progress patches to the linux-parisc
list but nobody bothered to test them except for Vincent today.  All I  
know
at this point is my rp3440 is much more stable and runs twice as fast as
it used to with my cache patch.  As such, it can keep up with unstable.
This took hundreds of kernel builds and considerable long term testing.

The problem with cache bugs is they are difficult.  The parisc  
architecture
and the linux requirements for cache routines are inadequately  
documented.
So, it has become a trial and error exercise.  This has always been the
critical problem for parisc-linux and the code in cache.c reflects this.

It is impossible for volunteers to run and maintain a broad range of
hardware.  So, we need to focus on the hardware that is used and will
continue to used over the next few years.  If users want support, then
they need to be willing to help as well.

Regards,
Dave
--
John David Anglin	dave.anglin@bell.net



