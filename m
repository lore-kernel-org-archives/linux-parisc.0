Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8DCD34A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Feb 2001 16:33:04 -0700 (MST)
Sender: marteaut@esiee.fr
Message-ID: <3A8C672C.E06566A0@esiee.fr>
Date: Fri, 16 Feb 2001 00:33:00 +0100
From: Thomas Marteau <marteaut@esiee.fr>
MIME-Version: 1.0
To: Kevin Read <obsidian@panokratie.de>,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Test on 705
References: <Pine.LNX.4.31.0102160013480.22670-100000@kiste.innnet.de>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hi Kevin,

	It seems like you want to boot with the file system via nfs.

This is waht that means:

mount: RPC call returned error 229
Root-NFS: Server returned error -229 while mounting /tftpboot/(none)
VFS: Unable to mount root fs via NFS, trying floppy.
VFS: Cannot open root device "nfs" or 02:00
Please append a correct "root=" boot option

If it is not what you want, please refer to the PALO Readme or to the
official website PALO How-To

Good Luck, Thomas

ESIEE Team
Visit http://www.esiee.fr/puffin
