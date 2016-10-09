From: Helge Deller <deller@gmx.de>
Subject: Re: parisc crash on boot with 4.8+git
Date: Sun, 9 Oct 2016 11:06:39 +0200
Message-ID: <57FA089F.1020301@gmx.de>
References: <alpine.LRH.2.20.1610090042580.12761@math.ut.ee>
 <57F96010.1040309@gmx.de> <alpine.LRH.2.20.1610091032210.12761@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: Linux Kernel list <linux-kernel@vger.kernel.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
To: Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.20.1610091032210.12761@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 09.10.2016 11:03, Meelis Roos wrote:
>> On 08.10.2016 23:52, Meelis Roos wrote:
>>> rp3410 crashed on boot with the following:
>>>
>>> Linux version 4.8.0-11288-gb66484c (mroos@rp3410) (gcc version 5.4.0 (Gentoo 5.4.0 p1.0) ) #81 Sat Oct 8 20:40:24 EEST 2016
>>> unwind_init: start = 0x4076e980, end = 0x407a7060, entries = 14446
>>> The 64-bit Kernel has started...
>>> Kernel default page size is 4 KB. Huge pages enabled with 1 MB physical and 2 MB virtual size.
>>> bootconsole [ttyB0] enabled
>>> ...
>>> Memory Ranges:
>>>  0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 MB
>>>  1) Start 0x0000004040000000 End 0x000000407fdfffff Size   1022 MB
>>> Total Memory: 2046 MB
>>> Backtrace:
>>>  [<0000000040102d40>] paging_init+0x5e0/0x740
>>>  [<0000000040103744>] setup_arch+0x16c/0x1b0
>>>  [<0000000040100ce0>] start_kernel+0xb8/0x668
>>>
>>> Bad Address (null pointer deref?): Code=15 regs=00000000408034c0 (Addr=000000099cf94000)
>>
>> You probably are facing one or both of those problems:
>> 1. Your kernel is bigger than the initial kernel mappings
>> 2. You face a bug in the palo boot loader.
>>
>> Regarding 1, you probably have CONFIG_TRACE=y or CONFIG_TEST_RHASHTABLE=y enabled?
>> Both increase the kernel size a lot and trigger this bug. 
> 
> # CONFIG_TEST_RHASHTABLE is not set
> 
> There is no CONFIG_TRACE in my .config.
> # CONFIG_FTRACE is not set

I meant CONFIG_FTRACE (which you don't seem to have enabled).

I just pushed two updated patches to my for-next git tree.
Please pull them on top of Linux head and try again (please update palo before).
http://git.kernel.org/cgit/linux/kernel/git/deller/parisc-linux.git/log/?h=for-next

>> Even if you fix the kernel with the patches above, you still may run
>> into the palo bug. I've just pushed a fix for it into the palo tree:
>> https://git.kernel.org/cgit/linux/kernel/git/deller/palo.git/commit/?id=70bd7a9a41e318c0575755a78c4d18ad97495c47
>>
>> If you rebuild palo, please make sure to install the new ipl boot loader into
>> the palo partition of your boot disc. palo should report at bootup version 1.96.

Same here. Please pull latest version, and install it:
https://git.kernel.org/cgit/linux/kernel/git/deller/palo.git/

Helge
