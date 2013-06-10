From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: Re: [PATCH] parisc: fix serial ports on C8000 workstation
Date: Mon, 10 Jun 2013 12:43:36 +0200
Message-ID: <ed2cc2a42ebd03a470c471a2f8a71a25@sf-mail.de>
References: <20130609210021.GA1009@p100.box>
 <3684361.ciEK0E58Qm@donald.sf-tec.de>
 <trinity-3fb7467d-4d50-4362-8003-6bdc2d184770-1370852828916@3capp-gmx-bs02>
 <20130610100026.GA23862@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Cc: Helge Deller <deller@gmx.de>, <linux-parisc@vger.kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130610100026.GA23862@alpha.franken.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Am 10.06.2013 12:00, schrieb Thomas Bogendoerfer:
> On Mon, Jun 10, 2013 at 10:27:09AM +0200, Helge Deller wrote:
>> Maybe you want to clean up the other parts, e.g. impmi or pci_mmap?
> 
> ipmi is already cleaned up, but I didn't get any response from the
> maintainer.
> 
> http://www.spinics.net/lists/linux-parisc/msg03191.html

parisc_registered should be a bool, and you don't reset it on 
unregister_parisc_driver. If this can be compiled as module you get bad 
effects (i.e. OOPS, crash ) on repeated modprobe/rmmod.

> info->irq               = 0; /* no interrup */

There is a 't' missing at the end.

I would say resend the patch, it probably got lost.

Eike
