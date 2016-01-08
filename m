From: Anton Wuerfel <anton.wuerfel@fau.de>
Subject: [PATCH v4 11/13] tty: serial: 8250: Remove SERIAL_DEBUG_PNP macro
Date: Fri,  8 Jan 2016 18:43:57 +0100
Message-ID: <1452275039-18787-12-git-send-email-anton.wuerfel@fau.de>
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
	phillip.raffeck@fau.de,
	=?UTF-8?q?Anton=20W=C3=BCrfel?= <anton.wuerf
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452275039-18787-1-git-send-email-anton.wuerfel@fau.de>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

=46rom: Phillip Raffeck <phillip.raffeck@fau.de>

This patch removes the macro SERIAL_DEBUG_PNP, which is used to enable
debugging at compile time.
As SERIAL_DEBUG_PNP is an orphan, the corresponding #ifdef is removed.
To keep the ability to enable debugging at compile time,
the call to printk(KERN_DEBUG ...) is replaced by a corresponding
call to dev_dbg(), which is configurable via CONFIG_DYNAMIC_DEBUG.

Signed-off-by: Phillip Raffeck <phillip.raffeck@fau.de>
Signed-off-by: Anton W=C3=BCrfel <anton.wuerfel@fau.de>
CC: linux-kernel@i4.cs.fau.de
---
 drivers/tty/serial/8250/8250_pnp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_pnp.c b/drivers/tty/serial/82=
50/8250_pnp.c
index ffa7354..ba3a1af 100644
--- a/drivers/tty/serial/8250/8250_pnp.c
+++ b/drivers/tty/serial/8250/8250_pnp.c
@@ -464,11 +464,11 @@ serial_pnp_probe(struct pnp_dev *dev, const struc=
t pnp_device_id *dev_id)
 	} else
 		return -ENODEV;
=20
-#ifdef SERIAL_DEBUG_PNP
-	printk(KERN_DEBUG
-		"Setup PNP port: port %x, mem 0x%lx, irq %d, type %d\n",
-		       uart.port.iobase, uart.port.mapbase, uart.port.irq, uart.port=
=2Eiotype);
-#endif
+	dev_dbg(&dev->dev,
+		 "Setup PNP port: port %x, mem 0x%lx, irq %d, type %d\n",
+		 uart.port.iobase, uart.port.mapbase,
+		 uart.port.irq, uart.port.iotype);
+
 	if (flags & CIR_PORT) {
 		uart.port.flags |=3D UPF_FIXED_PORT | UPF_FIXED_TYPE;
 		uart.port.type =3D PORT_8250_CIR;
--=20
1.9.1
