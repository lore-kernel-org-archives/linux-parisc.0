From: Meelis Roos <mroos@linux.ee>
Subject: WARNING: workqueue cpumask: online intersect > possible intersect
Date: Thu, 17 Aug 2017 14:40:51 +0300 (EEST)
Message-ID: <alpine.LRH.2.20.1708171438520.29402@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I get the following warning in dmegs on my RP3440 with 4.13-rc5+git:
WARNING: workqueue cpumask: online intersect > possible intersect

It's a RP3440 with 4 CPU cores and CONFIG_NR_CPUS=4.

Is it something I have misconfigured, or something harmless, or 
something worth for the developers of this code?

-- 
Meelis Roos (mroos@linux.ee)
