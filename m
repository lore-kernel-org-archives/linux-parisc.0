Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA12522
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Jan 2001 08:42:49 -0700
Received: from localhost (ingram@localhost)
	by maestro.symsys.com (8.9.3/8.9.3) with ESMTP id JAA25471
	for <parisc-linux@thepuffingroup.com>; Wed, 24 Jan 2001 09:46:40 -0600
Date: Wed, 24 Jan 2001 09:46:40 -0600 (CST)
From: Greg Ingram <ingram@symsys.com>
To: parisc-linux@thepuffingroup.com
In-Reply-To: <20010120115417.4CD28D1585@mail.esiee.fr>
Message-ID: <Pine.LNX.4.21.0101240943360.25434-100000@maestro.symsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] [PATCH] typo fix
List-ID: <linux-parisc.vger.kernel.org>


That patch I sent last week has a letter O instead of a zero in the 'C100'
string in the comment.  Only one.  What were my fingers doing?

--- ccio-dma.c.orig	Wed Jan 24 09:39:22 2001
+++ ccio-dma.c	Wed Jan 24 09:39:38 2001
@@ -1523,7 +1523,7 @@
 ** that can't be detected by PA/EISA/PCI bus walks.
 */
 	switch((unsigned long)d->hpa) {
-        case 0xf5fbf000L:       /* C1O0 (wild guess!) */
+        case 0xf5fbf000L:       /* C100 (wild guess!) */
 	case 0xf3fbf000L:       /* C110 IOA0 LBC (aka GSC port) */
 	case 0xf7fbf000L:       /* C110 IOA0 LBC (aka GSC port) */
 	case 0xf203f000L:       /* C180/C200/240/C360 IOA0 LBC (aka GSC port) */

- Greg
