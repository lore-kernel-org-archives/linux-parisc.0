Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta-2.gci.net (mta-2.gci.net [208.138.130.83])
	by dsl2.external.hp.com (Postfix) with ESMTP id 57394482C
	for <parisc-linux@lists.parisc-linux.org>; Fri,  9 Nov 2001 15:24:28 -0700 (MST)
Received: from mmp-2.gci.net ([208.138.130.81]) by mta-2.gci.net
          (Netscape Messaging Server 4.15) with ESMTP id GMK0WS00.EVS for
          <parisc-linux@lists.parisc-linux.org>; Fri, 9 Nov 2001 13:24:28 -0900
Date: Fri, 9 Nov 2001 13:23:27 -0900 (AKST)
From: Tom <palinux@alaskatech.org>
To: Jochen Friedrich <jochen@scram.de>
Cc: Helge Deller <deller@gmx.de>,
	<parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] EISA stuff now in CVS
In-Reply-To: <Pine.LNX.4.40.0111092205340.12365-100000@alpha.bocc.de>
Message-ID: <Pine.LNX.4.33.0111091320560.4707-100000@goliath.alaskatech.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

> > Helge:
> > I don't have any EISA cards, so I tested it here with an
> > old ISA NE2000 NIC clone in my 715/64:
> >
> > dmesg:
> > ne.c:v1.10 9/23/94 Donald Becker (becker@scyld.com)
> > Last modified Nov 1, 2000 by Paul Gortmaker
> > NE*000 ethercard probe at 0x340: 08 00 00 50 11 13
> > eth0: NE2000 found at 0x340, using IRQ 10.
>
> On Fri, 9 Nov 2001, Jochen Friedrich wrote:
> Pretty strange you're getting any interrupts, as with the current patch
> the EISA PIC isn't initialized, at all...

Not that strange, I'm thinking. Lots of ISA cards have the IO and IRQ
hard-coded on them, either via jumper or logically. I'd guess this NIC is
advertising it's presence and resources used, so the system is picking up
on it. Impressive that it's working, though...

BTW, how stands the 'apt-get update' fixes? Are we safe to go, or do we
need another day or two for things to spread about?
