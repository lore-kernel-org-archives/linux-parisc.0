Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailer.berkom.de (mailer.berkom.de [141.39.13.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id E9085482C
	for <parisc-linux@lists.parisc-linux.org>; Fri,  1 Jun 2001 04:53:30 -0600 (MDT)
Received: from peelnb (peel-nb.berkom.de [141.39.12.118])
	by mailer.berkom.de (8.11.2/0.0.0) with SMTP id f51ArQV00079
	for <parisc-linux@lists.parisc-linux.org>; Fri, 1 Jun 2001 12:53:26 +0200 (MET DST)
From: "Nicolai Leymann" <n.leymann@berkom.de>
To: <parisc-linux@lists.parisc-linux.org>
Date: Fri, 1 Jun 2001 12:54:10 +0200
Message-ID: <NDBBKPOMPCLCKIFPPHMNKEBKCOAA.n.leymann@berkom.de>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] palinux 0.9 on 715/64 STI
List-ID: <linux-parisc.vger.kernel.org>

Dear all,

I've downloaded the palinux 0.9 STI image and tried to install
it on my 715/64 (the 0.6.1 STI release runs fine). But during
booting from the CD the system hangs with the following messages:

  Warning: unable to open an initial console
  loop: enabling 8 loop devices

And thats it. Any ideas? Is it possible that the images tries
to open an serial console (which is not connected)?

   Nic

--
Nicolai Leymann                   Mail:   nicolai.leymann@telekom.de
T-Nova Berkom                     Phone:  ++49-30-34973570
IP-Technologies, T33              Mobile: ++49-0170-2275345
Goslarer Ufer 35, 10589 Berlin    Fax:    ++49-30-34973571
