From: Michiel Broek <mbroek@mbse.dds.nl>
Subject: Re: [parisc-linux] Re: front-panel LED and switch support broken
	(was: 2.6.10-pa1 compile fails)
Date: Mon, 3 Jan 2005 22:18:33 +0100
Message-ID: <200501032218.33618.mbroek@mbse.dds.nl>
References: <Pine.LNX.4.21.0501031142060.31807-100000@hal.pp.fishpool.fi>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.LNX.4.21.0501031142060.31807-100000@hal.pp.fishpool.fi>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Op maandag 3 januari 2005 10:42, schreef Martin-=C9ric Racine:
> On Mon, 3 Jan 2005, Matthew Wilcox wrote:
> > On Thu, Dec 30, 2004 at 04:40:38PM +0200, Martin-=C9ric Racine wrote:
> > > On Thu, 30 Dec 2004, Martin-=C9ric Racine wrote:
> > > > On Thu, 30 Dec 2004, Martin-=C9ric Racine wrote:
> > > > However, support for the front-panel LEDs and switches is BROKEN in
> > > > 2.6.10-pa1: when I press the power switch, it kills the AC power
> > > > instead of sending a signal to the kernel to shut itself down.  OUC=
H!
> > > >  The power/status LED is also off.
> > >
> > > This is still broken in 2.6.10-pa2 as well.
> >
> > On which machine?  It works fine on my 725 and c3600.
>
> 712.

On my 712/80 with a 2.6.9-pa1 it works fine.


=2D-=20

 Greetings, Michiel Broek

mbroek@mbse.dds.nl  or  Fidonet 2:280/2802 to Michiel Broek.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
