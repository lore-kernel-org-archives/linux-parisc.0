From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Remove SA_RESTORER define
Date: Wed, 23 Jul 2014 19:44:12 -0400
Message-ID: <BLU436-SMTP144A6E8DBF60A38EB9EDBEE97FE0@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-10-502606989"
Cc: Helge Deller <deller@gmx.de>,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-10-502606989
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

The sa_restorer field in struct sigaction is obsolete and no longer in  
the parisc
implementation.  However, the core code assumes the field is present if
SA_RESTORER is defined.  So, the define needs to be removed.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---



--Apple-Mail-10-502606989
Content-Disposition: attachment; filename="sa_restorer.d.txt"
Content-Type: text/plain; x-unix-mode=0644; name="sa_restorer.d.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/include/uapi/asm/signal.h b/arch/parisc/include/uapi/asm/signal.h
index a2fa2971..f5645d6 100644
--- a/arch/parisc/include/uapi/asm/signal.h
+++ b/arch/parisc/include/uapi/asm/signal.h
@@ -69,8 +69,6 @@
 #define SA_NOMASK	SA_NODEFER
 #define SA_ONESHOT	SA_RESETHAND
 
-#define SA_RESTORER	0x04000000 /* obsolete -- ignored */
--Apple-Mail-10-502606989--
