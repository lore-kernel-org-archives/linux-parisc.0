Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: parisc-linux@lists.parisc-linux.org, saw@saw.sw.com.sg
Cc: jgarzik@mandrakesoft.com
Subject: Re: [parisc-linux] PCI Intel EtherExpressPro100 strangeness on C200 machine. 
In-Reply-To: Message from Andreas Seltenreich <s_selten@informatik.uni-karlsruhe.de>
   of "Sun, 18 Aug 2002 00:37:15 +0200." <20020817223713.GA25852@gate450.dyndns.org>
References: <3D5EB2D6.9090403@charter.net>  <20020817223713.GA25852@gate450.dyndns.org> 
Date: Mon, 26 Aug 2002 12:14:54 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020826181454.1EA0A4829@dsl2.external.hp.com>
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

Andreas Seltenreich wrote:
> just append " || defined(__hppa__)" to line 47 of drivers/net/eepro100.c
> I got mine working that way.

For some definition of "working".
That #ifdef "forces" the RX copy *most* of the time.
If the dev_alloc_skb() call fails , the "broken" code path is taken anyway.

The code needs to differentiate architectures that *could* (but it's not
efficient) avoid the copy from architectures that *must* copy.

Patch below assumes the archs listed in the ifdef *must* copy.
If the dev_alloc_skb() fails, we drop the packet and update stats.
Not sure if I'm doing the right thing in the failure case though...

grant


Index: drivers/net/eepro100.c
===================================================================
RCS file: /var/cvs/linux/drivers/net/eepro100.c,v
retrieving revision 1.17
diff -u -p -r1.17 eepro100.c
--- drivers/net/eepro100.c	4 Aug 2002 22:58:29 -0000	1.17
+++ drivers/net/eepro100.c	26 Aug 2002 17:25:58 -0000
@@ -1,4 +1,3 @@
-/* drivers/net/eepro100.c: An Intel i82557-559 Ethernet driver for Linux. */
 /*
    NOTICE: For use with late 2.3 kernels only.
    May not compile for kernels 2.3.43-47.
@@ -43,11 +42,13 @@ static int rxdmacount /* = 0 */;
 
 /* Set the copy breakpoint for the copy-only-tiny-buffer Rx method.
    Lower values use more memory, but are faster. */
+static int rx_copybreak = 200;
+
 #if defined(__alpha__) || defined(__sparc__) || defined(__mips__) || \
-    defined(__arm__)
-static int rx_copybreak = 1518;
+    defined(__arm__) || defined(__hppa__)
+#define RX_COPY(x)		1
 #else
-static int rx_copybreak = 200;
+#define RX_COPY(x) (x < rx_copybreak)
 #endif
 
 /* Maximum events (Rx packets, etc.) to handle at each interrupt. */
@@ -1760,10 +1761,17 @@ speedo_rx(struct net_device *dev)
 		} else {
 			struct sk_buff *skb;
 
-			/* Check if the packet is long enough to just accept without
-			   copying to a properly sized skbuff. */
-			if (pkt_len < rx_copybreak
-				&& (skb = dev_alloc_skb(pkt_len + 2)) != 0) {
+			/* Check if the packet is long enough to just accept
+			 * without copying to a properly sized skbuff.
+			 */
+			if (RX_COPY(pkt_len)) {
+				skb = dev_alloc_skb(pkt_len + 2);
+				if (!skb) {
+					printk(KERN_ERR "%s: dropping packet,"
+						"no user space buffer!",
+						status);
+					goto update_stats;
+				}
 				skb->dev = dev;
 				skb_reserve(skb, 2);	/* Align IP on 16 byte boundaries */
 				/* 'skb_put()' points to the start of sk_buff data area. */
@@ -1797,6 +1805,7 @@ speedo_rx(struct net_device *dev)
 			sp->stats.rx_packets++;
 			sp->stats.rx_bytes += pkt_len;
 		}
+update_stats:
 		entry = (++sp->cur_rx) % RX_RING_SIZE;
 		sp->rx_ring_state &= ~RrPostponed;
 		/* Refill the recently taken buffers.
