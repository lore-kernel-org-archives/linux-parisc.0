Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rover (rover.mkp.net [209.217.122.9])
	by dsl2.external.hp.com (Postfix) with ESMTP id BAABF48A0
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Mar 2002 08:33:44 -0700 (MST)
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: duraid@fl.net.au (Duraid Madina),
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 'foreign' PCI cards in an rp2430
From: "Martin K. Petersen" <mkp@mkp.net>
References: <E16jLrI-0006Qt-00@the-village.bc.nu>
Date: 08 Mar 2002 10:33:34 -0500
In-Reply-To: <E16jLrI-0006Qt-00@the-village.bc.nu>
Message-ID: <yq1elivvzu9.fsf@austin.mkp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

>>>>> "Alan" == Alan Cox <alan@lxorguk.ukuu.org.uk> writes:

>> Alpha happens to work because its firmware includes a simple x86
>> simulator that executes the BIOS code on the card.  That way you
>> can configure your disk setup, etc.

Alan> There is btw a passable x86 emulator for free in the XFree86
Alan> code that is used to do things like boot video cards.

Yep.  It's going to take a fairly big hammer to beat libint10 into
submission, though.  Interactively mocking with disk configuration and
whatnot is a bit more complex than kicking off some init fluff on a
video card.


>> Unfortunately the 3ware management utility is 386 binary-only.
>> I.e. you can't configure the card once you get Linux up and running
>> either.

Alan> Bochs 8)

It would actually be useful to hack it so we had a generic way of
running x86 card ROMs on non-{PC,Alpha,Itanium} architectures.

-- 
Martin K. Petersen      Cereal Bowl Engineer, Linuxcare, Inc.
http://mkp.net/         SGI XFS, Linux/PA-RISC, GNOME
