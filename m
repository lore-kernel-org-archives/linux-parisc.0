Return-Path: <deller@gmx.de>
Received: from mail.gmx.net (pop.gmx.de [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id D46F84843
	for <parisc-linux@lists.parisc-linux.org>;
	Fri,  5 Dec 2003 13:40:33 -0700 (MST)
From: Helge Deller <deller@gmx.de>
Date: Fri, 5 Dec 2003 21:40:19 +0100
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200312052140.19017.deller@gmx.de>
Subject: [parisc-linux] Fwd: A call for boot loader IDs
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Is this something we should care about for PALO ?

Helge

----------  Forwarded Message  ----------

Subject: A call for boot loader IDs
Date: Friday 05 December 2003 17:38
From: "H. Peter Anvin" <hpa@zytor.com>
To: linux-kernel@vger.kernel.org

Hi all,

So far only a small number of boot loaders have actually officially
registered their IDs, this is the list that I have:

  type_of_loader: 
        If your boot loader has an assigned id (see table below),
        enter 0xTV here, where T is an identifier for the boot loader
        and V is a version number.  Otherwise, enter 0xFF here.

        Assigned boot loader ids:
        0  LILO
        1  Loadlin
        2  bootsect-loader
        3  SYSLINUX
        4  EtherBoot
        5  ELILO

        Please contact <hpa@zytor.com> if you need a bootloader ID
        value assigned.

I would really appreciate if other boot loaders -- especially GRUB,
which is widely used -- would let me know (a) what they are currently
doing, and (b) whether or not they need an official allocation.  It's
probably unwise to not do so, at least for the ones which have a
significant user community.

The purpose of this ID is so we can work around individual boot loader
issues if we should have a need to adjust or change the boot
protocol.  Not reporting a unique ID makes this impossible.

	 -hpa
