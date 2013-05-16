From: Meelis Roos <mroos@linux.ee>
Subject: Re: parisc boot crash on 3.10-rc1+git
Date: Thu, 16 May 2013 09:35:00 +0300 (EEST)
Message-ID: <alpine.SOC.1.00.1305160931430.23959@math.ut.ee>
References: <alpine.SOC.1.00.1305141432120.9094@math.ut.ee> <alpine.SOC.1.00.1305150957460.29631@math.ut.ee> <5193D0F5.4060706@gmx.de> <1536577.0f4jSevITp@eto>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1536577.0f4jSevITp@eto>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > Ok, the good thing is, that I got today a rp5470 with which I could
> > reproduce your problems.
> > 
> > The bad thing is:
> > Beside CONFIG_PREEMPT, CONFIG_DISCONTIGMEM is broken too.
> 
> My C8000 runs 3.7.3 happily, so it must have happened after that.

My RP3440 runs 3.9.0 fine, with mostly the same config as I sent (modulo 
the new questions).

Debian was becoming too hard so I switched to Gentoo on parisc and so 
far it has been fine. But to bootstrap Gentoo, I had to use old Debian 
so no ext4, just ext3.

-- 
Meelis Roos (mroos@linux.ee)
