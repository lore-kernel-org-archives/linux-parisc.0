Return-Path: <deller@gmx.de>
Received: from mail.gmx.net (pop.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 4D8FB4868
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 19 Jan 2004 14:48:35 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 32bit parisc kernel 2.6.1 and pcmcia
Date: Mon, 19 Jan 2004 22:48:29 +0100
References: <200401182059.34270.deller@gmx.de>
	<1074522943.2201.1.camel@mulgrave>
In-Reply-To: <1074522943.2201.1.camel@mulgrave>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Message-Id: <200401192248.29566.deller@gmx.de>
Cc: James Bottomley <James.Bottomley@steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Monday 19 January 2004 15:35, James Bottomley wrote:
> On Sun, 2004-01-18 at 14:59, Helge Deller wrote:
> > ..now inserting my TDK ISDN/serial modem PCMCIA card....
> 
> Sorry, I'm an idiot...these type of cards don't seem to work (they seem
> to require ISA IRQ routing rules, which we can't provide).

Wouldn't it be possible to write a wrapper, which simulated the
ISA IRQs 0-15 and routes them to dino instead ?
Isn't this similiar like the hack we have for the EISA driver ?
And maybe we are lucky and no PA-machine has both, EISA and PCMCIA.
Would this be possible ?

> Do you have a network or wireless card you could try instead?

Sadly no, only one other ISDN card (AVM).

Helge
