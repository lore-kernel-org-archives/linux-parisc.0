Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id EA1D648A9
	for <parisc-linux@parisc-linux.org>; Sun, 31 Aug 2003 09:42:10 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 19tULC-0001v1-Bk
	for parisc-linux@parisc-linux.org; Sun, 31 Aug 2003 16:42:10 +0100
Date: Sun, 31 Aug 2003 16:42:10 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20030831154210.GY13467@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [ron@rongage.org: [Patchbomb] - Copy_to/from_user audit - parisc -RESEND]
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

----- Forwarded message from Ron Gage <ron@rongage.org> -----

From: Ron Gage <ron@rongage.org>
To: kernel-janitor-discuss@lists.sourceforge.net
Subject: [Patchbomb] - Copy_to/from_user audit - parisc -RESEND
User-Agent: KMail/1.5.2
Errors-To: kernel-janitor-discuss-admin@lists.sourceforge.net
X-BeenThere: kernel-janitor-discuss@lists.sourceforge.net
X-Mailman-Version: 2.0.9-sf.net
Precedence: bulk
List-Help: <mailto:kernel-janitor-discuss-request@lists.sourceforge.net?subject=help>
List-Post: <mailto:kernel-janitor-discuss@lists.sourceforge.net>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kernel-janitor-discuss>,
	<mailto:kernel-janitor-discuss-request@lists.sourceforge.net?subject=subscribe>
List-Id: kernel janitor discussion list <kernel-janitor-discuss.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/kernel-janitor-discuss>,
	<mailto:kernel-janitor-discuss-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum=kernel-janitor-discuss>
X-Original-Date: Sun, 31 Aug 2003 11:18:49 -0400
Date: Sun, 31 Aug 2003 11:18:49 -0400

This patch is also available on my ftp server
ftp://new.rongage.org/pub/linux

This patch catches insures proper return values from 
copy_to/from_user calls.

Ron Gage - Pontiac, MI


diff -urN linux-2.6.0-test4/arch/parisc/kernel/signal32.c linux-2.6.0-test4-patched/arch/parisc/kernel/signal32.c
--- linux-2.6.0-test4/arch/parisc/kernel/signal32.c	2003-08-22 19:53:07.000000000 -0400
+++ linux-2.6.0-test4-patched/arch/parisc/kernel/signal32.c	2003-08-29 21:38:02.000000000 -0400
@@ -38,7 +38,7 @@
 	if (sz != sizeof *set) panic("put_sigset32()");
 	sigset_64to32(&s, set);
 
-	return copy_to_user(up, &s, sizeof s);
+	return copy_to_user(up, &s, sizeof s) ? -EFAULT : 0 ;
 }
 
 static int
diff -urN linux-2.6.0-test4/arch/parisc/kernel/sys_parisc.c linux-2.6.0-test4-patched/arch/parisc/kernel/sys_parisc.c
--- linux-2.6.0-test4/arch/parisc/kernel/sys_parisc.c	2003-08-22 19:59:03.000000000 -0400
+++ linux-2.6.0-test4-patched/arch/parisc/kernel/sys_parisc.c	2003-08-29 21:36:06.000000000 -0400
@@ -271,7 +271,7 @@
 	tbuf.shm_cpid = sbuf->shm_cpid;
 	tbuf.shm_lpid = sbuf->shm_lpid;
 	tbuf.shm_nattch = sbuf->shm_nattch;
-	return copy_to_user(buf, &tbuf, sizeof tbuf);
+	return copy_to_user(buf, &tbuf, sizeof tbuf) ? -EFAULT : 0;
 }
 
 int sys_msgctl_broken(int msqid, int cmd, struct msqid_ds *buf)
diff -urN linux-2.6.0-test4/arch/parisc/kernel/sys_parisc32.c linux-2.6.0-test4-patched/arch/parisc/kernel/sys_parisc32.c
--- linux-2.6.0-test4/arch/parisc/kernel/sys_parisc32.c	2003-08-22 19:54:17.000000000 -0400
+++ linux-2.6.0-test4-patched/arch/parisc/kernel/sys_parisc32.c	2003-08-29 21:36:59.000000000 -0400
@@ -370,7 +370,7 @@
 	struct compat_timeval t32;
 	t32.tv_sec = t->tv_sec;
 	t32.tv_usec = t->tv_usec;
-	return copy_to_user(u, &t32, sizeof t32);
+	return copy_to_user(u, &t32, sizeof t32) ? -EFAULT : 0 ;
 }
 
 static int



-------------------------------------------------------
This sf.net email is sponsored by:ThinkGeek
Welcome to geek heaven.
http://thinkgeek.com/sf
_______________________________________________
Kernel-janitor-discuss mailing list
Kernel-janitor-discuss@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kernel-janitor-discuss

----- End forwarded message -----

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
