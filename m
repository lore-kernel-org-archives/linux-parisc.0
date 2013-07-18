From: Jeroen Roovers <jer@gentoo.org>
Subject: [PATCH] palo/palo.c:482:5: /usr/include/bits/fcntl2.h:50:24: error:
 call to '__open_missing_mode' declared with attribute error: open with
 O_CREAT in second argument needs 3 arguments
Date: Thu, 18 Jul 2013 17:43:46 +0200
Message-ID: <20130718174346.022491f8@marga.jer-c2.orkz.net>
References: <20130718165539.15e7e327@marga.jer-c2.orkz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130718165539.15e7e327@marga.jer-c2.orkz.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

In file included from /usr/include/fcntl.h:296:0,
                 from palo.c:16:
In function 'open',
    inlined from 'do_formatted' at palo.c:482:5:
/usr/include/bits/fcntl2.h:50:24: error: call to '__open_missing_mode'
declared with attribute error: open with O_CREAT in second argument
needs 3 arguments

Signed-off-by: Jeroen Roovers <jer@gentoo.org>

diff --git a/palo/palo.c b/palo/palo.c
index 10031fd..fffb7ec 100644
--- a/palo/palo.c
+++ b/palo/palo.c
@@ -484,7 +484,7 @@ do_formatted(int init, int media, const char *medianame, int partition,
            error(14, "bootloader");

        sprintf(badblockfilename, "/tmp/paloblk-%d", getpid());
-       if ((fd = open(badblockfilename, O_RDWR | O_CREAT | O_TRUNC)) < 0) {
+       if ((fd = open(badblockfilename, O_RDWR | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR)) < 0) {
            perror(badblockfilename);
            exit(1);
        }
