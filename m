Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from c007.snv.cp.net (c007-h000.c007.snv.cp.net [209.228.33.206])
	by dsl2.external.hp.com (Postfix) with SMTP id 743B7482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 29 Jul 2001 23:29:36 -0600 (MDT)
Sender: chuck@dsl2.external.hp.com
Message-ID: <3B64F11B.DC4EEF75@telocity.com>
Date: Mon, 30 Jul 2001 01:31:07 -0400
From: caslivkoff@telocity.com
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Errors trying to compile 2.4.6-pa22
List-ID: <linux-parisc.vger.kernel.org>

Hi list,

I've been trying to compile a new kernel on my 712/80 (128MB RAM) while
running 2.4.0-pa25. I downloaded linux-latest.tar.gz (2.4.6-pa22),
configured, and "make dep" with no problems. "make palo" gets to the
end, and errors out with:

ld -T /usr/src/parisc-linux/linux/arch/parisc/vmlinux.lds 
arch/parisc/kernel/head.o  init/main.o init/version.o \
--start-group \
arch/parisc/kernel/pdc_cons.o arch/parisc/kernel/process.o
arch/parisc/lib/lib.a arch/parisc/mm/mm.o arch/parisc/kernel/kernel.o
arch/parisc/hpux/hpux.o kernel/kernel.o mm/mm.o fs/fs.o ipc/ipc.o
arch/parisc/kernel/init_task.o \
 drivers/parport/driver.o drivers/char/char.o drivers/block/block.o
drivers/misc/misc.o drivers/net/net.o drivers/media/media.o
drivers/scsi/scsidrv.o drivers/cdrom/driver.o
drivers/sound/sounddrivers.o drivers/video/video.o drivers/gsc/gscbus.o
arch/parisc/math-emu/math.o \
net/network.o \
`gcc -print-libgcc-file-name`
/usr/src/parisc-linux/linux/arch/parisc/lib/lib.a
/usr/src/parisc-linux/linux/lib/lib.a  \
	--end-group \
	-o vmlinux
