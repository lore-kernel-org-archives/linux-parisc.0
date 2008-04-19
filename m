From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Use lower nice level for ksoftirqd when HIL is enabled
Date: Sat, 19 Apr 2008 14:22:17 +0200
Message-ID: <20080419142217.6b360965@bleh.bxl.tuxicoman.be>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/i.T=rS/SXnmuFudh_TtNOWJ"
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--MP_/i.T=rS/SXnmuFudh_TtNOWJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Hi team,

The following patch makes sure that ksoftirqd gets a nice level of 15
when HIL is enabled in the kernel. This is to workaround the fact that
ksoftirqd's load is very high when you have HIL devices attached to your
system.

There may be a better way to fix this. However, I think that the load
problem was already looked into long time ago and nothing could be done
about it, hence this workaround.


The attached patch has been tested already by a few Gentoo users.


Cheers,
  Guy

-- 
Guy Martin
Gentoo Linux - HPPA port lead

--MP_/i.T=rS/SXnmuFudh_TtNOWJ
Content-Type: text/x-patch; name=HIL-softirqd-less-nice.patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=HIL-softirqd-less-nice.patch

Signed-off-by: Guy Martin <gmsoft@tuxicoman.be>

Use a nice level of 15 when HIL support is compiled into the kernel.

diff -uNr linux-2.6.23-gentoo-r8.orig/kernel/softirq.c linux-2.6.23-gentoo-r8/kernel/softirq.c
--- linux-2.6.23-gentoo-r8.orig/kernel/softirq.c	2008-03-01 14:44:15.000000000 +0100
+++ linux-2.6.23-gentoo-r8/kernel/softirq.c	2008-03-01 14:50:18.000000000 +0100
@@ -597,6 +597,10 @@
 			printk("ksoftirqd for %i failed\n", hotcpu);
 			return NOTIFY_BAD;
 		}
+#ifdef CONFIG_HIL_MLC
+		// When using HIL, ksoftirqd takes too much CPU so we reduce the nice level
+		set_user_nice(p, 15);
+#endif /* CONFIG_HIL_MLC */
 		kthread_bind(p, hotcpu);
   		per_cpu(ksoftirqd, hotcpu) = p;
  		break;

--MP_/i.T=rS/SXnmuFudh_TtNOWJ--
