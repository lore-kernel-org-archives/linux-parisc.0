Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id VAA15411
	for <parisc-linux@puffin.external.hp.com>; Wed, 28 Apr 1999 21:46:26 -0600
Date: Wed, 5 May 1999 01:29:47 -0400 (EDT)
From: Alex deVries <adevries@redhat.com>
To: Kumar <kumar@ix.netcom.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] linker errors
In-Reply-To: <Pine.LNX.3.96.990504211950.214A-100000@quark.ix.netcom.com>
Message-ID: <Pine.LNX.3.96.990505012802.22012I-100000@devserv.devel.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


On Tue, 4 May 1999, Kumar wrote:
> I am getting following errors even from the latest binutils and
> parisc-linux-gcc. Are there any special LDFLAGS that one needs to use ?
> 						-pkd
> 
> parisc-linux-ld -L. -R 0x100000 -N -S rom_interface.o setup.o utils.o
> strutils.o bcopy.o main.o io.o -l milli -o vmlinux
> parisc-linux-ld: can not size stub section: Bad value
> rom_interface.o: In function `cout_putc':
> rom_interface.o($CODE$+0xe4): undefined reference to `$$dyncall'
> rom_interface.o: In function `bootdev_sread':
> rom_interface.o($CODE$+0xe0): undefined reference to `$$dyncall'
> rom_interface.o: In function `pdc_call':
> rom_interface.o($CODE$+0x118): undefined reference to `$$dyncall'
> main.o: In function `parisc_init':
> main.o($CODE$+0x208): undefined reference to `$$divU'
> make: *** [vmlinux] Error 1
> 

Hm.  I don't get this at all... it certainly links for me.  I do get a lot
of errors with the linker itself, but nothing fatal.

Are you using the pre-built cross compilers? If so, which ones?

- Alex
