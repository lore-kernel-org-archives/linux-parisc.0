Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id VAA15157
	for <parisc-linux@puffin.external.hp.com>; Wed, 28 Apr 1999 21:41:55 -0600
Date: Tue, 4 May 1999 21:26:37 -0700 (PDT)
From: Kumar <kumar@ix.netcom.com>
To: parisc-linux@thepuffingroup.com
cc: kumar@ix.netcom.com
Message-ID: <Pine.LNX.3.96.990504211950.214A-100000@quark.ix.netcom.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] linker errors
List-ID: <linux-parisc.vger.kernel.org>


I am getting following errors even from the latest binutils and
parisc-linux-gcc. Are there any special LDFLAGS that one needs to use ?

						-pkd

I have been able to hack it to get in virtual mode. Just thought
of compiling with latest cross compiling tools ..rather than that
strange combination of gcc on HP-UX and HP's linker..


parisc-linux-ld -L. -R 0x100000 -N -S rom_interface.o setup.o utils.o
strutils.o bcopy.o main.o io.o -l milli -o vmlinux
parisc-linux-ld: can not size stub section: Bad value
rom_interface.o: In function `cout_putc':
rom_interface.o($CODE$+0xe4): undefined reference to `$$dyncall'
rom_interface.o: In function `bootdev_sread':
rom_interface.o($CODE$+0xe0): undefined reference to `$$dyncall'
rom_interface.o: In function `pdc_call':
rom_interface.o($CODE$+0x118): undefined reference to `$$dyncall'
main.o: In function `parisc_init':
main.o($CODE$+0x208): undefined reference to `$$divU'
make: *** [vmlinux] Error 1
