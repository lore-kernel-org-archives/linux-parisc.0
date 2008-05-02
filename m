From: akpm@linux-foundation.org
Subject: [patch 1/5] parisc: new termios definitions
Date: Fri, 02 May 2008 13:43:30 -0700
Message-ID: <200805022043.m42KhVC1013896@imap1.linux-foundation.org>
Cc: linux-parisc@vger.kernel.org, akpm@linux-foundation.org,
	alan@lxorguk.ukuu.org.uk, alan@redhat.com,
	grundler@parisc-linux.org, willy@debian.org
To: kyle@mcmartin.ca
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Alan Cox <alan@lxorguk.ukuu.org.uk>

Signed-off-by: Alan Cox <alan@redhat.com>
Cc: Kyle McMartin <kyle@mcmartin.ca>
Cc: Grant Grundler <grundler@parisc-linux.org>
Cc: Matthew Wilcox <willy@debian.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 include/asm-parisc/ioctls.h   |    4 ++++
 include/asm-parisc/termbits.h |    5 ++++-
 include/asm-parisc/termios.h  |    6 ++++--
 3 files changed, 12 insertions(+), 3 deletions(-)

diff -puN include/asm-parisc/ioctls.h~parisc-new-termios-definitions include/asm-parisc/ioctls.h
--- a/include/asm-parisc/ioctls.h~parisc-new-termios-definitions
+++ a/include/asm-parisc/ioctls.h
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
 
diff -puN include/asm-parisc/termbits.h~parisc-new-termios-definitions include/asm-parisc/termbits.h
--- a/include/asm-parisc/termbits.h~parisc-new-termios-definitions
+++ a/include/asm-parisc/termbits.h
@@ -141,6 +141,7 @@ struct ktermios {
 #define HUPCL   0002000
 #define CLOCAL  0004000
 #define CBAUDEX 0010000
+#define    BOTHER 0010000
 #define    B57600 0010001
 #define   B115200 0010002
 #define   B230400 0010003
@@ -156,10 +157,12 @@ struct ktermios {
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
diff -puN include/asm-parisc/termios.h~parisc-new-termios-definitions include/asm-parisc/termios.h
--- a/include/asm-parisc/termios.h~parisc-new-termios-definitions
+++ a/include/asm-parisc/termios.h
@@ -80,8 +80,10 @@ struct termio {
 	copy_to_user((termio)->c_cc, (termios)->c_cc, NCC); \
 })
 
-#define user_termios_to_kernel_termios(k, u) copy_from_user(k, u, sizeof(struct termios))
-#define kernel_termios_to_user_termios(u, k) copy_to_user(u, k, sizeof(struct termios))
+#define user_termios_to_kernel_termios(k, u) copy_from_user(k, u, sizeof(struct termios2))
+#define kernel_termios_to_user_termios(u, k) copy_to_user(u, k, sizeof(struct termios2))
+#define user_termios_to_kernel_termios_1(k, u) copy_from_user(k, u, sizeof(struct termios))
+#define kernel_termios_to_user_termios_1(u, k) copy_to_user(u, k, sizeof(struct termios))
 
 #endif	/* __KERNEL__ */
 
_
