Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA19448
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Nov 1999 12:39:24 -0700
From: Andi <der_fisch@fischlustig.de>
To: parisc-linux@thepuffingroup.com
Date: Mon, 15 Nov 1999 20:34:55 +0100
Content-Type: text/plain
MIME-Version: 1.0
Message-Id: <99111520410600.00425@beavis>
Subject: [parisc-linux] question about booting / console
List-ID: <linux-parisc.vger.kernel.org>

Hi,

I have now sucessfully booted the linux kernel over the network with bootp.

after booting the HP with "boot alt isl" , I changed the command line from
console=ttyS0 to console=tty at the interactive bootloader, but after the kernel
displays

realmode_setup exited

nothing else happens. I used the latest binary kernel snapshot, and I have a
HP 712.

-- 
bye
  Andreas

-------------------------------------------------
e-mail: andi@fischlustig.de

*Checkout our cool game for Linux and Win32*
   *http://www.fischlustig.de/clanbomber*
-------------------------------------------------
