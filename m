Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4655C482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 10 Jul 2003 04:18:57 -0600 (MDT)
Date: Thu, 10 Jul 2003 11:18:34 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Matthew Wilcox <willy@debian.org>
Cc: Joel Soete <jsoe0708@tiscali.be>,
	"Carlos O'Donell" <carlos@baldric.uwo.ca>,
	<parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] C3000 SCSI config, was Re: linux grundler
In-Reply-To: <20030709183423.GB1939@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.44.0307101113410.6826-100000@sal.ucc.ie>
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

On Wed, 9 Jul 2003, Matthew Wilcox wrote:

> Subject: Re: [parisc-linux] C3000 SCSI config, was Re: linux grundler
>
> On Wed, Jul 09, 2003 at 07:17:37PM +0100, M. Grabert wrote:
> > Well, the C3000 is very stable when just using the external SE SCSI, but
> > when trying to access the internal FW SCSI, it often aborts SCSI commands
> > and frequently resets (at least) the FW SCSI BUS, at least when trying to
> > copy large directories from SE SCSI to FW SCSI.
> >
> > The machine has 1GB RAM, 2x 9GB LVD FW Seagate 9GB disks, no IDE cdrom,
> > no graphics.
>
> Hm, you don't say whether you have terminators on your SCSI busses.

Yes, a (external) FW SCSI terminator and a (external) SE SCSI terminator
at the (external) SE SCSI box.

> > I'm using the SYM2 driver (using default options), but I tried a
> > 2.4.20-pa35 kernel with SYM1 and I had the same problems. I don't have my
> > config here, but I'm sure I've compiled the kernel with "Zalon" support,
> > since it's not clear to me, after reading the help, whether I need it or
> > not.
>
> Oh dear ;-( Here's the helptext for Zalon:
>
> config SCSI_ZALON
>         tristate "Zalon SCSI support"
>         depends on GSC && SCSI
>         help
>           The Zalon is a GSC/HSC bus interface chip that sits between the
>           PA-RISC processor and the NCR 53c720 SCSI controller on C100,
>           C110, J200, J210 and some D, K & R-class machines.  It's also
>           used on the add-in Bluefish, Barracuda & Shrike SCSI cards.
>           Say Y here if you have one of these machines or cards.
>
> I don't really see how I can make this more clear.  Can you tell me which
> bit is confusing you?

I'm using the the 2.4 -kernel, and it says:

"The Zalon is an interface chip that sits between the PA-RISC
processor and the NCR 53c720 SCSI controller on K-series PA-RISC
boards (these are used, among other places, on some HP 780
workstations).  Say Y here to make sure it gets initialized
correctly before the Linux kernel tries to talk to the controller."

Well, since the C240/C3000 are 780-series machines, I wasn't so sure ...

> > Can somebody give me his .config for a C3000 and can tell which driver to
> > use (SYM1 or SYM2)? Are there some kernel arguments neccessary for the
> > C3000?
>
> Use SYM2 -- SYM1 is going away in 2.5, so if SYM2 doesn't work for you,
> it needs to be fixed.  We used to need command line arguments on C3k
> (and similar) boxes, but we don't any more.

Thanks, Max
