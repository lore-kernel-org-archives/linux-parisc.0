Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 500284829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Apr 2003 07:36:31 -0600 (MDT)
Date: Wed, 16 Apr 2003 14:36:25 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Matthew Wilcox <willy@debian.org>
Cc: Gavin Hubbard <ghub005@xtra.co.nz>,
	<parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: Presicionbook success
In-Reply-To: <20030416132710.GO30643@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.44.0304161432590.28370-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Wed, 16 Apr 2003, Matthew Wilcox wrote:

> On Thu, Apr 17, 2003 at 01:15:31AM +1200, Gavin Hubbard wrote:
> > Before anyone loses too much sleep over this, the Precisionbook has
> > internal SCSI-IDE bridges that sit between the HBA and the drives. I
> > believe a similar system was used in some of the earlier Apple Powerbooks.
>
> Yep, someone pointed that out in an earlier email.  I'm just trying to
> figure out how to handle this for the best.
>
> 1) Provide a pci quirk that deletes the IDE device from the bus
> 2) Hack the IDE driver to not claim that device if it's on a PrecisionBook
> 3) Ignore the scsi device and let the IDE driver drive the chips
> 4) Er.. something else.

The initialization of the CMD PCI0643 IDE controller fails when using
the ESIEE kernel (which has support built-in for this chip).
Something like "failed to get IRQ, will probe later".

So no devices were found on the IDE bus, just on the LASI SCSI.
Probably it's the best just to use SCSI and not to use IDE support at all ...

greetings, max
