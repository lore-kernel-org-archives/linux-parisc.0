Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (lightning.swansea.linux.org.uk [194.168.151.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id AE6544894
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Mar 2002 07:45:49 -0700 (MST)
Subject: Re: [parisc-linux] 'foreign' PCI cards in an rp2430
To: mkp@mkp.net (Martin K. Petersen)
Date: Fri, 8 Mar 2002 15:00:36 +0000 (GMT)
Cc: duraid@fl.net.au (Duraid Madina),
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <yq1it87w3y8.fsf@austin.mkp.net> from "Martin K. Petersen" at Mar 08, 2002 09:04:47 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E16jLrI-0006Qt-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
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

> Alpha happens to work because its firmware includes a simple x86
> simulator that executes the BIOS code on the card.  That way you can
> configure your disk setup, etc.

There is btw a passable x86 emulator for free in the XFree86 code that
is used to do things like boot video cards.

> Unfortunately the 3ware management utility is 386 binary-only.
> I.e. you can't configure the card once you get Linux up and running
> either.

Bochs 8)
