From: Meelis Roos <mroos@linux.ee>
Subject: 4.0 parisc regression: memory leak?
Date: Sat, 25 Apr 2015 22:19:12 +0300 (EEST)
Message-ID: <alpine.LRH.2.11.1504242317450.14818@math.ut.ee>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
To: linux-parisc@vger.kernel.org,
	Linux Kernel list <linux-kernel@vger.kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I noticed that with 4.0 I'm running out of memory on HP A500 (1G RAM) 
and HP RP3410 (2G RAM) parisc machines during gentoo "revdep-rebuild 
-ip". Each time free shows less free memory until OOM killer visits us 
(and first revdep-rebuild after nontrivial emerge compilation loop kills 
the smaller box).

3.19 did not seem to have this problem.

Nothing in the dmesg besides OOM killer activating.

I reran it, leaving cat /prov/vmstat, cat /proc/meminfo and slabtop -o 
running in loop (each 5 s). revdep-rebuild -ip was also running in 
the loop, just checking the binaries and library linking info.

The results are at

http://kodu.ut.ee/~mroos/slabtop-log
http://kodu.ut.ee/~mroos/meminfo-log
http://kodu.ut.ee/~mroos/vmstat-log

Anything else I can provide to pinpoint it?

-- 
Meelis Roos (mroos@linux.ee)
