From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] PARISC: Avoid undefined shift in cnv_float.h
Date: Sun, 1 Apr 2012 12:57:18 -0400
Message-ID: <BLU0-SMTP6824DB7507844D291735CC974F0@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-93-657436718"
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-93-657436718
Content-Type: text/plain; charset="US-ASCII"; format=flowed
Content-Transfer-Encoding: 7bit

The attached change fixes a float conversion problem found running the
GCC testsuite with GCC configured with --with-arch=2.0.

Signed-off-by: John David Anglin <dave.anglin@bell.net>



--Apple-Mail-93-657436718
Content-Disposition: attachment; filename="cnv-float-patch.txt"
Content-Type: text/plain; x-unix-mode=0644; name="cnv-float-patch.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/math-emu/cnv_float.h b/arch/parisc/math-emu/cnv_float.h
index 9071e09..37299c7 100644
--- a/arch/parisc/math-emu/cnv_float.h
+++ b/arch/parisc/math-emu/cnv_float.h
@@ -347,16 +347,15 @@
     Sgl_isinexact_to_fix(sgl_value,exponent)
 
 #define Duint_from_sgl_mantissa(sgl_value,exponent,dresultA,dresultB)	\
-  {Sall(sgl_value) <<= SGL_EXP_LENGTH;  /*  left-justify  */		\
+  {unsigned int val = Sall(sgl_value) << SGL_EXP_LENGTH;		\
     if (exponent <= 31) {						\
     	Dintp1(dresultA) = 0;						\
-    	Dintp2(dresultB) = (unsigned)Sall(sgl_value) >> (31 - exponent); \
+    	Dintp2(dresultB) = val >> (31 - exponent);			\
     }									\
     else {								\
-    	Dintp1(dresultA) = Sall(sgl_value) >> (63 - exponent);		\
-    	Dintp2(dresultB) = Sall(sgl_value) << (exponent - 31);		\
+    	Dintp1(dresultA) = val >> (63 - exponent);			\
+    	Dintp2(dresultB) = exponent <= 62 ? val << (exponent - 31) : 0;	\
     }									\
-    Sall(sgl_value) >>= SGL_EXP_LENGTH;  /* return to original */	\
   }
 
 #define Duint_setzero(dresultA,dresultB) 	\

--Apple-Mail-93-657436718
Content-Type: text/plain; charset="US-ASCII"; format=flowed
Content-Transfer-Encoding: 7bit



--
John David Anglin	dave.anglin@bell.net


--Apple-Mail-93-657436718--
