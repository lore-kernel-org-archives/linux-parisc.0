From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: 2.6.38-rc3 regression on parisc: segfaults
Date: Wed, 2 Feb 2011 21:24:20 -0500 (EST)
Message-ID: <20110203022420.A73F54E7B@hiauly1.hia.nrc.ca>
References: <alpine.SOC.1.00.1102012342200.25944@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: mroos@linux.ee (Meelis Roos)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.SOC.1.00.1102012342200.25944@math.ut.ee> from "Meelis Roos" at Feb 2, 2011 00:00:13 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> I have been testing devel kernels on SMP L1000 successfully until 
> 2.6.38-rc2-00324-g70d1f36 included. The testing means booting the new 
> kernel and running aptitude to update to current debian unstable.
> 
> Now I tried 2.6.38-rc3 and got a crash from aptitude on 2 out of 2 
> tries. Maybe aptitude was broken inbetween but it looks like a kernel 
> bug. Retried 2.6.38-rc2-00324-g70d1f36 and that seemed to work fine so 
> it's more likely a kernel problem.

If aptitude fails consistently, it should be possible to debug or
isolate to a particular kernel change.  Usually, SMP segvs don't
provide much information as to the cause of the problem.  strace
output and a gdb backtrace would be useful.

I have seen improved SMP stability building with GCC 4.5.3 (try a
recent snap).  This fixes an asm/branch problem.  It seems like James'
flush patch hasn't been pulled.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
