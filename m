From: Meelis Roos <mroos@linux.ee>
Subject: BUG: workqueue lockup (after powerdown)
Date: Mon, 3 Jul 2017 10:34:46 +0300 (EEST)
Message-ID: <alpine.LRH.2.20.1707031031180.28253@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-parisc@vger.kernel.org,
        Linux Kernel list <linux-kernel@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Today I tested 4.12 release on my RP3440 (HP parisc). It worked fine, 
then on shutdown I got this strange message from kernel after shutdown:

reboot: Power down
System shut down completed.
Please power this system off now.
BUG: workqueue lockup - pool cpus=0 node=0 flags=0x0 nice=0 stuck for 40s!

and this continues with longer and longer times.

Is it something hppa specific or general?

-- 
Meelis Roos (mroos@linux.ee)
