From: Meelis Roos <mroos@linux.ee>
Subject: Re: RCU detected CPU 0 stall & timer_interrupt(CPU 0): delayed!
Date: Fri, 9 Jan 2009 19:12:58 +0200 (EET)
Message-ID: <Pine.SOC.4.64.0901091910330.14526@math.ut.ee>
References: <Pine.SOC.4.64.0901091632240.14526@math.ut.ee>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <Pine.SOC.4.64.0901091632240.14526@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> I tried stock 2.6.28 on a parisc64 machine (L1000). 2.6.27 worked fine 
> (except 2 bootup warnings that are known here as I was told). I turned 
> on some debugging options for the current kernel, among them RCU stall 
> detection, and it triggered quite some. In spite of the warnings, the 
> computer seems to work fine. But I'm writing here because this might 
> interest somebody.

Turned off RCU stall detection and now the messages are gon as expected, 
everything works fine. This is the same as 2.6.27 without the RCU stall 
check.

-- 
Meelis Roos (mroos@linux.ee)
