From: Helge Deller <deller@gmx.de>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Tue, 20 Apr 2010 19:59:10 +0200
Message-ID: <4BCDEB6E.1060408@gmx.de>
References: <20100412214118.46D925160@hiauly1.hia.nrc.ca> <20100413115501.307040@gmx.net> <20100419162653.GA106@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	linux-parisc@vger.kernel.org, gniibe@fsij.org,
	carlos@systemhalted.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100419162653.GA106@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Dave,

On 04/19/2010 06:26 PM, John David Anglin wrote:
> On Tue, 13 Apr 2010, Helge Deller wrote:
>> Still crashes.
> 
> Can you you try the patch below?  The change to cacheflush.h is the same
> as before.

Thanks for the patch.
I applied it on top of a clean 2.6.33.2 kernel and ran multiple parallel 
minifail programs on my B2000 (2 CPUs, SMP kernel, 32bit kernel).
Sadly minifail still crashed the same way as before.

Should I have applied other patches as well?

Helge

> I have lightly tested the attached change on rp3440 with SMP 2.6.33.2
> kernel.  It got through a GCC build at -j8, which is something of a
> record.  However, I did see one issue this morning in the ada testsuite:
> 
> malloc: ../bash/make_cmd.c:100: assertion botched
> malloc: block on free list clobbered
> Aborting.../home/dave/gnu/gcc/gcc/gcc/testsuite/ada/acats/run_all.sh: line 67: 29176 Aborted                 (core dumped) ls ${i}.adb >> ${i}.lst 2> /dev/null
> 
> I have seen this before.
> 
> The change reworks all code that manipulates ptes to use the pa_dbit_lock
> to ensure that we don't lose state information during updates.  I also
> added code to purge the tlb associated with the pte as it wasn't obvious
> to me how for example the write protect bit got set in the tlb.
> 
> Someone had clearly tried to fix the dirty bit handling in the past,
> but the change was incomplete.

