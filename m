Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id D23C0483E
	for <parisc-linux@parisc-linux.org>; Wed, 12 Sep 2001 16:42:10 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15hIhs-00055o-00
	for parisc-linux@parisc-linux.org; Wed, 12 Sep 2001 23:42:08 +0100
Date: Wed, 12 Sep 2001 23:42:08 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20010912234208.G2618@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] Further serial changes -- PLEASE TEST
List-ID: <linux-parisc.vger.kernel.org>

Richard reports the serial ports on his B180 are still swapped.  I
think I understand why and the following patch should fix it as well
as several other B/C/J `hundred' class machines.  It might also fix
the A180 (is this broken without the patch?  I haven't seen reports).

Please test this patch if you have one of the above machines.  This
mess might've been avoided if more people had tested the parisc_device
patch.

Index: drivers/gsc/serial.c
===================================================================
RCS file: /home/cvs/parisc/linux/drivers/gsc/serial.c,v
retrieving revision 1.20
diff -u -p -r1.20 serial.c
--- serial.c	2001/08/31 02:00:49	1.20
+++ serial.c	2001/09/12 22:32:40
@@ -97,23 +97,16 @@ static struct parisc_device_id serial_tb
  * only on those machines.  This needs to get fixed properly somehow.
  */
 static struct parisc_device_id serial1_tbl[] = {
-	{ HPHW_FIO, HVERSION_REV_ANY_ID, 0x019, 0x0008C }, /* B180L+ */
-	{ HPHW_FIO, HVERSION_REV_ANY_ID, 0x022, 0x0008C }, /* B132L+ */
 	{ HPHW_FIO, HVERSION_REV_ANY_ID, 0x03B, 0x0008C }, /* C1xx/C1xxL */
 	{ HPHW_FIO, HVERSION_REV_ANY_ID, 0x03C, 0x0008C }, /* B132L */
 	{ HPHW_FIO, HVERSION_REV_ANY_ID, 0x03D, 0x0008C }, /* B160L */
 	{ HPHW_FIO, HVERSION_REV_ANY_ID, 0x03E, 0x0008C }, /* B132L+ */
 	{ HPHW_FIO, HVERSION_REV_ANY_ID, 0x03F, 0x0008C }, /* B180L+ */
-	{ HPHW_FIO, HVERSION_REV_ANY_ID, 0x040, 0x0008C }, /* B132L */
-	{ HPHW_FIO, HVERSION_REV_ANY_ID, 0x041, 0x0008C }, /* B160L */
 	{ HPHW_FIO, HVERSION_REV_ANY_ID, 0x046, 0x0008C }, /* Rocky2 120 */
 	{ HPHW_FIO, HVERSION_REV_ANY_ID, 0x047, 0x0008C }, /* Rocky2 150 */
-	{ HPHW_FIO, HVERSION_REV_ANY_ID, 0x048, 0x0008C }, /* Rocky2 120 */
-	{ HPHW_FIO, HVERSION_REV_ANY_ID, 0x049, 0x0008C }, /* Rocky2 150 */
 	{ HPHW_FIO, HVERSION_REV_ANY_ID, 0x04E, 0x0008C }, /* Kiji L2 132 */
-	{ HPHW_FIO, HVERSION_REV_ANY_ID, 0x04F, 0x0008C }, /* Kiji L2 132 */
 	{ HPHW_FIO, HVERSION_REV_ANY_ID, 0x056, 0x0008C }, /* Raven+ */
-	{ HPHW_FIO, HVERSION_REV_ANY_ID, 0x05F, 0x00081 }, /* A-class 180 */
+	{ HPHW_FIO, HVERSION_REV_ANY_ID, 0x05F, 0x0008C }, /* A-class 180 */
 	{ 0 }
 };
 

-- 
Revolutions do not require corporate support.
