Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 016B74840
	for <parisc-linux@parisc-linux.org>; Thu,  9 Oct 2003 15:44:45 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A7iaS-0000Xf-Lt; Thu, 09 Oct 2003 22:44:44 +0100
Date: Thu, 9 Oct 2003 22:44:44 +0100
From: Matthew Wilcox <willy@debian.org>
To: Helge Deller <deller@gmx.de>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] defconfigs in 2.6
Message-ID: <20031009214444.GS27861@parcelfarce.linux.theplanet.co.uk>
References: <20031009150518.GG27861@parcelfarce.linux.theplanet.co.uk> <200310092321.18573.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200310092321.18573.deller@gmx.de>
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

On Thu, Oct 09, 2003 at 11:21:18PM +0200, Helge Deller wrote:
> On Donnerstag, 09. Oktober 2003 17:05, Matthew Wilcox wrote:
> > - 712 (Lasi, Wax, no PCI, no EISA.  targetted at exactly 712, may work on
> > 	other snake-type boxes)
> 
> Maybe we should add EISA to this configuration, in which case
> it would fit 715 machines too ?

My intent was that these machines would use a "hawk" configuration.  Keep
gecko minimal and expansion-less, and hawk gets all the EISA and PCI cards
compiled as modules.

The thing about 715 expansion is that (at least for 715/Mirage), you can
plug a GSC cardmode Dino into the expansion socket, so we should enable
that ... and the PCI drivers for whichever chips got put on a card with
Dino (Tulip, acenic, ... must be others?), NCR720, etc.

This starts to get kind of complicated.  I'd rather maintain these in
the hawk config.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
