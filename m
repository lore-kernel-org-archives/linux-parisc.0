Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 029E848C7
	for <parisc-linux@lists.parisc-linux.org>; Tue,  7 Oct 2003 03:58:56 -0600 (MDT)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by cpout1.tiscali.be with esmtp (Tiscali)
	id 1A6ocK-0002BB-00
	for <parisc-linux@lists.parisc-linux.org>; Tue, 07 Oct 2003 11:58:56 +0200
Date: Tue, 7 Oct 2003 11:58:55 +0200
Message-ID: <3F5CC41F0000EAE2@ocpmta3.freegates.net>
In-Reply-To: <3F5CB6FB0000CBFC@ocpmta1.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] 2.6.0-test6-pa6 on b2k finaly crash
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Hi all,

I come back to this bug to just notice that in the init of 2.4 it was:
[...]
Initializing RT netlink socket
Soft power switch enabled, polling @ 0xf0400804.
SuperIO: Found NS87560 Legacy I/O device at 00:0e.1 (IRQ 64) 
SuperIO: Serial port 1 at 0x3f8
SuperIO: Serial port 2 at 0x2f8
SuperIO: Parallel port at 0x378
SuperIO: Floppy controller at 0x3f0
SuperIO: ACPI at 0x7e0
SuperIO: USB regulator enabled
parport0: PC-style at 0x378, irq 101 [PCSPP(,...)]
[...]

so 'superio_init' (if i don't mistake)

but here in 2.6:
[...]
Soft power switch enabled, polling @ 0xf0400804.
pty: 256 Unix98 ptys configured
lp: driver loaded but no devices found
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision
[...]

so not superio_init (even thought CONFIG_SUPERIO=y and well find this function
into vmlinux)?

hth,
    Joel




-------------------------------------------------------------------------
L'Internet rapide, c'est pour tout le monde. Tiscali ADSL, 19,50 Euro
pendant 3 mois! http://reg.tiscali.be/default.asp?lg=fr 
