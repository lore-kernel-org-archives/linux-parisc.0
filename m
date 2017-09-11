From: Meelis Roos <mroos@linux.ee>
Subject: kernel/inventory.c:359:1: warning: the frame size of 1120 bytes is
 larger than 1024 bytes
Date: Mon, 11 Sep 2017 17:19:29 +0300 (EEST)
Message-ID: <alpine.LRH.2.21.1709111717300.23935@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

While looking for build lgos for my linke problem, I noticed two other 
warning on parisc-specific code. This is first of them:

  CC      arch/parisc/kernel/hardware.o
  CC      arch/parisc/kernel/inventory.o
arch/parisc/kernel/inventory.c: In function 'pat_memconfig':
arch/parisc/kernel/inventory.c:359:1: warning: the frame size of 1120 bytes is larger than 1024 bytes [-Wframe-larger-than=]


-- 
Meelis Roos (mroos@linux.ee)
