From: Joel Soete <joel.soete@tiscali.be>
Subject: Re: 2.6.10-pa1 compile fails
Date: Wed, 29 Dec 2004 15:38:05 +0000
Message-ID: <41D2CF5D.3020801__16765.4977449731$1416624518$gmane$org@tiscali.be>
References: <Pine.LNX.4.21.0412291312230.15774-100000@hal.pp.fishpool.fi>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="------------000106070303090805050000"
Cc: debian-hppa@lists.debian.org,
 parisc-linux@parisc-linux.org
To: =?ISO-8859-1?Q?Martin-=C9ric_Racine?= <q-funk@iki.fi>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <Pine.LNX.4.21.0412291312230.15774-100000@hal.pp.fishpool.fi>
Resent-Message-ID: <3xJAFC.A.EQD.g9s0BB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

This is a multi-part message in MIME format.
--------------000106070303090805050000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit



Martin-Éric Racine wrote:

>Feel free to forward to the PA-RISC kernel mailing list:
>
>drivers/parport/parport_gsc.c: In function `parport_gsc_write_control':
>drivers/parport/parport_gsc.c:175: sorry, unimplemented: inlining failed in call
>to 'parport_gsc_data_reverse': redefined extern inline functions are not
>considered for inlining
>drivers/parport/parport_gsc.c:112: sorry, unimplemented: called from here
>make[3]: *** [drivers/parport/parport_gsc.o] Error 1
>make[2]: *** [drivers/parport] Error 2
>make[1]: *** [drivers] Error 2
>make[1]: Leaving directory `/usr/src/linux-2.6.10'
>make: *** [stamp-build] Error 2
>
>  
>
mmm don't have such error with gcc-3.3.5.

>This makes 2.6.8.1 the last kernel I could compile, using the same tools:
>
>binutils-hppa-linux       2.15-1
>gcc-hppa-linux            3.4.1-1
>
>  
>
That said there are well something strange: parport_gsc_data_reverse() 
(and some other one) are define twice (once in 
drivers/parport/parport_gsc.c and another in 
include/asm-parisc/parport_gsc.h but fwiw foreseen like this:
[...]
/*
 * Access functions.
 *
 * Most of these aren't static because they may be used by the
 * parport_xxx_yyy macros.  extern __inline__ versions of several
 * of these are in parport_gsc.h.
 */
[...]

Even thought gcc 3.4.1 is bit outdated (3.4.3-6 now), I checked with 
this new and the pb is still the same.

a possible patch could be:
--- drivers/parport/parport_gsc.c.Orig    2004-12-29 13:11:41.371485993 
+0100
+++ drivers/parport/parport_gsc.c    2004-12-29 15:32:43.742960591 +0100
@@ -87,17 +87,6 @@
     return IRQ_HANDLED;
 }
 
-void parport_gsc_write_data(struct parport *p, unsigned char d)
-{
-    parport_writeb (d, DATA (p));
-}
-
-unsigned char parport_gsc_read_data(struct parport *p)
-{
-    unsigned char c = parport_readb (DATA (p));
-    return c;
-}
-
 void parport_gsc_write_control(struct parport *p, unsigned char d)
 {
     const unsigned char wm = (PARPORT_CONTROL_STROBE |
@@ -151,11 +140,6 @@
     return __parport_gsc_frob_control (p, mask, val);
 }
 
-unsigned char parport_gsc_read_status(struct parport *p)
-{
-    return parport_readb (STATUS (p));
-}
-
 void parport_gsc_disable_irq(struct parport *p)
 {
     __parport_gsc_frob_control (p, 0x10, 0);
@@ -166,16 +150,6 @@
     __parport_gsc_frob_control (p, 0x10, 0x10);
 }
 
-void parport_gsc_data_forward (struct parport *p)
-{
-    __parport_gsc_frob_control (p, 0x20, 0);
-}
-
-void parport_gsc_data_reverse (struct parport *p)
-{
-    __parport_gsc_frob_control (p, 0x20, 0x20);
-}
-
 void parport_gsc_init_state(struct pardevice *dev, struct parport_state *s)
 {
     s->u.pc.ctr = 0xc | (dev->irq_func ? 0x10 : 0x0);
--- include/asm-parisc/parport_gsc.h.Orig    2004-12-29 
16:17:31.110118022 +0100
+++ include/asm-parisc/parport_gsc.h    2004-12-29 16:28:34.319390619 +0100
@@ -52,7 +52,7 @@
     struct pci_dev *dev;
 };
 
-extern __inline__ void parport_gsc_write_data(struct parport *p, 
unsigned char d)
+static inline void parport_gsc_write_data(struct parport *p, unsigned 
char d)
 {
 #ifdef DEBUG_PARPORT
     printk (KERN_DEBUG "parport_gsc_write_data(%p,0x%02x)\n", p, d);
@@ -60,7 +60,7 @@
     parport_writeb(d, DATA(p));
 }
 
-extern __inline__ unsigned char parport_gsc_read_data(struct parport *p)
+static inline unsigned char parport_gsc_read_data(struct parport *p)
 {
     unsigned char val = parport_readb (DATA (p));
 #ifdef DEBUG_PARPORT
@@ -90,12 +90,12 @@
     return ctr;
 }
 
-extern __inline__ void parport_gsc_data_reverse (struct parport *p)
+static inline void parport_gsc_data_reverse (struct parport *p)
 {
     __parport_gsc_frob_control (p, 0x20, 0x20);
 }
 
-extern __inline__ void parport_gsc_data_forward (struct parport *p)
+static inline void parport_gsc_data_forward (struct parport *p)
 {
     __parport_gsc_frob_control (p, 0x20, 0x00);
 }
@@ -155,7 +155,7 @@
     return __parport_gsc_frob_control (p, mask, val);
 }
 
