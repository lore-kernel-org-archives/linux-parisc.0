From: Anton Wuerfel <anton.wuerfel@fau.de>
Subject: [PATCH v4 03/13] tty: serial: 8250: Fix braces after struct
Date: Fri,  8 Jan 2016 18:43:49 +0100
Message-ID: <1452275039-18787-4-git-send-email-anton.wuerfel@fau.de>
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

This patch fixes a checkpatch warning by moving an opening curly brace
to its correct position.

Signed-off-by: Anton W=C3=BCrfel <anton.wuerfel@fau.de>
Signed-off-by: Phillip Raffeck <phillip.raffeck@fau.de>
CC: linux-kernel@i4.cs.fau.de
---
 drivers/tty/serial/8250/8250_hp300.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_hp300.c b/drivers/tty/serial/=
8250/8250_hp300.c
index 2891958..5e1b464 100644
--- a/drivers/tty/serial/8250/8250_hp300.c
+++ b/drivers/tty/serial/8250/8250_hp300.c
@@ -24,8 +24,7 @@
 #endif
=20
 #ifdef CONFIG_HPAPCI
-struct hp300_port
-{
+struct hp300_port {
 	struct hp300_port *next;	/* next port */
 	int line;			/* line (tty) number */
 };
--=20
1.9.1
