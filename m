Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA23976
	for <parisc-linux@puffin.external.hp.com>; Sat, 21 Oct 2000 16:30:41 -0600
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel2.hp.com (Postfix) with ESMTP id 89DA2333
	for <parisc-linux@thepuffingroup.com>; Sat, 21 Oct 2000 18:32:06 -0400 (EDT)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id QAA05513 for parisc-linux@thepuffingroup.com; Sat, 21 Oct 2000 16:32:06 -0600 (MDT)
Date: Sat, 21 Oct 2000 16:32:06 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200010212232.QAA05513@udlkern.fc.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: parisc asm questions
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Randolph,

The add instruction doesn't use the carry bit as input, but it does
produce a carry bit.  The addc instruction both uses and produces a carry
bit.  The addi instruction also does not use the carry bit as input, but
it does produce a carry bit (I use the term "carry bit", although the
architecture has a set of "carry/borrow bits", but in terms of the
instructions referenced here, only one of the bits matters, so I refer to
it as the carry bit).

So I see a variety of problems with your examples:

1) Your first loop uses addc, which means that it will use the carry bit,
which may be in an undefined state the first time you execute it, if you
have done nothing to set it the way you want.  You can either use an add
instruction before the loop to do the first add, or you can do an "add
%r0,%r0,%r0" to clear the carry bit before the loop.

2) The addi in the loop messes with the carry bit, which you don't want.
In most cases it will set the carry bit, unless %arg1 is less than 4.
The normal convention would be to use ldo -4(%arg1),%arg1 instead.
The addib instruction is ok, since it does not use or set the carry
bit.

3) In the second loop the add instruction is not a noop, since it has the
effect of clearing the carry bit.
