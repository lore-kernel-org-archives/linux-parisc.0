Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from lists.samba.org (dp.samba.org [66.70.73.150])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4AD534830
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Sep 2003 23:20:07 -0600 (MDT)
From: Rusty Russell <rusty@rustcorp.com.au>
To: Matthew Wilcox <willy@debian.org>
Cc: Arnaldo Carvalho de Melo <acme@conectiva.com.br>,
	Linus Torvalds <torvalds@osdl.org>,
	James Bottomley <James.Bottomley@steeleye.com>,
	parisc-linux@lists.parisc-linux.org
In-reply-to: Your message of "Thu, 04 Sep 2003 15:19:28 +0100."
             <20030904141928.GO18654@parcelfarce.linux.theplanet.co.uk>
Date: Fri, 05 Sep 2003 13:29:48 +1000
Message-Id: <20030905052006.8A97E2C208@lists.samba.org>
Subject: [parisc-linux] Re: [PATCH] add MODULE_ALIAS_LDISC to asm-parisc/termios.h
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

In message <20030904141928.GO18654@parcelfarce.linux.theplanet.co.uk> you write
:
> On Thu, Sep 04, 2003 at 10:53:15AM -0300, Arnaldo Carvalho de Melo wrote:
> > 	This patch makes it compile, doing the same thing that was done to
> > include/asm-i386/termios.h, please see if this is acceptable, if it is I can
> > provide the same patch for all the other arches.
> 
> if it's the same for all arches, why not put it in <linux/termios.h>?

Because I'm stupid?

Linus, please apply,
Rusty.
--
  Anyone who quotes me in their sig is an idiot. -- Rusty Russell.

diff -urpN --exclude TAGS -X /home/rusty/devel/kernel/kernel-patches/current-dontdiff --minimal linux-2.6.0-test4-bk6/include/asm-i386/termios.h working-2.6.0-test4-bk6-tmp/include/asm-i386/termios.h
--- linux-2.6.0-test4-bk6/include/asm-i386/termios.h	2003-09-05 09:16:36.000000000 +1000
+++ working-2.6.0-test4-bk6-tmp/include/asm-i386/termios.h	2003-09-05 13:26:10.000000000 +1000
@@ -101,9 +101,6 @@ struct termio {
 
 #define user_termios_to_kernel_termios(k, u) copy_from_user(k, u, sizeof(struct termios))
 #define kernel_termios_to_user_termios(u, k) copy_to_user(u, k, sizeof(struct termios))
-
-#define MODULE_ALIAS_LDISC(ldisc) \
-	MODULE_ALIAS("tty-ldisc-" __stringify(ldisc))
 #endif	/* __KERNEL__ */
 
 #endif	/* _I386_TERMIOS_H */
diff -urpN --exclude TAGS -X /home/rusty/devel/kernel/kernel-patches/current-dontdiff --minimal linux-2.6.0-test4-bk6/include/linux/termios.h working-2.6.0-test4-bk6-tmp/include/linux/termios.h
--- linux-2.6.0-test4-bk6/include/linux/termios.h	2001-11-23 06:46:18.000000000 +1100
+++ working-2.6.0-test4-bk6-tmp/include/linux/termios.h	2003-09-05 13:26:24.000000000 +1000
@@ -4,4 +4,6 @@
 #include <linux/types.h>
 #include <asm/termios.h>
 
+#define MODULE_ALIAS_LDISC(ldisc) \
+	MODULE_ALIAS("tty-ldisc-" __stringify(ldisc))
 #endif
