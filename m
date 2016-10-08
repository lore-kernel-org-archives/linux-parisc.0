From: Helge Deller <deller@gmx.de>
Subject: Re: parisc crash on boot with 4.8+git
Date: Sat, 8 Oct 2016 23:07:28 +0200
Message-ID: <57F96010.1040309@gmx.de>
References: <alpine.LRH.2.20.1610090042580.12761@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
To: Meelis Roos <mroos@linux.ee>,
        Linux Kernel list <linux-kernel@vger.kernel.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.20.1610090042580.12761@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Meelis,

On 08.10.2016 23:52, Meelis Roos wrote:
> Just tried 4.8.0-11288-gb66484c on three of my parsic machines (enabled 
> strict usercopy checking or somethinng like that in make oldconfig).

It's not related to the usercopy checks, instead it's most likely a
parisc-specific problem I just noticed today as well and which I'm 
currently fixing.
 
> rp3440 worked fine. a500 and rp3410 cras on boot.
> 
> rp3410 crashed on boot with the following:
> 
> Linux version 4.8.0-11288-gb66484c (mroos@rp3410) (gcc version 5.4.0 (Gentoo 5.4.0 p1.0) ) #81 Sat Oct 8 20:40:24 EEST 2016
> unwind_init: start = 0x4076e980, end = 0x407a7060, entries = 14446
> The 64-bit Kernel has started...
> Kernel default page size is 4 KB. Huge pages enabled with 1 MB physical and 2 MB virtual size.
> bootconsole [ttyB0] enabled
> ...
> Memory Ranges:
>  0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 MB
>  1) Start 0x0000004040000000 End 0x000000407fdfffff Size   1022 MB
> Total Memory: 2046 MB
> Backtrace:
>  [<0000000040102d40>] paging_init+0x5e0/0x740
>  [<0000000040103744>] setup_arch+0x16c/0x1b0
>  [<0000000040100ce0>] start_kernel+0xb8/0x668
> 
> Bad Address (null pointer deref?): Code=15 regs=00000000408034c0 (Addr=000000099cf94000)

You probably are facing one or both of those problems:
1. Your kernel is bigger than the initial kernel mappings
2. You face a bug in the palo boot loader.

Regarding 1, you probably have CONFIG_TRACE=y or CONFIG_TEST_RHASHTABLE=y enabled?
Both increase the kernel size a lot and trigger this bug. 
To fix it, make sure you have this patch in your kernel (it's upstream):
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=690d097c00c88fa9d93d198591e184164b1d8c20

Additionally if people (not you) use a 32bit kernel I suggest this one too (in my for-next tree):
http://git.kernel.org/cgit/linux/kernel/git/deller/parisc-linux.git/commit/?h=for-next&id=96c65e4d1c77f461b34161dc8e6f2db7c50fd3e8

Both patches increase the initial kernel page mappings to 32MB which should be sufficient.

Even if you fix the kernel with the patches above, you still may run
into the palo bug. I've just pushed a fix for it into the palo tree:
https://git.kernel.org/cgit/linux/kernel/git/deller/palo.git/commit/?id=70bd7a9a41e318c0575755a78c4d18ad97495c47

If you rebuild palo, please make sure to install the new ipl boot loader into
the palo partition of your boot disc. palo should report at bootup version 1.96.

Helge
