Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 24EAA482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 10 Jul 2003 05:26:39 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19aZZN-000452-Pl; Thu, 10 Jul 2003 12:26:37 +0100
Date: Thu, 10 Jul 2003 12:26:37 +0100
From: Matthew Wilcox <willy@debian.org>
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: Matthew Wilcox <willy@debian.org>,
	Joel Soete <jsoe0708@tiscali.be>,
	Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C3000 SCSI config, was Re: linux grundler
Message-ID: <20030710112637.GD1939@parcelfarce.linux.theplanet.co.uk>
References: <20030709183423.GB1939@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.44.0307101113410.6826-100000@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.44.0307101113410.6826-100000@sal.ucc.ie>
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

On Thu, Jul 10, 2003 at 11:18:34AM +0100, M. Grabert wrote:
> > config SCSI_ZALON
> >         tristate "Zalon SCSI support"
> >         depends on GSC && SCSI
> >         help
> >           The Zalon is a GSC/HSC bus interface chip that sits between the
> >           PA-RISC processor and the NCR 53c720 SCSI controller on C100,
> >           C110, J200, J210 and some D, K & R-class machines.  It's also
> >           used on the add-in Bluefish, Barracuda & Shrike SCSI cards.
> >           Say Y here if you have one of these machines or cards.
> 
> I'm using the the 2.4 -kernel, and it says:
> 
> "The Zalon is an interface chip that sits between the PA-RISC
> processor and the NCR 53c720 SCSI controller on K-series PA-RISC
> boards (these are used, among other places, on some HP 780
> workstations).  Say Y here to make sure it gets initialized
> correctly before the Linux kernel tries to talk to the controller."
> 
> Well, since the C240/C3000 are 780-series machines, I wasn't so sure ...

OK, I'll just copy the 2.5 helptext into 2.4 then.  It wouldn't have
confused you, right?

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
