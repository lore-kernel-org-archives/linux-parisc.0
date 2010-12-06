From: Guy Martin <gmsoft@tuxicoman.be>
Subject: [PATCH] parisc : Remove broken line wrapping handling
 pdc_iodc_print()
Date: Mon, 6 Dec 2010 16:48:04 +0100
Message-ID: <20101206164804.1dd8765e@borg.bxl.tuxicoman.be>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/qy6Y6qpZWSd123zYwfhZ84k"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--MP_/qy6Y6qpZWSd123zYwfhZ84k
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Remove the broken line wrapping handling in pdc_iodc_print().
It is broken in 3 ways :
  - It doesn't keep track of the current screen position, it just
    assumes that the new buffer will be printed at the begining of the
    screen.
  - It doesn't take in account that non printable characters won't
    increase the current position on the screen.
  - And last but not least, it triggers a kernel panic if a backspace
    is the first char in the provided buffer :

 Backtrace:
  [<0000000040128ec4>] pdc_console_write+0x44/0x78
  [<0000000040128f18>] pdc_console_tty_write+0x20/0x38
  [<000000004032f1ac>] n_tty_write+0x2a4/0x550
  [<000000004032b158>] tty_write+0x1e0/0x2d8
  [<00000000401bb420>] vfs_write+0xb8/0x188
  [<00000000401bb630>] sys_write+0x68/0xb8
  [<0000000040104eb8>] syscall_exit+0x0/0x14

Most terminals handle the line wrapping just fine. I've confirmed that
it works correctly on a C8000 with both vga and serial output.

Signed-off-by: Guy Martin <gmsoft@tuxicoman.be>
--MP_/qy6Y6qpZWSd123zYwfhZ84k
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=pdc_iodc_print-cleanup.diff

--- arch/parisc/kernel/firmware.c.orig	2010-12-05 16:42:07.000000000 +0100
+++ arch/parisc/kernel/firmware.c	2010-12-05 17:32:52.000000000 +0100
@@ -1126,15 +1126,13 @@
 	unsigned int i;
 	unsigned long flags;
 
-	for (i = 0; i < count && i < 79;) {
+	for (i = 0; i < count;) {
 		switch(str[i]) {
 		case '\n':
 			iodc_dbuf[i+0] = '\r';
 			iodc_dbuf[i+1] = '\n';
 			i += 2;
 			goto print;
-		case '\b':	/* BS */
-			i--; /* overwrite last */
 		default:
 			iodc_dbuf[i] = str[i];
 			i++;
@@ -1142,15 +1140,6 @@
 		}
 	}
 
-	/* if we're at the end of line, and not already inserting a newline,
-	 * insert one anyway. iodc console doesn't claim to support >79 char
-	 * lines. don't account for this in the return value.
-	 */
-	if (i == 79 && iodc_dbuf[i-1] != '\n') {
-		iodc_dbuf[i+0] = '\r';
-		iodc_dbuf[i+1] = '\n';
-	}
--MP_/qy6Y6qpZWSd123zYwfhZ84k--
