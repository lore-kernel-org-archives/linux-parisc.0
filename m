From: Meelis Roos <mroos@linux.ee>
Subject: Re: parisc 4.16-rc1 error: ERROR: "$$remU" [drivers/net/tun.ko]
 undefined!
Date: Wed, 14 Feb 2018 16:20:02 +0200 (EET)
Message-ID: <alpine.LRH.2.21.1802141618460.25362@math.ut.ee>
References: <alpine.LRH.2.21.1802131552240.9153@math.ut.ee> <5abecbed-e50f-e41c-1fd1-a7bcc4768f2a@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5abecbed-e50f-e41c-1fd1-a7bcc4768f2a@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Since the error was strange, I ran "make clean" and make and the error 
was gone. So something in the build system might have missed a 
recompilation need (maybe) but my problem is gone. The new kernel is 
running fine.

-- 
Meelis Roos (mroos@linux.ee)
