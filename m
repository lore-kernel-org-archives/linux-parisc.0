Return-Path: <eggert.ehmke@berlin.de>
Received: from mail.gmx.net (pop.gmx.de [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 28D9648B2
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 27 Feb 2004 03:11:38 -0700 (MST)
From: Eggert Ehmke <eggert.ehmke@berlin.de>
To: parisc-linux@lists.parisc-linux.org
Date: Fri, 27 Feb 2004 11:10:50 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Message-Id: <200402271110.50459.eggert.ehmke@berlin.de>
Subject: [parisc-linux] kernel 2.6.3 compile problem
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hello!

This is my first message on this list. If  need some kind of registration, 
please let me know.

I run a HP PA-RISC B132L+ with Debian Woody as a DSL Gateway/Firwall for our 
home network. Right now we have the kernel 2.4.25-pa0 running. The kernel is 
compiled from sources by gcc 3.0.4. The system runs fine.

Now I tried to compile kernel 2.6.2-pa0 and 2.6.3-pa2 with the same result: 
the compile fails with this message:

--   CC      drivers/char/tty_io.o
In file included from include/linux/selection.h:11,
                 from drivers/char/tty_io.c:101:
include/linux/vt_buffer.h:19:21: asm/vga.h: No such file or directory
make[2]: *** [drivers/char/tty_io.o] Error 1
make[1]: *** [drivers/char] Error 2
make: *** [drivers] Error 2

There is indeed no file include/asm/vga.h. But if I understand the 
documentation right, I need to include VGA support. Can you please tell me 
where I am wrong? These are my console settings in .config:

CONFIG_VGA_CONSOLE=y
# CONFIG_MDA_CONSOLE is not set
CONFIG_STI_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=160
CONFIG_DUMMY_CONSOLE_ROWS=64
CONFIG_DUMMY_CONSOLE=y
CONFIG_FRAMEBUFFER_CONSOLE=y
CONFIG_PCI_CONSOLE=y
# CONFIG_FONTS is not set
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y


Eggert Ehmke
mailto:eggert.ehmke@berlin.de

receive my pgp public key from: blackhole.pca.dfn.de
ID: F237 0537
