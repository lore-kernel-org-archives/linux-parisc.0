Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id AAF884852
	for <parisc-linux@lists.parisc-linux.org>; Sat, 18 Oct 2003 14:51:46 -0600 (MDT)
Date: Sat, 18 Oct 2003 16:47:55 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Ulrich Drepper <drepper@redhat.com>
Cc: libc-alpha <libc-alpha@sources.redhat.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: [PATCH] Sysdeps changes for hppa.
Message-ID: <20031018204754.GA8642@systemhalted>
References: <20031012213226.GE23999@systemhalted> <3F8CDFD6.1010300@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F8CDFD6.1010300@redhat.com>
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

> I've applied this patch, but only because I really don't care how the PA
> port looks.

Small cleanup mistake. Thank you.

c.

---
2003-10-18  Carlos O'Donell  <carlos@baldric.uwo.ca>

	* sysdeps/unix/sysv/linux/hppa/sysdep.h: Fix merge error.

diff -u -p -r1.8 sysdep.h
--- libc/sysdeps/unix/sysv/linux/hppa/sysdep.h	15 Oct 2003 05:46:00 -0000	1.8
+++ libc/sysdeps/unix/sysv/linux/hppa/sysdep.h	16 Oct 2003 05:38:17 -0000
@@ -371,7 +371,6 @@
 			LDW_ASM_PIC				\
 			: "=r" (__res)				\
 			: "i" (SYS_ify(name)) ASM_ARGS_##nr	\
-			 );					\
 			: CALL_CLOB_REGS CLOB_ARGS_##nr		\
 		);						\
 		__sys_res = (long)__res;			\
