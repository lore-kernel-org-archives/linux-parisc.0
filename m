Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8A37B482D
	for <parisc-linux@lists.parisc-linux.org>; Sat, 13 Oct 2001 08:53:00 -0600 (MDT)
Sender: marteaut@esiee.fr
Message-ID: <3BC854FE.685DAA09@esiee.fr>
Date: Sat, 13 Oct 2001 16:51:42 +0200
From: Thomas Marteau <marteaut@esiee.fr>
MIME-Version: 1.0
To: Albert Strasheim <fullung@ilink.nis.za>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] disks not recognized by new 53c700/53c710 driver (was
 [parisc-linux-cvs] linux rhirst)
References: <20011013162103.A3604@dogbert.localdomain> <20011013162718.B3604@dogbert.localdomain> <3BC851AB.7968C3D5@esiee.fr> <20011013164448.A4317@dogbert.localdomain>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hi Albert,

	No, I thought that without sti support you could have the prompt and
debug. Anyway, Helge can be also true. Now, the HP Lasi driver is not in
default config. Be sure to add it on your kernel! 

In make menuconfig, it is SCSI support->SCSI low-level drivers->HP LASI
SCSI support for 53c700

Thomas.
