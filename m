Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 26987482E
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Dec 2002 00:12:52 -0700 (MST)
Date: Tue, 17 Dec 2002 08:12:03 +0100
Message-ID: <3DED9BBD0000213A@ocpmta7.freegates.net>
In-Reply-To: <20021216231132.GC854@dsl2.external.hp.com>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] quad tulip now not functional in 2.4.20
To: grundler@dsl2.external.hp.com,
	"Ed Schaller" <schallee@darkmist.net>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=========3DED9BBD0000213A/mail.tiscali.be"
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

--=========3DED9BBD0000213A/mail.tiscali.be
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

>
>I suspect it's a tulip driver bug.
>I haven't had a chance to diff the 2.4.19 vs 2.4.20 tulip driver.
>One idea might be to "forward port" the 2.4.19 drivers/net/tulip code
>into 2.4.20.
>
Just to avoid you loose time here is a diff:
diff -NaurX dontdiff linux-2.4.19-pa24/drivers/net/tulip/ChangeLog linux-=
2.4.20-pa14/drivers/net/tulip/ChangeLog
--- linux-2.4.19-pa24/drivers/net/tulip/ChangeLog	2002-08-03 02:39:44.000=
000000
+0200
+++ linux-2.4.20-pa14/drivers/net/tulip/ChangeLog	2002-11-18 09:09:41.000=
000000
+0100
@@ -1,3 +1,14 @@
+2002-09-18  Ryan Bradetich  <rbradetich@uswest.net>
+
+	tulip hppa support:
+	* eeprom.c (tulip_build_fake_mediatable): new function
+	(tulip_parse_eeprom): call it, when no media table
+	* interrupt.c (phy_interrupt): new function
+	(tulip_interrupt): call it, before checking for no-irq-work
+	* tulip.c: add HAS_PHY_IRQ chip feature flag.
+	add csr12_shadow to tulip_private struct, only for hppa currently.
+	* tulip_core (tulip_init_one): support hppa wonky eeproms
+
 2002-05-11  Juan Quintela  <quintela@mandrakesoft.com>
 
 	* 21142.c (t21142_lnk_change): Revert earlier patch
diff -NaurX dontdiff linux-2.4.19-pa24/drivers/net/tulip/eeprom.c linux-2=
.4.20-pa14/drivers/net/tulip/eeprom.c
--- linux-2.4.19-pa24/drivers/net/tulip/eeprom.c	2002-11-28 12:41:36.0000=
00000
+0100
+++ linux-2.4.20-pa14/drivers/net/tulip/eeprom.c	2002-11-18 09:09:41.0000=
00000
+0100
@@ -190,7 +190,7 @@
 	}
 subsequent_board:
 
-	if (ee_data[27] =3D=3D 0) {		/* No valid media table. */
+	if (ee_data[27] =3D=3D 0 || ee_data[ee_data[27]] =3D=3D 0) {  /* No val=
id media
table. */
 		tulip_build_fake_mediatable(tp);
 	} else if (tp->chip_id =3D=3D DC21041) {
 		unsigned char *p =3D (void *)ee_data + ee_data[27 + controller_index*3=
];
diff -NaurX dontdiff linux-2.4.19-pa24/drivers/net/tulip/tulip.h linux-2.=
4.20-pa14/drivers/net/tulip/tulip.h
--- linux-2.4.19-pa24/drivers/net/tulip/tulip.h	2002-11-28 12:41:36.00000=
0000
+0100
+++ linux-2.4.20-pa14/drivers/net/tulip/tulip.h	2002-11-18 09:09:41.00000=
0000
+0100
@@ -63,7 +63,7 @@
 	HAS_8023X		=3D 0x0400,
 	COMET_MAC_ADDR		=3D 0x0800,
 	HAS_PCI_MWI		=3D 0x1000,
-        HAS_PHY_IRQ             =3D 0x2000,
+	HAS_PHY_IRQ		=3D 0x2000,
 };
 
 
@@ -85,6 +85,7 @@
 	COMPEX9881,
 	I21145,
 	DM910X,
+	CONEXANT,
 };
 
 
diff -NaurX dontdiff linux-2.4.19-pa24/drivers/net/tulip/tulip_core.c lin=
ux-2.4.20-pa14/drivers/net/tulip/tulip_core.c
--- linux-2.4.19-pa24/drivers/net/tulip/tulip_core.c	2002-11-28 12:41:36.=
000000000
+0100
+++ linux-2.4.20-pa14/drivers/net/tulip/tulip_core.c	2002-11-18 09:09:41.=
000000000
+0100
@@ -15,8 +15,8 @@
 */
 
 #define DRV_NAME	"tulip"
