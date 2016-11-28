From: "Helge Deller" <deller@gmx.de>
Subject: Aw: Re: parsic: strange boot crash on a500
Date: Mon, 28 Nov 2016 16:36:37 +0100
Message-ID: <trinity-e31b21fb-9eb0-43ac-9d20-c8882740e7d6-1480347397040@3capp-gmx-bs03>
References: <alpine.LRH.2.20.1611260142170.9292@math.ut.ee>
 <e8a4822d-bd78-7d5a-9c4b-b515b6fa8eb1@gmx.de>
 <alpine.LRH.2.20.1611272329430.19497@math.ut.ee>
 <3aa51712-b586-aefc-8e1f-b81b97c0729a@gmx.de>,
 <alpine.LRH.2.20.1611280013540.19497@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc@vger.kernel.org
To: "Meelis Roos" <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.20.1611280013540.19497@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > > Partition Start(MB) End(MB) Id Type
> > > 1               1      32   f0 Palo
> > > 2              33     224   83 ext2
> > > 3             225   31696   83 ext2
> > > 4           31697   34732   83 ext2
> > > 
> > > PALO(F0) partition contains:
> > > 
> > > Command line for kernel: 'root=/dev/sda3 console=ttyS0 
> > > palo_kernel=2/vmlinux'
> > > Selected kernel: /vmlinux from partition 2
> > 
> > I'm missing here the information of the various sections
> > in the vmlinux file which the boot loader usually prints
> > here.
> 
> Well, I did not leave anything out AFAIK?

It seems palo can't read the vmlinux file (aka get's confused with the contents
and doesn't print the ELF section list).

Did you maybe used a recent binutils package?
See:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=845690
https://sourceware.org/ml/binutils/2016-11/msg00348.html

Maybe downgrading binutils helps?

Helge
