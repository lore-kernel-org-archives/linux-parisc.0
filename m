Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7C6AE49E6
	for <parisc-linux@lists.parisc-linux.org>; Wed, 22 Oct 2003 00:39:45 -0600 (MDT)
Date: Wed, 22 Oct 2003 00:39:43 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH] SuckyIO still doesn't work
Message-ID: <20031022063943.GA30984@colo.lackof.org>
References: <20031015141018.GD16535@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031015141018.GD16535@parcelfarce.linux.theplanet.co.uk>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Wed, Oct 15, 2003 at 03:10:18PM +0100, Matthew Wilcox wrote:
> This patch doesn't make suckyio serial work.  But I think it's along
> the right lines.  Anybody else want to play with this, go ahead.

I did. My resulting patch cleans up a few more things and still
needs yet more cleanup. But gets alot further now.
Problems are starting to look generic.
Current patch on ftp.p-l.o:patches/diff-2.6.0-suckyio-serial-03

I do like the static initializers much better.
And I've moved the pdc_io_reset() calls to sba driver where they belong.
I do need to add more code to:
	(1) determine when we need to reset (ie is USB active)
	(2a) unregister pdc_console (ie don't try to talk to it)
	(2b) resurrect serial config after reset (try to keep pdc_cons working)

Main problem I was seeing is a divide by zero trap
when setting up the baud rate.

> +static struct uart_port serial[] = {
> +	{
> +		.iotype		= UPIO_PORT,
> +		.line		= 0,
> +		.type		= PORT_16550A,
> +		.uartclk	= 115200,
> +		.fifosize	= 16,
> +	},

/me whacks willy's hand with a ruler...
(ok, not really called for, silly me didn't see the semi-obvious and
burned over 6 hours on Sunday+Monday night tracking this down)

Should read:
	.uartclk        = 115200*16,

uartclk/16 is used to determine the max baud rate.

        baud = uart_get_baud_rate(port, termios, old, 0, port->uartclk/16);

and since 9600 > 115200/16,  uart_get_baud_rate() returns 0...


My c3k now gets to:
....
VFS: Mounted root (ext3 filesystem) readonly.
Freeing unused kernel memory: 364k freed
      _______________________________
     < Your System ate a SPARC! Gah! >
      -------------------------------
             \   ^__^
              \  (xx)\_______
                 (__)\       )\/\
                  U  ||----w |
                     ||     ||
swapper (pid 1): Breakpoint (code 0)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111011100001111 Not tainted
r00-03  00000000 10339430 101f4044 00000003
r04-07  00000063 10212568 00000000 103062f0
r08-11  00000002 000f41fa 4e4da280 103d9404
r12-15  3ccbf700 1034e810 103d9010 f0400004
r16-19  f00008c4 f000017c f0000174 00000000
r20-23  00000003 00000000 101f3fec 103062f0
r24-27  000000d3 00000003 10355848 10330010
r28-31  00000060 10f0e940 4ffa8580 10104bfc
sr0-3   00000000 00000000 00000000 00000000
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 1037c748 1037c74c
 IIR: 00000000    ISR: 00000000  IOR: 00000000
 CPU:        0   CR30: 4ffa8000 CR31: 10367000
 ORIG_R28: 00000034
<2><2><0>Kernel panic: Attempted to kill init!

IOAQ: 0x1037c748 superio_init+0
GR02: 0x101f4044 superio_enable_irq+58

...
superio_init(superio_device *sio)
{
        struct pci_dev *pdev = sio->lio_pdev;
...

Mystery #1: Don't understand why sio is invalid.

Commenting out the superio_init() call from superio_enable_irq()
lets the machine boot though.

...
md: ... autorun DONE.
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem) readonly.
Freeing unused kernel memory: 364k freed
superio_enable_irq(10355848, 3)
superio_enable_irq(10355848, 3)
superio_enable_irq(10355848, 3)
superio_enable_irq(10355848, 3)
superio_enable_irq(10355848, 3)
superio_enable_irq(10355848, 3)
Adding 263144k swap on /dev/sda1.  Priority:-1 extents:1
EXT3 FS on sda3, internal journal
ip_conntrack version 2.1 (8081 buckets, 64648 max) - 300 bytes per conntrack
kjournald starting.  Commit interval 5 seconds
EXT3 FS on sda4, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
drivers/usb/core/usb.c: registered new driver usbfs
drivers/usb/core/usb.c: registered new driver hub
drivers/usb/core/usb.c: deregistering driver usbfs
drivers/usb/core/usb.c: deregistering driver hub
ip_tables: (C) 2000-2002 Netfilter core team
...
drivers/usb/core/usb.c: deregistering driver usbfs                              
drivers/usb/core/usb.c: deregistering driver hub                                
ip_tables: (C) 2000-2002 Netfilter core team                                    
eth0: Setting full-duplex based on MII#1 link partner capability of 45e1.       
<end of output>


Mystery #2: why is superio_enable_irq() getting called so often?

Waiting patiently for login prompt...can ping the machine but
can't ssh into it (yet)...bedtime. Probably need to TOC the machine
to see what it's spinning on. Another day.

hth,
grant