-#define DRV_VERSION	"0.9.15-pre11"
-#define DRV_RELDATE	"May 11, 2002"
+#define DRV_VERSION	"0.9.15-pre12"
+#define DRV_RELDATE	"Aug 9, 2002"
 
 #include <linux/config.h>
 #include <linux/module.h>
@@ -191,6 +191,10 @@
   { "Davicom DM9102/DM9102A", 128, 0x0001ebef,
 	HAS_MII | HAS_MEDIA_TABLE | CSR12_IN_SROM | HAS_ACPI,
 	tulip_timer },
+
+  /* CONEXANT */
+  {	"Conexant LANfinity", 256, 0x0001ebef,
+	HAS_MII, tulip_timer },
 };
 
 
@@ -214,6 +218,7 @@
 	{ 0x13D1, 0xAB08, PCI_ANY_ID, PCI_ANY_ID, 0, 0, COMET },
 	{ 0x104A, 0x0981, PCI_ANY_ID, PCI_ANY_ID, 0, 0, COMET },
 	{ 0x104A, 0x2774, PCI_ANY_ID, PCI_ANY_ID, 0, 0, COMET },
+	{ 0x1259, 0xa120, PCI_ANY_ID, PCI_ANY_ID, 0, 0, COMET },
 	{ 0x11F6, 0x9881, PCI_ANY_ID, PCI_ANY_ID, 0, 0, COMPEX9881 },
 	{ 0x8086, 0x0039, PCI_ANY_ID, PCI_ANY_ID, 0, 0, I21145 },
 	{ 0x1282, 0x9100, PCI_ANY_ID, PCI_ANY_ID, 0, 0, DM910X },
@@ -221,6 +226,10 @@
 	{ 0x1113, 0x1216, PCI_ANY_ID, PCI_ANY_ID, 0, 0, COMET },
 	{ 0x1113, 0x1217, PCI_ANY_ID, PCI_ANY_ID, 0, 0, MX98715 },
 	{ 0x1113, 0x9511, PCI_ANY_ID, PCI_ANY_ID, 0, 0, COMET },
+	{ 0x1186, 0x1561, PCI_ANY_ID, PCI_ANY_ID, 0, 0, COMET },
+	{ 0x1626, 0x8410, PCI_ANY_ID, PCI_ANY_ID, 0, 0, COMET },
+	{ 0x1737, 0xAB09, PCI_ANY_ID, PCI_ANY_ID, 0, 0, COMET },
+	{ 0x14f1, 0x1803, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CONEXANT },
 	{ } /* terminate list */
 };
 MODULE_DEVICE_TABLE(pci, tulip_pci_tbl);
@@ -453,7 +462,7 @@
 		tp->csr6 =3D 0x01a80200;
 		outl(0x0f370000 | inw(ioaddr + 0x80), ioaddr + 0x80);
 		outl(0x11000 | inw(ioaddr + 0xa0), ioaddr + 0xa0);
