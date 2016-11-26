From: Helge Deller <deller@gmx.de>
Subject: Re: parsic: strange boot crash on a500
Date: Sat, 26 Nov 2016 10:12:15 +0100
Message-ID: <e8a4822d-bd78-7d5a-9c4b-b515b6fa8eb1@gmx.de>
References: <alpine.LRH.2.20.1611260142170.9292@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
To: Meelis Roos <mroos@linux.ee>, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.20.1611260142170.9292@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Meelis,

I think I know what's going on...

On 26.11.2016 01:13, Meelis Roos wrote:
> I have succeeded in keepin my rp3410 and rp3440 up to date but I have 
> trouble on A500 after 4.8.
> 
> Tried two kernels, something around 4.9-rc2 and

In the rc1-rc3 kernel series I switched in kernel from bootmem 
to memblock allocator. There was some bug in there which led to
a crash. It was fixed later on.
So, rc2 is probably bad, but this is not the main reason why
your machine dies at the stage you report here...
 
> 4.9.0-rc5-00297-g20afa6e, they both crash on boot like that.

rc5 should be more OK, but just last night we fixed some more problems:
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=3ad0e83cf86bcaeb6ca3c37060a3ce866b25fb42
So, if you try, please update to latest git head now.

> Hardware seems fine, I can boot kernels up to 4.8 without problems.
> ...
> HARD Booted.
> palo ipl 1.95 portage@a500 Thu Jul  7 15:40:10 EEST 2016
> 
> Partition Start(MB) End(MB) Id Type
> 1               1      32   f0 Palo
> 2              33     224   83 ext2
> 3             225   31696   83 ext2
> 4           31697   34732   83 ext2
> 
> PALO(F0) partition contains:

You sadly didn't included the PALO segment list here.
I think this is your main problem.
Probably you have quite some modules built-in, and your
kernel got bigger than before and as such it triggers
an old bug in the palo boot loader.

Please read this palo commit message which explains it:
https://git.kernel.org/cgit/linux/kernel/git/deller/palo.git/commit/?id=70bd7a9a41e318c0575755a78c4d18ad97495c47

I think those steps should fix your problem:
1. Boot into a functional kernel (e.g. v4.8)
2. Update your palo boot loader: 
   https://git.kernel.org/cgit/linux/kernel/git/deller/palo.git/
   You should build palo 1.96, and then *install* it into
   your palo boot partition:  run "palo -v" once.
3. Pull and build Linus' latest git tree to get latest parisc fixes
4. boot again, palo should report version 1.96 and it should start your new kernel.

Helge
