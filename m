From: Jeroen Roovers <jer@gentoo.org>
Subject: [PATCH] palo/paloio.c:64: warning: implicit declaration of function
 'memcmp'
Date: Thu, 18 Jul 2013 16:55:39 +0200
Message-ID: <20130718165539.15e7e327@marga.jer-c2.orkz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I have been carrying this patch in the Gentoo repository[1] for quite a
while now.

[1]
http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/sys-boot/palo/files/palo-1.18-include.patch?view=log

Add missing include for memcmp.

Signed-off-by: Jeroen Roovers <jer@gentoo.org>

diff --git a/palo/paloio.c b/palo/paloio.c
index 518c6a5..64e8e45 100644
--- a/a/palo/paloio.c
+++ b/b/palo/paloio.c
@@ -7,6 +7,7 @@
  */
 #include <unistd.h>
 #include <stdio.h>
+#include <string.h>
 #include <errno.h>
 #include <sys/types.h>
 #include <sys/stat.h>
