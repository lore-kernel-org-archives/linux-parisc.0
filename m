From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: Re: [PATCH] parisc: fix serial ports on C8000 workstation
Date: Mon, 10 Jun 2013 12:00:26 +0200
Message-ID: <20130610100026.GA23862@alpha.franken.de>
References: <20130609210021.GA1009@p100.box>
 <3684361.ciEK0E58Qm@donald.sf-tec.de>
 <trinity-3fb7467d-4d50-4362-8003-6bdc2d184770-1370852828916@3capp-gmx-bs02>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <trinity-3fb7467d-4d50-4362-8003-6bdc2d184770-1370852828916@3capp-gmx-bs02>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Jun 10, 2013 at 10:27:09AM +0200, Helge Deller wrote:
> Maybe you want to clean up the other parts, e.g. impmi or pci_mmap?

ipmi is already cleaned up, but I didn't get any response from the
maintainer.

http://www.spinics.net/lists/linux-parisc/msg03191.html

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
