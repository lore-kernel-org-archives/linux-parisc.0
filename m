From: Helge Deller <deller@gmx.de>
Subject: [PATCH] nfs: fix do_div() warning by instead using sector_div()
Date: Mon, 2 Dec 2013 19:59:31 +0100
Message-ID: <20131202185931.GA1992@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
To: linux-nfs@vger.kernel.org,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

When compiling a 32bit kernel with CONFIG_LBDAF=3Dn the compiler compla=
ins like
shown below.  Fix this warning by instead using sector_div() which is p=
rovided
by the kernel.h header file.
=20
fs/nfs/blocklayout/extents.c: In function =E2=80=98normalize=E2=80=99:
include/asm-generic/div64.h:43:28: warning: comparison of distinct poin=
ter types lacks a cast [enabled by default]
fs/nfs/blocklayout/extents.c:47:13: note: in expansion of macro =E2=80=98=
do_div=E2=80=99
nfs/blocklayout/extents.c:47:2: warning: right shift count >=3D width o=
f type [enabled by default]
fs/nfs/blocklayout/extents.c:47:2: warning: passing argument 1 of =E2=80=
=98__div64_32=E2=80=99 from incompatible pointer type [enabled by defau=
lt]
include/asm-generic/div64.h:35:17: note: expected =E2=80=98uint64_t *=E2=
=80=99 but argument is of type =E2=80=98sector_t *=E2=80=99
 extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/fs/nfs/blocklayout/extents.c b/fs/nfs/blocklayout/extents.=
c
index 9c3e117..4d01614 100644
--- a/fs/nfs/blocklayout/extents.c
+++ b/fs/nfs/blocklayout/extents.c
@@ -44,7 +44,7 @@
 static inline sector_t normalize(sector_t s, int base)
 {
 	sector_t tmp =3D s; /* Since do_div modifies its argument */
-	return s - do_div(tmp, base);
+	return s - sector_div(tmp, base);
 }
=20
 static inline sector_t normalize_up(sector_t s, int base)
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
