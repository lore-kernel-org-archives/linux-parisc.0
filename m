From: Alex Ivanov <gnidorah@p0n4ik.tk>
Subject: Re: parisc debian kernel - missing  modules for C8000 - linux-image-3.10-2-parisc64-smp
Date: Wed, 4 Sep 2013 22:34:04 +0400
Message-ID: <F9C1BAB5-56D3-40E2-B0B2-184C92CD51AB@p0n4ik.tk>
References: <521A7589.5000503@gmx.de> <BLU0-SMTP41F72FA4035273DC12703897360@phx.gbl> <BLU0-SMTP99E4F2E24E1A3F5BA18E7A97360@phx.gbl> <108451378018002@web28j.yandex.ru> <BLU0-SMTP1273DDE4A968FD3A43C55D97370@phx.gbl> <3B9F0B38-597D-439E-B57E-0F7E9E11BE9D@p0n4ik.tk> <BLU0-SMTP6283FFA9572E9BF7725A1E97300@phx.gbl>
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
Content-Type: text/plain; charset=koi8-r
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP6283FFA9572E9BF7725A1E97300@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


02.09.2013, =D7 18:10, John David Anglin <dave.anglin@bell.net> =CE=C1=D0=
=C9=D3=C1=CC(=C1):

> You don't think it ran briefly and crashed?
>=20
> I have a thought.  The code that loads the microcode appears to be tr=
ying to load in 32-bit hunks.  Maybe
> we have a 64-bit path on the bus and we need to load the firmware in =
64-bit words.
>=20
> Dave
> --
> John David Anglin	dave.anglin@bell.net

Dave,

Am i understood you right?

--- r100.c.orig 2013-09-04 16:53:28.000000000 +0000
+++ r100.c      2013-09-04 18:28:23.000000000 +0000
@@ -1049,9 +1049,13 @@ static int r100_cp_init_microcode(struct
        return err;
 }
=20
+#define RADEON_CP_ME_RAM_DATAHL 0x07dc0x07e0
+
+void r100_mm_wregq(struct radeon_device *rdev, uint64_t reg, uint64_t =
v,
+                  bool always_indirect);
 static void r100_cp_load_microcode(struct radeon_device *rdev)
 {
-       const __be32 *fw_data;
+       const __be64 *fw_data;
        int i, size;
=20
        if (r100_gui_wait_for_idle(rdev)) {
@@ -1060,14 +1064,12 @@ static void r100_cp_load_microcode(struc
        }
=20
        if (rdev->me_fw) {
-               size =3D rdev->me_fw->size / 4;
-               fw_data =3D (const __be32 *)&rdev->me_fw->data[0];
+               size =3D rdev->me_fw->size / 8;
+               fw_data =3D (const __be64 *)&rdev->me_fw->data[0];
                WREG32(RADEON_CP_ME_RAM_ADDR, 0);
-               for (i =3D 0; i < size; i +=3D 2) {
-                       WREG32(RADEON_CP_ME_RAM_DATAH,
-                              be32_to_cpup(&fw_data[i]));
-                       WREG32(RADEON_CP_ME_RAM_DATAL,
-                              be32_to_cpup(&fw_data[i + 1]));
+               for (i =3D 0; i < size; i +=3D 1) {
+                       r100_mm_wregq(rdev, RADEON_CP_ME_RAM_DATAHL,
+                               be64_to_cpup(&fw_data[i]), false);
                }
        }
 }
@@ -4078,6 +4080,21 @@ void r100_mm_wreg(struct radeon_device *
        }
 }
=20
+void r100_mm_wregq(struct radeon_device *rdev, uint64_t reg, uint64_t =
v,
+                  bool always_indirect)
+{
+        if (reg < rdev->rmmio_size && !always_indirect)
+                writeq(v, ((void __iomem *)rdev->rmmio) + reg);
+        else {
+                unsigned long flags;
+
+                spin_lock_irqsave(&rdev->mmio_idx_lock, flags);
+                writeq(reg, ((void __iomem *)rdev->rmmio) + RADEON_MM_=
INDEX);
+                writeq(v, ((void __iomem *)rdev->rmmio) + RADEON_MM_DA=
TA);
+                spin_unlock_irqrestore(&rdev->mmio_idx_lock, flags);
+        }
+}
+
 u32 r100_io_rreg(struct radeon_device *rdev, u32 reg)
 {
        if (reg < rdev->rio_mem_size)

I'm not sure if this correct, but it didn't help.--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
