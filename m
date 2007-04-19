From: Julian Stecklina <der_julian@web.de>
Subject: [parisc-linux] LCD driver trims whitespace
Date: Thu, 19 Apr 2007 18:21:24 +0200
Message-ID: <46279704.1080001__33054.6171208427$1416624336$gmane$org@web.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="------------080101010604030705080809"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

This is a multi-part message in MIME format.
--------------080101010604030705080809
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I have a HP Visualize workstation with this fancy little LCD at the 
front controllable via /proc/pdc/lcd. The problem is that the 
responsible driver trims all trailing whitespace, which is quite 
annoying if you want to scroll some text. The attached trivial patch 
(against 2.6.20.1) removes this behaviour.

Regards,
Julian Stecklina

--------------080101010604030705080809
Content-Type: text/x-patch;
 name="no-space-removal.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="no-space-removal.patch"

diff -ur linux-2.6.20.1-hppa.orig/drivers/parisc/led.c linux-2.6.20.1-hppa/drivers/parisc/led.c
--- linux-2.6.20.1-hppa.orig/drivers/parisc/led.c	2007-04-19 12:38:55.000000000 +0200
+++ linux-2.6.20.1-hppa/drivers/parisc/led.c	2007-04-04 18:40:34.000000000 +0200
@@ -195,12 +195,6 @@
 
 	cur = lbuf;
 
-	/* skip initial spaces */
-	while (*cur && isspace(*cur))
-	{
-		cur++;
-	}
--------------080101010604030705080809--
