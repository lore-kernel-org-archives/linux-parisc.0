From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH 1/3 v2] parisc/uapi: Add definition of TIOC[SG]RS485
Date: Tue,  9 Sep 2014 20:58:15 +0200
Message-ID: <1410289095-3809-1-git-send-email-ricardo.ribalda@gmail.com>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: "James E . J . Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	Greg KH <greg@kroah.com>
Return-path: <linux-serial-owner@vger.kernel.org>
List-ID: <linux-serial.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Commit: e676253b19b2d269cccf67fdb1592120a0cd0676 (serial/8250: Add
support for RS485 IOCTLs), adds support for RS485 ioctls for 825_core on
all the archs. Unfortunaltely the definition of TIOCSRS485 and
TIOCGRS485 was missing on the ioctls.h file

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
Changelog:

v2: By GregKH

Follow the ioctl numbering scheme used by the particular
architecture UAPI file you are editing.

 arch/parisc/include/uapi/asm/ioctls.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/parisc/include/uapi/asm/ioctls.h b/arch/parisc/include/uapi/asm/ioctls.h
index 66719c3..b6572f0 100644
--- a/arch/parisc/include/uapi/asm/ioctls.h
+++ b/arch/parisc/include/uapi/asm/ioctls.h
@@ -50,6 +50,8 @@
 #define TCSETS2		_IOW('T',0x2B, struct termios2)
 #define TCSETSW2	_IOW('T',0x2C, struct termios2)
 #define TCSETSF2	_IOW('T',0x2D, struct termios2)
+#define TIOCGRS485	_IOR('T', 0x2E, struct serial_rs485)
+#define TIOCSRS485	_IOWR('T', 0x2F, struct serial_rs485)
 #define TIOCGPTN	_IOR('T',0x30, unsigned int) /* Get Pty Number (of pty-mux device) */
 #define TIOCSPTLCK	_IOW('T',0x31, int)  /* Lock/unlock Pty */
 #define TIOCGDEV	_IOR('T',0x32, int)  /* Get primary device node of /dev/console */
-- 
2.1.0

