Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id AE872485E
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Apr 2003 06:29:50 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 195m2v-0005Nx-1m; Wed, 16 Apr 2003 13:29:49 +0100
Date: Wed, 16 Apr 2003 13:29:48 +0100
From: Matthew Wilcox <willy@debian.org>
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Presicionbook success
Message-ID: <20030416122948.GM30643@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.44.0304161214080.15781-100000@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.44.0304161214080.15781-100000@sal.ucc.ie>
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

On Wed, Apr 16, 2003 at 01:07:06PM +0100, M. Grabert wrote:
> I just wanted you to inform that I successfully installed
> Debian testing on my Presicionbook.

Sweet!

> - The precompiled kernel from the EISEE team may hang ...
> 
>   ... since it has support for the CMD PCI0643 IDE Busmaster chip,
>   which is obviously used in the Presicionbook, but the driver
>   doensn't/mustn't be used in Linux, since it causes confusion!
>   So add "ide=nodma" or something similar to the kernel parameters
>   (using the IPL) or simply recompile the kernel with no IDE support.
> 
>   (The Presicionbook uses 2.5" IDE harddrives, obviously connected
>    to the CMD chip, but they automagically appear as SCSI drives on LASI
>    SCSI.)

*blink*.  That's pretty weird.  Could you send the device listing that
dmesg produces, and the results of lspci?

> - PCMCIA
> 
>   I'm honestly a little bit confused here.
>   It uses the  Cirrus Logic PD 6832 PCMCIA/CardBus Controller, which
>   seems to be supported under Linux, HOWEVER the physical slots
>   appear to be just for old PCMCIA ISA 16bit PC Cards, not for the
>   newer 32bit PCI CardBus PC Cards. I haven't tried whether it works,
>   since I don't have any PCMCIA PC Cards (ISA or PCI Cardbus).

I'm a little confused; I've got both 16 and 32 bit cards here and I
don't see any physical difference between the cards that'd prevent a
32-bit card being inserted into a slot.  Yes, gold vs silver colouring;
some bumps on the 32-bit card (could that be it?)

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
