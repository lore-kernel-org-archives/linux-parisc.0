Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id AF6CE482E
	for <parisc-linux@parisc-linux.org>; Wed, 18 Dec 2002 16:16:11 -0700 (MST)
Date: Wed, 18 Dec 2002 15:16:56 -0800
From: Randolph Chung <randolph@tausq.org>
To: Daniel Podlejski <underley@underley.eu.org>
Cc: parisc-linux@parisc-linux.org
Message-ID: <20021218231656.GN19331@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [patch] tun.c does not correctly align skb's
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

Hi David,

While trying to get the tun/tap driver to work on parisc-linux, I found
that the driver does not deliver correctly aligned buffers to the
underlying layers. The attached patch fixes the problem. AIUI the +2 is
there in some net drivers to deal with the 4n+2 length of MAC headers.
Since you don't have a MAC header here the +2 is not required. In fact,
it will cause the buffers that are delivered to the checksuming routines
to be unaligned, which will either not work on some archs, or have
performance implications on others.

This was tested on 2.4.19(-pa22).

--- drivers/net/tun.c.orig	2002-12-18 15:02:45.000000000 -0800
+++ drivers/net/tun.c	2002-12-18 15:03:30.000000000 -0800
@@ -194,12 +194,11 @@
 		memcpy_fromiovec((void *)&pi, iv, sizeof(pi));
 	}
  
-	if (!(skb = alloc_skb(len + 2, GFP_KERNEL))) {
+	if (!(skb = alloc_skb(len, GFP_KERNEL))) {
 		tun->stats.rx_dropped++;
 		return -ENOMEM;
 	}
 
-	skb_reserve(skb, 2);
 	memcpy_fromiovec(skb_put(skb, len), iv, len);
 
 	skb->dev = &tun->dev;


randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
