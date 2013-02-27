From: Helge Deller <deller@gmx.de>
Subject: parisc: avoid unitialized variable warning in pa_memcpy()
Date: Wed, 27 Feb 2013 23:21:15 +0100
Message-ID: <20130227222115.GA2921@p100.box>
References: <20130227221137.GA2806@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130227221137.GA2806@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

commit eed0220c5b2f33e4da2e9ba207c798c1bdebe500
Author: Helge Deller <deller@gmx.de>
Date:   Wed Feb 27 00:06:48 2013 +0100

parisc: avoid unitialized variable warning in pa_memcpy()

Avoid this warning, while still prevent gcc from optimizing away the ex=
ception code:
arch/parisc/lib/memcpy.c: In function =E2=80=98pa_memcpy=E2=80=99:
arch/parisc/lib/memcpy.c:256:2: warning: =E2=80=98dummy=E2=80=99 may be=
 used uninitialized in this function [-Wuninitialized]

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/lib/memcpy.c b/arch/parisc/lib/memcpy.c
index 1dbca5c..a49cc81 100644
--- a/arch/parisc/lib/memcpy.c
+++ b/arch/parisc/lib/memcpy.c
@@ -68,7 +68,7 @@
 DECLARE_PER_CPU(struct exception_data, exception_data);
=20
 #define preserve_branch(label)	do {					\
-	volatile int dummy;						\
+	volatile int dummy =3D 0;						\
 	/* The following branch is never taken, it's just here to  */	\
 	/* prevent gcc from optimizing away our exception code. */ 	\
 	if (unlikely(dummy !=3D dummy))					\
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
