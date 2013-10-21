From: Helge Deller <deller@gmx.de>
Subject: Re: HP J5600/J6750 64bit SMP CPU#1 stuck problems [was: Does there
 exists any 32bit-only PARISC SMP machines?]
Date: Mon, 21 Oct 2013 22:39:12 +0200
Message-ID: <526590F0.8040504@gmx.de>
References: <521F9848.4010404@gmx.de> <1377830541.2331.5.camel@dabdike> <20130903155643.GA1430@glitch> <trinity-b7a0d82a-16b9-4204-be6e-2873db548248-1378282389073@3capp-gmx-bs28> <20130904140705.GA30223@glitch> <20130904142847.GA2893@glitch> <52658989.5090508@gmx.de> <BLU0-SMTP632514F697DEA3A182EE9897010@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Dave Land <xmechanic@landcomp.net>
To: John David Anglin <dave.anglin@bell.net>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Domenico Andreoli <cavokz@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP632514F697DEA3A182EE9897010@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 10/21/2013 10:37 PM, John David Anglin wrote:
> It also likely will boot 32-bit SMP kernel with both CPUs with more than 3 GB memory.  This provides 3.63 GB
> of usable memory.

Sure, it will.
But the idea is to be able to drop the 32bit SMP kernels for Debian...
And those machines are currently the only reason why we can't drop 32bit SMP. 

Helge

> On 10/21/2013 4:07 PM, Helge Deller wrote:
>> Domenico,
>>
>> On 09/04/2013 04:28 PM, Domenico Andreoli wrote:
>>>>>> J5600 is SMP capable in both 32bit and 64bit mode.
>>>>>> mine doesn't boot 64bit SMP since 2.6.22. I've never been able to trace
>>>>>> it down but can confirm it happens also on more recent kernels.
>>>> I confirm that smp parisc64 v3.11 doesn't bring up both the cpus on my
>>>> system but at least it boots one, something that didn't happen in some
>>>> darker moments since 2.6.22.
>>>>
>>>> similar "SMP: CPU:1 is stuck." happens also with debian v3.10-parisc64-smp kernel.
>>> BTW, this is the most detailed investigation I'm aware of:
>>> https://lkml.org/lkml/2008/4/20/251
>> Dave Anglin had the idea that the 64bit SMP CPU#1 stuck problems might be
>> related to PDC- or I/O-space conflicts with physical memory.
>> On Dave Land's machine (J6750) we could verify that off-list.
>>
>> I assume you have more than 3GB (4GB) RAM in your machine?
>> If yes, then if you phyiscally remove some memory so that you leave a max.
>> of 3GB in, the 64bit SMP kernel will most likely boot up all CPUs.
>>
>> You wrote:
>>> mine doesn't boot 64bit SMP since 2.6.22.
>> Are you *really* sure that it booted 64bit SMP with kernel 2.6.22 ?
>> Or did you maybe upgraded memory after that date?
>> If it sucessfully booted, then we maybe have only some kind of regression.
>>
>> Helge

