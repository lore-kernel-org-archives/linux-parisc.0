From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Issue booting v2.6.39 .. v3.4-rc6 on hp712/100
Date: Wed, 16 May 2012 11:09:55 +0100
Message-ID: <1337162995.2985.34.camel@dabdike.int.hansenpartnership.com>
References: <4FA9975C.5060708@bergerie>
	 <41786065.U2qKzXR3uX@donald.sf-tec.de> <4FAA9382.7040802@bell.net>
	 <4FAADE2A.9080803@bergerie> <BLU0-SMTP65CF901B170B044925E85897160@phx.gbl>
	 <4FAEE943.2030203@gmx.de> <BLU0-SMTP93504AF1AF0414C90D1EFB971A0@phx.gbl>
	 <4FB182F8.2040403@gmx.de> <BLU0-SMTP728EA90F4400504B2AF7A4971A0@phx.gbl>
	 <1337069366.3005.10.camel@dabdike.lan>
	 <1337073212.3005.12.camel@dabdike.lan> <4FB29F13.5070801@bell.net>
	 <4FB2A58A.9050706@gmx.de> <4FB2AD78.1020002@bell.net>
	 <4FB2B2A2.2020207@bell.net> <4FB2B5B1.7000604@gmx.de>
	 <4FB2B71B.7090602@bell.net> <4FB2BC5F.3080905@gmx.de>
	 <1337153257.2985.3.camel@dabdike.int.hansenpartnership.com>
	 <1337160451.2985.23.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: John David Anglin <dave.anglin@bell.net>,
	Vincent <vincent.stehle@laposte.net>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1337160451.2985.23.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 2012-05-16 at 10:27 +0100, James Bottomley wrote:
> On Wed, 2012-05-16 at 08:27 +0100, James Bottomley wrote:
> > My current attempts to boot a B180 are failing on RCU:
> > 
> > Initializing cgroup subsys cpuacct
> > Initializing cgroup subsys memory
> > Initializing cgroup subsys devices
> > Initializing cgroup subsys freezer
> > devtmpfs: initialized
> > NET: Registered protocol family 16
> > Backtrace:
> >  [<10180fc4>] rcu_process_callbacks+0x20/0x40
> >  [<101330b0>] __do_softirq+0xd8/0x190
> >  [<101331d0>] run_ksoftirqd+0x68/0x118
> >  [<1014a144>] kthread+0xac/0xb4
> >  [<1010305c>] ret_from_kernel_thread+0x1c/0x24
> > 
> > 
> > Kernel Fault: Code=26 regs=2ec3c2c0 (Addr=00000000)
> 
> OK, debugged this: it's a prefetch(NULL) in the RCU code.  Apparently on
> the PA7300LC processor, which is what my B180 has, this is actually
> generating a dtlb insertion interruption.  The fix is to nullify the
> prefetch if the address is zero, which I'm testing out now.

OK, confirmed, my B180 finally boot.  This is the final patch it needed.

James

---

diff --git a/arch/parisc/include/asm/prefetch.h b/arch/parisc/include/asm/prefetch.h
index c5edc60..1ee7c82 100644
--- a/arch/parisc/include/asm/prefetch.h
+++ b/arch/parisc/include/asm/prefetch.h
@@ -21,7 +21,12 @@
 #define ARCH_HAS_PREFETCH
 static inline void prefetch(const void *addr)
 {
-	__asm__("ldw 0(%0), %%r0" : : "r" (addr));
+	__asm__(
+#ifndef CONFIG_PA20
+		/* Need to avoid prefetch of NULL on PA7300LC */
+		"	extrw,u,= %0,31,32,%%r0\n"
+#endif
+		"	ldw 0(%0), %%r0" : : "r" (addr));
 }
 
 /* LDD is a PA2.0 addition. */


