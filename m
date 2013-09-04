From: Alex Ivanov <gnidorah@p0n4ik.tk>
Subject: Re: [PATCH] Fix interrupt routing for C8000 serial ports
Date: Wed, 04 Sep 2013 22:51:02 +0400
Message-ID: <165661378320662@web27g.yandex.ru>
References: <20130730000216.94DB91D232@solo.franken.de>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130730000216.94DB91D232@solo.franken.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

30.07.2013, 05:00, "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>:
> We can't use dev->mod_index for selecting the interrupt routing entry,
> because it's not an index into interrupt routing table. It will be even
> wrong on a machine with 2 CPUs (4 cores). But all needed information is
> contained in the PAT entries for the serial ports. mod[0] contains the iosapic
> address and mod_info has some indications for the interrupt input (at least
> it looks like it). This patch implements the searching for the right iosapic
> and uses this interrupt input information.

Thomas,

Thanks for the fix! This indeed fixed serial on my c8000. Now, there is no
need to use PDC_CONSOLE on this machine anymore.
