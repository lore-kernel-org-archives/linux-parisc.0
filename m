From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: BUG_ON() cleanup
Date: Tue, 06 Jan 2009 17:09:55 +0100
Message-ID: <49638253.6000807@gmx.de>
References: <4963470D.1030101@gmx.de> <1231255233.7090.5.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1231255233.7090.5.camel@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

James Bottomley wrote:
> On Tue, 2009-01-06 at 12:57 +0100, Helge Deller wrote:
>> - convert a few "if (xx) BUG();" to BUG_ON(xx)
> 
> This is fine
> 
>> - remove a few printk()s, as we get a backtrace with BUG_ON() anyway
> 
> This is less helpful.  Each of the printks explains why the bug
> triggers.  In theory you can work this out from the BUG_ON line number,
> but *only* if your source files match those of the reporter, which isn't
> the case in an annoyingly large number of bug reports ... speaking as
> someone who seems to get to diagnose large numbers of bugs, it makes my
> life harder.

I fully understand your point.

Regarding arch/parisc/kernel/pci-dma.c:
- each of the pa11_dma_map_* functions where I removed the printks only had
  one BUG() anyway. Should be easy to find it in backtraces.
- a few of the pa11_dma_map_* functions have printks, the others don't. I just
  made it consistent.

Regarding arch/parisc/mm/init.c:
- setup_bootmem() is a huge function. I agree that keeping this printk would
  make sense.

So, would you be OK with the patch if I drop the init.c change and keep the
pci-dma.c changes?

Helge
