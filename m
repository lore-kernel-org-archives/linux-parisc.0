Return-Path: <xam@cs.ucc.ie>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7AFD448D8
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 27 Feb 2004 03:22:24 -0700 (MST)
Date: Fri, 27 Feb 2004 10:22:22 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Eggert Ehmke <eggert.ehmke@berlin.de>
Subject: Re: [parisc-linux] kernel 2.6.3 compile problem
In-Reply-To: <200402271110.50459.eggert.ehmke@berlin.de>
Message-ID: <Pine.LNX.4.58.0402271018590.3556@sal.ucc.ie>
References: <200402271110.50459.eggert.ehmke@berlin.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, 27 Feb 2004, Eggert Ehmke wrote:

> Hello!
>
> This is my first message on this list. If  need some kind of registration,
> please let me know.

Registration is not required, but I maybe you like to register your
here:

http://hwdb.parisc-linux.org/view.php3?type=machine&name=B132L%2B

> Now I tried to compile kernel 2.6.2-pa0 and 2.6.3-pa2 with the same result:
> the compile fails with this message:
>
> --   CC      drivers/char/tty_io.o
> In file included from include/linux/selection.h:11,
>                  from drivers/char/tty_io.c:101:
> include/linux/vt_buffer.h:19:21: asm/vga.h: No such file or directory
> make[2]: *** [drivers/char/tty_io.o] Error 1
> make[1]: *** [drivers/char] Error 2
> make: *** [drivers] Error 2
>
> There is indeed no file include/asm/vga.h. But if I understand the
> documentation right, I need to include VGA support. Can you please tell me
> where I am wrong? These are my console settings in .config:
>
> CONFIG_VGA_CONSOLE=y

I think this is the culprit. There is not VGA support on Linux/PA-RISC.

> # CONFIG_MDA_CONSOLE is not set
> CONFIG_STI_CONSOLE=y
> CONFIG_DUMMY_CONSOLE_COLUMNS=160
> CONFIG_DUMMY_CONSOLE_ROWS=64
> CONFIG_DUMMY_CONSOLE=y
> CONFIG_FRAMEBUFFER_CONSOLE=y
> CONFIG_PCI_CONSOLE=y
> # CONFIG_FONTS is not set
> CONFIG_FONT_8x8=y
> CONFIG_FONT_8x16=y

Greetings,
  Max
