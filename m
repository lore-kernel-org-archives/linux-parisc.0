From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] parisc: Add missing curly braces in puts()
Date: Sat, 9 Dec 2017 14:45:24 +0300
Message-ID: <20171209114524.kwsvkd4ui5jei4r3@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org, kernel-janitors@vger.kernel.org
To: "James E.J. Bottomley" <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Static analysis tools complain that we intended to have curly braces
around this indent block.  Which is true.

Fixes: 2f3c7b8137ef ("parisc: Add core code for self-extracting kernel")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/parisc/boot/compressed/misc.c b/arch/parisc/boot/compressed/misc.c
index 9345b44b86f0..432d33804a86 100644
--- a/arch/parisc/boot/compressed/misc.c
+++ b/arch/parisc/boot/compressed/misc.c
@@ -121,10 +121,11 @@ int puts(const char *s)
 	const char *nuline = s;
 
 	while ((nuline = strchr(s, '\n')) != NULL) {
-		if (nuline != s)
+		if (nuline != s) {
 			pdc_iodc_print(s, nuline - s);
 			pdc_iodc_print("\r\n", 2);
 			s = nuline + 1;
+		}
 	}
 	if (*s != '\0')
 		pdc_iodc_print(s, strlen(s));
