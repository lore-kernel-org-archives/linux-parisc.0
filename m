From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] 53c700.h backport (solve: use cast of expressions as
	lvalue...)
Date: Thu, 19 Aug 2004 09:30:13 +0000
Message-ID: <412135A800001B16@ocpmta3.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-1"
To: James.Bottomley@steeleye.com,
 "List Parisc" <parisc-linux@parisc-linux.org>
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

Hello James,

Here is a small patch backport stuff into 53c700.h to cleanup warning: us=
e
cast of expressions as lvalue is deprecated)

diff -NaurX ../dontdiff linux-2.4.27-pa1/drivers/scsi/53c700.h linux-2.4.=
27-rc4-pa7MM/drivers/scsi/53c700.h
--- linux-2.4.27-pa1/drivers/scsi/53c700.h	2002-06-06 09:55:58.000000000
+0200
+++ linux-2.4.27-rc4-pa7MM/drivers/scsi/53c700.h	2004-07-07 13:41:03.0000=
00000
+0200
@@ -109,18 +109,25 @@
 static inline void
 NCR_700_set_SXFER(Scsi_Device *SDp, __u8 sxfer)
 {
-	((unsigned long)SDp->hostdata) &=3D 0xffffff00;
-	((unsigned long)SDp->hostdata) |=3D sxfer & 0xff;
+	unsigned long l =3D (unsigned long)SDp->hostdata;
+
+	l &=3D 0xffffff00;
+	l |=3D sxfer & 0xff;
+	SDp->hostdata =3D (void *)l;
 }
-static inline __u8 NCR_700_get_SXFER(Scsi_Device *SDp)
+static inline __u8
+NCR_700_get_SXFER(Scsi_Device *SDp)
 {
 	return (((unsigned long)SDp->hostdata) & 0xff);
 }
 static inline void
 NCR_700_set_depth(Scsi_Device *SDp, __u8 depth)
 {
-	((unsigned long)SDp->hostdata) &=3D 0xffff00ff;
-	((unsigned long)SDp->hostdata) |=3D (0xff00 & (depth << 8));
+	unsigned long l =3D (unsigned long)SDp->hostdata;
+
+	l &=3D 0xffff00ff;
+	l |=3D (0xff00 & (depth << 8));
+	SDp->hostdata =3D (void *)l;
 }
 static inline __u8
 NCR_700_get_depth(Scsi_Device *SDp)
@@ -140,12 +147,18 @@
 static inline void
 NCR_700_set_flag(Scsi_Device *SDp, __u32 flag)
 {
-	((unsigned long)SDp->hostdata) |=3D (flag & 0xffff0000);
+	unsigned long l =3D (unsigned long)SDp->hostdata;
+
+	l |=3D (flag & 0xffff0000);
+	SDp->hostdata =3D (void *)l;
 }
 static inline void
 NCR_700_clear_flag(Scsi_Device *SDp, __u32 flag)
 {
-	((unsigned long)SDp->hostdata) &=3D ~(flag & 0xffff0000);
+	unsigned long l =3D (unsigned long)SDp->hostdata;
+
+	l &=3D ~(flag & 0xffff0000);
+	SDp->hostdata =3D (void *)l;
 }
 
 /* These represent the Nexus hashing functions.  A Nexus in SCSI terms
=3D=3D=3D=3D=3D=3D=3D=3D=3D><=3D=3D=3D=3D=3D=3D=3D=3D=3D

mmm just a small diff versus your 2.6: I choose l (ell) as 'unsigned long=
'
because afaik hostdata is a 'void *'

Please advise.

Joel

PS: If ok can you ci for me (no ci access to cvs) ;)
 

-------------------------------------------------------------------------=
--
Tiscali ADSL LIGHT, 19,95 EUR/mois pendant 6 mois, c'est le moment de fai=
re
le pas!
http://reg.tiscali.be/default.asp?lg=3Dfr




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
