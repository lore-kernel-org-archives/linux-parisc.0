Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep13-int.chello.at (viefep13-int.chello.at [213.46.255.15])
	by dsl2.external.hp.com (Postfix) with ESMTP id CC4EF484B
	for <parisc-linux@parisc-linux.org>; Mon, 30 Sep 2002 12:33:57 -0600 (MDT)
Message-ID: <3D989912.9310A140@gmx.at>
Date: Mon, 30 Sep 2002 20:33:54 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Matthew Wilcox <willy@debian.org>
Cc: 'parisc-linux maillist' <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Serial MUX
References: <02Sep30.171511cest.119078@ns.hiscom.nl> <20020930162536.L18377@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii
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

Oh sorry, that's beautiful, that there are so much
machines with the same device type. My knowledge was
here not complete. I only knew the state of the E55 
(family) and of this one K-class machine, Ryan has.

Christoph



Matthew Wilcox wrote:
> 
> From: Christoph Plattner [mailto:christoph.plattner@gmx.at]
> > This driver can be used on machines having a non-supported
> > multi-serial interface like a E35/45/55 or some K-series
> > machines.
> 
> slight misunderstanding: this driver supports almost all the
> non-16550-compatible serial ports used on HP machines.  That includes E,
> F-I, K-class and the optional console card used with some D & R class
> machines.  It doesn't include "Burgundy", "Silverfox" or "Lego" console
> devices.  I'm working on updating the hwdb to reflect this.
> 
> --
> Revolutions do not require corporate support.
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
