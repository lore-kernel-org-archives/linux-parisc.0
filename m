Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA03210
	for <parisc-linux@puffin.external.hp.com>; Mon, 11 Dec 2000 17:08:09 -0700
Message-Id: <200012120006.TAA29936@hiauly1.hia.nrc.ca>
To: alan@linuxcare.com.au (Alan Modra)
Date: Mon, 11 Dec 2000 19:06:47 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: grundler@cup.hp.com, parisc-linux@thepuffingroup.com
In-Reply-To: <Pine.LNX.4.21.0012102347330.31734-100000@front.linuxcare.com.au> from "Alan Modra" at Dec 11, 2000 00:02:57 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] gcc wchar patch for hppa64
List-ID: <linux-parisc.vger.kernel.org>

Alan,

This patch fixes a problem with wide characters.  We need to override the
defines in svr4.h.  With this, I get much further building a 64 bit glibc.
Please review and install if ok.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

2000-12-11  John David Anglin  <dave@hiauly1.hia.nrc.ca>

	* pa-linux64.h: Define WCHAR_TYPE and WCHAR_TYPE_SIZE per ABI.

--- pa-linux64.h.orig	Mon Oct 30 02:58:24 2000
+++ pa-linux64.h	Mon Dec 11 18:15:14 2000
@@ -158,9 +158,13 @@
   Make GCC agree with types.h.  */
 #undef SIZE_TYPE
 #undef PTRDIFF_TYPE
+#undef WCHAR_TYPE
+#undef WCHAR_TYPE_SIZE
 
 #define SIZE_TYPE "long unsigned int"
 #define PTRDIFF_TYPE "long int"
+#define WCHAR_TYPE "unsigned int"
+#define WCHAR_TYPE_SIZE 32
 
 /* If it is not listed here, then the default selected by GCC is OK.  */
 #define SHORT_TYPE_SIZE 16
