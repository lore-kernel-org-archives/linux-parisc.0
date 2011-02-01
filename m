From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: 2.6.38-rc3 regression on parisc: segfaults
Date: Tue, 01 Feb 2011 16:12:40 -0600
Message-ID: <1296598360.18277.11.camel@mulgrave.site>
References: <alpine.SOC.1.00.1102012342200.25944@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-parisc@vger.kernel.org,
	Linux Kernel list <linux-kernel@vger.kernel.org>
To: Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.SOC.1.00.1102012342200.25944@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 2011-02-02 at 00:00 +0200, Meelis Roos wrote:
> I have been testing devel kernels on SMP L1000 successfully until 
> 2.6.38-rc2-00324-g70d1f36 included. The testing means booting the new 
> kernel and running aptitude to update to current debian unstable.
> 
> Now I tried 2.6.38-rc3 and got a crash from aptitude on 2 out of 2 
> tries. Maybe aptitude was broken inbetween but it looks like a kernel 
> bug. Retried 2.6.38-rc2-00324-g70d1f36 and that seemed to work fine so 
> it's more likely a kernel problem.
> 
> What additional information can I provide?

Probably a bisection, if you could.  There have been no parisc patches
between -rc2 and -rc3, so it's coming from outside the architecture.

Thanks,

James


