From: Paul Bolle <pebolle@tiscali.nl>
Subject: [PATCH] parisc: rename "CONFIG_PA7100" to "CONFIG_PA7000"
Date: Wed, 29 May 2013 11:56:58 +0200
Message-ID: <1369821418.23034.25.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: "James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

There's a Makefile line setting cflags for CONFIG_PA7100. But that
Kconfig macro doesn't exist. There is a Kconfig symbol PA7000, which
covers both PA7000 and PA7100 processors. So let's use the corresponding
Kconfig macro.

Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
---
Untested. This needs testing for two reasons:

- the gcc documentation suggests this might not work for PA7000
processors of architecture 1.0 (aka, "PA7000 (PCX)");

- this has line has always been a NOP. See, a comparable line was added
in v2.5.45. It depended on CONFIG_PA7100, which didn't exist. A Kconfig
symbol PA7100 has actually never been part of the tree. (In v2.5.46 the
Kconfig symbol PA7000 was added, but that still kept that line a NOP.)

 arch/parisc/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 1976900..96ec398 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -66,7 +66,7 @@ KBUILD_CFLAGS_KERNEL += -mlong-calls
 endif
 
 # select which processor to optimise for
-cflags-$(CONFIG_PA7100)		+= -march=1.1 -mschedule=7100
+cflags-$(CONFIG_PA7000)		+= -march=1.1 -mschedule=7100
 cflags-$(CONFIG_PA7200)		+= -march=1.1 -mschedule=7200
 cflags-$(CONFIG_PA7100LC)	+= -march=1.1 -mschedule=7100LC
 cflags-$(CONFIG_PA7300LC)	+= -march=1.1 -mschedule=7300
-- 
1.7.11.7
