From: Leonardo =?utf-8?B?QnLDoXM=?= <leobras.c@gmail.com>
Subject: [PATCH v3 1/7] drivers: dio: Avoids building driver if CONFIG_DIO is
 disabled
Date: Thu, 27 Sep 2018 22:46:28 -0300
Message-ID: <20180928014628.GA10427@WindFlash>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Finn Thain <fthain@telegraphics.com.au>,
        Robert Richter <rric@kernel.org>,
        "James E.J. Bottomley" <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        oprofile-list@lists.sf.net, linux-parisc@vger.kernel.org,
        linux-s390@vger.kernel.org
To: lkcamp@lists.libreplanetbr.org,
        /tmp/v3-0002-drivers-nubus-Avoids-building-driver-if-CONFIG_NU.patch@windflash,
        /tmp/v3-0003-drivers-parisc-Avoids-building-driver-if-CONFIG_P.patch@windflash,
        /tmp/v3-0004-drivers-zorro-Avoids-building-proc.o-if-CONFIG_ZO.patch@windflash,
        /tmp/v3-0005-drivers-s390-Avoids-building-drivers-if-ARCH-is-n.patch@windflash,
        /tmp/v3-0006-drivers-oprofile-Avoids-building-driver-from-dire.patch@windflash,
        /tmp/v3-0007-drivers-hwtracing-Adds-Makefile-to-enable-buildin.patch@windflash
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Avoids building driver if 'make drivers/dio/' is called and
CONFIG_DIO is disabled.

Signed-off-by: Leonardo Brás <leobras.c@gmail.com>
---
 drivers/dio/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dio/Makefile b/drivers/dio/Makefile
index ae92d17083f2..8fc80e805b90 100644
--- a/drivers/dio/Makefile
+++ b/drivers/dio/Makefile
@@ -2,4 +2,4 @@
 # Makefile for the linux kernel.
 #
 
-obj-y := dio.o dio-driver.o dio-sysfs.o
+obj-$(CONFIG_DIO) := dio.o dio-driver.o dio-sysfs.o
-- 
2.19.0
