Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B16264829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 30 Mar 2003 08:20:37 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 18zebs-0004h8-2J; Sun, 30 Mar 2003 16:20:36 +0100
Date: Sun, 30 Mar 2003 16:20:36 +0100
From: Matthew Wilcox <willy@debian.org>
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] RDI Tadpole Precisionbook and Linux/PA-RISC
Message-ID: <20030330152036.GC29376@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.44.0303300852030.25173-100000@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.44.0303300852030.25173-100000@sal.ucc.ie>
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

On Sun, Mar 30, 2003 at 09:02:31AM +0100, M. Grabert wrote:
> I just wonder whether somebody has experience in running Linux on
> a Precisionbook (which is the equivalent to a B-Class machine according

I tried to get hold of one from them.  They never called me back ;-(

> to Tadpole). According to OpenPA.net it contains the following chips:
> 
> LASI ASIC, which features:

Same as everything from the 712 to the J2240 ;-)

> Dino PCI bus-adaptor

Also in everything from the B132 to the J2240

> Visualize EG (Graffiti) graphics with 2MB memory

Works in other machines.

> 1MB flash memory

Don't know how this is hooked up.  Might work, give it a try.

> Intel 82503 Ethernet transceiver, media auto-selection

Presumably we dont actually need a driver for this.

> CS4215 or AD1849 programmable CODECs

Hooks up to harmony, no worries.

> WD37C65C Floppy controller

As you say, no floppy support yet.

> As far as I can see the only thing that isn't supported on
> Linux/PA-RISC right now is the floppy controller. The (IDE-)hard disks
> shouldn't be a problem since they are attached to the NCR 53c710 via a
> SCSI-IDE adapter.

Doesn't it also have a PCMCIA adapter?  No-one's tried making those work.

> Does anybody know whether it could/should/may/will/does run Linux?

Obviously it _should_.  But since no-one's tried ...

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
