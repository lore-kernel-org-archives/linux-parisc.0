From: Guy Martin <gmsoft@gentoo.org>
Subject: Re: [parisc-linux] statfs() problem with glibc-2.5
Date: Tue, 20 Feb 2007 18:06:58 +0100
Message-ID: <20070220180658.ce5ce5ba.gmsoft__32032.9042188407$1416624308$gmane$org@gentoo.org>
References: <20070212102844.f045d760.gmsoft@gentoo.org>
	<20070212153731.846e2ad3.gmsoft@gentoo.org>
	<20070217160642.GC2880@athena.road.mcmartin.ca>
	<119aab440702181911t32a25761t8bf1f2306376595d@mail.gmail.com>
	<20070219031627.GA28109@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="Multipart=_Tue__20_Feb_2007_18_06_58_+0100_BK3LTC=uCclzkv7T"
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070219031627.GA28109@athena.road.mcmartin.ca>
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

--Multipart=_Tue__20_Feb_2007_18_06_58_+0100_BK3LTC=uCclzkv7T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Kyle,

Here is the proper patch with Signed-off-by.

Cheers,
  Guy


On Sun, 18 Feb 2007 22:16:27 -0500
Kyle McMartin <kyle@mcmartin.ca> wrote:

> On Sun, Feb 18, 2007 at 10:11:13PM -0500, Carlos O'Donell wrote:
> > >>  #define __NR_Linux_syscalls     298
> > 
> > You also forgot to update the total syscall count.
> > 
> 
> I fixed that one for him. ;-)


-- 
Guy Martin
Gentoo Linux - HPPA port lead

--Multipart=_Tue__20_Feb_2007_18_06_58_+0100_BK3LTC=uCclzkv7T
Content-Type: text/x-patch;
 name="statfs-syscalls.diff"
Content-Disposition: attachment;
 filename="statfs-syscalls.diff"
Content-Transfer-Encoding: 7bit

Add missing statfs64 and fstatfs64 to parisc.

Signed-off-by: Guy Martion <gmsoft@tuxicoman.be>

diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
index 5114666..7d665de 100644
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
index 7c1bb8b..5513bdf 100644
--- a/include/asm-parisc/unistd.h
+++ b/include/asm-parisc/unistd.h
@@ -790,8 +790,10 @@
 #define __NR_move_pages		(__NR_Linux + 295)
 #define __NR_getcpu		(__NR_Linux + 296)
 #define __NR_epoll_pwait	(__NR_Linux + 297)
+#define __NR_statfs64		(__NR_Linux + 298)
+#define __NR_fstatfs64		(__NR_Linux + 299)
 
-#define __NR_Linux_syscalls     298
+#define __NR_Linux_syscalls     300
 
 #define HPUX_GATEWAY_ADDR       0xC0000004
 #define LINUX_GATEWAY_ADDR      0x100

--Multipart=_Tue__20_Feb_2007_18_06_58_+0100_BK3LTC=uCclzkv7T
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Multipart=_Tue__20_Feb_2007_18_06_58_+0100_BK3LTC=uCclzkv7T--
