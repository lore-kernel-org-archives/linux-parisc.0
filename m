From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: RCU detected CPU 0 stall & timer_interrupt(CPU 0): delayed!
Date: Sat, 10 Jan 2009 13:24:02 -0700
Message-ID: <20090110202402.GB14664@colo.lackof.org>
References: <Pine.SOC.4.64.0901091632240.14526@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <Pine.SOC.4.64.0901091632240.14526@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jan 09, 2009 at 04:58:41PM +0200, Meelis Roos wrote:
> Hello,
> 
> 
> I tried stock 2.6.28 on a parisc64 machine (L1000). 2.6.27 worked fine 
> (except 2 bootup warnings that are known here as I was told). I turned 
> on some debugging options for the current kernel, among them RCU stall 
> detection, and it triggered quite some. In spite of the warnings, the 
> computer seems to work fine. But I'm writing here because this might 
> interest somebody.

Thanks!

The "delay!" is a known bug that I've never been able to quite figure out:

> [    0.000000] Linux version 2.6.28 (mroos@hernes) (gcc version 4.3.2 (GCC) ) #1 SMP Wed Jan 7 20:04:12 EET 2009
...
> [42949385.400000] timer_interrupt(CPU 0): delayed! cycles 100001588 rem 8BD88  next/now 5048400084/514840160C
> [42949395.170000] timer_interrupt(CPU 0): delayed! cycles 1000002C8 rem 8AAC8  next/now 51487A7C04/52487A7ECC
> [42949404.940000] timer_interrupt(CPU 0): delayed! cycles 1000002B1 rem 8AAB1  next/now 5248B4F784/5348B4FA35
> [42949404.940000] RCU detected CPU 0 stall (t=4294940494/977 jiffies)
....

It looks like the two are related given it's 4.2B/977 jiffies.
But it's not consistent (rated limited kernel messages?).

I suspect the problem is we have to program the CR16 timer but
can only write the lower 32-bits. It would be something like
by the time we actually write CR16, we've passed the computed
trigger value.  ISTR we added a "fudge factor" for this case but
maybe it's not sufficient or something else is interferring.
I'm wondering if the code should read CR16 back , figure out
what the "current" difference is and double check that we didn't
miss the window.

thanks,
grant
