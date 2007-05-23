From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: [parisc-linux] [PATCH] parisc: Enable arbitary speed tty ioctl
	interfaces
Date: Wed, 23 May 2007 17:51:02 +0100
Message-ID: <20070523175102.65553ff5__48801.0094770745$1416624639$gmane$org@the-village.bc.nu>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
To: matthew@wil.cx,
 parisc-linux@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

All the code is already present in the tree and used by some other
platforms (eg x86_64). Adding the constants and defines activates it for
parisc.

Signed-off-by: Alan Cox <alan@redhat.com>

diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanilla-2.6.22-rc1-mm1/include/asm-parisc/ioctls.h linux-2.6.22-rc1-mm1/include/asm-parisc/ioctls.h
--- linux.vanilla-2.6.22-rc1-mm1/include/asm-parisc/ioctls.h	2007-04-30 10:48:18.000000000 +0100
+++ linux-2.6.22-rc1-mm1/include/asm-parisc/ioctls.h	2007-05-23 16:38:15.454648304 +0100
@@ -46,6 +46,10 @@
 #define TIOCSBRK	0x5427  /* BSD compatibility */
 #define TIOCCBRK	0x5428  /* BSD compatibility */
 #define TIOCGSID	_IOR('T', 20, int) /* Return the session ID of FD */
+#define TCGETS2		_IOR('T',0x2A, struct termios2)
+#define TCSETS2		_IOW('T',0x2B, struct termios2)
+#define TCSETSW2	_IOW('T',0x2C, struct termios2)
+#define TCSETSF2	_IOW('T',0x2D, struct termios2)
 #define TIOCGPTN	_IOR('T',0x30, unsigned int) /* Get Pty Number (of pty-mux device) */
 #define TIOCSPTLCK	_IOW('T',0x31, int)  /* Lock/unlock Pty */
 
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanilla-2.6.22-rc1-mm1/include/asm-parisc/termbits.h linux-2.6.22-rc1-mm1/include/asm-parisc/termbits.h
--- linux.vanilla-2.6.22-rc1-mm1/include/asm-parisc/termbits.h	2007-04-30 10:48:18.000000000 +0100
+++ linux-2.6.22-rc1-mm1/include/asm-parisc/termbits.h	2007-05-23 16:37:48.499746072 +0100
@@ -130,6 +130,7 @@
 #define HUPCL   0002000
 #define CLOCAL  0004000
 #define CBAUDEX 0010000
+#define    BOTHER 0010000
 #define    B57600 0010001
 #define   B115200 0010002
 #define   B230400 0010003
@@ -145,10 +146,12 @@
 #define  B3000000 0010015
 #define  B3500000 0010016
 #define  B4000000 0010017
-#define CIBAUD    002003600000  /* input baud rate (not used) */
+#define CIBAUD    002003600000		/* input baud rate */
 #define CMSPAR    010000000000          /* mark or space (stick) parity */
 #define CRTSCTS   020000000000          /* flow control */
 
+#define IBSHIFT	16		/* Shift from CBAUD to CIBAUD */
+
 
 /* c_lflag bits */
 #define ISIG    0000001
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanilla-2.6.22-rc1-mm1/include/asm-parisc/termios.h linux-2.6.22-rc1-mm1/include/asm-parisc/termios.h
--- linux.vanilla-2.6.22-rc1-mm1/include/asm-parisc/termios.h	2007-04-30 11:00:07.000000000 +0100
+++ linux-2.6.22-rc1-mm1/include/asm-parisc/termios.h	2007-05-23 16:37:55.371701376 +0100
@@ -80,8 +80,10 @@
 	copy_to_user((termio)->c_cc, (termios)->c_cc, NCC); \
 })
 
-#define user_termios_to_kernel_termios(k, u) copy_from_user(k, u, sizeof(struct termios))
-#define kernel_termios_to_user_termios(u, k) copy_to_user(u, k, sizeof(struct termios))
+#define user_termios_to_kernel_termios(k, u) copy_from_user(k, u, sizeof(struct termios2))
+#define kernel_termios_to_user_termios(u, k) copy_to_user(u, k, sizeof(struct termios2))
+#define user_termios_to_kernel_termios_1(k, u) copy_from_user(k, u, sizeof(struct termios))
+#define kernel_termios_to_user_termios_1(u, k) copy_to_user(u, k, sizeof(struct termios))
 
 #endif	/* __KERNEL__ */
 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
