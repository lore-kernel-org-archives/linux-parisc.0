From: Helge Deller <deller@gmx.de>
Subject: Re: kernel 4.6-rc unbootable due to module changes
Date: Wed, 6 Apr 2016 23:44:18 +0200
Message-ID: <57058332.8050204@gmx.de>
References: <alpine.LRH.2.02.1604051326470.14606@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.1604051332280.25453@file01.intranet.prod.int.rdu2.redhat.com>
 <570409DA.1060508@gmx.de>
 <alpine.LRH.2.02.1604051612310.32758@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.1604061014490.30369@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: linux-parisc@vger.kernel.org
To: Mikulas Patocka <mpatocka@redhat.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.02.1604061014490.30369@file01.intranet.prod.int.rdu2.redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 06.04.2016 16:30, Mikulas Patocka wrote:
>>>>> The patch "parisc: Use generic extable search and sort routines" makes the 
>>>>> kernel unable to load any modules. It fails with:
>>>>>
>>>>> module unix: Unknown relocation: 9
>>>>> modprobe: FATAL: Error inserting unix (/lib/modules/4.6.0-rc2/kernel/net/unix/unix.ko): Invalid module format
>>>>>
>>>>> When I revert the patch, the kernel 4.6-rc2 boots fine.
>>>>>
>>>>> Apparently, the function apply_relocate_add in arch/parisc/kernel/module.c 
>>>>> doesn't handle the new relocation type.
>>>>>
>>>>> Mikulas
>>>>
>>>> BTW. I'm using hppa64 binutils 2.21 to build the kernel. It generates the 
>>>> R_PARISC_PCREL32 relocation that the kernel module loader doesn't handle:
>>>
>>> Can you try attached patch (untested) ?
>>>
>>> Helge
>>
>> I tried a similar patch, the system booted fine ... but then I discovered 
>> that the system boots fine no matter what value is written to *loc.
>>
>> Apparently, none of the modules trigger any exceptions in my 
>> configuration.
>>
>> I'll have to create a test module that triggers some exception.
>>
>> Mikulas
> 
> Hmm - it's even more strange.
> 
> I created a test kernel module that triggers an exception by using 
> get_user with an invalid address (see the attached file exception.tar)

I see there is a kernel module <sourcetree>/lib/test_user_copy.c as well.
It seems to crash too.
 
> On x86-64 the module loads fine, but on pa-risc it always crashes, even 
> with older kernel version (I tried versions 2.6.39, 4.5 and 4.6-rc2 and I 
> always get a crash).

I don't fully trust the 4.5 kernel yet.
I was working the last few days on trying to fix the FTRACE functions, but
am seeing strange crashes too.
Any chance that you can try 4.4-stable, just to make sure ?

> When I write a userspace code that triggers a fault in module unix.ko, by 
> passing an invalid address to the ioctl syscall, the kernel also crashes.
> 
> So, it seems that handling exceptions from modules never worked on 
> pa-risc, it was just masked by the fact that exceptions from modules don't 
> happen during normal use.

I'll try to dig deeper as soon as I find time.

Helge
