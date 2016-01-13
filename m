From: Anton Wuerfel <anton.wuerfel@fau.de>
Subject: [PATCH v5 08/15] tty: serial: 8250: Add parentheses to macro
Date: Wed, 13 Jan 2016 17:39:24 +0100
Message-ID: <1452703171-5632-9-git-send-email-anton.wuerfel@fau.de>
References: <1452703171-5632-1-git-send-email-anton.wuerfel@fau.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Jiri Slaby <jslaby@suse.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>,
	Peter Hurley <peter@hurleysoftware.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Qipeng Zha <qipeng.zha@intel.com>,
	Desmond Liu <desmondl@broadcom.com>,
	Wang Long <long.wanglong@huawei.com>,
	Matt Redfearn <matt.redfearn@imgtec.com>,
	Paul Burton <paul.burton@imgtec.com>,
	Ralf Baechle <ralf@linux-mips.org>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Peter Hung <hpeter@gmail.com>,
	Soeren Grunewald <soeren.grunewald@desy.de>,
	Adam Lee <adam.lee@canonical.com>,
	"Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
	Mans Rullgard <mans@mansr.com>, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-kernel@i4.cs.fau.de,
	Phillip Raffeck <phillip.raffeck@fau.de>,
	Anton Wuerfel <anton.wuerf
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452703171-5632-1-git-send-email-anton.wuerfel@fau.de>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This patch fixes a checkpatch warning caused by missing parentheses
in the definition of a macro.
=46urthermore redundant parentheses are removed in an assignment.

Signed-off-by: Anton W=C3=BCrfel <anton.wuerfel@fau.de>
Signed-off-by: Phillip Raffeck <phillip.raffeck@fau.de>
Cc: linux-kernel@i4.cs.fau.de
---
 drivers/tty/serial/8250/8250_core.c | 2 +-
 drivers/tty/serial/8250/8250_pci.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_core.c b/drivers/tty/serial/8=
250/8250_core.c
index 15082ae..d042ad5 100644
--- a/drivers/tty/serial/8250/8250_core.c
+++ b/drivers/tty/serial/8250/8250_core.c
@@ -686,7 +686,7 @@ static int __init univ8250_console_init(void)
 }
 console_initcall(univ8250_console_init);
=20
-#define SERIAL8250_CONSOLE	&univ8250_console
+#define SERIAL8250_CONSOLE	(&univ8250_console)
 #else
 #define SERIAL8250_CONSOLE	NULL
 #endif
diff --git a/drivers/tty/serial/8250/8250_pci.c b/drivers/tty/serial/82=
50/8250_pci.c
index 09157fa..433afdd 100644
--- a/drivers/tty/serial/8250/8250_pci.c
+++ b/drivers/tty/serial/8250/8250_pci.c
@@ -803,7 +803,7 @@ static int pci_netmos_9900_numports(struct pci_dev =
*dev)
 	unsigned int pi;
 	unsigned short sub_serports;
=20
-	pi =3D (c & 0xff);
+	pi =3D c & 0xff;
=20
 	if (pi =3D=3D 2)
 		return 1;
--=20
1.9.1
