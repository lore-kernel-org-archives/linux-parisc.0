Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 4F2E4482C
	for <parisc-linux@lists.parisc-linux.org>; Fri,  9 Nov 2001 15:33:59 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Tom <palinux@alaskatech.org>, Jochen Friedrich <jochen@scram.de>
Subject: Re: [parisc-linux] EISA stuff now in CVS
Date: Fri, 9 Nov 2001 23:33:30 +0100
Cc: <parisc-linux@lists.parisc-linux.org>
References: <Pine.LNX.4.33.0111091320560.4707-100000@goliath.alaskatech.org>
In-Reply-To: <Pine.LNX.4.33.0111091320560.4707-100000@goliath.alaskatech.org>
MIME-Version: 1.0
Message-Id: <20011109223359.4F2E4482C@dsl2.external.hp.com>
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

> > On Fri, 9 Nov 2001, Jochen Friedrich wrote:
> > Pretty strange you're getting any interrupts, as with the current patch
> > the EISA PIC isn't initialized, at all...
>
> Not that strange, I'm thinking. Lots of ISA cards have the IO and IRQ
> hard-coded on them, either via jumper or logically. I'd guess this NIC is
> advertising it's presence and resources used, so the system is picking up
> on it. Impressive that it's working, though...

It's even better :-)
This card uses the ne2.c driver and this driver probes all adresses 0x300, 0x320, 0x340, ...
and then uses Linux's irq autodetection code. Nothing hardcoded here.

Helge
