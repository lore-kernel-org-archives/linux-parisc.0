From: Meelis Roos <mroos@linux.ee>
Subject: Re: 2.6.38-rc3 regression on parisc: segfaults
Date: Thu, 3 Feb 2011 09:03:20 +0200 (EET)
Message-ID: <alpine.SOC.1.00.1102030902390.26784@math.ut.ee>
References: <20110203022420.A73F54E7B@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110203022420.A73F54E7B@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> If aptitude fails consistently, it should be possible to debug or
> isolate to a particular kernel change.  Usually, SMP segvs don't
> provide much information as to the cause of the problem.  strace
> output and a gdb backtrace would be useful.

It's not failing consitently - it's in different places. I'm bisecting 
now.

-- 
Meelis Roos (mroos@linux.ee)
