From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] Re: [PATCH] missing exports
Date: Sat, 10 Jul 2004 15:55:18 +0200
Message-ID: <200407101555.18830.deller@gmx.de>
References: <1067288209.3591.1.camel@kars.perseus.home>
	<Pine.GSO.4.58.0407101107240.10242@waterleaf.sonytel.be>
	<20040710130529.GP5889@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: Kars de Jong <jongk@linux-m68k.org>,
 Linux/m68k kernel mailing list <linux-m68k@lists.linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 parisc-linux@parisc-linux.org
To: Matthew Wilcox <willy@debian.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040710130529.GP5889@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Saturday 10 July 2004 15:05, Matthew Wilcox wrote:
> On Sat, Jul 10, 2004 at 11:09:34AM +0200, Geert Uytterhoeven wrote:
> > > worry about merging with the PARISC people later?
> > 
> > What about posting the patches to the Linux/m68k and Linux/PA-RISC lists?
> 
> That'd be great.  More shared code!
> It's also good incentive for us to get this stuff merged upstream.
> Helge, you said you'd take care of this... what's the current status?

Last time I tried the HIL stuff for 2.6 was still in bad shape.
It worked unreliable and all the locking due to the timing issues still increases the generic load of the machine.

Our code in kernel 2.4 has similiar problems, but this I think we can live with.

Anyway, I would be happy to see any patches and merge them upstream.

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
