From: John David Anglin <dave.anglin@bell.net>
Subject: Re: PA8800 with 3.9.0-rc1-JeR-10942-g6dbe51c : WARNING: at lib/timerqueue.c:74
Date: Wed, 20 Mar 2013 22:02:55 -0400
Message-ID: <BLU0-SMTP790A969254E562667034B397EB0@phx.gbl>
References: <20130315152226.46ad0993@marga.jer-c2.orkz.net> <BLU0-SMTP3801FFE58A0BCC9C8836A597EE0@phx.gbl> <20130318135831.7c14b6e7@marga.jer-c2.orkz.net> <5148E903.1020105@gmx.de> <20130320182756.7b0e4f5d@marga.jer-c2.orkz.net> <514A183A.7090809@bell.net>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-5--1022881206"
Cc: Jeroen Roovers <jer@gentoo.org>, linux-parisc@vger.kernel.org,
	Helge Deller <deller@gmx.de>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <514A183A.7090809@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-5--1022881206
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

On 20-Mar-13, at 4:12 PM, John David Anglin wrote:

> On 3/20/2013 1:27 PM, Jeroen Roovers wrote:
>> +CONFIG_PREEMPT_NONE=y
> Given that CONFIG_PREEMPT is broken, we must be missing at least one
> preempt_disable()/preempt_enable() pair.


You might try the attached change.  My rp3440 booted with  
CONFIG_PREEMPT=y
and CONFIG_PREEMPT_NONE=y with it.  The fix is just a guess.

Dave
--
John David Anglin	dave.anglin@bell.net



--Apple-Mail-5--1022881206
Content-Disposition: attachment; filename="linux-3.9-rc3-20130320.d.txt"
Content-Type: text/plain; x-unix-mode=0644;
	name="linux-3.9-rc3-20130320.d.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 4b12890..1871724 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -372,10 +372,12 @@ void flush_kernel_dcache_page_addr(void *addr)
 {
 	unsigned long flags;
 
+	preempt_disable();
 	flush_kernel_dcache_page_asm(addr);
 	purge_tlb_start(flags);
 	pdtlb_kernel(addr);
 	purge_tlb_end(flags);
+	preempt_enable();
 }
 EXPORT_SYMBOL(flush_kernel_dcache_page_addr);
 

--Apple-Mail-5--1022881206--
