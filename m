From: =?UTF-8?q?Manuel=20Sch=C3=B6lling?= <manuel.schoelling@gmx.de>
Subject: [PATCH 0/2] Persistent scrollback buffers for all VGA consoles
Date: Mon, 18 Apr 2016 21:56:43 +0200
Message-ID: <1461009405-1738-1-git-send-email-manuel.schoelling@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: jslaby@suse.com, thomas@winischhofer.net, plagnioj@jcrosoft.com,
	tomi.valkeinen@ti.com, jejb@parisc-linux.org, deller@gmx.de,
	manuel.schoelling@gmx.de, sfr@canb.auug.org.au,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-parisc@vger.kernel.org
To: gregkh@linuxfoundation.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Another attempt to add persistent scrollback buffers for all VGA consol=
es,
so the buffer is not flushed when swithing back and forth between conso=
les.

Note that breaks tools like bash's clear_console and thus might have
security implications:
clear_console relies on this 'anti-feature' of the kernel to clear the =
buffer
when consoles are switched.

To offer a way for userland tools to flush the buffer my second patch a=
dds
a ioctl call for that.
Also this feature is disabled by default and security implications are =
clearly
stated in its documentation.

Manuel Sch=C3=B6lling (2):
  console: Add persistent scrollback buffers for all VGA consoles
  console: Add ioctl for flushing the scrollback buffer

 drivers/tty/vt/vt_ioctl.c               |  20 ++++
 drivers/usb/misc/sisusbvga/sisusb_con.c |   1 +
 drivers/video/console/Kconfig           |  22 +++-
 drivers/video/console/dummycon.c        |   1 +
 drivers/video/console/mdacon.c          |   6 +
 drivers/video/console/newport_con.c     |   1 +
 drivers/video/console/sticon.c          |   7 ++
 drivers/video/console/vgacon.c          | 195 ++++++++++++++++++++++--=
--------
 include/linux/console.h                 |   1 +
 include/uapi/linux/vt.h                 |   1 +
 10 files changed, 194 insertions(+), 61 deletions(-)

--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
