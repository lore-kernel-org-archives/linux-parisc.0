Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA11284
	for <parisc-linux@puffin.external.hp.com>; Fri, 7 Apr 2000 02:56:22 -0600
Message-ID: <20000407085620.3974.qmail@web504.mail.yahoo.com>
Date: Fri, 7 Apr 2000 01:56:20 -0700 (PDT)
From: Ulrich Strelow <ulrich_strelow@yahoo.com>
To: parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Kernel build with CONFIG_IODC_CONSOLE fails
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

after the 2.3.99-pre1 merge I am no longer able to
build a kernel with the IODC console. Building
defconfig is OK (CVS Version 20000406).

When I define CONFIG_VT, CONFIG_VT_CONSOLE and
CONFIG_IODC_CONSOLE the kernel build ends up with a
"death: pckbd_setkeycode type 1" message. This remains
even when I add CONFIG_GSC_PS2.

Although I must admit that I don't understand the
logic behind drivers/char/Makefile, I can see that
neither gsc_ps2.c nor keyb_at.c gets compiled, so this
seems to be the cause of the missing symbol.

When I append gsc_ps2.o and keyb_at.o to the line
  obj-y    += tty_io.o n_tty.o tty_ioctl.o mem.o 
              raw.o pty.o misc.o random.o
compiling gsc_ps2.c ends with the message
gsc_ps2.c:161: `KEYBOARD_BH' undeclared 

Any ideas ?
Ulrich

__________________________________________________
Do You Yahoo!?
Talk to your friends online with Yahoo! Messenger.
http://im.yahoo.com
