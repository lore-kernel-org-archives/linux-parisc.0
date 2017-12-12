From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Fix indenting in puts()
Date: Tue, 12 Dec 2017 21:32:16 +0100
Message-ID: <20171212203216.GA13832@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Dan Carpenter <dan.carpenter@oracle.com>
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Static analysis tools complain that we intended to have curly braces
around this indent block. In this case this assumption is wrong, so fix
the indenting.

Fixes: 2f3c7b8137ef ("parisc: Add core code for self-extracting kernel")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/boot/compressed/misc.c b/arch/parisc/boot/compressed/misc.c
index 9345b44b86f0..f57118e1f6b4 100644
--- a/arch/parisc/boot/compressed/misc.c
+++ b/arch/parisc/boot/compressed/misc.c
@@ -123,8 +123,8 @@ int puts(const char *s)
 	while ((nuline = strchr(s, '\n')) != NULL) {
 		if (nuline != s)
 			pdc_iodc_print(s, nuline - s);
-			pdc_iodc_print("\r\n", 2);
-			s = nuline + 1;
+		pdc_iodc_print("\r\n", 2);
+		s = nuline + 1;
 	}
 	if (*s != '\0')
 		pdc_iodc_print(s, strlen(s));
