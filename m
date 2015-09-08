From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Use double word condition in 64bit CAS operation
Date: Mon, 7 Sep 2015 20:13:28 -0400
Message-ID: <BLU437-SMTP83DADEA6683F7E81EB14D997530@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary="Apple-Mail-12--492459262"
Cc: Helge Deller <deller@gmx.de>,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-12--492459262
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

The attached change fixes the condition used in the "sub" instruction.  =
A double word comparison
is needed.  This fixes the 64-bit LWS CAS operation on 64-bit kernels.

I can now enable 64-bit atomic support in GCC.

Cc: <stable@vger.kernel.org>
Signed-off-by: John David Anglin <dave.anglin>


--Apple-Mail-12--492459262
Content-Disposition: attachment; filename="syscall.S.d.txt"
Content-Type: text/plain; name="syscall.S.d.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index 7ef22e3..0b8d26d 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -821,7 +821,7 @@ cas2_action:
 	/* 64bit CAS */
 #ifdef CONFIG_64BIT
 19:	ldd,ma	0(%sr3,%r26), %r29
-	sub,=	%r29, %r25, %r0
+	sub,*=	%r29, %r25, %r0
 	b,n	cas2_end
 20:	std,ma	%r24, 0(%sr3,%r26)
 	copy	%r0, %r28

--Apple-Mail-12--492459262
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"



--
John David Anglin	dave.anglin@bell.net

--Apple-Mail-12--492459262--
