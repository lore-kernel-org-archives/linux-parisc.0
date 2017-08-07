From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Drop exception_data struct
Date: Mon, 7 Aug 2017 23:26:45 +0200
Message-ID: <20170807212645.GA4867@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/lib/memcpy.c b/arch/parisc/lib/memcpy.c
index 99115cd..865a7f7 100644
--- a/arch/parisc/lib/memcpy.c
+++ b/arch/parisc/lib/memcpy.c
@@ -27,8 +27,6 @@
 #include <linux/compiler.h>
 #include <linux/uaccess.h>
 
-DECLARE_PER_CPU(struct exception_data, exception_data);
