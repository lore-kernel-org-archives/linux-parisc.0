Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA11095
	for <parisc-linux@puffin.external.hp.com>; Tue, 19 Dec 2000 16:28:11 -0700
Message-ID: <3A3FEFC1.6D57E72A@hrzpub.tu-darmstadt.de>
Date: Wed, 20 Dec 2000 00:31:13 +0100
From: =?iso-8859-1?Q?R=FCdiger?= Scholz <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Problems with boot_admin prompt
List-ID: <linux-parisc.vger.kernel.org>

Hello everybody,

I have a hp 715/100, which works quite well with PARISC-Linux. Usually
it boots with tftp over my local network. So I switch the primary boot
path to lan at the boot_admin prompt.
Yesterday I tried to install the palinux-0.5.iso-Image on the harddisk.
I booted the machine over net and followed the instructions in
README.INSTALL. Then I partitioned the drive with fdisk. After
installing the Base-Package and the PALO-Bootloader, I rebooted the
machine.
But now the boot_admin prompt doesn't appear anymore, so I can't change
the boot path to scsi!

The Box boots over the network yet, but how can I access the boot_admin
prompt? All I get is a black screen, when I switch the machine on. I
used the Serial Console, because the STI-Console doesn't work for me
(Another question: Does anybody got a working STI-Con on such a box ?).

Can somebody help me?
