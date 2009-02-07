From: Helge Deller <deller@gmx.de>
Subject: Re: FUNCTION_TRACER and parisc kernel
Date: Sat, 07 Feb 2009 20:05:33 +0100
Message-ID: <498DDB7D.50309@gmx.de>
References: <20090207032523.06F704EF8@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: carlos@systemhalted.org, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090207032523.06F704EF8@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

John David Anglin wrote:
>> Hi Carlos, Dave & parisc-linux mailing list,
>>
>> I just started looking into implementing function tracer functionality 
>> into the parisc kernel (http://cateee.net/lkddb/web-lkddb/FUNCTION_TRACER.html).
>>
>> While doing so, I noticed that gcc issues lots of warnings like this one:
>>   CC      arch/parisc/lib/iomap.o
>> cc1: warning: -ffunction-sections disabled; it makes profiling impossible
>>
>> So it seems that this statement in arch/parisc/Makefile:
>> # Without this, "ld -r" results in .text sections that are too big
>> # (> 0x40000) for branches to reach stubs.
>> cflags-y        += -ffunction-sections
>>
>> breaks with the -pg compile option which is needed for function tracing.
>>
>> Some searching with google brought up this thread:
>> http://gcc.gnu.org/ml/gcc-help/2008-11/msg00128.html
>> and esp. this answer:
>> http://gcc.gnu.org/ml/gcc-help/2008-11/msg00141.html
> 
> Hmmm, we killed named section support on the HP-UX SOM port several years
> ago because it wasn't very useful.  Jeff did it...  So, at this time, only
> Solaris is an issue.  Of course, changing the code in toplev.c affects all
> targets.  So, a change to remove this would have to go into 4.5 quite
> early.
> 
> There was some work on the profiling implementation for both HP-UX and
> Linux after the removal of named section support on HP-UX, so the label
> issue may not be a problem.  Remove the code disabling function sections
> when -pg is specified and see what happens.

It does not link when building 32bit or PA20 code.
On 64bit it does build and link, although taking the patch from 
http://sourceware.org/ml/binutils/2009-02/msg00040.html
into account, as well as me running an old ld, it might be that
I just don't see it failing yet...

> [I have thought it would be useful to have named sections for dwarf2
> debug support on HP-UX.  However, this is not useful for normal code.
> I have a patch somewhere to do this, but gdb needs work which I've
> never got around to.  So, I might bring named section support back
> in a limited way.]

Ok. This means it would be possible to drop function-sections.

> Regarding .text sections that are too big, see this thread:
> http://sourceware.org/ml/binutils/2009-02/msg00061.html
> 
> It seems that it should be possible to do more fine grained stub
> sections.  At this time, it's not fully clear where the problem
> lies.  GCC may need to start a new .text section before each function,
> or maybe the .text sections are getting merged.
> 
> Recently, I got pushed to look a bit at GNU ld.  It turns out there is no
> long branch stub support in it at all.  As a result, it can't assemble
> large applications like cc1plus.  It can just barely link cc1.  It
> might have trouble with a large linux kernel.  I added a check recently
> to generate an error if a branch target is out of range.  There's
> a possibility that the current code for stub management in elf32-hppa.c
> can be modified for hppa64 without too much work.

That would be great.

> I don't know about the "ld -r" problem but I suspect we have to stop
> .text sections from getting merged in partial links.  The other possiblity
> would be to add long branch stubs for calls to undefined symbols.  The
> latter approach would complicate final links.

Thanks a lot for those explanations!!!
I see I need to dig in closer into ld/gcc as well too :-(

Helge
