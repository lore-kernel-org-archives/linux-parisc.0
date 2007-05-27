From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] [PATCH] [PARISC] fix section mismatch in parisc eisa
	driver
Date: Sun, 27 May 2007 19:57:11 +0200
Message-ID: <200705271957.11716.deller__4512.20432664758$1416624369$gmane$org@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
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

Hi Kyle,

this patch fixes the following section mismatch (EISA cards should be hotplug aware, but the EISA bus itself shouldn't):
WARNING: drivers/built-in.o(.text.eisa_probe+0x220): Section mismatch: reference to .init.text:eisa_root_register (after 'eisa_probe')

Please apply, 
Helge

    Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/parisc/eisa.c b/drivers/parisc/eisa.c
index 309076b..771cef5 100644
--- a/drivers/parisc/eisa.c
+++ b/drivers/parisc/eisa.c
@@ -307,7 +307,7 @@ static void init_eisa_pic(void)
 
 #define is_mongoose(dev) (dev->id.sversion == 0x00076)
 
-static int __devinit eisa_probe(struct parisc_device *dev)
+static int __init eisa_probe(struct parisc_device *dev)
 {
 	int i, result;
 
@@ -387,7 +387,7 @@ static int __devinit eisa_probe(struct p
 	return 0;
 }
 
-static struct parisc_device_id eisa_tbl[] = {
+static const struct parisc_device_id eisa_tbl[] = {
 	{ HPHW_BA, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x00076 }, /* Mongoose */
 	{ HPHW_BA, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x00090 }, /* Wax EISA */
 	{ 0, }
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
