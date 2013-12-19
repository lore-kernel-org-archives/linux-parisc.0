From: Helge Deller <deller@gmx.de>
Subject: Re: parisc: fix mmap(MAP_FIXED|MAP_SHARED) to already mmapped address
Date: Thu, 19 Dec 2013 21:28:41 +0100
Message-ID: <52B356F9.9050008@gmx.de>
References: <20131219191750.GC2881@blackmetal.musicnaut.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: 'Mike Frysinger' <vapier@gentoo.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20131219191750.GC2881@blackmetal.musicnaut.iki.fi>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello Aaro,

On 12/19/2013 08:17 PM, Aaro Koskinen wrote:
> This commit (0576da2c08e3d332f1b0653030d28ab804585ab6) and the current
> mainline kernel (3.13-rc4) gives me the following with GLIBC 2.18:
> 
> $ localedef -c -i en_US -f UTF-8 en_US.UTF-8
> cannot map archive header: Invalid argument
> 
> strace looks like this:
> 
> mmap2(NULL, 536870912, PROT_NONE, MAP_SHARED, 3, 0) = 0x42f34000
> mmap2(0x43000000, 1607632, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_FIXED, 3, 0) = -1 EINVAL (Invalid argument)
> 
> With the patch reverted, it works:
> 
> mmap2(NULL, 536870912, PROT_NONE, MAP_SHARED, 3, 0) = 0x42d74000
> mmap2(0x43000000, 1607632, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_FIXED, 3, 0) = 0x43000000

It maybe doesn't fail now, but it's not correctly mapped either.
So, even if you don't get the EINVAL error, it might not work properly.
The patch I send just corrected this wrong behaviour.

> BTW, note that for GLIBC 2.18 some changes were done regarding this:
> https://sourceware.org/bugzilla/show_bug.cgi?id=10283

Mike Frysinger already mentioned something like that some time ago:
http://www.spinics.net/lists/linux-parisc/msg05204.html

I think we need to take a look at the glibc again...

Helge
