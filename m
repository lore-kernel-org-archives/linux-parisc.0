Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from fep19-app.kolumbus.fi (fep19-0.kolumbus.fi [193.229.0.45])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8F088484C
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Oct 2002 04:00:12 -0600 (MDT)
Received: from azrael.blades.cxm ([62.248.232.158])
          by fep19-app.kolumbus.fi with ESMTP
          id <20021001100007.QFFT28168.fep19-app.kolumbus.fi@azrael.blades.cxm>
          for <parisc-linux@lists.parisc-linux.org>;
          Tue, 1 Oct 2002 13:00:07 +0300
Received: (from blades@localhost)
	by azrael.blades.cxm (SGI-8.9.3/8.9.3) id NAA10194
	for parisc-linux@lists.parisc-linux.org; Tue, 1 Oct 2002 13:00:04 +0300 (EEST)
Date: Tue, 1 Oct 2002 13:00:03 +0300
From: Harri Haataja <harri.haataja@cs.helsinki.fi>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] hardware newbie question...
Message-ID: <20021001130000.A10114@azrael.smilehouse.com>
References: <Pine.NEB.4.44.0209251557570.7537-100000@io.fachschaften.tu-muenchen.de> <20020930223115.63225.qmail@web12508.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020930223115.63225.qmail@web12508.mail.yahoo.com>; from derekengelhaupt@rocketmail.com on Mon, Sep 30, 2002 at 03:31:15PM -0700
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

On Mon, Sep 30, 2002 at 03:31:15PM -0700, Derek Engelhaupt wrote:
> --- Andreas Deresch <aderesch@fs.tum.de> wrote:
> > On Wed, 25 Sep 2002, Thibaut VARENE wrote:
> > > Stephen J de Vries wrote:
> > > > I have a HP 712 that I'd purchased recently.
> > > > My question is:
> > > > Can I use a PC monitor, keyboard, and mouse to boot the thing
> > > > up?  If so, does the monitor have to be a multisync or something
> > > > special?
> > > OK for the PC monitor. Use 'Tab' at boot time to switch 712's
> > > resolution
> > > NO for the PC keyboard (pc kbd is 75mA iirc, 712 is 500mA)
> > Hhmm. I have used two different PS/2 keyboards on a 712. So far
> > nothing unexpected has happened to either the box nor the
> > keyboard... it works just fine.
> Me too....

And even if those numbers meant something, 712 having 500mA available
and a keyboard pulling 75mA out of it would be perfectly fine. Now if
those were voltages or impedances, then you might want to match.

My SGI Granite says 12V 300mA max kb, 5V 15mA mouse
My HP C1429B says 200mA max, 12V 120mA (Whoa!) mouse
My Sun type4 says 5V 0.35A (sic) max both
ICL PS/2 says 0.3A

JFTR. ICBW, but I don't think so.

-- 
The meek will inherit the earth; the rest of us will go to the stars.
