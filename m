From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] Cast of lvalue warning in the last k 2.4.27-rc2 ...
Date: Tue, 29 Jun 2004 16:00:56 +0200
Message-ID: <40BDA020000122B5@ocpmta3.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-1"
Cc: parisc-linux@parisc-linux.org
To: "James Bottomley" <jejb@parisc-linux.org>
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

If still some interest for 2.4 I just backport some 2.6 stuff for your dr=
iver
53c700 to cleanup '... lvalues is deprecated warning':
--- linux-2.4.27-rc2-pa4mm/drivers/scsi/53c700.h.Orig	2004-06-29 10:24:01=
.766864352
+0200
+++ linux-2.4.27-rc2-pa4mm/drivers/scsi/53c700.h	2004-06-29 10:30:27.6472=
01624
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

hth,
    Joel

PS: btw I also have similar small patches for upstream (crc32.c, readdir.=
c,
fbcon.c, ...). Do you know who can help me to submit it to Marcelo (I alr=
eady
try directly but no audience $) )

-------------------------------------------------------------------------=
--
NEW: Tiscali ADSL LIGHT, 28,95 EUR/mois, c'est le moment de faire le pas!=

http://reg.tiscali.be/default.asp?lg=3Dfr




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
