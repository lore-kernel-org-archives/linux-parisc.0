Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8C0B24868
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 19 Jan 2004 18:16:38 -0700 (MST)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i0K1GZa03593; Mon, 19 Jan 2004 20:16:35 -0500
Subject: Re: [parisc-linux] 32bit parisc kernel 2.6.1 and pcmcia
From: James Bottomley <James.Bottomley@steeleye.com>
To: Helge Deller <deller@gmx.de>
In-Reply-To: <200401192248.29566.deller@gmx.de>
References: <200401182059.34270.deller@gmx.de>
	<1074522943.2201.1.camel@mulgrave> <200401192248.29566.deller@gmx.de>
Content-Type: text/plain
Date: 19 Jan 2004 20:16:30 -0500
Message-Id: <1074561391.2081.17.camel@mulgrave>
Mime-Version: 1.0
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, 2004-01-19 at 16:48, Helge Deller wrote:
> Wouldn't it be possible to write a wrapper, which simulated the
> ISA IRQs 0-15 and routes them to dino instead ?
> Isn't this similiar like the hack we have for the EISA driver ?
> And maybe we are lucky and no PA-machine has both, EISA and PCMCIA.
> Would this be possible ?

OK...Just to confirm what you're getting yourself into:

The yenta socket is a deep black art.  It also covers a multitude of
slightly different standards (from different manufacturers).  I learned
enough of the sourcery to say the required incantations for my
particular needs (which were a B180 with a PCI<->cardbus yenta socket
that came free with my zoom wireless card).

In order to get my setup to work, I also had to replumb virtually the
whole of the dino PCI system (I needed this because the B180 firmware
barfed at the PCMCIA socket and simply disabled it).

The point, I'm afraid, is that although I got it work for me, I'll bet
not much of the magic is transferrable, so you may also find yourself
ploughing through the yenta specs...

If this hasn't deterred you, then read on intrepid adventurer.

One of the things you seem to have from the error messages is IRQ
misrouting.  Could you boot up (or stop PCMCIA, remove all the modules,
including the core and restart) with a card in the socket?  The socket
status should tell us which one, and the IRQ line is given by lspci. 
Since the chip is both PCI device functions, it's not impossible to have
the IRQ routings messed up.

James