drivers/char/char.o: In function `read_port':
drivers/char/char.o(.text.read_port+0x6c): undefined reference to `inb'
ld: drivers/char/char.o(.text.read_port+0x6c): cannot find stub entry
0000089b_inb+0
ld: drivers/char/char.o(.text.read_port+0x6c): cannot handle
R_PARISC_PCREL17F for inb
drivers/char/char.o(.text.read_port+0xd8): undefined reference to `inb'
ld: drivers/char/char.o(.text.read_port+0xd8): cannot find stub entry
0000089b_inb+0
ld: drivers/char/char.o(.text.read_port+0xd8): cannot handle
R_PARISC_PCREL17F for inb
drivers/char/char.o: In function `write_port':
drivers/char/char.o(.text.write_port+0x88): undefined reference to
`outb'
ld: drivers/char/char.o(.text.write_port+0x88): cannot find stub entry
0000089b_outb+0
ld: drivers/char/char.o(.text.write_port+0x88): cannot handle
R_PARISC_PCREL17F for outb
/usr/src/parisc-linux/linux/arch/parisc/lib/lib.a(io.o): In function
`insb':
io.o(.text.insb+0x30): undefined reference to `inb'
ld: io.o(.text.insb+0x30): cannot find stub entry 00000fd4_inb+0
ld: io.o(.text.insb+0x30): cannot handle R_PARISC_PCREL17F for inb
io.o(.text.insb+0x50): undefined reference to `inb'
ld: io.o(.text.insb+0x50): cannot find stub entry 00000fd4_inb+0
ld: io.o(.text.insb+0x50): cannot handle R_PARISC_PCREL17F for inb
io.o(.text.insb+0x5c): undefined reference to `inb'
ld: io.o(.text.insb+0x5c): cannot find stub entry 00000fd4_inb+0
ld: io.o(.text.insb+0x5c): cannot handle R_PARISC_PCREL17F for inb
io.o(.text.insb+0x70): undefined reference to `inb'
ld: io.o(.text.insb+0x70): cannot find stub entry 00000fd4_inb+0
ld: io.o(.text.insb+0x70): cannot handle R_PARISC_PCREL17F for inb
io.o(.text.insb+0x80): undefined reference to `inb'
ld: io.o(.text.insb+0x80): cannot find stub entry 00000fd4_inb+0
ld: io.o(.text.insb+0x80): cannot handle R_PARISC_PCREL17F for inb
/usr/src/parisc-linux/linux/arch/parisc/lib/lib.a(io.o)(.text.insb+0xa0):
more undefined references to `inb' follow
ld: io.o(.text.insb+0xa0): cannot find stub entry 00000fd4_inb+0
ld: io.o(.text.insb+0xa0): cannot handle R_PARISC_PCREL17F for inb
/usr/src/parisc-linux/linux/arch/parisc/lib/lib.a(io.o): In function
`insw':
io.o(.text.insw+0x4c): undefined reference to `inw'
ld: io.o(.text.insw+0x4c): cannot find stub entry 00000fd4_inw+0
ld: io.o(.text.insw+0x4c): cannot handle R_PARISC_PCREL17F for inw
io.o(.text.insw+0x60): undefined reference to `inw'
ld: io.o(.text.insw+0x60): cannot find stub entry 00000fd4_inw+0
ld: io.o(.text.insw+0x60): cannot handle R_PARISC_PCREL17F for inw
io.o(.text.insw+0x6c): undefined reference to `inw'
ld: io.o(.text.insw+0x6c): cannot find stub entry 00000fd4_inw+0
ld: io.o(.text.insw+0x6c): cannot handle R_PARISC_PCREL17F for inw
io.o(.text.insw+0x8c): undefined reference to `inw'
ld: io.o(.text.insw+0x8c): cannot find stub entry 00000fd4_inw+0
ld: io.o(.text.insw+0x8c): cannot handle R_PARISC_PCREL17F for inw
/usr/src/parisc-linux/linux/arch/parisc/lib/lib.a(io.o): In function
`insl':
io.o(.text.insl+0x60): undefined reference to `inl'
ld: io.o(.text.insl+0x60): cannot find stub entry 00000fd4_inl+0
ld: io.o(.text.insl+0x60): cannot handle R_PARISC_PCREL17F for inl
io.o(.text.insl+0x88): undefined reference to `inl'
ld: io.o(.text.insl+0x88): cannot find stub entry 00000fd4_inl+0
ld: io.o(.text.insl+0x88): cannot handle R_PARISC_PCREL17F for inl
io.o(.text.insl+0xb0): undefined reference to `inl'
ld: io.o(.text.insl+0xb0): cannot find stub entry 00000fd4_inl+0
ld: io.o(.text.insl+0xb0): cannot handle R_PARISC_PCREL17F for inl
io.o(.text.insl+0xd0): undefined reference to `inl'
ld: io.o(.text.insl+0xd0): cannot find stub entry 00000fd4_inl+0
ld: io.o(.text.insl+0xd0): cannot handle R_PARISC_PCREL17F for inl
io.o(.text.insl+0xf0): undefined reference to `inl'
ld: io.o(.text.insl+0xf0): cannot find stub entry 00000fd4_inl+0
ld: io.o(.text.insl+0xf0): cannot handle R_PARISC_PCREL17F for inl
/usr/src/parisc-linux/linux/arch/parisc/lib/lib.a(io.o)(.text.insl+0x110):
more undefined references to `inl' follow
ld: io.o(.text.insl+0x110): cannot find stub entry 00000fd4_inl+0
ld: io.o(.text.insl+0x110): cannot handle R_PARISC_PCREL17F for inl
ld: io.o(.text.insl+0x130): cannot find stub entry 00000fd4_inl+0
ld: io.o(.text.insl+0x130): cannot handle R_PARISC_PCREL17F for inl
/usr/src/parisc-linux/linux/arch/parisc/lib/lib.a(io.o): In function
`outsb':
io.o(.text.outsb+0x2c): undefined reference to `outb'
ld: io.o(.text.outsb+0x2c): cannot find stub entry 00000fd4_outb+0
ld: io.o(.text.outsb+0x2c): cannot handle R_PARISC_PCREL17F for outb
/usr/src/parisc-linux/linux/arch/parisc/lib/lib.a(io.o): In function
`outsw':
io.o(.text.outsw+0x4c): undefined reference to `outw'
ld: io.o(.text.outsw+0x4c): cannot find stub entry 00000fd4_outw+0
ld: io.o(.text.outsw+0x4c): cannot handle R_PARISC_PCREL17F for outw
io.o(.text.outsw+0x68): undefined reference to `outw'
ld: io.o(.text.outsw+0x68): cannot find stub entry 00000fd4_outw+0
ld: io.o(.text.outsw+0x68): cannot handle R_PARISC_PCREL17F for outw
io.o(.text.outsw+0x74): undefined reference to `outw'
ld: io.o(.text.outsw+0x74): cannot find stub entry 00000fd4_outw+0
ld: io.o(.text.outsw+0x74): cannot handle R_PARISC_PCREL17F for outw
io.o(.text.outsw+0x8c): undefined reference to `outw'
ld: io.o(.text.outsw+0x8c): cannot find stub entry 00000fd4_outw+0
ld: io.o(.text.outsw+0x8c): cannot handle R_PARISC_PCREL17F for outw
/usr/src/parisc-linux/linux/arch/parisc/lib/lib.a(io.o): In function
`outsl':
io.o(.text.outsl+0x64): undefined reference to `outl'
ld: io.o(.text.outsl+0x64): cannot find stub entry 00000fd4_outl+0
ld: io.o(.text.outsl+0x64): cannot handle R_PARISC_PCREL17F for outl
/usr/src/parisc-linux/linux/arch/parisc/lib/lib.a(io.o): In function
`L215':
io.o(.text.outsl+0xb4): undefined reference to `outl'
ld: io.o(.text.outsl+0xb4): cannot find stub entry 00000fd4_outl+0
ld: io.o(.text.outsl+0xb4): cannot handle R_PARISC_PCREL17F for outl
io.o(.text.outsl+0xd0): undefined reference to `outl'
ld: io.o(.text.outsl+0xd0): cannot find stub entry 00000fd4_outl+0
ld: io.o(.text.outsl+0xd0): cannot handle R_PARISC_PCREL17F for outl
/usr/src/parisc-linux/linux/arch/parisc/lib/lib.a(io.o): In function
`L249':
io.o(.text.outsl+0xec): undefined reference to `outl'
ld: io.o(.text.outsl+0xec): cannot find stub entry 00000fd4_outl+0
ld: io.o(.text.outsl+0xec): cannot handle R_PARISC_PCREL17F for outl
io.o(.text.outsl+0x10c): undefined reference to `outl'
ld: io.o(.text.outsl+0x10c): cannot find stub entry 00000fd4_outl+0
ld: io.o(.text.outsl+0x10c): cannot handle R_PARISC_PCREL17F for outl
/usr/src/parisc-linux/linux/arch/parisc/lib/lib.a(io.o)(.text.outsl+0x130):
more undefined references to `outl' follow
ld: io.o(.text.outsl+0x130): cannot find stub entry 00000fd4_outl+0
ld: io.o(.text.outsl+0x130): cannot handle R_PARISC_PCREL17F for outl
ld: io.o(.text.outsl+0x158): cannot find stub entry 00000fd4_outl+0
ld: io.o(.text.outsl+0x158): cannot handle R_PARISC_PCREL17F for outl
make: *** [vmlinux] Error 1

and I noticed a register dump in dmesg:

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111011100001111
r0-3	 00000000 000a63a0 00003063 00000000
r4-7	 00000000 00003ad4 00020000 40bc3040
r8-11	 00000007 000a63a0 000a63d8 000b6c58
r12-15	 000a63a0 000a73a0 000a63a0 faf00768
r16-19	 faf00608 00007b49 40843040 0000abf2
r20-23	 000b6c58 40f26044 00010000 00010000
r24-27	 00000007 00020000 40bc3040 000a63a0
r28-31	 00040000 00002000 faf00800 40c44070
sr0-3	 0000003d 0000003d 00000000 0000003d
sr4-7	 0000003d 0000003d 0000003d 0000003d

IASQ: 0000003d 0000003d IAOQ: 000043b7 000043bb
 IIR: 32ed040f    ISR: 0000003d  IOR: 40f66000
 ORIG_R28: 0200ffff


Is there a quick fix for this? Should I spend the effort to
download/configure/build the latest gcc and/or glibc or just wait for
someone to post a more recent kernel for the 712 (with mouse, keyboard,
STI console, & audio support)?

-chuck

P.S. What happened to the ESIEE site?  I realize that most of France
takes the month of August off, but it's only July 30th. ;-)