-	} else if (tp->chip_id =3D=3D COMET) {
+	} else if (tp->chip_id =3D=3D COMET || tp->chip_id =3D=3D CONEXANT) {
 		/* Enable automatic Tx underrun recovery. */
 		outl(inl(ioaddr + 0x88) | 1, ioaddr + 0x88);
 		dev->if_port =3D tp->mii_cnt ? 11 : 0;
@@ -1474,7 +1483,6 @@
 	tp->timer.function =3D tulip_tbl[tp->chip_id].media_timer;
 
 	dev->base_addr =3D ioaddr;
-	dev->irq =3D irq;
 
 #ifdef CONFIG_TULIP_MWI
 	if (!force_csr0 && (tp->flags & HAS_PCI_MWI))
@@ -1548,7 +1556,13 @@
 		for (i =3D 0; i < 8; i ++)
 			if (ee_data[i] !=3D ee_data[16+i])
 				sa_offset =3D 20;
-		if (ee_data[0] =3D=3D 0xff  &&  ee_data[1] =3D=3D 0xff &&  ee_data[2] =
=3D=3D 0) {
+		if (chip_idx =3D=3D CONEXANT) {
+		    /* Check that the tuple type and length is correct. */
+			if (ee_data[0x198] =3D=3D 0x04  &&  ee_data[0x199] =3D=3D 6)
+			    sa_offset =3D 0x19A;
+		}
+		if (ee_data[0] =3D=3D 0xff && ee_data[1] =3D=3D 0xff &&
+		    ee_data[2] =3D=3D 0) {
 			sa_offset =3D 2;		/* Grrr, damn Matrox boards. */
 			multiport_cnt =3D 4;
 		}
@@ -1641,6 +1655,7 @@
 	for (i =3D 0; i < 6; i++)
 		last_phys_addr[i] =3D dev->dev_addr[i];http://webmail.tiscali.be/mail/=
MessageReplyAll?sid=3DDBE10C1646FA3872D205B9CC28640282AD467BC4&userid=3Dj=
soe0708@tiscali.be&seq=3DC&auth=3D01RVNMIUMKQMZQKW&srcfolder=3DINBOX&uid=3D=
3182&style=3Dfrans&abcompose=3D0
:: options avanc=E9es
 	last_irq =3D irq;
+	dev->irq =3D irq;
 
 	/* The lower four bits are the media type. */
 	if (board_idx >=3D 0  &&  board_idx < MAX_UNITS) {


(I have well a second interface on my b2k but never use it. I will try an=
d
try to revert this diff.)

hph,
    Joel

*************************************************************************=
*******
Controlez mieux votre consommation Internet...surfez Tiscali Complete...h=
ttp://tiscali.complete.be




--=========3DED9BBD0000213A/mail.tiscali.be
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="Tulip_2.4.19-2.4.20.diff"

ZGlmZiAtTmF1clggZG9udGRpZmYgbGludXgtMi40LjE5LXBhMjQvZHJpdmVycy9uZXQvdHVsaXAv
Q2hhbmdlTG9nIGxpbnV4LTIuNC4yMC1wYTE0L2RyaXZlcnMvbmV0L3R1bGlwL0NoYW5nZUxvZwot
LS0gbGludXgtMi40LjE5LXBhMjQvZHJpdmVycy9uZXQvdHVsaXAvQ2hhbmdlTG9nCTIwMDItMDgt
MDMgMDI6Mzk6NDQuMDAwMDAwMDAwICswMjAwCisrKyBsaW51eC0yLjQuMjAtcGExNC9kcml2ZXJz
L25ldC90dWxpcC9DaGFuZ2VMb2cJMjAwMi0xMS0xOCAwOTowOTo0MS4wMDAwMDAwMDAgKzAxMDAK
QEAgLTEsMyArMSwxNCBAQAorMjAwMi0wOS0xOCAgUnlhbiBCcmFkZXRpY2ggIDxyYnJhZGV0aWNo
QHVzd2VzdC5uZXQ+CisKKwl0dWxpcCBocHBhIHN1cHBvcnQ6CisJKiBlZXByb20uYyAodHVsaXBf
YnVpbGRfZmFrZV9tZWRpYXRhYmxlKTogbmV3IGZ1bmN0aW9uCisJKHR1bGlwX3BhcnNlX2VlcHJv
bSk6IGNhbGwgaXQsIHdoZW4gbm8gbWVkaWEgdGFibGUKKwkqIGludGVycnVwdC5jIChwaHlfaW50
ZXJydXB0KTogbmV3IGZ1bmN0aW9uCisJKHR1bGlwX2ludGVycnVwdCk6IGNhbGwgaXQsIGJlZm9y
ZSBjaGVja2luZyBmb3Igbm8taXJxLXdvcmsKKwkqIHR1bGlwLmM6IGFkZCBIQVNfUEhZX0lSUSBj
aGlwIGZlYXR1cmUgZmxhZy4KKwlhZGQgY3NyMTJfc2hhZG93IHRvIHR1bGlwX3ByaXZhdGUgc3Ry
dWN0LCBvbmx5IGZvciBocHBhIGN1cnJlbnRseS4KKwkqIHR1bGlwX2NvcmUgKHR1bGlwX2luaXRf
b25lKTogc3VwcG9ydCBocHBhIHdvbmt5IGVlcHJvbXMKKwogMjAwMi0wNS0xMSAgSnVhbiBRdWlu
dGVsYSAgPHF1aW50ZWxhQG1hbmRyYWtlc29mdC5jb20+CiAKIAkqIDIxMTQyLmMgKHQyMTE0Ml9s
bmtfY2hhbmdlKTogUmV2ZXJ0IGVhcmxpZXIgcGF0Y2gKZGlmZiAtTmF1clggZG9udGRpZmYgbGlu
dXgtMi40LjE5LXBhMjQvZHJpdmVycy9uZXQvdHVsaXAvZWVwcm9tLmMgbGludXgtMi40LjIwLXBh
MTQvZHJpdmVycy9uZXQvdHVsaXAvZWVwcm9tLmMKLS0tIGxpbnV4LTIuNC4xOS1wYTI0L2RyaXZl
cnMvbmV0L3R1bGlwL2VlcHJvbS5jCTIwMDItMTEtMjggMTI6NDE6MzYuMDAwMDAwMDAwICswMTAw
CisrKyBsaW51eC0yLjQuMjAtcGExNC9kcml2ZXJzL25ldC90dWxpcC9lZXByb20uYwkyMDAyLTEx
LTE4IDA5OjA5OjQxLjAwMDAwMDAwMCArMDEwMApAQCAtMTkwLDcgKzE5MCw3IEBACiAJfQogc3Vi
c2VxdWVudF9ib2FyZDoKIAotCWlmIChlZV9kYXRhWzI3XSA9PSAwKSB7CQkvKiBObyB2YWxpZCBt
ZWRpYSB0YWJsZS4gKi8KKwlpZiAoZWVfZGF0YVsyN10gPT0gMCB8fCBlZV9kYXRhW2VlX2RhdGFb
MjddXSA9PSAwKSB7ICAvKiBObyB2YWxpZCBtZWRpYSB0YWJsZS4gKi8KIAkJdHVsaXBfYnVpbGRf
ZmFrZV9tZWRpYXRhYmxlKHRwKTsKIAl9IGVsc2UgaWYgKHRwLT5jaGlwX2lkID09IERDMjEwNDEp
IHsKIAkJdW5zaWduZWQgY2hhciAqcCA9ICh2b2lkICopZWVfZGF0YSArIGVlX2RhdGFbMjcgKyBj
b250cm9sbGVyX2luZGV4KjNdOwpkaWZmIC1OYXVyWCBkb250ZGlmZiBsaW51eC0yLjQuMTktcGEy
NC9kcml2ZXJzL25ldC90dWxpcC90dWxpcC5oIGxpbnV4LTIuNC4yMC1wYTE0L2RyaXZlcnMvbmV0
L3R1bGlwL3R1bGlwLmgKLS0tIGxpbnV4LTIuNC4xOS1wYTI0L2RyaXZlcnMvbmV0L3R1bGlwL3R1
bGlwLmgJMjAwMi0xMS0yOCAxMjo0MTozNi4wMDAwMDAwMDAgKzAxMDAKKysrIGxpbnV4LTIuNC4y
MC1wYTE0L2RyaXZlcnMvbmV0L3R1bGlwL3R1bGlwLmgJMjAwMi0xMS0xOCAwOTowOTo0MS4wMDAw
MDAwMDAgKzAxMDAKQEAgLTYzLDcgKzYzLDcgQEAKIAlIQVNfODAyM1gJCT0gMHgwNDAwLAogCUNP
TUVUX01BQ19BRERSCQk9IDB4MDgwMCwKIAlIQVNfUENJX01XSQkJPSAweDEwMDAsCi0gICAgICAg
IEhBU19QSFlfSVJRICAgICAgICAgICAgID0gMHgyMDAwLAorCUhBU19QSFlfSVJRCQk9IDB4MjAw
MCwKIH07CiAKIApAQCAtODUsNiArODUsNyBAQAogCUNPTVBFWDk4ODEsCiAJSTIxMTQ1LAogCURN
OTEwWCwKKwlDT05FWEFOVCwKIH07CiAKIApkaWZmIC1OYXVyWCBkb250ZGlmZiBsaW51eC0yLjQu
MTktcGEyNC9kcml2ZXJzL25ldC90dWxpcC90dWxpcF9jb3JlLmMgbGludXgtMi40LjIwLXBhMTQv
ZHJpdmVycy9uZXQvdHVsaXAvdHVsaXBfY29yZS5jCi0tLSBsaW51eC0yLjQuMTktcGEyNC9kcml2
ZXJzL25ldC90dWxpcC90dWxpcF9jb3JlLmMJMjAwMi0xMS0yOCAxMjo0MTozNi4wMDAwMDAwMDAg
KzAxMDAKKysrIGxpbnV4LTIuNC4yMC1wYTE0L2RyaXZlcnMvbmV0L3R1bGlwL3R1bGlwX2NvcmUu
YwkyMDAyLTExLTE4IDA5OjA5OjQxLjAwMDAwMDAwMCArMDEwMApAQCAtMTUsOCArMTUsOCBAQAog
Ki8KIAogI2RlZmluZSBEUlZfTkFNRQkidHVsaXAiCi0jZGVmaW5lIERSVl9WRVJTSU9OCSIwLjku
MTUtcHJlMTEiCi0jZGVmaW5lIERSVl9SRUxEQVRFCSJNYXkgMTEsIDIwMDIiCisjZGVmaW5lIERS
Vl9WRVJTSU9OCSIwLjkuMTUtcHJlMTIiCisjZGVmaW5lIERSVl9SRUxEQVRFCSJBdWcgOSwgMjAw
MiIKIAogI2luY2x1ZGUgPGxpbnV4L2NvbmZpZy5oPgogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5o
PgpAQCAtMTkxLDYgKzE5MSwxMCBAQAogICB7ICJEYXZpY29tIERNOTEwMi9ETTkxMDJBIiwgMTI4
LCAweDAwMDFlYmVmLAogCUhBU19NSUkgfCBIQVNfTUVESUFfVEFCTEUgfCBDU1IxMl9JTl9TUk9N
IHwgSEFTX0FDUEksCiAJdHVsaXBfdGltZXIgfSwKKworICAvKiBDT05FWEFOVCAqLworICB7CSJD
b25leGFudCBMQU5maW5pdHkiLCAyNTYsIDB4MDAwMWViZWYsCisJSEFTX01JSSwgdHVsaXBfdGlt
ZXIgfSwKIH07CiAKIApAQCAtMjE0LDYgKzIxOCw3IEBACiAJeyAweDEzRDEsIDB4QUIwOCwgUENJ
X0FOWV9JRCwgUENJX0FOWV9JRCwgMCwgMCwgQ09NRVQgfSwKIAl7IDB4MTA0QSwgMHgwOTgxLCBQ
Q0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLCBDT01FVCB9LAogCXsgMHgxMDRBLCAweDI3NzQs
IFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAsIENPTUVUIH0sCisJeyAweDEyNTksIDB4YTEy
MCwgUENJX0FOWV9JRCwgUENJX0FOWV9JRCwgMCwgMCwgQ09NRVQgfSwKIAl7IDB4MTFG
NiwgMHg5ODgxLCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLCBDT01QRVg5ODgxIH0sCiAJ
eyAweDgwODYsIDB4MDAzOSwgUENJX0FOWV9JRCwgUENJX0FOWV9JRCwgMCwgMCwgSTIxMTQ1IH0s
CiAJeyAweDEyODIsIDB4OTEwMCwgUENJX0FOWV9JRCwgUENJX0FOWV9JRCwgMCwgMCwgRE05MTBY
IH0sCkBAIC0yMjEsNiArMjI2LDEwIEBACiAJeyAweDExMTMsIDB4MTIxNiwgUENJX0FOWV9JRCwg
UENJX0FOWV9JRCwgMCwgMCwgQ09NRVQgfSwKIAl7IDB4MTExMywgMHgxMjE3LCBQQ0lfQU5ZX0lE
LCBQQ0lfQU5ZX0lELCAwLCAwLCBNWDk4NzE1IH0sCiAJeyAweDExMTMsIDB4OTUxMSwgUENJX0FO
WV9JRCwgUENJX0FOWV9JRCwgMCwgMCwgQ09NRVQgfSwKKwl7IDB4MTE4NiwgMHgxNTYxLCBQQ0lf
QU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLCBDT01FVCB9LAorCXsgMHgxNjI2LCAweDg0MTAsIFBD
SV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAsIENPTUVUIH0sCisJeyAweDE3MzcsIDB4QUIwOSwg
UENJX0FOWV9JRCwgUENJX0FOWV9JRCwgMCwgMCwgQ09NRVQgfSwKKwl7IDB4MTRmMSwgMHgxODAz
LCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLCBDT05FWEFOVCB9LAogCXsgfSAvKiB0ZXJt
aW5hdGUgbGlzdCAqLwogfTsKIE1PRFVMRV9ERVZJQ0VfVEFCTEUocGNpLCB0dWxpcF9wY2lfdGJs
KTsKQEAgLTQ1Myw3ICs0NjIsNyBAQAogCQl0cC0+Y3NyNiA9IDB4MDFhODAyMDA7CiAJCW91dGwo
MHgwZjM3MDAwMCB8IGludyhpb2FkZHIgKyAweDgwKSwgaW9hZGRyICsgMHg4MCk7CiAJCW91dGwo
MHgxMTAwMCB8IGludyhpb2FkZHIgKyAweGEwKSwgaW9hZGRyICsgMHhhMCk7Ci0JfSBlbHNlIGlm
ICh0cC0+Y2hpcF9pZCA9PSBDT01FVCkgeworCX0gZWxzZSBpZiAodHAtPmNoaXBfaWQgPT0gQ09N
RVQgfHwgdHAtPmNoaXBfaWQgPT0gQ09ORVhBTlQpIHsKIAkJLyogRW5hYmxlIGF1dG9tYXRpYyBU
eCB1bmRlcnJ1biByZWNvdmVyeS4gKi8KIAkJb3V0bChpbmwoaW9hZGRyICsgMHg4OCkgfCAxLCBp
b2FkZHIgKyAweDg4KTsKIAkJZGV2LT5pZl9wb3J0ID0gdHAtPm1paV9jbnQgPyAxMSA6IDA7CkBA
IC0xNDc0LDcgKzE0ODMsNiBAQAogCXRwLT50aW1lci5mdW5jdGlvbiA9IHR1bGlwX3RibFt0cC0+
Y2hpcF9pZF0ubWVkaWFfdGltZXI7CiAKIAlkZXYtPmJhc2VfYWRkciA9IGlvYWRkcjsKLQlkZXYt
PmlycSA9IGlycTsKIAogI2lmZGVmIENPTkZJR19UVUxJUF9NV0kKIAlpZiAoIWZvcmNlX2NzcjAg
JiYgKHRwLT5mbGFncyAmIEhBU19QQ0lfTVdJKSkKQEAgLTE1NDgsNyArMTU1NiwxMyBAQAogCQlm
b3IgKGkgPSAwOyBpIDwgODsgaSArKykKIAkJCWlmIChlZV9kYXRhW2ldICE9IGVlX2RhdGFbMTYr
aV0pCiAJCQkJc2Ffb2Zmc2V0ID0gMjA7Ci0JCWlmIChlZV9kYXRhWzBdID09IDB4ZmYgICYmICBl
ZV9kYXRhWzFdID09IDB4ZmYgJiYgIGVlX2RhdGFbMl0gPT0gMCkgeworCQlpZiAoY2hpcF9pZHgg
PT0gQ09ORVhBTlQpIHsKKwkJICAgIC8qIENoZWNrIHRoYXQgdGhlIHR1cGxlIHR5cGUgYW5kIGxl
bmd0aCBpcyBjb3JyZWN0LiAqLworCQkJaWYgKGVlX2RhdGFbMHgxOThdID09IDB4MDQgICYmICBl
ZV9kYXRhWzB4MTk5XSA9PSA2KQorCQkJICAgIHNhX29mZnNldCA9IDB4MTlBOworCQl9CisJCWlm
IChlZV9kYXRhWzBdID09IDB4ZmYgJiYgZWVfZGF0YVsxXSA9PSAweGZmICYmCisJCSAgICBlZV9k
YXRhWzJdID09IDApIHsKIAkJCXNhX29mZnNldCA9IDI7CQkvKiBHcnJyLCBkYW1uIE1hdHJveCBi
b2FyZHMuICovCiAJCQltdWx0aXBvcnRfY250ID0gNDsKIAkJfQpAQCAtMTY0MSw2ICsxNjU1LDcg
QEAKIAlmb3IgKGkgPSAwOyBpIDwgNjsgaSsrKQogCQlsYXN0X3BoeXNfYWRkcltpXSA9IGRldi0+
ZGV2X2FkZHJbaV07CiAJbGFzdF9pcnEgPSBpcnE7CisJZGV2LT5pcnEgPSBpcnE7CiAKIAkvKiBU
aGUgbG93ZXIgZm91ciBiaXRzIGFyZSB0aGUgbWVkaWEgdHlwZS4gKi8KIAlpZiAoYm9hcmRfaWR4
ID49IDAgICYmICBib2FyZF9pZHggPCBNQVhfVU5JVFMpIHsK

--=========3DED9BBD0000213A/mail.tiscali.be--