-extern __inline__ unsigned char parport_gsc_read_status(struct parport *p)
+static inline unsigned char parport_gsc_read_status(struct parport *p)
 {
     return parport_readb (STATUS(p));
 }
=========><=========

Can you test it for me?

Joel

PS: In case of bad wraping I also attached patch files :-)



--------------000106070303090805050000
Content-Type: text/plain;
 name="include_asm-parisc_parport_gsc.h.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="include_asm-parisc_parport_gsc.h.diff"

--- include/asm-parisc/parport_gsc.h.Orig	2004-12-29 16:17:31.110118022 +0100
+++ include/asm-parisc/parport_gsc.h	2004-12-29 16:28:34.319390619 +0100
@@ -52,7 +52,7 @@
 	struct pci_dev *dev;
 };
 
-extern __inline__ void parport_gsc_write_data(struct parport *p, unsigned char d)
+static inline void parport_gsc_write_data(struct parport *p, unsigned char d)
 {
 #ifdef DEBUG_PARPORT
 	printk (KERN_DEBUG "parport_gsc_write_data(%p,0x%02x)\n", p, d);
@@ -60,7 +60,7 @@
 	parport_writeb(d, DATA(p));
 }
 
-extern __inline__ unsigned char parport_gsc_read_data(struct parport *p)
+static inline unsigned char parport_gsc_read_data(struct parport *p)
 {
 	unsigned char val = parport_readb (DATA (p));
 #ifdef DEBUG_PARPORT
@@ -90,12 +90,12 @@
 	return ctr;
 }
 
-extern __inline__ void parport_gsc_data_reverse (struct parport *p)
+static inline void parport_gsc_data_reverse (struct parport *p)
 {
 	__parport_gsc_frob_control (p, 0x20, 0x20);
 }
 
-extern __inline__ void parport_gsc_data_forward (struct parport *p)
+static inline void parport_gsc_data_forward (struct parport *p)
 {
 	__parport_gsc_frob_control (p, 0x20, 0x00);
 }
@@ -155,7 +155,7 @@
 	return __parport_gsc_frob_control (p, mask, val);
 }
 
-extern __inline__ unsigned char parport_gsc_read_status(struct parport *p)
+static inline unsigned char parport_gsc_read_status(struct parport *p)
 {
 	return parport_readb (STATUS(p));
 }

--------------000106070303090805050000
Content-Type: text/plain;
 name="drivers_parport_parport_gsc.c.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="drivers_parport_parport_gsc.c.diff"

--- drivers/parport/parport_gsc.c.Orig	2004-12-29 13:11:41.371485993 +0100
+++ drivers/parport/parport_gsc.c	2004-12-29 15:32:43.742960591 +0100
@@ -87,17 +87,6 @@
 	return IRQ_HANDLED;
 }
 
-void parport_gsc_write_data(struct parport *p, unsigned char d)
-{
-	parport_writeb (d, DATA (p));
-}
-
-unsigned char parport_gsc_read_data(struct parport *p)
-{
-	unsigned char c = parport_readb (DATA (p));
-	return c;
-}
-
 void parport_gsc_write_control(struct parport *p, unsigned char d)
 {
 	const unsigned char wm = (PARPORT_CONTROL_STROBE |
@@ -151,11 +140,6 @@
 	return __parport_gsc_frob_control (p, mask, val);
 }
 
-unsigned char parport_gsc_read_status(struct parport *p)
-{
-	return parport_readb (STATUS (p));
-}
-
 void parport_gsc_disable_irq(struct parport *p)
 {
 	__parport_gsc_frob_control (p, 0x10, 0);
@@ -166,16 +150,6 @@
 	__parport_gsc_frob_control (p, 0x10, 0x10);
 }
 
-void parport_gsc_data_forward (struct parport *p)
-{
-	__parport_gsc_frob_control (p, 0x20, 0);
-}
-
-void parport_gsc_data_reverse (struct parport *p)
-{
-	__parport_gsc_frob_control (p, 0x20, 0x20);
-}
--------------000106070303090805050000--
