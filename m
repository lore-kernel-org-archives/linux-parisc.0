Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailserver3.hrz.tu-darmstadt.de (mailserver3.hrz.tu-darmstadt.de [130.83.126.47])
	by dsl2.external.hp.com (Postfix) with ESMTP id BF7BC482B
	for <parisc-linux@lists.parisc-linux.org>; Sat, 19 Jul 2003 05:38:14 -0600 (MDT)
Received: from hrzpub.tu-darmstadt.de (IP-213157001009.dialin.heagmedianet.de [213.157.1.9])
	(authenticated bits=0)
	by mailserver3.hrz.tu-darmstadt.de (8.12.9/8.12.7) with ESMTP id h6JBc4bH000713
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <parisc-linux@lists.parisc-linux.org>; Sat, 19 Jul 2003 13:38:07 +0200
Message-ID: <3F192C1D.2050701@hrzpub.tu-darmstadt.de>
Date: Sat, 19 Jul 2003 13:31:41 +0200
From: =?ISO-8859-15?Q?R=FCdiger_Scholz?= <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: multipart/mixed;
 boundary="------------080307050105090100090206"
Subject: [parisc-linux] [PATCH] Prevent loopback traffic to be shown on the network leds
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

This is a multi-part message in MIME format.
--------------080307050105090100090206
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

looking at the Download page from the ESIEE-Team I found the following 
patch from Thibaut. It filters the traffic from/to the loopback device, 
so network led isn't blinking when accessing the loopback device. 
Should'nt it go into CVS?

Rüdiger

--------------080307050105090100090206
Content-Type: text/plain;
 name="led.c-diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="led.c-diff"

Index: linux/arch/parisc/kernel/led.c
===================================================================
RCS file: /var/cvs/linux/arch/parisc/kernel/led.c,v
retrieving revision 1.28
diff -u -p -u -r1.28 led.c
--- linux/arch/parisc/kernel/led.c	29 Sep 2002 15:49:20 -0000	1.28
+++ linux/arch/parisc/kernel/led.c	17 Jan 2003 16:02:56 -0000
@@ -365,10 +365,12 @@ static void led_get_net_stats(int addval
 	 * for reading should be OK */
 	read_lock(&dev_base_lock);
 	for (dev = dev_base; dev != NULL; dev = dev->next) {
-	    if (dev->get_stats) { 
-	        stats = dev->get_stats(dev);
-		rx_total += stats->rx_packets;
-		tx_total += stats->tx_packets;
+	    if (!(dev->flags & IFF_LOOPBACK)) {
+		if (dev->get_stats) {
+		    stats = dev->get_stats(dev);
+		    rx_total += stats->rx_packets;
+		    tx_total += stats->tx_packets;
+		}
 	    }
 	}
 	read_unlock(&dev_base_lock);

--------------080307050105090100090206--
