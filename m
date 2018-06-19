From: Meelis Roos <mroos@linux.ee>
Subject: bpfilter compile failure on parisc
Date: Tue, 19 Jun 2018 20:38:19 +0300 (EEST)
Message-ID: <alpine.LRH.2.21.1806192036240.10716@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: netdev@vger.kernel.org, linux-parisc@vger.kernel.org
Return-path: <netdev-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>

Tried enabling bpfilter on parisc, got this:

  HOSTCC  net/bpfilter/main.o
net/bpfilter/main.c:3:21: fatal error: sys/uio.h: No such file or directory
 #include <sys/uio.h>
                     ^
compilation terminated.

-- 
Meelis Roos (mroos@linux.ee)
