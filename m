Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (f214.law12.hotmail.com [64.4.19.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id 36635482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  7 Jun 2001 10:15:30 -0600 (MDT)
From: "Mike Werneke" <mikewerneke@hotmail.com>
To: parisc-linux@lists.parisc-linux.org
Date: Thu, 07 Jun 2001 03:51:22 -0000
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <F214YiMCIqtQvAauNjV0001bb18@hotmail.com>
Subject: [parisc-linux] Apollo 735/99 hangs after booting from CDROM
List-ID: <linux-parisc.vger.kernel.org>

Hello.

I have an HP Apollo 735/99 workstation with 112MB RAM and a 2GB HD.  The 
external SCSI CDROM is a bit old, but it's Sony from Sun.  I burned the 
32-bit graphical iso this afternoon and it booted into the 2.4.0-pa10 
kernel.   After it's done searching for devices (it finds 13 of them), it 
prints out:

--snip
CPU(s): 1 x PA7100 (PCX-T) at 99.000000 MHz
Kernel command line: HOME=/ TERM=linux root=/dev/ram console=tty0 sti=0 
sti_font=VGA8x16
Console: colour dummy device 80x25
snip--

and then hangs.  Could this be a bad iso image? Or is this a known issue? 
Any help would be greatly appreciated (as is all the effort already done by 
the developers of the parisc port).

Thanks-

Mike Werneke
_________________________________________________________________
Get your FREE download of MSN Explorer at http://explorer.msn.com
