From: Anton Wuerfel <anton.wuerfel@fau.de>
Subject: [PATCH v4 07/13] tty: serial: 8250: Fix line continuation warning
Date: Fri,  8 Jan 2016 18:43:53 +0100
Message-ID: <1452275039-18787-8-git-send-email-anton.wuerfel@fau.de>
References: <1452275039-18787-1-git-send-email-anton.wuerfel@fau.de>
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
	phillip.raffeck@fau.de, Anton Wuerfel <anton.wuerfel@fau.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452275039-18787-1-git-send-email-anton.wuerfel@fau.de>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

=46ixed checkpatch warning about an unnecessary line continuation in a
multi-line variable assignment.

Signed-off-by: Anton W=C3=BCrfel <anton.wuerfel@fau.de>
Signed-off-by: Phillip Raffeck <phillip.raffeck@fau.de>
CC: linux-kernel@i4.cs.fau.de
---
 drivers/tty/serial/8250/8250_hp300.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_hp300.c b/drivers/tty/serial/=
8250/8250_hp300.c
index 5e1b464..cf566bb 100644
--- a/drivers/tty/serial/8250/8250_hp300.c
+++ b/drivers/tty/serial/8250/8250_hp300.c
@@ -248,8 +248,8 @@ static int __init hp300_8250_init(void)
=20
 		/* Memory mapped I/O */
 		uart.port.iotype =3D UPIO_MEM;
-		uart.port.flags =3D UPF_SKIP_TEST | UPF_SHARE_IRQ \
-			      | UPF_BOOT_AUTOCONF;
+		uart.port.flags =3D UPF_SKIP_TEST | UPF_SHARE_IRQ
+				| UPF_BOOT_AUTOCONF;
 		/* XXX - no interrupt support yet */
 		uart.port.irq =3D 0;
 		uart.port.uartclk =3D HPAPCI_BAUD_BASE * 16;
--=20
1.9.1
