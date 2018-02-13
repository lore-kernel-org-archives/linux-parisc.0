From: Meelis Roos <mroos@linux.ee>
Subject: parisc 4.16-rc1 error: ERROR: "$$remU" [drivers/net/tun.ko]
 undefined!
Date: Tue, 13 Feb 2018 15:55:12 +0200 (EET)
Message-ID: <alpine.LRH.2.21.1802131552240.9153@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I am compiling todays git on HP A500 (Gentoo) and it fails with this 
error. Strange thing is that it did work on RP3410 and RP3440 - I may 
have different kernel configuration there but Gentoo state is roughly 
the same (maybe days apart but not months).

  MODPOST 9 modules
ERROR: "$$remU" [drivers/net/tun.ko] undefined!
make[1]: *** [scripts/Makefile.modpost:92: __modpost] Error 1


-- 
Meelis Roos (mroos@linux.ee)
