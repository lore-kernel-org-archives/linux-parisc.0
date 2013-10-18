From: "Myklebust, Trond" <Trond.Myklebust-HgOvQuBEEgTQT0dZR+AlfA@public.gmane.org>
Subject: Re: 3.12-rcX - NFS regression - kswapd0 / kswapd1 stays using 100%
 CPU?
Date: Fri, 18 Oct 2013 20:12:14 +0000
Message-ID: <1382127133.20461.9.camel@leira.trondhjem.org>
References: <52604BA9.20104@gmx.de>
		 <1382044045.3216.44.camel@leira.trondhjem.org> <52618B5F.4000508@gmx.de>
	 <1382124981.20461.4.camel@leira.trondhjem.org> <5261940A.4090101@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-7"
Cc: Linux Kernel Development <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>,
	NFS list <linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>,
	linux-parisc <linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
To: Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>
Return-path: <linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5261940A.4090101-Mmb7MZpHnFY@public.gmane.org>
List-ID: <linux-nfs.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 2013-10-18 at 22:03 +-0200, Helge Deller wrote:
+AD4- On 10/18/2013 09:36 PM, Myklebust, Trond wrote:
+AD4- +AD4- Also, could you please try a sysRQ-t the next time it happens, so that
+AD4- +AD4- we can get a trace of where the mount program is hanging. Knowing that
+AD4- +AD4- the mount is stuck in +ACIAXwBf-schedule()+ACI- is not really interesting unless we
+AD4- +AD4- know from where that was called.
+AD4- 
+AD4- Actually, the machine was still running in this state.
+AD4- Here is sysrq-t:
+AD4- +AFs-112009.084000+AF0- mount           S 00000000401040c0     0 25331      1 0x00000010
+AD4- +AFs-112009.084000+AF0- Backtrace:
+AD4- +AFs-112009.084000+AF0-  +AFsAPA-0000000040113a68+AD4AXQ- +AF8AXw-schedule+0x500/0x810-
+AD4- +AFs-112009.232000+AF0-
+AD4- +AFs-112009.232000+AF0- mount.nfs       D 00000000401040c0     0 25332  25331 0x00000010
+AD4- +AFs-112009.232000+AF0- Backtrace:
+AD4- +AFs-112009.232000+AF0-  +AFsAPA-0000000040113a68+AD4AXQ- +AF8AXw-schedule+0x500/0x810-

That makes no sense unless sysrq-t works differently on parisc than on
other platforms. I'd expect the backtrace to at least include a system
call. Parisc experts?

-- 
Trond Myklebust
Linux NFS client maintainer

NetApp
Trond.Myklebust+AEA-netapp.com
www.netapp.com
--
To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
