Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 267AF611E
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Dec 2001 11:30:17 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16EE90-0006YQ-00; Wed, 12 Dec 2001 18:30:14 +0000
Date: Wed, 12 Dec 2001 18:30:14 +0000
From: Matthew Wilcox <willy@debian.org>
To: Herb Radford <herbr@magma.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Install on a D370!
Message-ID: <20011212183014.A22198@parcelfarce.linux.theplanet.co.uk>
References: <5.1.0.14.0.20011212111857.0263d110@mail.magma.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <5.1.0.14.0.20011212111857.0263d110@mail.magma.ca>; from herbr@magma.ca on Wed, Dec 12, 2001 at 12:01:45PM -0500
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

On Wed, Dec 12, 2001 at 12:01:45PM -0500, Herb Radford wrote:
> There is a FWSCSI card in the box with 6 drives attached and another card, 
> a "Remote Management/Access Port" card in HSC 0 Slot 0.
> I've seen a couple of messages about D350's which say all this stuff worked!
> 
> Does anyone have any suggestions?

Yep, I think I know the problem.  Let's see if anyone agrees.

> I/O MODULE INFORMATION
>                                                                     IODC   IODC
> Path (dec)   Type                Bus Slot Mod HVERSION  SVERSION   Vers   Dep
> ----         ----                --- ---- --- -------- ---------- ------ ------
> 8            I/O Adapter           0   2   0   0x580f  0x10000b50  0x00   0x00
> 8/0          Bus Converter         1   0   0   0x5000  0x00000c00  0x00   0x00
> 8/0/0        A Direct I/O          5   0   0   0x0100  0x00000d00  0x04   0x00
> 8/4          A DMA I/O             1   1   0   0x0131  0x00008980  0x98   0x00
> 8/16         Bus Adapter           1   4   0   0x02f0  0x00008100  0x00   0x00
> 8/16/5       Built-in SE SCSI     16   1   1   0x02f0  0x00008280  0x01   0x00
> 8/16/6       Built-in LAN         16   1   2   0x02f0  0x00008a00  0x02   0x00
> 8/16/0       Built-in Parallel    16   0   0   0x02f0  0x00007400  0x00   0x00
> 8/16/7       Built-in Keyboard    16   1   3   0x02f0  0x00008400  0x00   0x00
> 8/16/8       Built-in Mouse       16   2   0   0x02f0  0x00008400  0x00   0x00
> 8/20         Bus Adapter           1   5   0   0x0310  0x00008e00  0x00   0x00
> 8/20/5       Bus Adapter          20   1   1   0x0310  0x00009000  0x00   0x00
> 8/20/2       RS232 Port           20   0   2   0x0310  0x00008c00  0x00   0x00
> 10           I/O Adapter           0   2   2   0x580f  0x10000b50  0x00   0x00

The device at 8/16 is a Lasi.  However, it doesn't report a serial port
below it.  I wonder if plugging the management card in disables the first
onboard serial port?  Anyway, there is an RS232 device we know how to
drive at 8/20/2.  This is a Wax chip and it has a standard UART in it.

So if you plug your console into the _second_ serial port, yet boot
it with console=ttyS0, you should see boot messages.  If you have two
null-modem cables, you might want to try having both plugged in at the
same time to be sure you don't miss anything.

-- 
Revolutions do not require corporate support.
