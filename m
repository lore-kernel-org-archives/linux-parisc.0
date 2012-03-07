From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: parisc: fix lib/bitmap.c in linux-next
Date: Tue, 6 Mar 2012 20:44:27 -0500
Message-ID: <CAP=VYLqRj3tJCMyiJy-Sq0cnSGrSWUsuGqdjqYQGfs77ONYhFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-next@vger.kernel.org,
	Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I'm glad I pushed to fix parisc in linux-next, since now I can tell
when I've broken it.  :)  [but hey it was a good five days while it
lasted though!]

For those of you following parisc in linux-next, as per here:

    http://kisskb.ellerman.id.au/kisskb/target/2059/

the fix is a trivial include that seems specific to parisc:

diff --git a/lib/bitmap.c b/lib/bitmap.c
index e255bfb..0b39614 100644
--- a/lib/bitmap.c
+++ b/lib/bitmap.c
@@ -11,6 +11,8 @@
 #include <linux/bitmap.h>
 #include <linux/bitops.h>
 #include <linux/bug.h>
+#include <linux/thread_info.h>
+
 #include <asm/uaccess.h>

and I'll have this in the module-3.4 tree in linux-next tomorrow.

Thanks,
Paul.
