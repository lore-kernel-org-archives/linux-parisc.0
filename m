From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: parisc: fix mmap(MAP_FIXED|MAP_SHARED) to already mmapped address
Date: Thu, 19 Dec 2013 22:53:50 +0200
Message-ID: <20131219205349.GE2881@blackmetal.musicnaut.iki.fi>
References: <20131219191750.GC2881@blackmetal.musicnaut.iki.fi>
 <52B356F9.9050008@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org, 'Mike Frysinger' <vapier@gentoo.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <52B356F9.9050008@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

On Thu, Dec 19, 2013 at 09:28:41PM +0100, Helge Deller wrote:
> On 12/19/2013 08:17 PM, Aaro Koskinen wrote:
> > This commit (0576da2c08e3d332f1b0653030d28ab804585ab6) and the current
> > mainline kernel (3.13-rc4) gives me the following with GLIBC 2.18:
> > 
> > $ localedef -c -i en_US -f UTF-8 en_US.UTF-8
> > cannot map archive header: Invalid argument
> > 
> > strace looks like this:
> > 
> > mmap2(NULL, 536870912, PROT_NONE, MAP_SHARED, 3, 0) = 0x42f34000
> > mmap2(0x43000000, 1607632, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_FIXED, 3, 0) = -1 EINVAL (Invalid argument)
> > 
> > With the patch reverted, it works:
> > 
> > mmap2(NULL, 536870912, PROT_NONE, MAP_SHARED, 3, 0) = 0x42d74000
> > mmap2(0x43000000, 1607632, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_FIXED, 3, 0) = 0x43000000
> 
> It maybe doesn't fail now, but it's not correctly mapped either.
> So, even if you don't get the EINVAL error, it might not work properly.
> The patch I send just corrected this wrong behaviour.

The generated locale-archive seemed to be correct (md5sum matched my other
machines). Anyway, I'll avoid running localedef on parisc for time being.

Thanks for info,

A.
