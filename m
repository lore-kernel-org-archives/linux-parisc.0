Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mel-rto3.wanadoo.fr (smtp-out-3.wanadoo.fr [193.252.19.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id D270F484E
	for <parisc-linux@lists.parisc-linux.org>; Tue, 25 Jun 2002 12:59:02 -0600 (MDT)
Message-ID: <3D18BEF7.1060804@wanadoo.fr>
Date: Tue, 25 Jun 2002 21:05:27 +0200
From: eddantes@wanadoo.fr
MIME-Version: 1.0
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [OT] PCI hardware question
References: <3D188431.1060804@wanadoo.fr> <20020625182552.B625D4849@dsl2.external.hp.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Grant Grundler wrote:

[snip]

> HP specific PCI Host bus adapter called Dino (aka GSCtoPCI).
> See hwdb.parisc-linux.org to know which systems used it.
> Some systems have been fixed with a newer rev of the Dino chip.
> You can:
> o update the PDC and install a PCI card
> o boot parisc-linux
> o or look for -0004 on the IO board
> 
> to figure out if the PCI is usable or not.
> Only HP PCI graphics cards are permitted to be used in PCI
> when a broken DINO rev is in the system. PDC revs higher
> than about 5.x will enforce this.
> 
> Read comments in drivers/gsc/dino.c for more details.
> 
> grant


OK, thanks a lot for the precisions. I'll keep those infos in RAM when 
hunting down the perfect station. I am kind of tempted by a C240 or a 
C360, the latter being not as common as the former (at least on eBay, 
any other shop / surplus / auction site welcome), both have Dino. Well, 
that sounds like a PDC update.

One quick question about it: on on of HP's servers, it says that PDC 
updates must be performed using a tape drive. 
(ftp://ftp.itrc.hp.com/firmware_patches/hp/cpu/PF_CC2X0063.txt for the 
C200/C240) I guess tapes are not so common anymore, especially in 
workstations, even if I probably have an old SCSI DDT-1 or something 
like that lying around somewhere in my 
pile-of-junk-salvaged-to-repare-dead-computers. Any other way to do it? 
CD-R? Small empty HDD partition?

And at last, what about compatibility of PCI cards between different 
architectures? I'm wondering about it due to the different PC and Apple 
cards from some manufacturers (Adaptec and ATI, for example). The bottom 
line being: if I stick a PC-world USB 2.0 or whatever card in a C240, 
any chance that it *may* work, even if it requires software tweaking and 
/ or hacking?

Thanks again!
/Dantes
