Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [156.153.255.205])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6A91C4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Dec 2002 09:54:18 -0700 (MST)
To: "Tim Kemna" <t.kemna@student.utwente.nl>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] another kernel compilation error 
In-Reply-To: Your message of "Wed, 11 Dec 2002 14:51:44 +0100."
             <006e01c2a11c$71745200$4fe85982@kabel.utwente.nl>
References: <20021211035731.GB9521@systemhalted> <Pine.LNX.4.44.0212110410060.6654-100000@sal.ucc.ie> <20021211063321.GB10185@systemhalted>  <006e01c2a11c$71745200$4fe85982@kabel.utwente.nl> 
Date: Wed, 11 Dec 2002 09:54:10 -0700
From: Paul Bame <bame@fc.hp.com>
Message-Id: <20021211165410.EAD7015192@paul.bame>
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

> drivers/char/char.o: In function `hp_diva_check':
> drivers/char/char.o(.text.hp_diva_check+0x60): undefined reference to
> `rs_interrupt'
> make: *** [vmlinux] Error 1
> 
> What am I doing wrong?

Probably nothing but I did :-)  My Diva changes currently require
CONFIG_SERIAL_SHARE_IRQ to be set -- need to fix that.

        -P
