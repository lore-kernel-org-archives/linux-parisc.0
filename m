Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pubnix.net (Mail.pubnix.net [192.172.250.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id D2F1D482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 17 Jan 2002 09:04:14 -0700 (MST)
Received: from aapril ([205.205.45.2])
	by mail.pubnix.net (8.9.3/8.9.3) with SMTP id LAA10507
	for <parisc-linux@lists.parisc-linux.org>; Thu, 17 Jan 2002 11:04:12 -0500 (EST)
	(envelope-from aapril@galeasec.com)
Reply-To: <aapril@galeasec.com>
From: "Alexandre April" <aapril@galeasec.com>
To: <parisc-linux@lists.parisc-linux.org>
Date: Thu, 17 Jan 2002 11:02:31 -0500
Message-ID: <LLENLJGPDFAGGGBLOAHKCEBLCFAA.aapril@galeasec.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] irq vs smp
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

	I'm developping a char driver for one of our PCI card in linux kernel
2.4.2-2smp (Multi-processor). And the IRQ that I read from my pci config
space is 0x7 but the one that the kernel sees when I do "lspci -v" is 0x27.
Is there a way the pass from 0x7 to 0x27 using some kernel macro's.

	Thanks

	Alex
