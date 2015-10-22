From: "Helge Deller" <deller@gmx.de>
Subject: Aw: [PATCH v3] parisc: Change L1_CACHE_BYTES to 16
Date: Thu, 22 Oct 2015 13:53:17 +0200
Message-ID: <trinity-8980ad10-b889-45cf-8f37-a33ba9cf99ef-1445514797080@3capp-gmx-bs32>
References: <42430464-867C-4E0B-8E95-C6CDB6D8A0B2@bell.net>
 <32A3BF6F-B243-4AD4-9AE9-A5F9DAE0270A@bell.net>,
 <B8E85737-5ECD-4CBE-8730-886B098C5FA4@bell.net>,
 <trinity-eda7d55d-7234-4b29-a15c-955f8ba0c95e-1445513884942@3capp-gmx-bs32>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: "John David Anglin" <dave.anglin@bell.net>,
	"linux-parisc List" <linux-parisc@vger.kernel.org>,
	"James Bottomley" <James.Bottomley@HansenPartnership.com>
To: "Helge Deller" <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <trinity-eda7d55d-7234-4b29-a15c-955f8ba0c95e-1445513884942@3capp-gmx-bs32>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > Betreff: [PATCH v3] parisc: Change L1_CACHE_BYTES to 16
> > The latest version changes L1_CACHE_BYTES to 16 bytes and doesn't a=
djust SMP_CACHE_BYTES as
> > per James suggestion
>=20
> This patch sadly breaks build on Linux kernel git head:
>=20
> In file included from /home/cvs/LINUX/git-kernel/linux-2.6/net/core/d=
ev.c:92:0:
> /net/core/dev.c: In function =E2=80=98expand_xps_map=E2=80=99:
> /include/linux/netdevice.h:721:27: warning: overflow in implicit cons=
tant conversion [-Woverflow]
>  #define XPS_MIN_MAP_ALLOC ((L1_CACHE_BYTES - sizeof(struct xps_map))=
 \
> /net/core/dev.c:1972:18: note: in expansion of macro =E2=80=98XPS_MIN=
_MAP_ALLOC=E2=80=99
>   int alloc_len =3D XPS_MIN_MAP_ALLOC;

This is one possibility to fix it:

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 2d15e38..21cf683 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -718,7 +718,7 @@ struct xps_map {
        u16 queues[0];
 };
 #define XPS_MAP_SIZE(_num) (sizeof(struct xps_map) + ((_num) * sizeof(=
u16)))
-#define XPS_MIN_MAP_ALLOC ((L1_CACHE_BYTES - sizeof(struct xps_map))  =
 \
+#define XPS_MIN_MAP_ALLOC ( (L1_CACHE_BYTES > sizeof(struct xps_map) ?=
 L1_CACHE_BYTES : 2 * L1_CACHE_BYTES) - sizeof(struct xps_map)   \
     / sizeof(u16))
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
