From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: Hacking SuperDome
Date: Wed, 11 Feb 2009 00:23:12 -0700
Message-ID: <20090211072312.GA19531@colo.lackof.org>
References: <20090207142906.GA8553@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090207142906.GA8553@alpha.franken.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Feb 07, 2009 at 03:29:06PM +0100, Thomas Bogendoerfer wrote:
> Hi,
> 
> thanks to Madze, I've now access to a HP Superdome;-)

Wow...that's so cool...I didn't this would happen. :)

> The bigger partition produces following boot log:
...

> The smaller partion hangs even earlier:
> 
> HARD Booted.
> palo ipl 1.14 root@duet Sat Apr  8 16:08:16 EDT 2006
> 
> Boot image contains:
>     0/vmlinux64 6484269 bytes @ 0xa000
...
> SBA found REO rev 2 at 0xfffffff888000000
> Elroy version TR4.0 (0x5) found at 0xfffffff884000000
> 
> 
> First guess would be some PCI setup issues... Any hints ?

Look for HPMC's. The console can't keep up with the kernel in general.
When an HPMC occurs, some of the output can get stranded.

I would add "initcall_debug=1" to boot parameters. See kernel/main.c.
Possible add a mdelay(100) after each initcall.

Since Tulip configured properly, I'm going to assume PCI resources
were properly assigned and all PCI Busses enumerated. PCI support
shouldn't be any different than for other PAT PDC machines.

hth,
grant
