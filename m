From: Borislav Petkov <petkovbb@googlemail.com>
Subject: Re: [PATCH] ide-cd: fix kernel crash on hppa regression
Date: Fri, 17 Apr 2009 08:53:44 +0200
Message-ID: <20090417065344.GC6806@liondog.tnic>
References: <49E6638B.8090700@gmx.de> <20090416063735.GA21742@liondog.tnic> <49E7945E.7030508@gmx.de>
Reply-To: petkovbb@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: Linus <torvalds@linux-foundation.org>,
	Borislav Petkov <petkovbb@googlemail.com>,
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	"Rafael J. Wysocki" <rjw@sisk.pl>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <49E7945E.7030508@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

On Thu, Apr 16, 2009 at 10:26:06PM +0200, Helge Deller wrote:

[..]

> I tried to build a kernel with CONFIG_DEBUG_INFO.
> There are two problem with that, because I'm cross-compiling:
> a) I don't have a cross-gdb (but I could use addr2line instead though)
> b) the resulting kernel is becoming too big and won't link/boot:
> ...
>   SYSMAP  System.map
>   SYSMAP  .tmp_System.map
> /sbin/palo -f /mnt/sda4/home/cvs/parisc/git-kernel/linus-linux-2.6-32bit/palo.conf
> palo version 1.14 deller@p100 Fri Jul 28 22:55:11 CEST 2006
> ELF32 executable
> ipl: addr 2048 size 36864 entry 0x0
>  ko 0x0 ksz 0 k64o 0x0 k64sz 0 rdo 0 rdsz 0
> <>
> Your 32-bit-kernel is too big for your F0 partition
> make[3]: *** [palo] Error 2
> 
> I could now just try to look into the assembly by hand and try
> to find which line produces the problem. But reading hppa assembly code
> for such a big function is not very easy though.

Thanks a lot for trying, I appreciate it. However, I think I have an easier idea
I could try here first and maybe we won't need the hppa assembly exercise :).

> BTW, even with my patch ATAPI CDROM accesses don't work with the current kernel...

What do you mean by that, please elaborate?

-- 
Regards/Gruss,
    Boris.
