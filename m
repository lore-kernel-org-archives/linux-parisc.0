Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id ADDF1482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 30 Apr 2002 18:08:56 -0600 (MDT)
Received: from p5080DD88.dip.t-dialin.net (p5080DD88.dip.t-dialin.net [80.128.221.136])
	(authenticated)
	by mail.scram.de (8.11.6+3.4W/8.11.0) with ESMTP id g4108rT00621
	for <parisc-linux@lists.parisc-linux.org>; Wed, 1 May 2002 02:08:53 +0200 (CEST)
Date: Wed, 1 May 2002 02:08:48 +0200 (CEST)
From: Jochen Friedrich <jochen@scram.de>
To: HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.LNX.4.44.0205010207430.4938-100000@alpha.bocc.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Patch to enable IrDA :-)
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

Hi,

this tiny patch enables the usage of IrDA dongles on the PA-RISC :-)

# cvs diff -u drivers/net/irda/irtty.c arch/parisc/config.in
Index: drivers/net/irda/irtty.c
===================================================================
RCS file: /var/cvs/linux/drivers/net/irda/irtty.c,v
retrieving revision 1.8
diff -u -r1.8 irtty.c
--- drivers/net/irda/irtty.c    2001/11/09 23:36:06     1.8
+++ drivers/net/irda/irtty.c    2002/05/01 00:07:28
@@ -26,6 +26,7 @@

 #include <linux/module.h>
 #include <linux/kernel.h>
+#include <linux/config.h>
 #include <linux/tty.h>
 #include <linux/init.h>
 #include <linux/skbuff.h>
@@ -767,6 +768,9 @@

 #ifdef TIOCM_OUT2 /* Not defined for ARM */
        arg = TIOCM_OUT2;
+#endif
+#ifdef CONFIG_PARISC  /* PA-RISC uses OUT1 as hardware flow control bit 
*/
+       arg |= TIOCM_OUT1;
 #endif
        if (rts)
                arg |= TIOCM_RTS;
Index: arch/parisc/config.in
===================================================================
RCS file: /var/cvs/linux/arch/parisc/config.in,v
retrieving revision 1.39
diff -u -r1.39 config.in
--- arch/parisc/config.in       2001/11/08 21:17:52     1.39
+++ arch/parisc/config.in       2002/05/01 00:07:28
@@ -153,6 +153,8 @@

 source fs/Config.in

+source net/irda/Config.in
+
 if [ "$CONFIG_VT" = "y" ]; then
    mainmenu_option next_comment
    comment 'Console drivers'

Cheers,
--jochen
