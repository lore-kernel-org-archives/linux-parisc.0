From: Meelis Roos <mroos@linux.ee>
Subject: fs/select.c:991:1: warning: the frame size of 1032 bytes is larger
 than 1024 bytes
Date: Mon, 11 Sep 2017 17:22:02 +0300 (EEST)
Message-ID: <alpine.LRH.2.21.1709111719310.23935@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-parisc@vger.kernel.org,
        Linux Kernel list <linux-kernel@vger.kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

While looking for build logs for another problem, I noticed two warnings 
while compiling for 64-bit parisc.

This is the second of them and I think I have seen it earlier too, but 
the value was 1064 back then:

  CC      fs/select.o
fs/select.c: In function 'do_sys_poll':
fs/select.c:991:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]


-- 
Meelis Roos (mroos@linux.ee)
