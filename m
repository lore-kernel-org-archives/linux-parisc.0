Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: eddantes@wanadoo.fr
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [OT] PCI hardware question 
In-Reply-To: Message from eddantes@wanadoo.fr
   of "Tue, 25 Jun 2002 16:54:41 +0200." <3D188431.1060804@wanadoo.fr>
References: <3D188431.1060804@wanadoo.fr> 
Date: Tue, 25 Jun 2002 12:25:52 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020625182552.B625D4849@dsl2.external.hp.com>
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

eddantes@wanadoo.fr wrote:
> I'm planning to buy a second hand station at some point and have fun 
> with Linux, but in the documentation process, I discovered some stations 
> have problemw with PCI hardware.
> 
> The question is: which kind of PCI stuff is this? Regular, PC compatible 
> cards, or HP specific?

HP specific PCI Host bus adapter called Dino (aka GSCtoPCI).
See hwdb.parisc-linux.org to know which systems used it.
Some systems have been fixed with a newer rev of the Dino chip.
You can:
o update the PDC and install a PCI card
o boot parisc-linux
o or look for -0004 on the IO board

to figure out if the PCI is usable or not.
Only HP PCI graphics cards are permitted to be used in PCI
when a broken DINO rev is in the system. PDC revs higher
than about 5.x will enforce this.

Read comments in drivers/gsc/dino.c for more details.

grant
