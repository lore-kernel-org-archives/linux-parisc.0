From: Guy Martin <gmsoft@gentoo.org>
Subject: Re: [parisc-linux] statfs() problem with glibc-2.5
Date: Mon, 12 Feb 2007 15:37:31 +0100
Message-ID: <20070212153731.846e2ad3.gmsoft__6384.99391866407$1416624287$gmane$org@gentoo.org>
References: <20070212102844.f045d760.gmsoft@gentoo.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="Multipart=_Mon__12_Feb_2007_15_37_31_+0100_MfWJjtJO2MnLHGri"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070212102844.f045d760.gmsoft@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

This is a multi-part message in MIME format.

--Multipart=_Mon__12_Feb_2007_15_37_31_+0100_MfWJjtJO2MnLHGri
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit




Hi all,


After some more troubleshooting, I've found out that parisc doesn't hook up the statfs64 syscall.

Applying the attached patch and recompile glibc with updated headers makes df works again.

Apparently, the statfs64 syscalls are available since 2.5.74.


Please review the patch.


Regards,
  Guy



On Mon, 12 Feb 2007 10:28:44 +0100
Guy Martin <gmsoft@gentoo.org> wrote:

> 
> Hi all,
> 
> 
> While running and testing glibc-2.5, I've encountered the following problem :
> 
> hope bin # ./df -h
> Filesystem            Size  Used Avail Use% Mounted on
> /dev/sda3             276Y  276Y  539Z 100% /
> sysfs                18641256972210Y 18634655137640Y 70815813734120Y  21% /sys
> udev                 18641256972210Y 18634655137640Y 70815813734120Y  21% /dev
> devpts               18641256972210Y 18634655137640Y 70815813734120Y  21% /dev/pts
> shm                  18641256972210Y 18634655137640Y 70815813734120Y  21% /dev/shm
> usbfs                18641256972210Y 18634655137640Y 70815813734120Y  21% /proc/bus/usb
> playa:/usr/portage/distfiles
>                      18641256972210Y 18634655137640Y 70815813734120Y  21% /usr/portage/distfiles
> /dev/sdb4            18641256972210Y 18634655137640Y 70815813734120Y  21% /mnt/gentoo
> /dev/sdb2            18641256972210Y 18634655137640Y 70815813734120Y  21% /mnt/gentoo/boot
> 
> 
> Despite the fact that I whish I had that capacity, there is definately an issue.
> 
> This is using glibc-2.5, 2.6.20-pa0 and corresponding headers.
> 
> 
> Let me know if you need more info.
> 
> Cheers,
>   Guy
> 
> 
> 
> -- 
> Guy Martin
> Gentoo Linux - HPPA port lead
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


-- 
Guy Martin
Gentoo Linux - HPPA port lead


--Multipart=_Mon__12_Feb_2007_15_37_31_+0100_MfWJjtJO2MnLHGri
Content-Type: text/x-patch;
 name="hookup-statfs64-syscall-parisc.diff"
Content-Disposition: attachment; filename="hookup-statfs64-syscall-parisc.diff"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
index 5114666..fb6788f 100644
--- a/arch/parisc/kernel/syscall_table.S
+++ b/arch/parisc/kernel/syscall_table.S
@@ -403,5 +403,7 @@
 	ENTRY_COMP(move_pages)		/* 295 */
 	ENTRY_SAME(getcpu)
 	ENTRY_SAME(epoll_pwait)
+	ENTRY_COMP(statfs64)
+	ENTRY_COMP(fstatfs64)
 	/* Nothing yet */
 
diff --git a/include/asm-parisc/unistd.h b/include/asm-parisc/unistd.h
index 7c1bb8b..4369991 100644
--- a/include/asm-parisc/unistd.h
+++ b/include/asm-parisc/unistd.h
@@ -790,6 +790,8 @@
 #define __NR_move_pages		(__NR_Linux + 295)
 #define __NR_getcpu		(__NR_Linux + 296)
 #define __NR_epoll_pwait	(__NR_Linux + 297)
+#define __NR_statfs64		(__NR_Linux + 298)
+#define __NR_fstatfs64		(__NR_Linux + 299)
 
 #define __NR_Linux_syscalls     298
 

--Multipart=_Mon__12_Feb_2007_15_37_31_+0100_MfWJjtJO2MnLHGri
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Multipart=_Mon__12_Feb_2007_15_37_31_+0100_MfWJjtJO2MnLHGri--
