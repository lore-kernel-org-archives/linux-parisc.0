From: Helge Deller <deller@gmx.de>
Subject: Re: parisc crash on boot with 4.8+git
Date: Mon, 10 Oct 2016 16:47:13 +0200
Message-ID: <57FBA9F1.6000009@gmx.de>
References: <alpine.LRH.2.20.1610090042580.12761@math.ut.ee>
 <57F96010.1040309@gmx.de> <alpine.LRH.2.20.1610091032210.12761@math.ut.ee>
 <57FA089F.1020301@gmx.de> <alpine.LRH.2.20.1610092356270.32571@math.ut.ee>
 <57FAA079.5010502@gmx.de> <alpine.LRH.2.20.1610100857110.32571@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: Linux Kernel list <linux-kernel@vger.kernel.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
To: Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.20.1610100857110.32571@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 10.10.2016 08:04, Meelis Roos wrote:
>>>>>> Even if you fix the kernel with the patches above, you still may run
>>>>>> into the palo bug. I've just pushed a fix for it into the palo tree:
>>>>>> https://git.kernel.org/cgit/linux/kernel/git/deller/palo.git/commit/?id=70bd7a9a41e318c0575755a78c4d18ad97495c47
>>>>>>
>>>>>> If you rebuild palo, please make sure to install the new ipl boot loader into
>>>>>> the palo partition of your boot disc. palo should report at bootup version 1.96.
>>>>
>>>> Same here. Please pull latest version, and install it:
>>>> https://git.kernel.org/cgit/linux/kernel/git/deller/palo.git/
>>>
>>> palo ipl 1.96 http://www.parisc-linux.org - Sun, 08 Oct 2016 22:40:31 +0100
>>>
>>> Just palo with newst upstream kernel git did not change anything, so 
>>> it's not palo.
>>>
>>>
>>> Pulled 
>>> git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git 
>>> but it seems to be alreay up to date - these commits are in my tested 
>>> upstream that broke the booting?
>>
>> Really? I just updated it a few hours ago. Please pull the "for-next" branch.
>>
>> Can you send the last line of your "System.map" file, e.g.
>> 0000000041f00000 B _end
>>
>> What is the output of palo when booting ?
> 
> Sorry, I pulled from the default branch before, now for-next and it did 
> pull stuff.
> 
> System.map ends with
> 
> 0000000040900000 B _end
> 
> 
> 
> HARD Booted.
> palo ipl 1.96 http://www.parisc-linux.org - Sun, 08 Oct 2016 22:40:31 +0100
> 
> Partition Start(MB) End(MB) Id Type
> 1               1      32   f0 Palo
> 2              33     224   83 ext2
> 3             225   31696   83 ext2
> 4           31697   34715   82 swap
> 
> PALO(F0) partition contains:
> 
> Command line for kernel: 'root=/dev/sdb3 console=ttyS1 
> palo_kernel=2/vmlinux'
> Selected kernel: /vmlinux from partition 2
> ELF64 executable
> Entry 00100000 first 00100000 n 5
> Segment 0 load 00100000 size 135536 mediaptr 0x1000
> Segment 1 load 00122000 size 23320 mediaptr 0x23000
> Segment 2 load 00200000 size 4541488 mediaptr 0x29000
> Segment 3 load 00655000 size 1393916 mediaptr 0x47e000
> Segment 4 load 00800000 size 1045640 mediaptr 0x5d3000
> Branching to kernel entry point 0x00100000.  If this is the last
> message you see, you may need to switch your console.  This is
> a common symptom -- search the FAQ and mailing list at parisc-linux.org
> 
> Linux version 4.8.0-11292-gf79b076 (mroos@rp3410) (gcc version 5.4.0 (Gentoo 5.4.0 p1.0) ) #82 Mon Oct 10 01:25:58 EEST 2016
> unwind_init: start = 0x40770e1c, end = 0x407a94fc, entries = 14446
> FP[0] enabled: Rev 1 Model 20
> The 64-bit Kernel has started...
> Kernel default page size is 4 KB. Huge pages enabled with 1 MB physical and 2 MB virtual size.
> bootconsole [ttyB0] enabled
> Initialized PDC Console for debugging.
> Determining PDC firmware type: 64 bit PAT.
> model 00008860 00000491 00000000 00000002 3e45475d0860fe3d 100000f0 00000008 000000b2 000000b2
> vers  00000302
> CPUID vers 20 rev 5 (0x00000285)
> capabilities 0x35
> model 9000/800/rp3410  
> parisc_cache_init: Only equivalent aliasing supported!
> Memory Ranges:
>  0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 MB
>  1) Start 0x0000004040000000 End 0x000000407fdfffff Size   1022 MB
> Total Memory: 2046 MB

2046 MB ???
That's strange, it should be 2048 MB.

Can you check in your firmware "service" or "Configuration" menu, if it 
reports some entries in your PDT (Page Deallocation Table) ?
What happens if you clean the PDT entries (see firmware menu) and boot again?

Helge
