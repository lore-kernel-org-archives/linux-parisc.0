Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dh64.b180 (b180.mmjgroup.com [192.34.35.37])
	by dsl2.external.hp.com (Postfix) with ESMTP id BBB394829
	for <parisc-linux@parisc-linux.org>; Thu,  5 Dec 2002 15:18:55 -0700 (MST)
Date: Thu, 5 Dec 2002 15:18:45 -0700
To: parisc-linux@parisc-linux.org
Cc: lamont@hp.com
Message-ID: <20021205221845.GA22847@b180.mmjgroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: lamont@b180.mmjgroup.com (LaMont Jones)
Subject: [parisc-linux] airo.c fix for hppa and others
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

Here's the patch that actually works.

airo.c is vs 2.4.20, the checksum.h patch (which is purely performance) is vs
2.4.19 which is probably the same as 2.4.20...

The airo.c patch is critical and sufficient.  The other is for comment,
should anyone care.

lamont

diff -ur x/kernel-source-2.4.19-hppa/drivers/net/wireless/airo.c kernel-source-2.4.19-hppa/drivers/net/wireless/airo.c
--- x/kernel-source-2.4.19-hppa/drivers/net/wireless/airo.c	2002-12-05 15:13:42.000000000 -0700
+++ kernel-source-2.4.19-hppa/drivers/net/wireless/airo.c	2002-12-05 15:15:24.000000000 -0700
@@ -1966,7 +1966,7 @@
 #pragma pack()
 			u16 gap;
 			u16 tmpbuf[4];
-			u16 *buffer;
+			u16 *buffer=NULL;
 
 			fid = IN4500( apriv, RXFID );
 
@@ -2011,13 +2011,14 @@
 				} else
 					hdrlen = ETH_ALEN * 2;
 
-				skb = dev_alloc_skb( len + hdrlen + 2 );
+				skb = dev_alloc_skb( len + hdrlen + 4 );
 				if ( !skb ) {
 					apriv->stats.rx_dropped++;
 					len = 0;
 				}
 			}
 			if (len) {
+				skb_reserve(skb, 2);	/* Align IP on 16 byte boundaries */
 				buffer = (u16*)skb_put (skb, len + hdrlen);
 				if (apriv->flags & FLAG_802_11) {
 					buffer[0] = fc;
@@ -4008,6 +4009,10 @@
 {
 	struct net_device *dev;
 
+	if (pci_enable_device(pdev))
+		return -ENODEV;
+	pci_set_master(pdev);
+
 	dev = init_airo_card(pdev->irq,	pdev->resource[2].start, 0);
 	if (!dev)
 		return -ENODEV;
diff -ur x/kernel-source-2.4.19-hppa/include/asm-parisc/checksum.h kernel-source-2.4.19-hppa/include/asm-parisc/checksum.h
--- x/kernel-source-2.4.19-hppa/include/asm-parisc/checksum.h	2002-02-12 22:16:45.000000000 -0700
+++ kernel-source-2.4.19-hppa/include/asm-parisc/checksum.h	2002-12-05 12:03:48.000000000 -0700
@@ -54,7 +54,8 @@
 /*
  *	Optimized for IP headers, which always checksum on 4 octet boundaries.
  *
- *	Written by Randolph Chung <tausq@debian.org>
+ *	Written by Randolph Chung <tausq@debian.org>, and then mucked with by
+ *	LaMont Jones <lamont@debian.org>
  */
 static inline unsigned short ip_fast_csum(unsigned char * iph,
 					  unsigned int ihl) {
@@ -63,27 +64,23 @@
 
 	__asm__ __volatile__ (
 "	ldws,ma		4(%1), %0\n"
-"	addi		-4, %2, %2\n"
-"	comib,>=	0, %2, 2f\n"
+"	addib,<=	-4, %2, 2f\n"
 "\n"
-"	ldws,ma		4(%1), %%r19\n"
-"	add		%0, %%r19, %0\n"
-"	ldws,ma		4(%1), %%r19\n"
-"	addc		%0, %%r19, %0\n"
-"	ldws,ma		4(%1), %%r19\n"
+"	ldws		4(%1), %%r20\n"
+"	ldws		8(%1), %%r21\n"
+"	add		%0, %%r20, %0\n"
+"	ldws,ma		12(%1), %%r19\n"
+"	addc		%0, %%r21, %0\n"
 "	addc		%0, %%r19, %0\n"
 "1:	ldws,ma		4(%1), %%r19\n"
-"	addib,<>	-1, %2, 1b\n"
+"	addib,<		0, %2, 1b\n"
 "	addc		%0, %%r19, %0\n"
-"	addc		%0, %%r0, %0\n"
 "\n"
-"	zdepi		-1, 31, 16, %%r19\n"
-"	and		%0, %%r19, %%r20\n"
+"	extru		%0, 31, 16, %%r20\n"
 "	extru		%0, 15, 16, %%r21\n"
-"	add		%%r20, %%r21, %0\n"
-"	and		%0, %%r19, %%r20\n"
+"	addc		%%r20, %%r21, %0\n"
 "	extru		%0, 15, 16, %%r21\n"
-"	add		%%r20, %%r21, %0\n"
+"	add		%0, %%r21, %0\n"
 "	subi		-1, %0, %0\n"
 "2:\n"
 	: "=r" (sum), "=r" (iph), "=r" (ihl)
