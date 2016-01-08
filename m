From: Anton Wuerfel <anton.wuerfel@fau.de>
Subject: [PATCH v4 12/13] tty: serial: 8250: Removed warning in debug output
Date: Fri,  8 Jan 2016 18:43:58 +0100
Message-ID: <1452275039-18787-13-git-send-email-anton.wuerfel@fau.de>
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

This patch fixes type warnings in a debug output in 8250_pnp.c.
Those warnings never got triggered, because the command was nested
in an #ifdef, which is removed by a patch of this series.

Signed-off-by: Anton W=C3=BCrfel <anton.wuerfel@fau.de>
Signed-off-by: Phillip Raffeck <phillip.raffeck@fau.de>
CC: linux-kernel@i4.cs.fau.de
---
 drivers/tty/serial/8250/8250_pnp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_pnp.c b/drivers/tty/serial/82=
50/8250_pnp.c
index ba3a1af..e99282f 100644
--- a/drivers/tty/serial/8250/8250_pnp.c
+++ b/drivers/tty/serial/8250/8250_pnp.c
@@ -465,8 +465,8 @@ serial_pnp_probe(struct pnp_dev *dev, const struct =
pnp_device_id *dev_id)
 		return -ENODEV;
=20
 	dev_dbg(&dev->dev,
-		 "Setup PNP port: port %x, mem 0x%lx, irq %d, type %d\n",
-		 uart.port.iobase, uart.port.mapbase,
+		 "Setup PNP port: port %lx, mem 0x%lx, irq %d, type %d\n",
+		 uart.port.iobase, (unsigned long) uart.port.mapbase,
 		 uart.port.irq, uart.port.iotype);
=20
 	if (flags & CIR_PORT) {
--=20
1.9.1
