Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from young-lust.wild-wind.fr.eu.org (lopsy-lu.misterjones.org [62.4.18.26])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3AFEB482A
	for <parisc-linux@parisc-linux.org>; Thu,  3 Jul 2003 02:05:50 -0600 (MDT)
Received: from hina.wild-wind.fr.eu.org ([192.168.70.139])
	by young-lust.wild-wind.fr.eu.org with esmtp (Exim 3.35 #1 (Debian))
	id 19XynH-0003kS-00
	for <parisc-linux@parisc-linux.org>; Thu, 03 Jul 2003 09:46:15 +0200
To: parisc-linux@parisc-linux.org
Reply-To: mzyngier@freesurf.fr
From: Marc Zyngier <mzyngier@freesurf.fr>
Date: Thu, 03 Jul 2003 10:03:20 +0200
Message-ID: <wrpd6gsjauv.fsf@hina.wild-wind.fr.eu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [PATCH 2.5] More serial console hack...
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

Hi all,

Until then, I couldn't get a serial console to work on my C100 when
running 2.5 (2.4 is OK). So I finally had time to look at it...

I just put in the same hack 8250_pci has... Looks horrible, but at
least it allows me to get a working console.

I suppose the real problem is that console_initcall is being called
much too late in the boot process, which leads to all those
PA-specific hacks in 8250*. Is there any plan on how to solve that ?

Regards,

            M.

--- ../vanilla/linux-2.5.73/drivers/serial/8250_gsc.c	2003-07-02 11:10:27.000000000 +0200
+++ linux-current/drivers/serial/8250_gsc.c	2003-07-02 15:24:26.000000000 +0200
@@ -131,6 +131,11 @@
 {
 	register_parisc_driver(&lasi_driver);
 	register_parisc_driver(&serial_driver);
+
+#if defined(CONFIG_SERIAL_8250_CONSOLE)
+        serial8250_console_init();
+#endif
+
 	return 0;
 }
 

-- 
Places change, faces change. Life is so very strange.
