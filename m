From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: fix kernel crash when unwinding a userspace process
 (v2)
Date: Fri, 21 Nov 2008 23:00:06 +0100
Message-ID: <49272F66.1010702@gmx.de>
References: <200811202258.56561.deller@gmx.de>	<200811211516.50750.deller@gmx.de> <20081121111705.dc03a465.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org, kyle@hera.kernel.org,
	randolph@tausq.org
To: Andrew Morton <akpm@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081121111705.dc03a465.akpm@linux-foundation.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Andrew Morton wrote:
> On Fri, 21 Nov 2008 15:16:50 +0100
> Helge Deller <deller@gmx.de> wrote:
> 
>> Any user on existing parisc 32- and 64bit-kernels can easily crash
>> the kernel and as such enforce a DSO.
>> A simple testcase is available here: 
>>         http://gsyprf10.external.hp.com/~deller/crash.tgz
>>
>> The problem is introduced by the fact, that the handle_interruption()
>> crash handler calls the show_regs() function, which in turn tries
>> to unwind the stack by calling parisc_show_stack().
>> Since the stack contains userspace addresses, a try to unwind 
>> the stack is dangerous and useless and leads to the crash.
>>
>> The fix is trivial: For userspace processes
>> a) avoid to unwind the stack, and
>> b) avoid to resolve userspace addresses to kernel symbol names.
>>
>> While touching this code, I converted print_symbol() to %pS 
>> printk formats and made parisc_show_stack() static.
>>
>> An initial patch for this was written by Kyle McMartin back in August:
>> http://marc.info/?l=linux-parisc&m=121805168830283&w=2
>>
>> Compile and run-tested with a 64bit parisc kernel.
> 
> Why has a fix for such a severe bug been floating around unmerged for
> such a long time?

I've tried to push it upstream a few times...

>> Patches for -stable series will follow shortly.
> 
> That shouldn't be needed - I'll cc stable on my copy and the stable
> maintainers should see that and pick it up.  The patch applies cleanly
> all the way back to 2.6.25.

Although it may apply to the older stable kernels, I'm currently not 
sure if this will work then.
We added the fixes for PA for the '%pS' vsprintf format pretty late. 
This is probably then a patch which needs backporting to stable as well 
(if it didn't happened yet):
	commit deac93df26b20cf8438339b5935b5f5643bc30c9
	Author: James Bottomley <James.Bottomley@HansenPartnership.com>
	Date:   Wed Sep 3 20:43:36 2008 -0500
	lib: Correct printk %pF to work on all architectures

Alternatively, I could write a little more simple patch, which is what I 
  intended initially.

Thanks a lot Andrew!
Helge
