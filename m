Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4E60F482B
	for <parisc-linux@lists.parisc-linux.org>; Wed,  9 Jul 2003 12:34:30 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19aJln-0007J7-3y; Wed, 09 Jul 2003 19:34:23 +0100
Date: Wed, 9 Jul 2003 19:34:23 +0100
From: Matthew Wilcox <willy@debian.org>
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: Joel Soete <jsoe0708@tiscali.be>,
	Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C3000 SCSI config, was Re: linux grundler
Message-ID: <20030709183423.GB1939@parcelfarce.linux.theplanet.co.uk>
References: <3F0571860000097D@ocpmta8.freegates.net> <Pine.LNX.4.44.0307091825210.2022-100000@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.44.0307091825210.2022-100000@sal.ucc.ie>
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

On Wed, Jul 09, 2003 at 07:17:37PM +0100, M. Grabert wrote:
> Well, the C3000 is very stable when just using the external SE SCSI, but
> when trying to access the internal FW SCSI, it often aborts SCSI commands
> and frequently resets (at least) the FW SCSI BUS, at least when trying to
> copy large directories from SE SCSI to FW SCSI.
> 
> The machine has 1GB RAM, 2x 9GB LVD FW Seagate 9GB disks, no IDE cdrom,
> no graphics.

Hm, you don't say whether you have terminators on your SCSI busses.

> I'm using the SYM2 driver (using default options), but I tried a
> 2.4.20-pa35 kernel with SYM1 and I had the same problems. I don't have my
> config here, but I'm sure I've compiled the kernel with "Zalon" support,
> since it's not clear to me, after reading the help, whether I need it or
> not.

Oh dear ;-( Here's the helptext for Zalon:

config SCSI_ZALON
        tristate "Zalon SCSI support"
        depends on GSC && SCSI
        help
          The Zalon is a GSC/HSC bus interface chip that sits between the
          PA-RISC processor and the NCR 53c720 SCSI controller on C100,
          C110, J200, J210 and some D, K & R-class machines.  It's also
          used on the add-in Bluefish, Barracuda & Shrike SCSI cards.
          Say Y here if you have one of these machines or cards.

I don't really see how I can make this more clear.  Can you tell me which
bit is confusing you?

> Can somebody give me his .config for a C3000 and can tell which driver to
> use (SYM1 or SYM2)? Are there some kernel arguments neccessary for the
> C3000?

Use SYM2 -- SYM1 is going away in 2.5, so if SYM2 doesn't work for you,
it needs to be fixed.  We used to need command line arguments on C3k
(and similar) boxes, but we don't any more.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
