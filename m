Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0C5C4482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 27 Jan 2002 10:27:14 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16Ut5E-00045i-00; Sun, 27 Jan 2002 17:27:12 +0000
Date: Sun, 27 Jan 2002 17:27:12 +0000
From: Matthew Wilcox <willy@debian.org>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 743 VME board boots
Message-ID: <20020127172712.B19804@parcelfarce.linux.theplanet.co.uk>
References: <20020127151743.GQ2884@sleepie.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020127151743.GQ2884@sleepie.demon.co.uk>; from rhirst@linuxcare.com on Sun, Jan 27, 2002 at 03:17:44PM +0000
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

On Sun, Jan 27, 2002 at 03:17:44PM +0000, Richard Hirst wrote:
>   I just stuck a 743 board in a VME rack and powered it up - it "just
> worked" :)

Excellent :-)

> Found devices:
> 1. Anole Artist Optional Graphics (10) at 0xf8000000 [1], versions 0x8, 0x0, 0x85
> 2. Anole 100 Core BA (11) at 0xf0100000 [2], versions 0x1b, 0x0, 0x81
> 3. Anole 100 Core SCSI (10) at 0xf0106000 [2/0/1], versions 0x1b, 0x0, 0x82
> 4. Anole 100 Core LAN (802.3) (10) at 0xf0107000 [2/0/2], versions 0x1b, 0x0, 0x8a
> 5. Anole 100 Core RS-232 (10) at 0xf0105000 [2/0/4], versions 0x1b, 0x0, 0x8c
> 6. Anole 100 Core Centronics (10) at 0xf0102000 [2/0/6], versions 0x1b, 0x0, 0x74
> 7. Anole 100 Audio (10) at 0xf0104000 [2/0/8], versions 0x1b, 0x0, 0x7b
> 8. Anole 100 Core PS/2 Port (10) at 0xf0108000 [2/0/11], versions 0x1b, 0x0, 0x84
> 9. Anole 100 Core PS/2 Port (10) at 0xf0108100 [2/0/12], versions 0x1b, 0x0, 0x84
> 10. Anole 64 TIMI BA (11) at 0xffc11000 [7], versions 0x1b, 0x0, 0x93
> 11. Anole 100 VME Networking (10) at 0xffcf0000 [7/0/1], versions 0x1b, 0x0, 0x88
> 12. Anole 100 Timi RS-232 (10) at 0xffc1a000 [7/0/2], versions 0x21, 0x0, 0x8c
> 13. unknown device (10) at 0xffcf1000 [7/0/3], versions 0x1b, 0x0, 0x8f
> 14. Anole 100 (743/100) (0) at 0xfffbe000 [8], versions 0x604, 0x0, 0x4
> 15. unknown device (1) at 0xfffbf000 [9], versions 0x0, 0x0, 0x9
> 16. Shrike Add-on FW-SCSI (4) at 0xfff88000 [11], versions 0x14, 0x0, 0x89
> 17. Anole 100 VME BA (11) at 0xffc00000 [15], versions 0x1b, 0x0, 0x78

device 13 is a Boot ROM.  And device 15 is Memory.  We can simply update
hardware.c for this.

> Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
> ttyS00 at iomem 0xf0105800 (irq = 90) is a 16550A
> IRQ not found for serial device at 0xffc1a000
> Warning : device (10, 0x21, 0x0, 0x8c) NOT claimed by Serial RS232

This is because we don't have a driver which claims Timi.  Anyone happen
to have documentation on the Timi bus adapter?

> SCSI subsystem driver Revision: 1.00
> zalon_scsi_callback: Zalon vers field is 0x1, IRQ 34
> ncr53c8xx: 53c720 detected
> ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
> scsi0 : ncr53c8xx-3.4.3b-20010512

heh, fun.  So a Shrike works the same as a Zalon.. OK that does make sense.

> Lasi Harmony Audio rev. 0 at 0xf0104000, using IRQ 82

Cool, can you play mp3s?  The CPU should be fast enough :-)

-- 
Revolutions do not require corporate support.
