Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from netlx010.civ.utwente.nl (netlx010.civ.utwente.nl [130.89.1.92])
	by dsl2.external.hp.com (Postfix) with ESMTP id F0C2C4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Dec 2002 16:16:06 -0700 (MST)
Message-ID: <001d01c2a16a$5a426060$4fe85982@kabel.utwente.nl>
From: "Tim Kemna" <t.kemna@student.utwente.nl>
To: "Paul Bame" <bame@fc.hp.com>
Cc: <parisc-linux@lists.parisc-linux.org>
References: <20021211035731.GB9521@systemhalted> <Pine.LNX.4.44.0212110410060.6654-100000@sal.ucc.ie> <20021211063321.GB10185@systemhalted>  <006e01c2a11c$71745200$4fe85982@kabel.utwente.nl>  <20021211165410.EAD7015192@paul.bame>
Subject: Re: [parisc-linux] another kernel compilation error 
Date: Thu, 12 Dec 2002 00:09:25 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
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

> > drivers/char/char.o: In function `hp_diva_check':
> > drivers/char/char.o(.text.hp_diva_check+0x60): undefined reference to
> > `rs_interrupt'
> > make: *** [vmlinux] Error 1
> > 
> > What am I doing wrong?
> 
> Probably nothing but I did :-)  My Diva changes currently require
> CONFIG_SERIAL_SHARE_IRQ to be set -- need to fix that.

I can't find that option in my .config
