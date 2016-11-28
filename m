From: Meelis Roos <mroos@linux.ee>
Subject: Re: Aw: Re: parsic: strange boot crash on a500
Date: Mon, 28 Nov 2016 19:39:13 +0200 (EET)
Message-ID: <alpine.LRH.2.20.1611281918510.10341@math.ut.ee>
References: <alpine.LRH.2.20.1611260142170.9292@math.ut.ee> <e8a4822d-bd78-7d5a-9c4b-b515b6fa8eb1@gmx.de> <alpine.LRH.2.20.1611272329430.19497@math.ut.ee> <3aa51712-b586-aefc-8e1f-b81b97c0729a@gmx.de>, <alpine.LRH.2.20.1611280013540.19497@math.ut.ee>,
 <trinity-e31b21fb-9eb0-43ac-9d20-c8882740e7d6-1480347397040@3capp-gmx-bs03> <trinity-2cc16b5d-53b2-4332-8a92-566526865345-1480347604360@3capp-gmx-bs71>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <trinity-2cc16b5d-53b2-4332-8a92-566526865345-1480347604360@3capp-gmx-bs71>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > > > > Command line for kernel: 'root=/dev/sda3 console=ttyS0 
> > > > > palo_kernel=2/vmlinux'
> > > > > Selected kernel: /vmlinux from partition 2
> > > > 
> > > > I'm missing here the information of the various sections
> > > > in the vmlinux file which the boot loader usually prints
> > > > here.
> > > 
> > > Well, I did not leave anything out AFAIK?
> > 
> > It seems palo can't read the vmlinux file (aka get's confused with the contents
> > and doesn't print the ELF section list).
> > 
> > Did you maybe used a recent binutils package?
> > See:
> > https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=845690
> > https://sourceware.org/ml/binutils/2016-11/msg00348.html
> > 
> > Maybe downgrading binutils helps?
> 
> Sorry, I just noticed that you are pretty aware of this bug
> (you actually opened the ticket) :-)

Yes, but I did not understand it would affect parisc, since the problem 
_seemed_ to be amd64-specific. But looking at the description, it might 
well be related.

However, I seem to have installed version 2.25.1-r1 that seems to be 
from Oct 3 2015 and thus is not likely to have this change.

There is also sys-devel/binutils-hppa64-2.25.1 that is probably used for 
the 64-bit kernel, but this is emerged Jul 6 2016 and packaged Sep 30 
2015.

In summary it seems my binutils last changed in July 2016, but 
4.8.0 kernel was compile on Oct 5 2016, with the same binutils as I am 
using now.

So, any other ideas?

-- 
Meelis Roos (mroos@linux.ee)
