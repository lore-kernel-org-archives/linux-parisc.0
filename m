From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] PARISC: provide __ucmpdi2
Date: Sat, 20 Apr 2013 15:41:06 -0400
Message-ID: <BLU0-SMTP16CB97A849149145EF5FC997C90@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-7--514873447"
Cc: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-7--514873447
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Provide __ucmpdi2 to resolve undefined references in 32 bit builds.

The Debian experimental linux source package (3.8.5-1) build fails  
with the following errors:
...
MODPOST 2016 modules
ERROR: "__ucmpdi2" [fs/btrfs/btrfs.ko] undefined!
ERROR: "__ucmpdi2" [drivers/md/dm-verity.ko] undefined!

The attached patch resolves this problem.  It is based on the s390  
implementation
of ucmpdi2.c.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>
Cc: Helge Deller <deller@gmx.de>
---




--Apple-Mail-7--514873447
Content-Disposition: attachment; filename="ucmpdi2.diff.txt"
Content-Type: text/plain; x-unix-mode=0644; name="ucmpdi2.diff.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/kernel/parisc_ksyms.c b/arch/parisc/kernel/parisc_ksyms.c
index 6795dc6..568b2c6 100644
--- a/arch/parisc/kernel/parisc_ksyms.c
+++ b/arch/parisc/kernel/parisc_ksyms.c
@@ -120,11 +120,13 @@ extern void __ashrdi3(void);
 extern void __ashldi3(void);
 extern void __lshrdi3(void);
 extern void __muldi3(void);
+extern void __ucmpdi2(void);
 
 EXPORT_SYMBOL(__ashrdi3);
 EXPORT_SYMBOL(__ashldi3);
 EXPORT_SYMBOL(__lshrdi3);
 EXPORT_SYMBOL(__muldi3);
+EXPORT_SYMBOL(__ucmpdi2);
 
 asmlinkage void * __canonicalize_funcptr_for_compare(void *);
 EXPORT_SYMBOL(__canonicalize_funcptr_for_compare);
diff --git a/arch/parisc/lib/Makefile b/arch/parisc/lib/Makefile
index 5f2e690..5651536 100644
--- a/arch/parisc/lib/Makefile
+++ b/arch/parisc/lib/Makefile
@@ -2,6 +2,7 @@
 # Makefile for parisc-specific library files
 #
 
-lib-y	:= lusercopy.o bitops.o checksum.o io.o memset.o fixup.o memcpy.o
+lib-y	:= lusercopy.o bitops.o checksum.o io.o memset.o fixup.o memcpy.o \
+	   ucmpdi2.o
 
 obj-y	:= iomap.o
--- /dev/null	2013-04-18 22:44:06.316000000 -0400
+++ linux/arch/parisc/lib/ucmpdi2.c	2013-04-20 10:50:01.000000000 -0400
@@ -0,0 +1,25 @@
+#include <linux/module.h>
+
+union ull_union {
+	unsigned long long ull;
+	struct {
+		unsigned int high;
+		unsigned int low;
+	} ui;
+};
+
+int __ucmpdi2(unsigned long long a, unsigned long long b)
+{
+	union ull_union au = {.ull = a};
+	union ull_union bu = {.ull = b};
+
+	if (au.ui.high < bu.ui.high)
+		return 0;
+	else if (au.ui.high > bu.ui.high)
+		return 2;
+	if (au.ui.low < bu.ui.low)
+		return 0;
+	else if (au.ui.low > bu.ui.low)
+		return 2;
+	return 1;
+}

--Apple-Mail-7--514873447
Content-Type: text/plain; charset="US-ASCII"; format=flowed
Content-Transfer-Encoding: 7bit



Dave
--
John David Anglin	dave.anglin@bell.net


--Apple-Mail-7--514873447--
