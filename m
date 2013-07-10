From: gnidorah@p0n4ik.tk
Subject: [PATCH] parisc: agp/parisc-agp: allow binding of user memory to the AGP GART
Date: Wed, 10 Jul 2013 10:17:43 +0400
Message-ID: <76F511EB-1172-4753-A8AC-B14497EF8121@p0n4ik.tk>
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
Content-Type: multipart/mixed; boundary="Apple-Mail=_3EF73B8B-184B-4008-9823-ADA469CEBF20"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Apple-Mail=_3EF73B8B-184B-4008-9823-ADA469CEBF20
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1251

The patch allows binding of user memory to the AGP GART=20
on systems with HP Quicksilver AGP bus. This resolves 'bind memory =
failed'=20
error seen in dmesg:

[   29.365973] [TTM] AGP Bind memory failed.
=85
[   29.367030] [drm] Forcing AGP to PCI mode=20

The system doesn't more fail to bind the memory, and hence not falling
back to the PCI mode (if other failures aren't detected).

This is just a simple write down from the following patches:
agp/amd-k7: Allow binding user memory to the AGP GART [1]
agp/hp-agp: Allow binding user memory to the AGP GART [2]

Both fixes are in upstream.

[1] https://lkml.org/lkml/2010/10/15/469
[2] http://marc.info/?l=3Dlinux-ia64&m=3D131412890819311&w=3D2


--Apple-Mail=_3EF73B8B-184B-4008-9823-ADA469CEBF20
Content-Disposition: attachment;
	filename=patch-parisc_agp_c
Content-Type: application/octet-stream;
	name="patch-parisc_agp_c"
Content-Transfer-Encoding: 7bit

diff --git a/drivers/char/agp/parisc-agp.c b/drivers/char/agp/parisc-agp.c
index 94821ab..9576fad 100644
--- a/drivers/char/agp/parisc-agp.c
+++ b/drivers/char/agp/parisc-agp.c
@@ -129,7 +129,8 @@ parisc_agp_insert_memory(struct agp_memory *mem, off_t pg_start, int type)
 	off_t j, io_pg_start;
 	int io_pg_count;
 
-	if (type != 0 || mem->type != 0) {
+	if (type != mem->type ||
+		agp_bridge->driver->agp_type_to_mask_type(agp_bridge, type)) {
 		return -EINVAL;
 	}
 
@@ -175,7 +176,8 @@ parisc_agp_remove_memory(struct agp_memory *mem, off_t pg_start, int type)
 	struct _parisc_agp_info *info = &parisc_agp_info;
 	int i, io_pg_start, io_pg_count;
 
-	if (type != 0 || mem->type != 0) {
+	if (type != mem->type ||
+		agp_bridge->driver->agp_type_to_mask_type(agp_bridge, type)) {
 		return -EINVAL;
 	}
 

--Apple-Mail=_3EF73B8B-184B-4008-9823-ADA469CEBF20--
